From: Eric Malkowski <eric@bvwireless.net>
Date: Wed, 11 Feb 2009 14:18:55 -0500
Subject: [Buildroot] Remove and Rebuild "project_build_arch/project/root"
	tree
Message-ID: <4993249F.5070502@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone-

It's been since November, 2007 since I last grabbed a copy of buildroot 
for a project -- a lot is the same since then, but obviously a lot has 
changed too.

I'm creating a new project based off the tip of svn which is RC4 + 
r25295: gmp/mpfr use static since shared libs are gone -- Peter recently 
committed.  BTW: the unwanted rebuild of mpfr when make is called again 
appears to work fine for me having seen the issue w/ pure RC4 from 2 
days ago.

In the past I've built everything and then just called make to rebuild 
stuff and when things look good, I would use a small script to clean out 
the rootfs and call make to just populate w/ shared libs and binaries by 
having the "make install" portion of everything take care of re-creating 
the rootfs tree under project_build_$(ARCH)/project/root.  This is very 
handy when making wholesale changes to a customized target skeleton so I 
can be confident there's no stale stuff hanging around in the final 
rootfs filesystem.  The script is called "rebuild_root.sh" and looked 
like this:

  #!/bin/sh

  set -x

  rm -f build_i486/grub-0.97/.installed
  rm -f toolchain_build_i486/gcc-4.2.1-final/.libs_installed

  rm -rf project_build_i486/wireless/root
  rm -f project_build_i486/wireless/.root
  rm -f build_i486/staging_dir/.fakeroot.00000

  make

On past projects the above worked great.  With the latest buildroot I'm 
finding after a complete build of everything from scratch, calling 
rebuild_root.sh would rebuild (unwantingly) the uClibc 0.9.30 static and 
shared libs and install those -- that's not too bad -- it would then 
carry on and just install busybox binaries and various packages 
rebuilding my rootfs from a fresh target_skeleton.

But -- calling rebuild_root.sh a second time would cause a bunch of 
additional toolchain related stuff (gcc final) and busybox itself to be 
recompiled, but NOT uClibc -- it's not consistent.  Calling it a third 
time is like the first time -- rebuild just uClibc 0.9.30 and then just 
install busybox, other packages etc.

In tracing this a bit, first rebuild causes uClibc to call "make 
install_runtime" and it recompiles the libs, installs in TARGET_DIR -- 
everything else just installs, nothing else rebuilds
The second rebuild causes uClibc to call "make install_runtime 
install_dev" which skips compling uclibc like the first rebuild, but 
some headers are re-created which causes a call to just "make 
install_runtime", that skips compiling uClibc -- fine, but 
gcc-4.3.2-final would run configure and make and rebuild libiberty -- 
recompiling all of that.  That then causes busybox to recompile 
everything due to some dependency on gcc/uclibc being partially rebuilt 
(I think).  The remaining stuff after busybox installs fine w/o rebuilds.
Do a third rebuild, it behaves like the first rebuild and the pattern 
repeats.

My goal is to be able to somehow remove 
project_build_$(ARCH)/$(PROJECT)/root and call make to re-populate while 
minimizing stuff from being rebuilt -- just allow the various "make 
installs" to re-populate.  Does anyone have any suggestions / 
alternatives to meet my goal?  I'm open for other approaches -- perhaps 
what I'm doing is overkill?

If my approach seems doable -- can anyone advise what files to remove or 
touch so I can re-build the root from empty and let genxt2fs create my 
compressed rootfs -- it's very handy when trying to just re-build 
add-ons to the base buildroot toolchain + packages and re-create the 
rootfs.

If the toolchain is just too inter-twined with dependencies on things 
under project_build_$(ARCH)/$(PROJECT)/root, then I will try to work 
around it -- I guess I can get everything working w/o removing the 
rootfs wholesale or perhaps not remove the various .so files placed in 
there by gcc/uclibc/toolchain related "make install" stuff, but 
suggestions are appreciated.

On another note -- the OpenSSL and OpenSSH packages for whatever reason 
don't re-build or re-install their binaries in the rootfs when doing 
this.  In the past they did and the only package I had to force into 
re-populating it's binaries was grub as seen above along with the 
gcc-4.2.1-final libgcc shared libs by removing .libs_installed -- I've 
noticed .libs_installed is no longer, grub doesn't install it's 
binaries, and OpenSSL / OpenSSH similar to grub don't install their 
binaries upon trying to rebuild root.

Sorry to be so long winded -- any ideas appreciated.

Thanks,

-Eric Malkowski
