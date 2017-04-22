From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:32:22 +0200
Subject: [Buildroot] [PATCH v8 06/12] e2fsprogs: let it create symlinks
In-Reply-To: <20170422144914.60f5b97e@free-electrons.com>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-7-arnout@mind.be>
 <20170422144914.60f5b97e@free-electrons.com>
Message-ID: <d1e42b70-102c-c03a-ed71-c4c7135041da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 14:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Apr 2017 13:59:49 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: Carlos Santos <casantos@datacom.ind.br>
>>
>> We have post-install hooks to create the symlinks mkfs.ext2 -> mke2fs
>> etc. However, the e2fsprogs build system creates those symlinks itself.
>> So just rely on that.
>>
>> fsck.ext4dev and mkfs.ext4dev were dropped in version 1.43.4.
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> [Arnout: keep configure options more or less alphabetical]
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> This would definitely be a very very nice cleanup, but it doesn't seem
> to work. I've tried to build the following configuration:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-756-gae15148.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_E2FSPROGS=y
> # BR2_PACKAGE_E2FSPROGS_BADBLOCKS is not set
> # BR2_PACKAGE_E2FSPROGS_CHATTR is not set
> # BR2_PACKAGE_E2FSPROGS_DUMPE2FS is not set
> # BR2_PACKAGE_E2FSPROGS_E2FREEFRAG is not set
> # BR2_PACKAGE_E2FSPROGS_E2FSCK is not set

 Ah, indeed, I hadn't checked the symlinks with e2fsck disabled.

> # BR2_PACKAGE_E2FSPROGS_E2LABEL is not set
> # BR2_PACKAGE_E2FSPROGS_E2UNDO is not set
> # BR2_PACKAGE_E2FSPROGS_FILEFRAG is not set
> # BR2_PACKAGE_E2FSPROGS_LOGSAVE is not set
> # BR2_PACKAGE_E2FSPROGS_LSATTR is not set
> # BR2_PACKAGE_E2FSPROGS_MKE2FS is not set
> # BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND is not set
> # BR2_PACKAGE_E2FSPROGS_TUNE2FS is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> and I get numerous broken symbolic links:
> 
> thomas at skate:~/projets/buildroot (master)$ ls -l output/target/usr/sbin/
> total 116
> -rwxr-xr-x 1 thomas thomas 13976 avril 22 14:38 e4crypt
> -rwxr-xr-x 1 thomas thomas 18180 avril 22 14:38 fsck
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 fsck.ext2 -> e2fsck
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 fsck.ext3 -> e2fsck
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 fsck.ext4 -> e2fsck
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 mkfs.ext2 -> mke2fs
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 mkfs.ext3 -> mke2fs
> lrwxrwxrwx 1 thomas thomas     6 avril 22 14:38 mkfs.ext4 -> mke2fs
> -rwxr-xr-x 1 thomas thomas 80996 avril 22 14:38 tune2fs
> 
> So basically: all the symbolic links are broken. It raises a few
> questions:
> 
>  - What is the difference between the fsck option and the e2fsck option?

 fsck is the wrapper, e2fsck is the ext2/3/4-specific checker.


>  - Why is this creating the symbolic links even for programs not
>    installed (e2fsck and mke2fs in our case) ?

 Because e2fsprogs installs them and we remove them.


>  - Why is tune2fs built/installed even if it wasn't enabled in my
>    configuration?

 This I can't explain. tune2fs should be a symlink to e2label, and in addition
it should be removed by Buildroot.


>  - Why is e4crypt built/installed?

 Because it is one of the tools that can't be disabled with configure options,
and it was added to e2fsprogs after the stupid removal hacks were already in
place, and whoever did that bump didn't notice.


 So bottom line: the problem is that this patch individually doesn't work. We
either have to add some complication, or it should be squashed with patch 7.
After patch 7 e2fsck, mke2fs and e2label are always installed so no dead
symlinks anymore.

 OK to squash with patch 7?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
