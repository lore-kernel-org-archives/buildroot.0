From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:11:42 +0100
Subject: [Buildroot] [git commit] package/coremark-pro: fix build without
 threads
Message-ID: <20210118205305.020DE7F899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1e15eec4223b8205c28e52e7f4f386481e6aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coremark-pro/coremark-pro.mk | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
index fdcfda33e8..f69279d5cd 100644
--- a/package/coremark-pro/coremark-pro.mk
+++ b/package/coremark-pro/coremark-pro.mk
@@ -10,13 +10,32 @@ COREMARK_PRO_LICENSE = Apache-2.0
 COREMARK_PRO_LICENSE_FILES = LICENSE.md
 COREMARK_PRO_DEPENDENCIES = perl
 
+COREMARK_PRO_LDFLAGS = -lm
+
 ifeq ($(BR2_ENDIAN),"BIG")
-COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=1 EE_LITTLE_ENDIAN=0'
+COREMARK_PRO_DEFINES += \
+	EE_BIG_ENDIAN=1 \
+	EE_LITTLE_ENDIAN=0
+else
+COREMARK_PRO_DEFINES += \
+	EE_BIG_ENDIAN=0 \
+	EE_LITTLE_ENDIAN=1
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+COREMARK_PRO_DEFINES += \
+	USE_NATIVE_PTHREAD=1 \
+	USE_SINGLE_CONTEXT=0
+COREMARK_PRO_LDFLAGS += -lpthread
 else
-COREMARK_PRO_MAKE_OPTS += PLATFORM_DEFINES='EE_BIG_ENDIAN=0 EE_LITTLE_ENDIAN=1'
+COREMARK_PRO_DEFINES += \
+	USE_NATIVE_PTHREAD=0 \
+	USE_SINGLE_CONTEXT=1
 endif
 
 COREMARK_PRO_MAKE_OPTS += \
+	LINKER_LAST="$(COREMARK_PRO_LDFLAGS)" \
+	PLATFORM_DEFINES="$(COREMARK_PRO_DEFINES)" \
 	TARGET=linux$(if $(BR2_ARCH_IS_64),64) \
 	EXE=
 
