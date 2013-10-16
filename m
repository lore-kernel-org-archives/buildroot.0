From: Denis Mingulov <denis@mingulov.com>
Date: Wed, 16 Oct 2013 16:13:37 +0300
Subject: [Buildroot] [PATCH v2] rsync: use system zlib and popt,
	also do not lose debug options
In-Reply-To: <1381923631-26549-1-git-send-email-denis@mingulov.com>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
Message-ID: <1381929217-13399-1-git-send-email-denis@mingulov.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rsync by default compiles statically its own zlib and popt
libraries, it is better to use system wide libraries instead -
both for disk and memory consumption. Change rsync package
accordingly.

Also previously a debug configure option has been lost, as
overwritten by '--with-included-popt' option - fixed.

For example, on ARMv5 rsync binary size is reduced by about 25%.

Signed-off-by: Denis Mingulov <denis@mingulov.com>
---
 package/rsync/Config.in | 2 ++
 package/rsync/rsync.mk  | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index be95a7c..b952974 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_RSYNC
 	bool "rsync"
 	# fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_POPT
 	help
 	  File transfer program to keep remote files in sync.
 
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index d8e5f3f..35f128c 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -8,7 +8,10 @@ RSYNC_VERSION = 3.1.0
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPLv3+
 RSYNC_LICENSE_FILES = COPYING
-RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-RSYNC_CONF_OPT = --with-included-popt
+RSYNC_DEPENDENCIES = zlib popt
+RSYNC_CONF_OPT = \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
+	--with-included-zlib=no \
+	--with-included-popt=no
 
 $(eval $(autotools-package))
-- 
1.8.4
