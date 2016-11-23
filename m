From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:44 +0100
Subject: [Buildroot] [PATCH v4 05/18] reproducibility/linux: override build
	timestamp
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Linux kernel include a few information about build environment in its binary.
This feature is incompatible with BR2_REPRODUCIBLE. This patch overload build
information when BR2_REPRODUCIBLE is enabled.

Note that usage of KBUILD_BUILD_TIMESTAMP is not mandatory since Buildroot
use `fakedate'. However, native solution is prefered when upstream
provide one.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - Justify use of KBUILD_BUILD_TIMESTAMP (Arnout)

 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 988427c..7e826cc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -94,6 +94,14 @@ LINUX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+LINUX_MAKE_ENV += \
+	KBUILD_BUILD_VERSION=1 \
+	KBUILD_BUILD_USER=buildroot \
+	KBUILD_BUILD_HOST=buildroot \
+	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
-- 
1.9.1
