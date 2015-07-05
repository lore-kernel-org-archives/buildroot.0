From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 11:10:07 +0200
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705000050.7c2be969@core2quad.morethan.org>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
Message-ID: <20150705111007.63ff239b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike,

On Sun, 5 Jul 2015 00:00:50 -0500, Mike wrote:

> Meanwhile, the package I had specified as external was
> LuaJIT.
> And that package may be a **very special** case.

I've tried with LuaJIT and out of tree build, and it works just fine
for me:

 */ I have the LuaJIT Git repository cloned in
    $(HOME)/projets/luajit-2.0

 */ I have my Buildroot source code in $(HOME)/projets/buildroot

 */ I create my out of tree build directory in /tmp/luajit-build/

Here is what I do:

$ cat > .config
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LUAJIT=y
# BR2_TARGET_ROOTFS_TAR is not set
$ make olddefconfig
$ cat > local.mk
LUAJIT_OVERRIDE_SRCDIR = $(HOME)/projets/luajit-2.0/

And what happens:

$ make
[...]
>>> luajit custom Syncing from source dir /home/thomas/projets/luajit-2.0/
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/thomas/projets/luajit-2.0// /tmp/luajit-build/build/luajit-custom
>>> luajit custom Configuring
>>> luajit custom Building
/usr/bin/make -j5 PREFIX="/usr" STATIC_CC="/tmp/luajit-build/host/usr/bin/arm-linux-gcc" DYNAMIC_CC="/tmp/luajit-build/host/usr/bin/arm-linux-gcc -fPIC" TARGET_LD="/tmp/luajit-build/host/usr/bin/arm-linux-gcc" TARGET_AR="/tmp/luajit-build/host/usr/bin/arm-linux-ar rcus" TARGET_STRIP=true TARGET_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os " TARGET_LDFLAGS="" HOST_CC="/usr/bin/gcc -m32" HOST_CFLAGS="-O2 -I/tmp/luajit-build/host/usr/include" HOST_LDFLAGS="-L/tmp/luajit-build/host/lib -L/tmp/luajit-build/host/usr/lib -Wl,-rpath,/tmp/luajit-build/host/usr/lib" BUILDMODE=dynamic -C /tmp/luajit-build/build/luajit-custom amalg
Building LuaJIT 2.0.4
/usr/bin/make -C src amalg
+--------------------------------------------------------------------------+
| WARNING: Compiling the amalgamation needs a lot of virtual memory        |
| (around 300 MB with GCC 4.x)! If you don't have enough physical memory   |
| your machine will start swapping to disk and the compile will not finish |
| within a reasonable amount of time.                                      |
| So either compile on a bigger machine or use the non-amalgamated build.  |
+--------------------------------------------------------------------------+
/usr/bin/make all "LJCORE_O=ljamalg.o"
HOSTCC    host/minilua.o
HOSTCC    host/buildvm_asm.o
HOSTCC    host/buildvm_peobj.o
HOSTCC    host/buildvm_lib.o
[...]

I.e, it works perfectly fine.

So there is something else you are doing, or that is special in your
setup.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
