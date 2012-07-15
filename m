From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 15 Jul 2012 19:19:03 +0200
Subject: [Buildroot] [PATCH] luajit: new package
In-Reply-To: <1342306252-19152-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <20120715004755.4cc159e9@skate>
 <1342306252-19152-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAB0FRsv-bQnLUZvq_8xm4CkQsbxF3z6quUW5jwGhhbr0KK6nZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With a x86 host and an ARM target, I obtain the following error :
>>> luajit 2.0.0-beta10 Building
/usr/bin/make -j2 PREFIX="/usr"
STATIC_CC="/home/user/build/qarm/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
DYNAMIC_CC="/home/user/build/qarm/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-fPIC" TARGET_LD="/home/user/build/qarm/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
TARGET_AR="/home/user/build/qarm/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
rcus" TARGET_STRIP="/home/user/build/qarm/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip"
CFLAGS=" -pipe -Os " LDFLAGS="" HOST_CC=""/usr/bin/gcc -m32""
HOST_CFLAGS="-O2 -I/home/user/build/qarm/host/include
-I/home/user/build/qarm/host/usr/include"
HOST_LDFLAGS="-L/home/user/build/qarm/host/lib
-L/home/user/build/qarm/host/usr/lib
-Wl,-rpath,/home/user/build/qarm/host/usr/lib" -C
/home/user/build/qarm/build/luajit-2.0.0-beta10 amalg
/usr/bin/make: invalid option -- '3'
/usr/bin/make: invalid option -- '2'

so, I remove extra quote :
ifeq ($(BR2_ARCH_IS_64),y)
LUAJIT_HOST_CC=$(HOSTCC)
else
LUAJIT_HOST_CC=$(HOSTCC) -m32
endif

and the build command could be rewrite with CROSS :
define LUAJIT_BUILD_CMDS
	$(MAKE) PREFIX="/usr" \
		HOST_CC="$(LUAJIT_HOST_CC)" \
		CROSS="$(TARGET_CROSS)" \
		-C $(@D) amalg
endef

Fran?ois

Note : please, don't forget http://patchwork.ozlabs.org/patch/162294/

2012/7/15 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> From: Fran?ois Perrad <francois.perrad@gadz.org>
>
> [thomas.petazzoni at free-electrons.com:
>  - Added shared library patch to link luajit dynamically against the
>    luajit library
>  - Added no strip patch.
>  - Added no symlink patch.
>  - Removed symlink creation logic from luajit.mk.
>  - Fixed compilation on x86_64 hosts by adding -m32 to the compile
>    flags.
>  - Added 'depends on' for the architectures supported by luajit.
> ]
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in                             |    3 +-
>  package/luajit/Config.in                      |   10 ++++
>  package/luajit/luajit-01-root-path.patch      |   22 +++++++++
>  package/luajit/luajit-02-shared-lib.patch     |   17 +++++++
>  package/luajit/luajit-03-dont-strip.patch     |   23 ++++++++++
>  package/luajit/luajit-04-no-bin-symlink.patch |   40 ++++++++++++++++
>  package/luajit/luajit.mk                      |   61 +++++++++++++++++++++++++
>  7 files changed, 175 insertions(+), 1 deletion(-)
>  create mode 100644 package/luajit/Config.in
>  create mode 100644 package/luajit/luajit-01-root-path.patch
>  create mode 100644 package/luajit/luajit-02-shared-lib.patch
>  create mode 100644 package/luajit/luajit-03-dont-strip.patch
>  create mode 100644 package/luajit/luajit-04-no-bin-symlink.patch
>  create mode 100644 package/luajit/luajit.mk
>
