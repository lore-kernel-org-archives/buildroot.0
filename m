From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] uclibc: make sure the default
	configuration doesn't ask questions
Message-ID: <20100502220950.B4F918A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4c57d9638f06038dfd9cb56d60c862b8a8e67efc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since new configuration options have been added in 0.9.31, the value
of these configuration options should be determined, either by the
default configuration file we provide, or by uclibc.mk process.

The locale generation process should probably be improved in order to
allow building other locales than just en_US.

[Peter: fixup locale handling, add PROGRAM__NAME to defconfig]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.31.config |    1 +
 toolchain/uClibc/uclibc.mk            |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index d2e54ad..57541b9 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -90,6 +90,7 @@ UCLIBC_SUSV4_LEGACY=y
 # UCLIBC_HAS_STUBS is not set
 UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+# UCLIBC_HAS___PROGNAME is not set
 UCLIBC_HAS_PTY=y
 ASSUME_DEVPTS=y
 UNIX98PTY_ONLY=y
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index a9ee609..91abc68 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -314,7 +314,7 @@ else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
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
