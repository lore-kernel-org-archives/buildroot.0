From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 13:37:28 +0200
Subject: [Buildroot] [PATCH 5/8] ltrace: fix build failure
In-Reply-To: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0878af525699db6c1298ecb340f7ffdd95541045.1273836748.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace failed to build because of missing arguments to gcc to find the
header files. This is due to the fact that the existing ltrace.mk was
setting CC and LD at build time to incorrect values. Keeping the
values set at configure time is just the right thing to do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/ltrace.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index c99f223..4a6811d 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -54,8 +54,7 @@ $(LTRACE_DIR)/.configured: $(LTRACE_DIR)/.patched
 	touch $@
 
 $(LTRACE_DIR)/$(LTRACE_BINARY): $(LTRACE_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld ARCH=$(LTRACE_ARCH) \
-		-C $(LTRACE_DIR)
+	$(MAKE) ARCH=$(LTRACE_ARCH) -C $(LTRACE_DIR)
 
 $(TARGET_DIR)/$(LTRACE_TARGET_BINARY): $(LTRACE_DIR)/$(LTRACE_BINARY)
 	#$(MAKE) DESTDIR=$(TARGET_DIR) ARCH=$(LTRACE_ARCH)  -C $(LTRACE_DIR) install
-- 
1.6.3.3
