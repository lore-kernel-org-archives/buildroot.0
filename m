From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:28 -0300
Subject: [Buildroot] [PATCH 03/10] uclibc: move tools to host dir
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move uclibc host tools (ldd/ldconfig) to host dir.
They were previously installed in the staging dir.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uclibc.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e05e16c..ec92824 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -450,17 +450,17 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 	fi
 	# Build the host utils. Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
-		PREFIX=$(STAGING_DIR) \
+		PREFIX=$(HOST_DIR) \
 		HOSTCC="$(HOSTCC)" \
 		hostutils
 	if [ -f $(UCLIBC_DIR)/utils/ldd.host ]; then \
-		install -c $(UCLIBC_DIR)/utils/ldd.host $(STAGING_DIR)/usr/bin/ldd; \
-		ln -sf ldd $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
+		install -D $(UCLIBC_DIR)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
+		ln -sf ldd $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
 	fi
 	if [ -f $(UCLIBC_DIR)/utils/ldconfig.host ]; then \
-		install -c $(UCLIBC_DIR)/utils/ldconfig.host $(STAGING_DIR)/usr/bin/ldconfig; \
-		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
-		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
+		install -D $(UCLIBC_DIR)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
+		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
+		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
 	fi
 	touch -c $@
 
-- 
1.7.2.2
