From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 20:35:44 +0200
Subject: [Buildroot] [PATCH] package/haveged: Allow service to run early
In-Reply-To: <CAFvCimXjptaExo7ia5XWRxrQrAYEhJqEZisTyp2_uUbWwu40uA@mail.gmail.com>
References: <20200605225421.13494-1-nolange79@gmail.com>
 <CAFvCimXjptaExo7ia5XWRxrQrAYEhJqEZisTyp2_uUbWwu40uA@mail.gmail.com>
Message-ID: <CADYdroMhuGysCOy2aV2ihoA3kQ9fSUdKiocpL4h2niT7=iWuHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 12:35 Uhr schrieb J?r?my ROSEN <jeremy.rosen@smile.fr>:
>
>
>
> Le sam. 6 juin 2020 ? 00:55, Norbert Lange <nolange79@gmail.com> a ?crit :
>>
>> Drop default dependencies, haveged needs nothing but
>> local sockets and /dev/random.
>> This allows the entropy to be available earlier.
>>
>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> ---
>>  package/haveged/haveged.service | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/haveged/haveged.service b/package/haveged/haveged.service
>> index 91035c6711..ed9f043a91 100644
>> --- a/package/haveged/haveged.service
>> +++ b/package/haveged/haveged.service
>> @@ -1,10 +1,13 @@
>>  [Unit]
>>  Description=Entropy Harvesting Daemon
>>  Documentation=man:haveged(8)
>> +DefaultDependencies=no
>> +Conflicts=shutdown.target
>> +Before=sysinit.target shutdown.target systemd-update-done.service
>>
> Since v243 (quoting  systemd's NEWS file) :
>
> * systemd-random-seed.service is now a synchronization point for full
>           initialization of the kernel's entropy pool. Services that require
>           /dev/urandom to be correctly initialized should be ordered after this
>           service.
>
> so... in that case it might make sense to add Before=systemd-random-seed.service
> (assuming that works. This a very early point, so it needs some testing)


No, doesnt make sense, a "before"  only means the service is *started before*,
not the process did do anything worthwile. (That's the reason for my
openssh patch BTW)
systemd-random-seed.service is a one-shot, so a "before" *that*
service means the dependants wait till it is finished.

>
>>  [Service]
>>  ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
>>  SuccessExitStatus=143
>>
> I could not find any documentation on haveged return codes, so i'll trust you on that one


Don't trust me, I did not touch the values (but I  can attest they work).

>>  [Install]
>> -WantedBy=multi-user.target
>> +WantedBy=sysinit.target
>> --
>> 2.26.2
>>
> Apart from my earlier remark, you can add my ReviewedBy


Thx.
Norbert
