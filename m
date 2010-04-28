From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:51 +0200
Subject: [Buildroot] [PATCH 10/19] uclibc: make sure the default
	configuration doesn't ask questions
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <741b47e2a65e767bc93ab4ed094248617c5e1298.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since new configuration options have been added in 0.9.31, the value
of these configuration options should be determined, either by the
default configuration file we provide, or by uclibc.mk process.

The locale generation process should probably be improved in order to
allow building other locales than just en_US.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uclibc.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index a9ee609..e8556d0 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -314,7 +314,7 @@ else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
@@ -325,8 +325,10 @@ else
 endif
 ifeq ($(BR2_PROGRAM_INVOCATION),y)
 	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ("$(KERNEL_ARCH)","i386")
 	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
-- 
1.6.3.3
