From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 11:57:51 +0100
Subject: [Buildroot] [git commit] lmbench: fix build for xtensa
Message-ID: <20131231105813.65C869C27E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c04932603476f3adf474f3bc47c35bdb59d947a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lmbench package generates a binary that is too large for the xtensa default
placement of literals in a dedicated section. Use -mtext-section-literal to
place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/afe/afe9f4550e6ac9a41e4ba338773c1d51034273f7/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
