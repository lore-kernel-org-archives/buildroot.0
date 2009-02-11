From: Eric Malkowski <eric@bvwireless.net>
Date: Wed, 11 Feb 2009 16:29:21 -0500
Subject: [Buildroot] Remove and Rebuild
	"project_build_arch/project/root" tree
In-Reply-To: <4993249F.5070502@bvwireless.net>
References: <4993249F.5070502@bvwireless.net>
Message-ID: <49934331.1080406@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After working on this some more, here's what I came up with --
With this rebuild_root.sh script, I can use it to rebuild the rootfs and 
pickup updates to target skeleton, my own stuff I build on top of base 
buildroot and packages that copies stuff into the rootfs.

Just calling make after a full build has most things install all of 
their stuff properly (verified by diffing a full build versus 
rebuild_root.sh run):
   busybox
   gdb  (I'm just building gdbserver for target)
   kernel modules
   pci_utils
   setserial
   wireless_tools
   zlib

Stuff that needs "extra files" removed so they'll properly install their 
binaries / utils / libs in to the rootfs:

   grub
   openssl / openssh

I get libgcc_s share libs from gcc_final from removing autotools-stamps 
files for free.
If I want my kernel to rebuild completely, I remove 
project_build_arch/project/linux-2.6.X.Y and it rebuilds the kernel for 
me -- I mostly rebuild the kernel if I change kernel config, or rootfs 
if I change my own stuff or some buildroot item.

Here's the script as it stands -- still open for other ideas ... curious 
what you guys think -- maybe I'm way off in left field here, but this 
does what I'm after and what I historically have been doing since 2005 
timeframe (what I did in 2005 was even simpler than 2007 shown in quoted 
post below which is simpler than the following script -- that's why I'm 
wondering if I'm wandering into the weeds):

#!/bin/sh

# Set appropriately -- I realize if we did this w/ make we could use
# vars from buildroot hierarchy.

RB_ARCH=i586
RB_PROJECT=vehicle_manager

set -x

# Kill everything in "root" area except /lib directory
# If some package we enable that installs convenience shared libs in /lib
# and we want to make sure those get rebuilt and populated in the "root" 
area,
# then remove those by individial libxyz-x.y.z.so and various libxyz.so.N
# symlink -- currently there's nothing but uclibc provided libs and
# libgcc_s.so.1 from gcc-final in our setup -- when enabling new packages --
# check for new libs installed in /lib area of "root" and add to removal
# commands here for rebuild_root functionality.

(cd project_build_${RB_ARCH}/${RB_PROJECT}/root; \
   rm -rf bin dev etc home lib/modules linuxrc mnt opt \
          proc root sbin sys tmp usr var)

# Make sure target_skeleton gets copied over
rm -f project_build_${RB_ARCH}/${RB_PROJECT}/.root

# Make sure fakeroot does makedevs based on device table and creates
# a real ramdisk capable fs w/ genext2fs
rm -f build_${RB_ARCH}/staging_dir/.fakeroot.00000

# Make sure grub populates it's files
rm -f build_${RB_ARCH}/grub-0.97/.installed

# Maks sure SSH populates it's binaries ... also makes gcc libs get copied
# too, no harm there -- but be careful if more packages are enabled in
# buildroot conf that cause more autotools-stamps to appear for which
# removal on rebuild-root might make more stuff rebuild than we want
rm -f project_build_${RB_ARCH}/${RB_PROJECT}/autotools-stamps/*

make


That's the end of the above script.

The next thing I'll do is a quick hack to toplevel makfile to include a 
small bit of make variables in a file that use my own target_skeleton 
and device_table.txt, then I'll specify my own busybox config and 
possibly uclibc config, although the default so far appears fine and 
what I'll have is all stuff I need custom in one place w/o having to do 
a target/device/xyz "board support" setup like I've done in the past.  I 
was going to suggest adding the ability to pick in the BR menuconfig a 
custom target_skeleton / device_table to use -- if what I do doesn't end 
up being too ugly, I'll post a patch for what I plan to do.

Thanks,

-Eric

Eric Malkowski wrote:
> Hi everyone-
>
> It's been since November, 2007 since I last grabbed a copy of 
> buildroot for a project -- a lot is the same since then, but obviously 
> a lot has changed too.
>
> I'm creating a new project based off the tip of svn which is RC4 + 
> r25295: gmp/mpfr use static since shared libs are gone -- Peter 
> recently committed.  BTW: the unwanted rebuild of mpfr when make is 
> called again appears to work fine for me having seen the issue w/ pure 
> RC4 from 2 days ago.
>
> In the past I've built everything and then just called make to rebuild 
> stuff and when things look good, I would use a small script to clean 
> out the rootfs and call make to just populate w/ shared libs and 
> binaries by having the "make install" portion of everything take care 
> of re-creating the rootfs tree under 
> project_build_$(ARCH)/project/root.  This is very handy when making 
> wholesale changes to a customized target skeleton so I can be 
> confident there's no stale stuff hanging around in the final rootfs 
> filesystem.  The script is called "rebuild_root.sh" and looked like this:
>
>  #!/bin/sh
>
>  set -x
>
>  rm -f build_i486/grub-0.97/.installed
>  rm -f toolchain_build_i486/gcc-4.2.1-final/.libs_installed
>
>  rm -rf project_build_i486/wireless/root
>  rm -f project_build_i486/wireless/.root
>  rm -f build_i486/staging_dir/.fakeroot.00000
>
>  make
>
> On past projects the above worked great.  With the latest buildroot 
> I'm finding after a complete build of everything from scratch, calling 
> rebuild_root.sh would rebuild (unwantingly) the uClibc 0.9.30 static 
> and shared libs and install those -- that's not too bad -- it would 
> then carry on and just install busybox binaries and various packages 
> rebuilding my rootfs from a fresh target_skeleton.
>
> But -- calling rebuild_root.sh a second time would cause a bunch of 
> additional toolchain related stuff (gcc final) and busybox itself to 
> be recompiled, but NOT uClibc -- it's not consistent.  Calling it a 
> third time is like the first time -- rebuild just uClibc 0.9.30 and 
> then just install busybox, other packages etc.
>
> In tracing this a bit, first rebuild causes uClibc to call "make 
> install_runtime" and it recompiles the libs, installs in TARGET_DIR -- 
> everything else just installs, nothing else rebuilds
> The second rebuild causes uClibc to call "make install_runtime 
> install_dev" which skips compling uclibc like the first rebuild, but 
> some headers are re-created which causes a call to just "make 
> install_runtime", that skips compiling uClibc -- fine, but 
> gcc-4.3.2-final would run configure and make and rebuild libiberty -- 
> recompiling all of that.  That then causes busybox to recompile 
> everything due to some dependency on gcc/uclibc being partially 
> rebuilt (I think).  The remaining stuff after busybox installs fine 
> w/o rebuilds.
> Do a third rebuild, it behaves like the first rebuild and the pattern 
> repeats.
>
> My goal is to be able to somehow remove 
> project_build_$(ARCH)/$(PROJECT)/root and call make to re-populate 
> while minimizing stuff from being rebuilt -- just allow the various 
> "make installs" to re-populate.  Does anyone have any suggestions / 
> alternatives to meet my goal?  I'm open for other approaches -- 
> perhaps what I'm doing is overkill?
>
> If my approach seems doable -- can anyone advise what files to remove 
> or touch so I can re-build the root from empty and let genxt2fs create 
> my compressed rootfs -- it's very handy when trying to just re-build 
> add-ons to the base buildroot toolchain + packages and re-create the 
> rootfs.
>
> If the toolchain is just too inter-twined with dependencies on things 
> under project_build_$(ARCH)/$(PROJECT)/root, then I will try to work 
> around it -- I guess I can get everything working w/o removing the 
> rootfs wholesale or perhaps not remove the various .so files placed in 
> there by gcc/uclibc/toolchain related "make install" stuff, but 
> suggestions are appreciated.
>
> On another note -- the OpenSSL and OpenSSH packages for whatever 
> reason don't re-build or re-install their binaries in the rootfs when 
> doing this.  In the past they did and the only package I had to force 
> into re-populating it's binaries was grub as seen above along with the 
> gcc-4.2.1-final libgcc shared libs by removing .libs_installed -- I've 
> noticed .libs_installed is no longer, grub doesn't install it's 
> binaries, and OpenSSL / OpenSSH similar to grub don't install their 
> binaries upon trying to rebuild root.
>
> Sorry to be so long winded -- any ideas appreciated.
>
> Thanks,
>
> -Eric Malkowski
