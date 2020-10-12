From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 08:35:45 +0200
Subject: [Buildroot] [git commit] package/htpdate: bump to version 1.2.5
Message-ID: <20201012062532.7FE658F3BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d732b60941e86d5e3eddf981ce4e7deaab5009a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now upstreamed patch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-pkg-config-to-determine-openssl-LDFLAGS.patch | 36 ----------------------
 package/htpdate/htpdate.hash                       |  2 +-
 package/htpdate/htpdate.mk                         |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch b/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
deleted file mode 100644
index 2dad41ad37..0000000000
--- a/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 32d6cec3be361c3d2228967d41b868b7b3b910c0 Mon Sep 17 00:00:00 2001
-From: Titouan Christophe <titouan.christophe@railnova.eu>
-Date: Sat, 12 Sep 2020 16:49:57 +0200
-Subject: [PATCH] Use pkg-config to determine openssl LDFLAGS
-
-Depending on its build configuration, openssl might not be compiled with
-dynamic zlib support, and programs that link against openssl need to link
-against zlib as well, as illustrated in this build failure:
-http://autobuild.buildroot.net/results/ae9/ae946ca72238840b3eaa5fe823e8d620618f7462/
-
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
-[upstream status: https://github.com/angeloc/htpdate/pull/1]
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 09eea4a..21668a6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -4,10 +4,11 @@ mandir = ${prefix}/share/man
- 
- CC ?= gcc
- CFLAGS += -Wall -std=c99 -pedantic -O2
-+PKG_CONFIG ?= pkg-config
- 
- ifdef ENABLE_HTTPS
- CFLAGS += -DENABLE_HTTPS
--LDFLAGS += -lssl -lcrypto
-+LDFLAGS += $(shell $(PKG_CONFIG) --libs openssl)
- endif
- 
- INSTALL = install -c
--- 
-2.25.3
-
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index 282bcbe7ed..b82b2bfa08 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 08aee5132b0c73ba01485b907d037fd676d0ad89d2736bbf117ec5c5035b513a  htpdate-1.2.4.tar.gz
+sha256 267003ca4d5d191122bfd8f85a0fd2d0b7d751f7b04f5fde4e8f51e570c98d0b  htpdate-1.2.5.tar.gz
 sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index ed74830494..7a08738d29 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.2.4
+HTPDATE_VERSION = 1.2.5
 HTPDATE_SITE = $(call github,angeloc,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
