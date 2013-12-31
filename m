From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Dec 2013 11:07:30 +0200
Subject: [Buildroot] [PATCH 2/3] lmbench: fix build for xtensa
In-Reply-To: <cover.1388480526.git.baruch@tkos.co.il>
References: <cover.1388480526.git.baruch@tkos.co.il>
Message-ID: <5b24fca49c6b4bd0bd1956c63f1337fb76388f44.1388480526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lmbench package generates a binary that is too large for the xtensa default
placement of literals in a dedicated section. Use -mtext-section-literal to
place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/afe/afe9f4550e6ac9a41e4ba338773c1d51034273f7/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lmbench/lmbench.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index c3a6c09..529026f 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -19,6 +19,10 @@ LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 LMBENCH_LDFLAGS += -ltirpc
 endif
 
+ifeq ($(BR2_xtensa),y)
+LMBENCH_CFLAGS += -mtext-section-literals
+endif
+
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
-- 
1.8.5.2
