From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 3 Apr 2017 10:41:28 -0300 (BRT)
Subject: [Buildroot] [PATCH v3 2/2] systemd: select util-linux/fsck and
 e2fsprogs/e2fsck
In-Reply-To: <3f5305c2-c524-3766-6569-af36901311b7@mind.be>
References: <1491154114-14797-1-git-send-email-casantos@datacom.ind.br>
 <1491154114-14797-3-git-send-email-casantos@datacom.ind.br>
 <3f5305c2-c524-3766-6569-af36901311b7@mind.be>
Message-ID: <902712529.17369661.1491226888495.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Sent: Monday, April 3, 2017 10:26:26 AM
> Subject: Re: [Buildroot] [PATCH v3 2/2] systemd: select util-linux/fsck and e2fsprogs/e2fsck

> On 02-04-17 19:28, Carlos Santos wrote:
>> e2fsprogs does not override/remove the fsck from util-linux anymore when
>> /sbin and /usr/sbin are merged. So we can select the fsck tools required
>> by systemd provided by those packages. This also prevents ending up with
>> the fsck from busybox, which is incompatible with systemd.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>>  package/systemd/Config.in | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>> index 0f54686..f5eb9d0 100644
>> --- a/package/systemd/Config.in
>> +++ b/package/systemd/Config.in
>> @@ -22,6 +22,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
>>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
>>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
>>  	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
>> +	select BR2_PACKAGE_UTIL_LINUX_FSCK
> 
> I agree with this bit. If I understand correctly, as soon as you have *some*
> filesystem configured (or hotplugged), systemd will call fsck with an option not
> known to busybox/e2fsprogs fsck and will barf.
> 
>> +	select BR2_PACKAGE_E2FSPROGS
>> +	select BR2_PACKAGE_E2FSPROGS_E2FSCK
> 
> I don't agree with this bit: it should only be necessary when there is an ext2
> filesystem somewhere. And even so, with a 'nofail' in fstab, it's not an error
> if the fsck.ext2 is missing. Therefore, it's up to the user to select it IMO. At
> most, add something to the help text about it.

Good point. I will submit a new patch set removing the selection of
e2fsprogs.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
