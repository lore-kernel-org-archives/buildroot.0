From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 19:48:21 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <20151222172842.GC21998@free.fr>
References: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
 <20151222172842.GC21998@free.fr>
Message-ID: <alpine.DEB.2.11.1512221934050.15569@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Dec 2015, Yann E. MORIN wrote:

> Date: Tue, 22 Dec 2015 18:28:42 +0100
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
> 
> Jonathan, All,
>
> On 2015-12-22 19:12 +0200, Jonathan Ben-Avraham spake thusly:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> Installs /etc/nfsmount.conf on the target, mainly to be able to configure the
>> the NFS version that mount.nfs uses by default. Without this ability you are
>> likely to encounter mount errors when automounting directories from NFS
>> version 3 servers.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> However, see below...
>
>> ---
>>  package/nfs-utils/nfs-utils.mk |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>> index 30f12fd..6dd175c 100644
>> --- a/package/nfs-utils/nfs-utils.mk
>> +++ b/package/nfs-utils/nfs-utils.mk
>> @@ -38,6 +38,8 @@ endif
>>  define NFS_UTILS_INSTALL_FIXUP
>>  	rm -f $(NFS_UTILS_TARGETS_)
>>  	touch $(TARGET_DIR)/etc/exports
>> +	$(INSTALL) -D -m 644 \
>> +		$(@D)/utils/mount/nfsmount.conf $(TARGET_DIR)/etc/nfsmount.conf
>
> This file is only comments, save for a single un-commented line;
>    [ NFSMount_Global_Options ]
>
> Would it not be better that we just generate a file with just that line,
> and a comment to see the sources for the format, like so:
>
>    # See utils/mount/nfsmount.conf in nfs-utils sources
>    # for the format of this file.
>    [ NFSMount_Global_Options ]

Hi Yann,
When debugging an unexpected NFS mount problem on a target for which you 
do not have the build system, at a site that might not have Internet 
access, with a root filesystem that might not have the "strings" 
utility, it is much easier to have all of the mount options in front of 
you rather than to have to leave the premises and start searching for the 
correct nfs-utils sources in order to find the full nfsmount.conf. It's 
just a much more friendly way of working. The lack of any nfsmount.conf 
cost me (my client really) several hours of work while I installed 
"strings" and figured out that there is such a thing as nfsmount.conf. It 
would be unfortunate for others to have to repeat this. Most people 
assigned to debug these types of systems are even less experienced than I.

  - yba


> Either way, I'm OK.
>
> Regards,
> Yann E. MORIN.
>
>>  endef
>>  NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
