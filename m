From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:12 +0200
Subject: [Buildroot] [PATCH 04/12] reproducibility/linux: override build
	timestamp
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-4-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index a751da9..2a7310c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -97,6 +97,14 @@ LINUX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+LINUX_MAKE_ENV += \
+	KBUILD_BUILD_VERSION=1 \
+	KBUILD_BUILD_USER=buildroot \
+	KBUILD_BUILD_HOST=buildroot \
+	KBUILD_BUILD_TIMESTAMP="$(shell TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
-- 
2.8.2
