From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 21:58:06 +0200
Subject: [Buildroot] [git commit] toolchain/uClibc: properly honor DEBUG and
	STRIP options
Message-ID: <20130627200344.D9B779B25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0056b811f7c94ea8f31e138bf827c5ce90ea5b66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default uClibc configurations strip the resulting binaries/libraries
and don't add debug symbols which is a problem when wanting to debug
issues.
Bind the buildroot BR2_STRIP_* option to uClibc .config DO_STRIP and
BR2_ENABLE_DEBUG to uClibc DO_DEBUG.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uclibc.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index da1830f..2036dab 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -287,6 +287,18 @@ endif
 	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/PTHREADS_DEBUG_SUPPORT/d' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/UCLIBC_HAS_THREADS_NATIVE/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/DODEBUG /d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/DOSTRIP/d' $(UCLIBC_DIR)/.oldconfig
+ifeq ($(BR2_STRIP_none),y)
+	echo "# DOSTRIP is not set" >> $(UCLIBC_DIR)/.oldconfig
+else
+	echo "DOSTRIP=y" >> $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_ENABLE_DEBUG),y)
+	echo "DODEBUG=y" >> $(UCLIBC_DIR)/.oldconfig
+else
+	echo "# DODEBUG is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ($(BR2_PTHREADS_NONE),y)
 	echo "# UCLIBC_HAS_THREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
 else
