From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2009 16:16:06 +0200
Subject: [Buildroot] [PATCH 1/1] microperl: fix build
In-Reply-To: <cover.1249395363.git.thomas.petazzoni@free-electrons.com>
References: <cover.1249395363.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6cd57ce392233177261d218a8697c92bd0f9a764.1249395363.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the little build systems hacks that no longer applied to the
version of Perl being used. With these fixes in place, microperl
builds and runs properly simple Perl commands on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/microperl/microperl.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 5a41f38..f2a958b 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -33,8 +33,8 @@ $(MICROPERL_DIR)/.host_configured: $(MICROPERL_DIR)/.source
 
 
 $(MICROPERL_DIR)/.host_configured_and_fixed: $(MICROPERL_DIR)/.host_configured
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/makefile
-	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/makefile
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/Makefile
+	$(SED) 's/^.*<command-line>.*//g' $(MICROPERL_DIR)/x2p/Makefile
 	touch $@
 
 $(MICROPERL_DIR)/.host_make: $(MICROPERL_DIR)/.host_configured_and_fixed
@@ -42,7 +42,6 @@ $(MICROPERL_DIR)/.host_make: $(MICROPERL_DIR)/.host_configured_and_fixed
 	touch $@
 
 $(MICROPERL_DIR)/.host_make_fixed: $(MICROPERL_DIR)/.host_make
-	$(SED) 's#^.*<asm/page.h>.*##g' $(MICROPERL_DIR)/ext/IPC/SysV/SysV.c
 	$(MAKE) -C $(MICROPERL_DIR) test	|| echo "An error is expected on make test"
 	touch $@
 
-- 
1.6.0.4
