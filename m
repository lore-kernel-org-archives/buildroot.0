From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 15 Jul 2021 03:37:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: enable nfsv4/nfsv4.1
 support
In-Reply-To: <YO4KwsYMZ3FAW4Mo@pevik>
References: <YO4KwsYMZ3FAW4Mo@pevik>
Message-ID: <A6DEB160-36E8-4E22-8315-2E3256DC07B0@benettiengineering.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Petr, James, All,

> Il giorno 13 lug 2021, alle ore 23:51, Petr Vorel <petr.vorel@gmail.com> ha scritto:
> 
> ?Hi Giulio, all,
> 
> [Cc Thomas, Peter ]
> 
>>>> Il giorno 13 lug 2021, alle ore 10:19, James Hilliard <james.hilliard1@gmail.com> ha scritto:
>> 
>>>> ?On Tue, Jul 13, 2021 at 2:03 AM Giulio Benetti
>>> <giulio.benetti@benettiengineering.com> wrote:
> 
>>>> Hello James,
> 
>>>>>> Il giorno 13 lug 2021, alle ore 05:14, James Hilliard <james.hilliard1@gmail.com> ha scritto:
> 
>>>>> ?Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>>>> ---
>>>>> package/nfs-utils/Config.in    | 10 ++++++++++
>>>>> package/nfs-utils/nfs-utils.mk |  9 +++++++--
>>>>> 2 files changed, 17 insertions(+), 2 deletions(-)
> 
>>>>> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
>>>>> index da563db0f1..b736f6c973 100644
>>>>> --- a/package/nfs-utils/Config.in
>>>>> +++ b/package/nfs-utils/Config.in
>>>>> @@ -14,6 +14,16 @@ config BR2_PACKAGE_NFS_UTILS
> 
>>>>> if BR2_PACKAGE_NFS_UTILS
> 
>>>>> +config BR2_PACKAGE_NFS_UTILS_NFSV4
>>>>> +    bool "NFSv4/NFSv4.1"
>>>>> +    depends on !BR2_STATIC_LIBS # keyutils, lvm2
>>>>> +    select BR2_PACKAGE_KEYUTILS
>>>>> +    select BR2_PACKAGE_LIBEVENT
>>>>> +    select BR2_PACKAGE_LVM2
>>>>> +    select BR2_PACKAGE_SQLITE
>>>>> +    help
>>>>> +      Enable NFSv4/NFSv4.1 support
>>>>> +
>>>>> config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
>>>>>  bool "rpcdebug"
>>>>>  help
>>>>> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
>>>>> index c384e939d8..2598f0908b 100644
>>>>> --- a/package/nfs-utils/nfs-utils.mk
>>>>> +++ b/package/nfs-utils/nfs-utils.mk
>>>>> @@ -16,8 +16,6 @@ NFS_UTILS_AUTORECONF = YES
>>>>> NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
> 
>>>>> NFS_UTILS_CONF_OPTS = \
>>>>> -    --disable-nfsv4 \
>>>>> -    --disable-nfsv41 \
> 
>>>> Is this ^^^ what prevents uuid.h build error?
> 
>>> No idea, have some background on that issue?
> 
>> Yes, I had that issue on this commit:
> 
>> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=blobdiff;f=support/export/v4root.c;h=c12a7d8562b22616fbc7840faf6719443dac64d3;hp=3654bd7c10c059d6a6ae32001ca979d671ef38f2;hb=c5528f40f9db5061e06dcf1f9b7fce5185b376c6;hpb=ed83085ff310fdc95badb06a26289efb70f99ccd
> 
>> But it seems that ?disable-nfsv4 avoid building it,
>> so we should have no problem.
> 
> Can you be more specific how c5528f40 ("Fix NFSv4 export of tmpfs filesystems")
> affects Buildroot? Is it a problem with -luuid

Yes, in nfs-utils ?disable-uuid options doesn?t take into account v4nfs that from that commit on
uses uuid. It only prevents bulding libblkid support that they still declare buggy here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

> 
> Anyway, we disabled nfsv4/nfsv4.1 from the start, I wonder why.

As I see from James patch, he disables nfsv4 that is the part where uuid is required. 
That is why it builds fine without uuid. If we want nfsv4 we need uuid, but then nfs-utile must be patched to make things more clear, but substituting ?disable-uuid with ?disable-libblkid
and using ?disable-uuid to remove the above commit code from building.

Anyway what is supplied by James builds then, I didn?t try but it makes sense. So it depends if someone wants to create patches to send upstream like I?ve described(if it makes sense for you all of course.

Best regards
Giulio

> @Thomas, @Peter: do you remember it?
> 
> But generally good idea, thus:
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
>> Can you double check building with nfsv4 support and find it failing wi uuid.h? I don?t have time at the moment.
> 
> I'll try to test it this week.
> 
> Kind regards,
> Petr
> 
>> Thanks a lot
> 
>> Giulio
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210715/92c00aaf/attachment-0001.html>
