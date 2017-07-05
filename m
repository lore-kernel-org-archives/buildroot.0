From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 5 Jul 2017 14:08:04 +0200
Subject: [Buildroot] [PATCH v5 4/5] fs/ext2: Add
 BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
In-Reply-To: <2776e2e7-c975-92e1-c213-b7f0d161bf21@mind.be>
References: <20170704144729.19753-1-s.martin49@gmail.com>
 <20170704144729.19753-5-s.martin49@gmail.com>
 <2776e2e7-c975-92e1-c213-b7f0d161bf21@mind.be>
Message-ID: <3829c54e-be21-fd33-f4eb-f8ee00d5c953@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/04/2017 07:39 PM, Arnout Vandecappelle wrote:
> 
> 
> On 04-07-17 16:47, Samuel Martin wrote:
>> From: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>>
>> This option lets the user specify mke2fs options and/or ext2/3/4
>> features.
>>
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> ---
>> changes v4->v5:
>> - turn the options to accept any mke2fs options, not only ext2/3/4
>>   features (Arnout)
>> - add explaination for the default value for this new option (Arnout)
>>
>> changes v3->v4:
>> - none
>>
>> changes v2->v3:
>> - none
>>
>> changes v1->v2:
>> - rebase
>> ---
>>  fs/ext2/Config.in | 17 +++++++++++++++++
>>  fs/ext2/ext2.mk   |  5 ++++-
>>  2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
>> index b2363940f0..9bbeb797a5 100644
>> --- a/fs/ext2/Config.in
>> +++ b/fs/ext2/Config.in
>> @@ -67,6 +67,23 @@ config BR2_TARGET_ROOTFS_EXT2_RESBLKS
>>  	  Traditionally, this has been 5%, and all ext-related tools still
>>  	  default to reserving 5% when creating a new ext filesystem.
>>  
>> +config BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS
>> +	string "additional mke2fs options"
>> +	default "-O ^64bit"
>> +	help
>> +	  Specify a space-separated list of mke2fs options, including any
>> +	  ext2/3/4 filesystem features.
>> +
>> +	  For more information about the mke2fs option, see the manual page
> 
>  Lines should be wrapped at 72 columns, where tab counts for 8, so 62
> significant characters.
> 
>> +	  mke2fs(8).
>> +
>> +	  For more information about the ext2/3/4 features which can be set,
>> +	  see then manual page ext4(5).
>> +
>> +	  The defaults disables the 64bit ext2/3/4 filesystem support since
>> +	  its has been enable lately in 2017 in uboot, so most of the uboot
>> +	  versions do not support it yet.
> 
>  Replace:
> 	  The default is "-O ^64bit", i.e. disable the 64-bit filesystem.
> 	  This is chosen because U-Boot versions before 2017.02 don't
> 	  support that filesystem option, which may render the system
> 	  unbootable if it is used.
> 
>  BTW, on reading the ext4 man page, I doubt this is needed at all:
> 
>        64bit
>               Enables the file system to be larger than 2^32 blocks.  This
> feature is set automatically, as needed, but it can be  useful  to  specify
> this  feature explicitly  if the file system might need to be resized larger
> than 2^32 blocks, even if it was smaller than that threshold when it was
> originally created.  Note that some older kernels and older versions of
> e2fsprogs will not support file systems with this ext4 feature enabled.
> 
> In other words, unless you create a filesystem larger than 4TB, this option
> wouldn't be set anyway...
> 
>  But OK, it doesn't hurt to have this default I guess.
> 
>  S?bastien, could you comment?

Since e2fsprogs 1.43 [1], the 64bit feature is enabled by default.

[1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43

"Mke2fs will now create file systems with the metadata_csum and 64bit
features enabled by default."

Regards,

> 
> 
>  Regards,
>  Arnout
> 
> 
>> +
>>  choice
>>  	prompt "Compression method"
>>  	default BR2_TARGET_ROOTFS_EXT2_NONE
>> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
>> index c8da9c4451..a4c4a7b3d3 100644
>> --- a/fs/ext2/ext2.mk
>> +++ b/fs/ext2/ext2.mk
>> @@ -9,6 +9,8 @@ ifeq ($(BR2_TARGET_ROOTFS_EXT)-$(EXT2_SIZE),y-)
>>  $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
>>  endif
>>  
>> +EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
>> +
>>  # qstrip results in stripping consecutive spaces into a single one. So the
>>  # variable is not qstrip-ed to preserve the integrity of the string value.
>>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
>> @@ -19,7 +21,8 @@ EXT2_OPTS = \
>>  	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
>>  	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
>>  	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
>> -	-L "$(EXT2_LABEL)"
>> +	-L "$(EXT2_LABEL)" \
>> +	$(EXT2_MKFS_OPTS)
>>  
>>  ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>>  
>>
> 


-- 
S?bastien Szymanski
Software engineer, Armadeus Systems
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
