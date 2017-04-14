From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 20:31:24 +0200
Subject: [Buildroot] Journal size too big for filesystem
In-Reply-To: <fa03666f-27d6-d01b-078a-7da8900e9eb6@gmail.com>
References: <fa03666f-27d6-d01b-078a-7da8900e9eb6@gmail.com>
Message-ID: <6e150539-1b8b-4b65-fa49-0b1ec4d10f60@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-04-17 12:29, St?phane Jublin wrote:
> Hi,
> 
> thank's for Buildroot.
> I just beging to learn , understand and test it.
> I've got the last version of buildroot (git pull in my git directory)
> 
> I just try to build an image.
> 1) make pc_x86_64_bios_defconfig
> 2) make
> 
> at the end of the compilation I have this error
> 
> 
> *tune2fs 1.43.4 (31-Jan-2017)**
> **tune2fs 1.43.4 (31-Jan-2017)**
> ****
> **Please run e2fsck on the filesystem.**
> ****
> **Creating journal inode:**
> **Journal size too big for filesystem.**

 Correct, this is one of the defconfigs that need fixing after the change that
you refer to below.

 The problem is that the filesystem size is too small. To fix in your local
build without patching Buildroot, you can just do

make menuconfig

then go the the Filesystem images menu, select the 'exact size in blocks' option
and change the 61440 into 120000.

Exit menuconfig, then type

make

and the build should succeed.

 Regards,
 Arnout

> ****
> **fs/ext2/ext2.mk:44 : Recipe for target
> ? /home/***/git/buildroot/output/images/rootfs.ext2 ? failed**
> **make[1]: *** [/home/***/git/buildroot/output/images/rootfs.ext2] Erreur 1**
> **Makefile:79 : Recipe for target ? _all ? failed**
> **make: *** [_all] Erreur 2*
> 
> 
> I find this error on different web site, but no effect
> https://github.com/buildroot/buildroot/commit/c6bca8cef0310bc649240b451989457ce94a8358
> https://git.busybox.net/buildroot/commit/?id=0fab0a4afdff2f27fce49e7b38179e781e7b64ed
> https://patchwork.ozlabs.org/patch/225977/
> 
> Could you help me ?
> 
> Thank's
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
