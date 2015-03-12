From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 12 Mar 2015 16:12:25 +0100
Subject: [Buildroot] [PATCH v2 1/3] Remove --{enable,
	disable}-debug configure flags.
Message-ID: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding this flag when BR2_ENABLE_DEBUG is activated make several
packages to produce binaries that do not work as expected (e.g., dhcp,
lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
say it is adding this flag. It is supposed to build packages with
debugging symbols enabled. So, let it do that only.

* package/Makefile.in: Do not add --{enable,disable}-debug flags.
* package/pkg-autotools.mk: Remove ENABLE_DEBUG as it is not set
  anymore.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v1 -> v2:
  - Do not pass --disable-debug neither.
---
 package/Makefile.in      | 6 ------
 package/pkg-autotools.mk | 1 -
 2 files changed, 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..049c89b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -387,12 +387,6 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 TARGET_CONFIGURE_OPTS += CXX=false
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
-ENABLE_DEBUG := --enable-debug
-else
-ENABLE_DEBUG := --disable-debug
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --disable-shared
 TARGET_CFLAGS += -static
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d2f15fa..11bc643 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -203,7 +203,6 @@ define $(2)_CONFIGURE_CMDS
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
-		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
-- 
2.1.0
