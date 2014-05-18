From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 May 2014 22:24:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: remove useless
	makefile target.
Message-ID: <1400444650-29600-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile's target "install-magickincarchHEADERS" and "magick-install-data-local"
install both the same file (magick-baseconfig.h) in the same time...

The problem can be reproduced with:
mkdir /tmp/bar
/usr/bin/install -c -m 644 foo /tmp/bar &
/usr/bin/install -c -m 644 foo /tmp/bar/foo
/usr/bin/install: cannot create regular file '/tmp/bar/foo' : File exists

So, remove one of them.

Fixes:
http://autobuild.buildroot.net/results/d34/d34077ce582866c50bbd90de10bbe593e39463f1/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...2-remove-magick-install-data-local-target.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/imagemagick/imagemagick-02-remove-magick-install-data-local-target.patch

diff --git a/package/imagemagick/imagemagick-02-remove-magick-install-data-local-target.patch b/package/imagemagick/imagemagick-02-remove-magick-install-data-local-target.patch
new file mode 100644
index 0000000..11b4d46
--- /dev/null
+++ b/package/imagemagick/imagemagick-02-remove-magick-install-data-local-target.patch
@@ -0,0 +1,56 @@
+From 8f8f73265b281b0a01f1b6bfe8ec189b24fe75c0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 18 May 2014 20:44:26 +0200
+Subject: [PATCH 1/1] Remove magick-install-data-local target.
+
+The magick-baseconfig.h is already installed by install-magickincarchHEADERS target.
+This cause a race condition by calling install command twice to copy the same file at the same location at the same time.
+
+Fixes:
+http://autobuild.buildroot.net/results/d34/d34077ce582866c50bbd90de10bbe593e39463f1/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.am        |  4 ++--
+ magick/Makefile.am | 12 ------------
+ 2 files changed, 2 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0741336..f9598b6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -184,9 +184,9 @@ all-local: $(MAGICKPP_LOCAL_TARGETS) $(PERLMAGICK_ALL_LOCAL_TARGETS) $(MAINTAINE
+ 
+ install-exec-local: $(PERLMAGICK_INSTALL_EXEC_LOCAL_TARGETS)
+ 
+-install-data-local: $(MAGICK_INSTALL_DATA_LOCAL_TARGETS) $(PERLMAGICK_INSTALL_DATA_LOCAL_TARGETS) $(HTML_INSTALL_DATA_TARGETS)
++install-data-local: $(PERLMAGICK_INSTALL_DATA_LOCAL_TARGETS) $(HTML_INSTALL_DATA_TARGETS)
+ 
+-uninstall-local: $(MAGICK_UNINSTALL_LOCAL_TARGETS) $(PERLMAGICK_UNINSTALL_LOCAL_TARGETS) $(HTML_UNINSTALL_DATA_TARGETS)
++uninstall-local: $(PERLMAGICK_UNINSTALL_LOCAL_TARGETS) $(HTML_UNINSTALL_DATA_TARGETS)
+ 
+ clean-local: $(PERLMAGICK_CLEAN_LOCAL_TARGETS)
+ 
+diff --git a/magick/Makefile.am b/magick/Makefile.am
+index 4c6360b..2e389f2 100644
+--- a/magick/Makefile.am
++++ b/magick/Makefile.am
+@@ -471,15 +471,3 @@ MAGICK_EXTRA_DIST = \
+ 	magick/nt-feature.c \
+ 	magick/vms.c \
+ 	magick/xwdfile.h_vms 
+-
+-# Install magick-baseconfig.h
+-MAGICK_INSTALL_DATA_LOCAL_TARGETS = magick-install-data-local
+-magick-install-data-local:
+-	$(mkinstalldirs) $(DESTDIR)$(magickincarchdir)
+-	$(INSTALL_HEADER) magick/magick-baseconfig.h $(DESTDIR)$(magickincarchdir)/magick-baseconfig.h
+-
+-# Uninstall magick-config.h
+-MAGICK_UNINSTALL_LOCAL_TARGETS = magick-uninstall-local
+-magick-uninstall-local:
+-	rm -f $(DESTDIR)$(magickincarchdir)/magick-baseconfig.h
+-
+-- 
+1.9.0
+
-- 
1.9.0
