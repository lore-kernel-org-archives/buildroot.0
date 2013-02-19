From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2013 00:40:43 +0100
Subject: [Buildroot] [PATCH 4/4] fs/ext: add support for ext2 rev0 and
 rev1
In-Reply-To: <201302191910.33509.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <2f41f484f574512df6919967f641cf2152049a22.1361142401.git.yann.morin.1998@free.fr>
 <51232FF1.2080306@mind.be> <201302191910.33509.yann.morin.1998@free.fr>
Message-ID: <51240D7B.7070608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/13 19:10, Yann E. MORIN wrote:
> Arnout, All,
>
> On Tuesday 19 February 2013 Arnout Vandecappelle wrote:
>> On 18/02/13 00:10, Yann E. MORIN wrote:
>>> Some bootloaders have a buggy ext2 support, and require ext2 rev1
>>> instead of the traditional ext2 rev0 that genext2fs produces.
> [--SNIP--]
>>> @@ -23,10 +27,11 @@ config BR2_TARGET_ROOTFS_EXT_EXT4
>>>    endchoice
>>>
>>>    config BR2_TARGET_ROOTFS_EXT_GEN
>>> -	int
>>> -	default 2 if BR2_TARGET_ROOTFS_EXT_EXT2
>>> -	default 3 if BR2_TARGET_ROOTFS_EXT_EXT3
>>> -	default 4 if BR2_TARGET_ROOTFS_EXT_EXT4
>>> +	string
>>> +	default 2.0 if BR2_TARGET_ROOTFS_EXT_EXT2r0
>>> +	default 2.1 if BR2_TARGET_ROOTFS_EXT_EXT2r1
>>> +	default 3   if BR2_TARGET_ROOTFS_EXT_EXT3
>>> +	default 4   if BR2_TARGET_ROOTFS_EXT_EXT4
>>
>>    I think it makes things simpler if you keep the GEN as it is, and
>> process the rev separately. Or perhaps set
>>
>> config BR2_TARGET_ROOTFS_EXT_REV
>> 	int
>> 	default 0 if BR2_TARGET_ROOTFS_EXT_EXT2r0
>> 	default 1
>
> Not sure. ext2 rev1 is just that: a revision 1 ext2. ext3 or ext4 rev1
> do not mean anything, AFAIK.

  They are partly independent - although ext4 is not possible with 
rev0... And in practice you want rev1 for ext3 filesystems as well. 
Actually, you always want rev1, except when you have a stupid bootloader 
that doesn't support it.

  So what I meant is: set revision to 1, except for ext2r0.

>
> [--SNIP--]
>>> +ext_fsck() {
>>> +    gen="${1}"
>>> +    img="${2}"
>>> +    ret=0
>>> +    fsck.ext${gen} -pDf "${img}" >/dev/null || ret=$?
>>
>>    Don't bother with ${gen}, just use e2fsck.
>
> OK, I've just checked, and e2fsck's behavior does indeed not depend
> on its argv[0], so I'll use that.
>
> [--SNIP--]
>>> +# Upgrade to ext2 rev1 if needed
>>> +if [ ${EXT2_REV} -ge 1 -o ${GEN} -ge 3 ]; then
>>
>>    With BR2_TARGET_ROOTFS_EXT_REV this condition becomes simpler.
>
> Yes, but as I said above, rev0/1 is only meaningfull for ext2, not ext3/4.
>
> I'd rather keep the semantics clear. The ext filesystem can be:
>    - ext2 rev0
>    - ext2 rev1
>    - ext3
>    - ext4
>
> And the fsck is only needed for ext2 rev1, ext3 or ext4.
>
> But it is not stupid to always run the fsck anyway, so I'll simplify the
> code by always calling e2fsck, even if it is not strictly required. Doing
> so will also help catching badly generated ext2 rev0 filesystems, so it's
> a net gain (and does not cost too much, anyway).
>
>>> +    tune2fs -O filetype "${IMG}" >/dev/null
>>> +    ext_fsck 2 "${IMG}"
>>> +fi
>>> +
>>>    # Upgrade to ext3 if needed
>>>    if [ ${GEN} -ge 3 ]; then
>>>        tune2fs -j -J size=1 "${IMG}" >/dev/null
>>> +    ext_fsck 3 "${IMG}"
>>>    fi
>>>
>>>    # Upgrade to ext4 if needed
>>>    if [ ${GEN} -ge 4 ]; then
>>>        tune2fs -O extents,uninit_bg,dir_index "${IMG}" >/dev/null
>>> -    ret=0
>>> -    fsck.ext4 -pDf "${IMG}" >/dev/null || ret=$?
>>> -    # Exit codes 1 & 2 are OK, it means fs errors
>>> -    # were successfully corrected
>>> -    case ${ret} in
>>> -	0|1|2) ;;
>>> -	*)   exit 1;;
>>> -    esac
>>> -    # fsck.ext4 will force a UUID, which we do not want
>>> -    tune2fs -U clear "${IMG}" >/dev/null
>>> +    NEED_FSCK=1
>>
>>    I guess you originally had just a single fsck and used this variable to
>> decide if it was needed. That's actually a good idea.
>
> Oh, I forgot to remove that variable. We can't run fsck once at the end.
> It has to be called after each tune2fs call.
>
> Also, I'll rework the code as thus:
>
>      ext_opts=""
>      ext_opts_O=""
>      if ! ext2rev0:
>          ext_opts_O+="filetype"
>      if ext3:
>          ext_opts+="-j -J size=1"
>      if ext4:
>          ext_opts_O+="extents,uninit_bg,dir_index"
>      if ext_opts_O != "":
>          ext_opts+="-O ext_opts_O"
>      tune2fs ext_opts img
>      e2fsck img
>
> That is even better, I think.

  Agreed! Moving to Python is certainly better! :-)

  BTW doesn't tune2fs support -O x -O y options?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
