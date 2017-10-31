From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Oct 2017 19:36:56 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/git: bump version to 2.15.0
Message-ID: <20171031183657.27406-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To avoid the build error

grep.c:(.text+0xa02): undefined reference to `pcre_jit_exec'

we need to add NO_LIBPCRE1_JIT=1 according to
https://www.spinics.net/lists/git/msg314515.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/git/git.hash | 2 +-
 package/git/git.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index d65296f17a..79a386eb72 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 bce97e403bea34f50378e90ade10c12666b2382cc247551b63dc5604e03b2523  git-2.13.6.tar.xz
+sha256 107116489f10b758b51af1c5dbdb9a274917b0fb67dc8eaefcdabc7bc3eb3e6a  git-2.15.0.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 9f13f0f6aa..181e7421e2 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.13.6
+GIT_VERSION = 2.15.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
@@ -22,6 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
 GIT_DEPENDENCIES += pcre
 GIT_CONF_OPTS += --with-libpcre
+GIT_MAKE_OPTS += NO_LIBPCRE1_JIT=1
 else
 GIT_CONF_OPTS += --without-libpcre
 endif
@@ -58,7 +59,7 @@ GIT_CONF_OPTS += --without-tcltk
 endif
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-GIT_MAKE_OPTS = NO_GETTEXT=1
+GIT_MAKE_OPTS += NO_GETTEXT=1
 endif
 
 GIT_INSTALL_TARGET_OPTS = $(GIT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-- 
2.11.0
