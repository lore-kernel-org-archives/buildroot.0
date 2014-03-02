From: jean.sorgemoel at laposte.net <jean.sorgemoel@laposte.net>
Date: Sun, 02 Mar 2014 20:04:24 +0100
Subject: [Buildroot] [PATCH v5 1/2] modify bootloader option for iso9660
 filesystem image (grub)
In-Reply-To: <20140302171738.3c5c0020@skate>
References: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>	<1393707656-29664-1-git-send-email-jean.sorgemoel@laposte.net>
 <20140302171738.3c5c0020@skate>
Message-ID: <531380B8.5060405@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 02/03/2014 17:17, Thomas Petazzoni wrote:
> Hello,
>
> On Sat,  1 Mar 2014 22:00:55 +0100,jean.sorgemoel at laposte.net  wrote:
>> From: Jerome Sagnole<jean.sorgemoel@laposte.net>
>>
>> Changelog :
>>
>> patch v1 : new branch to generate iso with bootloader isolinux
>>
>> patch v2 : add bootloader option for iso9660 filesystem image (isolinux)
>>          addon to include comment Arnout Vandecappelle
>>          simplify code
>>            1/ I suppress redundant comment
>>            2/ Suppress menu and use conditional (replace 'depends on' by 'if/end$
>>            3/ Modify comment
>>            4/ suppress option (keyboard, ...)
>>            5/ replace 8 x space by tabulation
>>                  File : fs/isolinux/isolinux.mk
>>            6/ suppress extension 'BR2_'
>>            7/ use variable 'ISOLINUX_DIR'
>>            8/ suppress keyboard option
>>            9/ I can't use command '$(INSTALL) -D' beacause I don't define filena$
>>           10/ Hide command genisoimage (with option $@)
>>
>> patch v3 : add bootloader option for iso9660 filesystem image (isolinux)
>>          addon to include comment Thomas Petazzoni & Arnout Vandecappelle
>>          modify comment
>>          default generate iso with grub bootloader
>>          you can select isolinux bootloader
>>          detail : (module fs/iso9660)
>>            option to select bootloader (grub/isolinux)
>>            file(s) bootloader configuration
>>            option to copy file(s) on iso (only for isolinux)
>>            option to create iso with long filenames (Joliet format)
>>            option to create iso with POSIX file system (file mode, uid, gid, ...)
>>            define volume label
>>            define parameter input charset
>>            can use initramfs (if activate), also cpio (like initrd)
>>
>> patch v4 : add bootloader option for iso9660 filesystem image (isolinux)
>>          addon to include comment Arnout Vandecappelle & Thomas Petazzoni
>>          add choise to select bootloader in iso9660 menu
>>          modify comment
>>          seperate code in two patch
>>            1st patch : update iso9660 with grub
>>            2nd patch : add new bootloader isolinux
>>
>> patch v5 part 1: modify bootloader option for iso9660 filesystem image (grub)
>>          addon to include comment Arnout Vandecappelle & Martin Bark
>>          modify option to include files and directories in iso image
>>            suppress option BR2_TARGET_ROOTFS_ISOLINUX_EXTRA_FILES
>>            add option BR2_TARGET_ROOTFS_ISO9660_OVERLAY
>>            modify code to include this new option
>>          modify comment
>>          modify signed-off-by (use real name)
>>          keep default option for BR2_TARGET_ROOTFS_ISO9660_ROCK_RIDGE
>>            in old code, it defined by default (keep for compatibility)
>>          modify default option for BR2_TARGET_ROOTFS_ISO9660_NAME
>>          modify default option for BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
>>          modify variable name to add prefix 'ISO9660_'
>>          "qstrip" each variable
>>            BR2_TARGET_ROOTFS_ISO9660_INPUT_CHARSET
>>            BR2_TARGET_ROOTFS_ISO9660_NAME
>>          modify command INITRD_SED_CMD
>>          modify kernel launch for this iso
>>            use LINUX_IMAGE_NAME
>>            add command sed to replace __LINUX_IMAGE_NAME__ in configuration
> This changelog should go after the "---" sign below. Moreover your
> commit should have a proper title, like:
>
> 	fs/iso9660: <short description>
>
> and a proper commit log, with several paragraphs explaining what the
> commit is changing. Your title mentions only "modify bootloader
> option", but your commit does *much* more than that. If your commit
> does multiple things, it should be split into several commits. Your
> commit actually seems to be doing several things:
>
>   * Adding multiple new options for ISO9660 filesystems: Joliet,
>     RockRidge, name, input charset, overlay, etc.
>
>   * Adding the infrastructure to use different bootloaders.
>
> Those two things should lead to two separate patches.
>
> See also
> http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
> on how to format a git commit log with a changelog.

Good remark, I will update my patch.

>> Signed-off-by: Jerome Sagnole<jean.sorgemoel@laposte.net>
>> ---
>>   fs/iso9660/Config.in  |   49 ++++++++++++++++++++++++++++++++++-
>>   fs/iso9660/iso9660.mk |   68 ++++++++++++++++++++++++++++++++++++-------------
>>   2 files changed, 99 insertions(+), 18 deletions(-)
>>
>> diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
>> index 50b4377..8020bd8 100644
>> --- a/fs/iso9660/Config.in
>> +++ b/fs/iso9660/Config.in
>> @@ -8,10 +8,57 @@ config BR2_TARGET_ROOTFS_ISO9660
>>   	help
>>   	  Build a bootable iso9660 image
>>   
>> +if BR2_TARGET_ROOTFS_ISO9660
>> +
>>   config BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU
>>   	string "Boot menu.lst file"
>> -	depends on BR2_TARGET_ROOTFS_ISO9660
>>   	default "fs/iso9660/menu.lst"
>> +	help
>> +	  Grub configuration
>> +	  Define menu, commands and options for grub
>> +
>> +config BR2_TARGET_ROOTFS_ISO9660_OVERLAY
>> +	string "iso9660 filesystem overlay directories"
>> +	default ""
>> +	help
>> +	  Specify a list of directories that are copied over the root of the
>> +	  iso filesystem after the build has finished and before it is
>> +	  packed into the iso filesystem image.
>> +
>> +	  They are copied as-is into the iso image, excluding files ending
>> +	  with ~ and .git, .svn and .hg directories.
> I must say I'm not a big fan of this. We already have an overlay
> mechanism for the root filesystem. I understand that in the case of
> iso9660, the root filesystem as generated by Buildroot goes into the
> initramfs, and that there is no way to put some more stuff in the
> iso9660 filesystem itself (outside the initramfs), I believe that the
> direction we are taking here is the wrong one.
>
> Instead, I believe we should turn the iso9660 option into what it
> should have been in the first place: using an iso9660 root filesystem.
> So we would get rid of the initramfs usage, enable Rock Ridge and
> Joliet extensions by default, and put the Buildroot filesystem as is in
> the ISO9660 filesystem. This way, no need for an additional overlay
> mechanism, we can just re-use the one from Buildroot.
>
> Do you think this would be possible?
The goal is to copy on iso the binary to choice in boot. (ex. check memory)
The initial code copy only files (not directories). (and without overlay 
method)
What's method can be use?

I will update my patch without this option.
I will enable Joliet extension by default (for Rock Ridge it's ok)

> Thanks,
>
> Thomas

Thanks,
Jerome
