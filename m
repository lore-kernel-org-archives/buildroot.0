From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 14:30:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/asterisk: fix parallel build/install
In-Reply-To: <cover.1511789437.git.yann.morin.1998@free.fr>
References: <cover.1511789437.git.yann.morin.1998@free.fr>
Message-ID: <77a465b5afe27dd09b5b3ec5a4e9069b24f00a5e.1511789437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/7c9892b9425aff6e54b8c8942dbdcb0b26e58572

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...nsure-target-directory-for-modules-exists.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch

diff --git a/package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch b/package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch
new file mode 100644
index 0000000000..92ff296a38
--- /dev/null
+++ b/package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch
@@ -0,0 +1,32 @@
+From 933b2554a40f932571bdbdbb5217cda3e35fd61f Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 27 Nov 2017 12:52:52 +0100
+Subject: [PATCH] build: ensure target directory for modules exists
+
+Currently, in highly-parallel builds, it is possible that installing
+modules fails because the target direcotry does not exist yet.
+
+We fix that by instructing $(INSTALL) to create the destination directory
+first.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile.moddir_rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.moddir_rules b/Makefile.moddir_rules
+index 59190bece9..b73153a9a5 100644
+--- a/Makefile.moddir_rules
++++ b/Makefile.moddir_rules
+@@ -110,7 +110,7 @@ clean::
+ 
+ install:: all
+ 	@echo "Installing modules from `basename $(CURDIR)`..."
+-	@for x in $(LOADABLE_MODS:%=%.so); do $(INSTALL) -m 755 $$x "$(DESTDIR)$(ASTMODDIR)" ; done
++	@for x in $(LOADABLE_MODS:%=%.so); do $(INSTALL) -D -m 755 $$x "$(DESTDIR)$(ASTMODDIR)" ; done
+ ifneq ($(findstring :,$(XMLSTARLET)$(BASH)),:)
+ 	@if [ -f .moduleinfo ] ; then \
+ 		declare -A DISABLED_MODS ;\
+-- 
+2.11.0
+
-- 
2.11.0
