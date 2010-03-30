From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Mar 2010 17:23:23 +0200
Subject: [Buildroot] [git commit master] Fix autotools instalation with
	symbols
Message-ID: <20100330152415.8667421344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31365deda785255b00a32f969a059e48b5832ea2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1447

When installing without symbols install-strip is used,
with symbols - install-exec.
Since install-exec installs only executables, we should use
simple install, to install other needed files also
(like files in /usr/shared) as install-strip does.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                       |    1 +
 package/Makefile.autotools.in |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8845b16..0a3a87a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,6 +27,7 @@
 	#1303: Add librsync package
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 	#1441: Add binutils 2.20.1
+	#1447: Package installation on target with debug symbols is broken
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 7114bba..a8dd051 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -60,7 +60,7 @@ $(2)_LIBTOOL_PATCH		?= YES
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 ifeq ($(BR2_ENABLE_DEBUG),y)
-$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 else
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
 endif
-- 
1.6.3.3
