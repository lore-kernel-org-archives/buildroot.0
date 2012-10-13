From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:32 +0200
Subject: [Buildroot] [PATCH 09/13] Skip menuconfig if BR2_DEFCONFIG or
 BR2_PROJECT_DIR is given.
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231432.17317.13596.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

If BR2_DEFCONFIG or BR2_PROJECT_DIR is given on the command line and
it exists, there is no need to go through menuconfig and we can
build immediately.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index cbaa0c4..1f42141 100644
--- a/Makefile
+++ b/Makefile
@@ -544,8 +544,24 @@ show-targets:
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
+ifneq ($(PROJECT_DIR),)
+ifeq ($(DEFCONFIG),)
+DEFCONFIG = $(wildcard $(PROJECT_DIR)/buildroot.config)
+endif
+endif
+
+ifeq ($(DEFCONFIG),)
+
 all: menuconfig
 
+else # ifeq ($(DEFCONFIG),)
+
+# Re-run make if necessary
+all world: defconfig
+	$(MAKE) $(EXTRAMAKEARGS) $@
+
+endif # ifeq ($(DEFCONFIG),)
+
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # configuration
