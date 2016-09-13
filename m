From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 13 Sep 2016 22:29:40 +0200
Subject: [Buildroot] Ensafe header/library path issue with
	<pkg>_OVERRIDE_SRCDIR
Message-ID: <1473798580.17229.35.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have an issue when using an autotools package cloned with git. The
clone is added to <pkg>_OVERRIDE_SRCDIR, e.g.

LIBUPNPP_OVERRIDE_SRCDIR=/home/me/override/libupnpp

As this git clone has no configure file autoreconf needs to be run
first. This is currently not supported by the autotools infrastructure.
So I have to choices:

1) Add <pkg>_AUTORECONF=YES
2) Add <pkg>_PRE_CONFIGURE_HOOKS which runs the packages autogen.sh

The first option works fine and is for sure the prefered way.

However, If I choose for curiosity the second option, I run into unsafe
header/library issue for the package libupnpp when doing a "libtool
install" step:

```
make DESTDIR=/home/buildroot/output/host/usr/x86_64-buildroot-linux-
musl/sysroot install -C /home/buildroot/output/build/libupnpp/
?/bin/sh ./libtool???--mode=install /usr/bin/install -c???libupnpp.la
'/home/buildroot/output/host/usr/x86_64-buildroot-linux-
musl/sysroot/usr/lib'

libtool: warning: relinking 'libupnpp.la'
libtool: install: [..]

x86_64-linux-musl-g++: ERROR: unsafe header/library path used in cross-
compilation: '/usr/lib'
libtool:???error: error: relink 'libupnpp.la' with the above command
before installing it
make[2]: *** [Makefile:562: install-libLTLIBRARIES] Error 1
```

I suppose the first option is working as Buildroot patches libtool,
whereas for the second option the host libtool is executed, right? I've
read some post on different mailing lists remarking that libtool has
some issues with cross-compiling.

Is it possible for Buildroot to detect if autoreconf has to be run for
override sources?

Or is it problem of the package and it can fixed by adding some crucial
autoconf/libtool flags? As I did not cited the complete build log, the
steps to reproduce the issue are described below...

Otherwise, I would suggest to add a note to the manual that in case for
autotools packages clone from a repository, a <pkg>_AUTORECONF=YES has
to be added the <pkg>.mk file manually.

---

Steps to reproduce this issue:

1) In the override directory:
? ?git clone?https://github.com/medoc92/libupnpp.git

2) Add the libupnpp override path to the local.mk in the Buildroot dir.

3) Minimal defconfig:
BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBUPNPP=y

4) Add to libupnpp.mk:
define LIBUPNPP_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
LIBUPNPP_PRE_CONFIGURE_HOOKS += LIBUPNPP_RUN_AUTOGEN

---

Best regards
J?rg Krause
