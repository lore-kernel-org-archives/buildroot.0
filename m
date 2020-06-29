From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 29 Jun 2020 17:08:36 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <CAFvCimUG6xcKsLC3ufhc3FVuwXj3Www2YH+sRUFtX8w0jVfvMQ@mail.gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
 <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
 <CADYdroNxW-em_kbTZ8iYOuc=6WOkoOWoDOvdCohVbfCU4T74oA@mail.gmail.com>
 <CAFvCimUG6xcKsLC3ufhc3FVuwXj3Www2YH+sRUFtX8w0jVfvMQ@mail.gmail.com>
Message-ID: <CADYdroOSf2=5vj8cQawmnpiSsS_d2KcBvp5Ljka6nn6_68NZuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 29. Juni 2020 um 14:04 Uhr schrieb J?r?my ROSEN <
jeremy.rosen@smile.fr>:

>
>
> Le lun. 29 juin 2020 ? 10:29, Norbert Lange <nolange79@gmail.com> a
> ?crit :
>
>>
>>
>> Am Mo., 29. Juni 2020 um 09:31 Uhr schrieb J?r?my ROSEN <
>> jeremy.rosen at smile.fr>:
>>
>>> Well
>>> I still think you need Before=systemd-random-seed.service and I don't
>>> understand why you are reluctant to add it.
>>> (Honestly, I think the Before= and your work to make it an early boot
>>> service should be upstreamed)
>>>
>>> So, i'm a bit reluctant to give my reviewed-by. Again, it's not worse
>>> than it was, but if you want
>>> to make sure that all services that need randomness are correctly
>>> started after haveged, then
>>> you have to add that Before=
>>>
>>
>> Again, this doesn't help, and might actually hurt.
>>
>> -   systemd-random-seed.service could actually add better (real) entropy.
>>      (Upstream actually had an After systemd-random-seed.service for that
>> reason).
>> -   a before on a "persistent" service does not really block, while
>> accessing the kernels random source when it's not uninitialised will,
>>     so random consumers are already implicitly waiting for haveged - when
>> they need entropy and not a moment before.
>>
>>
> I'm not sure what you mean by "persistent" in that context.
> I also think there is a confusion on what Before= does....
> Before=systemd-random-seed.service means that systemd-random-seed will be
> spawned after haveged is READY (in
> the Type= sense of READY)
>
> unfortunately, it seems haveged does not synchronize with systemd at all
> and indeed, in the case of haveged,
> Before= will only sync the point where systemd spawns the coresponding
> processes.
>

So you agree it's pointless?
It does not make haveged start faster, it will delay systemd-random-seed a
ridiculous small amount.

I am not very convinced on what you said about another source being
> "better". Either you are OK with the value
> proposition of haveged and you count it as good entropy or you are not and
> you don't use haveged at all...
>

I don't use haveged as good source for entropy, I use it because otherwise
the system won't boot for ages.
You don't even have a measure on how much entropy the jitter adds.


> now... my main point is that services that need good entopy will
> synchronize after systemd-random-seed.service.
> This is documented by systemd and means that the processes will only be
> spawned after the RNG is ready and
> will not wait for entropy at all. That's the whole point of syncing after
> systemd-random-seed.
>

Yes, and none of this is affected by adding a Before dependency.


> So i understand your point about the implicit sync point added by the
> kernel's "RGN is ready" bit, but I still think
> that adding my sync point is "the way it's meant to be"
>

Some concrete example of where this "actually" helps would be needed, let
alone an explanation why upstream, debian and
AFAIR fedora had haveged ordered *after* systemd-random-seed (likely before
they figured out this could deadlock with the
seed being on an network drive).

So it:
-   Wont help
-   the sync point is already systemd-random-seed
-   arguably if you are paranoid about secure random numbers you will
disable haveged in favor of true entropy,
    then can consider blocking on systemd-random-seed.

Norbert

Anyway, at this point I think we should just agree to disagree and it's not
> that relevant.
> I still don't consider that the proper approch, but I still don't think
> this should block that patch. Everything else is fine by me.
>

>
>> I won't block the patch going in if a BR maintainer want to commit it,
>>> but i'd like to understand why you are reluctant
>>> to add that
>>>
>>
>> Haveged is not entropy, it's a substitute. I dont know how many times I
>> need to point that out.
>> The less dependencies, the faster the system can startup (and lesser
>> chances of some stoopid deadlocks).
>>
>> Look at the history for service.fedora [1], which is now the blueprint
>> for the v2 patch,
>> I considered just adding a switch to install the upstream service file,
>> but this adds several heavy isolation options that are overkill for most
>> uses,
>> and add dependencies (upstream just removed one of these, because it
>> created a cycle).
>>
>> [1] -
>> https://github.com/jirka-h/haveged/commits/master/init.d/service.fedora
>>
>> Norbert
>>
>>
>>> Regards
>>> Jeremy
>>>
>>> Le ven. 26 juin 2020 ? 00:39, Norbert Lange <nolange79@gmail.com> a
>>> ?crit :
>>>
>>>> Jeremy,
>>>>
>>>> Can you have a look and add your reviewed-by pls?
>>>> No drastic changes from v1, except adding a few isolation options from
>>>> the upstream fedora service file.
>>>>
>>>> Am Mi., 10. Juni 2020 um 00:42 Uhr schrieb Norbert Lange <
>>>> nolange79 at gmail.com>:
>>>> >
>>>> > Drop default dependencies, haveged needs nothing but
>>>> > local sockets and /dev/random.
>>>> >
>>>> > The service file now mostly matches the upstream fedora file,
>>>> > except alot of isolation options have been dropped.
>>>> > The benefit for a completely controlled system is small,
>>>> > and those option would pull in dependencies, delaying
>>>> > entropy being filled up.
>>>> >
>>>> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>>> > ---
>>>> >  package/haveged/haveged.service | 22 +++++++++++++++++-----
>>>> >  1 file changed, 17 insertions(+), 5 deletions(-)
>>>> >
>>>> > diff --git a/package/haveged/haveged.service
>>>> b/package/haveged/haveged.service
>>>> > index 91035c6711..cfdaa93a37 100644
>>>> > --- a/package/haveged/haveged.service
>>>> > +++ b/package/haveged/haveged.service
>>>> > @@ -1,10 +1,22 @@
>>>> >  [Unit]
>>>> > -Description=Entropy Harvesting Daemon
>>>> > -Documentation=man:haveged(8)
>>>> > +# inspiration from upstream init.d/service.fedora
>>>> > +Description=Entropy Daemon based on the HAVEGE algorithm
>>>> > +Documentation=man:haveged(8) http://www.issihosts.com/haveged/
>>>> > +DefaultDependencies=no
>>>> > +# This would wait for filesystems, but we only need /dev/random,
>>>> > +# which is certainly available after systemd initialised
>>>> > +# After=systemd-tmpfiles-setup-dev.service
>>>> > +Before=sysinit.target shutdown.target systemd-journald.service
>>>> >
>>>> >  [Service]
>>>> > -ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
>>>> > -SuccessExitStatus=143
>>>> > +ExecStart=/usr/sbin/haveged -w 1024 -v 1 --Foreground
>>>> > +Restart=always
>>>> > +SuccessExitStatus=137 143
>>>> > +
>>>> > +# Only simple isolation methods that dont pull in dependencies
>>>> > +CapabilityBoundingSet=CAP_SYS_ADMIN
>>>> > +SecureBits=noroot-locked
>>>> > +ProtectSystem=full
>>>> >
>>>> >  [Install]
>>>> > -WantedBy=multi-user.target
>>>> > +WantedBy=sysinit.target
>>>> > --
>>>> > 2.26.2
>>>> >
>>>>
>>>
>>>
>>> --
>>> [image: SMILE]  <http://www.smile.eu/>
>>>
>>> 20 rue des Jardins
>>> 92600 Asni?res-sur-Seine
>>> *J?r?my ROSEN*
>>> Architecte technique
>>>
>>> [image: email] jeremy.rosen at smile.fr
>>> [image: phone]  +33 6 88 25 87 42
>>> [image: url] http://www.smile.eu
>>>
>>> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
>>> <https://www.facebook.com/smileopensource> [image: LinkedIn]
>>> <https://www.linkedin.com/company/smile> [image: Github]
>>> <https://github.com/Smile-SA>
>>>
>>> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
>>> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>>>
>>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/17151b53/attachment.html>
