From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Thu,  2 Sep 2010 12:09:48 +0200
Subject: [Buildroot] [PATCH 5/8] Use the normal download method for Tremor
In-Reply-To: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1283422191-30926-6-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the generic download method supports Subversion, fall back to
the normal usage of AUTOTARGETS for Tremor.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
---
 package/multimedia/tremor/tremor.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index 74fd725..654a403 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -5,19 +5,11 @@
 ############################################################
 
 TREMOR_SITE:=http://svn.xiph.org/trunk/Tremor/
+TREMOR_SITE_METHOD:=svn
 TREMOR_VERSION:=16259
-TREMOR_SVNDIR = Tremor-svn-r$(TREMOR_VERSION)
-TREMOR_SOURCE:= $(TREMOR_SVNDIR).tar.bz2
+
 TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(TREMOR_SOURCE):
-	$(SVN_CO) -r $(TREMOR_VERSION) $(TREMOR_SITE) $(BUILD_DIR)/$(TREMOR_SVNDIR)
-	tar -cv -C $(BUILD_DIR) $(TREMOR_SVNDIR) | bzip2 - -c > $@
-	rm -rf $(BUILD_DIR)/$(TREMOR_SVNDIR)
-
-# use custom download step
-TREMOR_TARGET_SOURCE := $(DL_DIR)/$(TREMOR_SOURCE)
-
 $(eval $(call AUTOTARGETS,package/multimedia,tremor))
-- 
1.6.3.3.346.g8a41d
