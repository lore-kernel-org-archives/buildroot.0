From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 21 Jan 2019 00:08:57 +0800
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <20190120141318.szbl7zs4bgazznov@vkochan-ThinkPad-T470p>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
 <20190119163336.ihaetocpbabtnnjj@vkochan-ThinkPad-T470p>
 <CAAsE_udPhniigABfB27SO9nWdPKSAg=kfjrwLTDKuU3DAyuC7Q@mail.gmail.com>
 <20190120141318.szbl7zs4bgazznov@vkochan-ThinkPad-T470p>
Message-ID: <CAAsE_uf8o9nR2C+kDxfGz12Ov6oEGaM3MBuonnqMHR7MgWd9Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried several combination with the toolchain selections, at the last I
also directly copied your config, but it's still the same error.  But the
last time (with your configs) the output log appeared a little different:

PATH="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/bin:/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/sbin:/opt/linaro/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin:/home/woody/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
PKG_CONFIG="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib/pkgconfig:/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/share/pkgconfig"
/usr/bin/make -j1  -C
/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/
running build
running build_ext
INFO: Can't locate Tcl/Tk libs and/or headers
building 'crypt' extension
/usr/bin/gcc -pthread -fPIC -fno-strict-aliasing -O2
-I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/include
-DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I. -IInclude -I./Include
-I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/include
-I/usr/include/x86_64-linux-gnu -I/usr/local/include
-I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Include
-I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15
-c
/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.c
-o
build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
/usr/bin/gcc -pthread -shared
-L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
-Wl,-rpath,/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
-Wl,--enable-new-dtags
build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
-L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
-L/usr/lib/x86_64-linux-gnu -L/usr/local/lib -L. -lcrypt -lpython2.7 -o
build/lib.linux-x86_64-2.7/crypt.so

Python build finished, but the necessary bits to build these modules were
not found:
_bsddb             _sqlite3           _tkinter
bsddb185           bz2                dbm
dl                 gdbm               imageop
readline           sunaudiodev
To find the necessary bits, look in setup.py in detect_modules() for the
module's name.


Failed to build these modules:
crypt
================

Can you guess a clue from above?  Thanks!


On Sun, Jan 20, 2019 at 10:04 PM Vadim Kochan <vadim4j@gmail.com> wrote:

> Hi,
>
> On Sun, Jan 20, 2019 at 08:51:32PM +0800, Woody Wu wrote:
> > Hi,
> >
> > My savedefconfig:
> >
> > BR2_arm=y
> > BR2_cortex_a8=y
> > BR2_ARM_FPU_NEON=y
> > BR2_DL_DIR="$(TOPDIR)/../downloads"
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnueabihf"
> > BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > BR2_PACKAGE_IOSTAT=y
> > BR2_PACKAGE_NODEJS=y
> > BR2_PACKAGE_PYTHON=y
> >
> > BTW: My building system is ubuntu 18.10.  The target is armv7
> >
> >
> > On Sun, Jan 20, 2019 at 12:24 AM Vadim Kochan <vadim4j@gmail.com> wrote:
> >
> > > Hi Woody,
> > >
> > > On Sun, Jan 20, 2019 at 12:15:36AM +0800, Woody Wu wrote:
> > > > Hi,
> > > >
> > > > This is buildroot-2018.11.1.    I found I cannot build some packages
> with
> > > > buildroot, the problem seemed in the building of the host-python.
> Below
> > > is
> > > > the log:
> > > >
> > > > >>> host-python 2.7.15 Building
> > > >
> > >
> PATH="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/bin:/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/sbin:/opt/linaro/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin:/home/woody/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
> > > >
> > >
> PKG_CONFIG="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/bin/pkg-config"
> > > > PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
> > > > PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
> > > >
> > >
> PKG_CONFIG_LIBDIR="/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib/pkgconfig:/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/share/pkgconfig"
> > > > /usr/bin/make -j1  -C
> > > >
> > >
> /home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/
> > > > running build
> > > > running build_ext
> > > > INFO: Can't locate Tcl/Tk libs and/or headers
> > > > building 'crypt' extension
> > > > /usr/bin/gcc -pthread -fPIC -fno-strict-aliasing -O2
> > > >
> > >
> -I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/include
> > > > -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -I. -IInclude
> > > -I./Include
> > > >
> > >
> -I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/include
> > > > -I/usr/include/x86_64-linux-gnu -I/usr/local/include
> > > >
> > >
> -I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Include
> > > >
> > >
> -I/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15
> > > > -c
> > > >
> > >
> /home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.c
> > > > -o
> > > >
> > >
> build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
> > > > /usr/bin/gcc -pthread -shared
> > > >
> > >
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> > > >
> > >
> -Wl,-rpath,/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> > > > -Wl,--enable-new-dtags
> > > >
> > >
> build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
> > > >
> > >
> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
> > > > -L/usr/lib/x86_64-linux-gnu -L/usr/local/lib -L. -lcrypt -lpython2.7
> -o
> > > > build/lib.linux-x86_64-2.7/crypt.so
> > > > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libcrypt.a(crypt-entry.o):
> > > > relocation R_X86_64_PC32 against symbol `_ufc_foobar' can not be used
> > > when
> > > > making a shared object; recompile with -fPIC
> > > > /usr/bin/ld: final link failed: bad value
> > > > collect2: error: ld returned 1 exit status
> > > >
> > > > Python build finished, but the necessary bits to build these modules
> were
> > > > not found:
> > > > _bsddb             _sqlite3           _tkinter
> > > > bsddb185           bz2                dbm
> > > > dl                 gdbm               imageop
> > > > readline           sunaudiodev
> > > > To find the necessary bits, look in setup.py in detect_modules() for
> the
> > > > module's name.
> > > >
> > > > Failed to build these modules:
> > > > crypt
> > > > =============
> > > >
> > > > Can someone have a look at it and give me a hint?
> > > >
> > > > Thanks!
> > > >
>
> So, you are using custom toolchain, I used this defconfig:
>
>         BR2_arm=y
>         BR2_cortex_a8=y
>         BR2_ARM_FPU_NEON=y
>         BR2_TOOLCHAIN_EXTERNAL=y
>         BR2_PACKAGE_IOSTAT=y
>         BR2_PACKAGE_NODEJS=y
>         BR2_PACKAGE_PYTHON=y
>
> and it builds OK on master and 2018.11.1 tag.
>
> Regards,
> Vadim Kochan
>


-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

woody
public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190121/05d8f5ce/attachment.html>
