From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:21 +0100
Subject: [Buildroot] [PATCH 02/12] rsync: drop special case now managed in
	Makefile.package.in
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/rsync/rsync.mk |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e1bb28e..d7c2ccd 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -9,14 +9,9 @@ RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_INSTALL_STAGING:=NO
 RSYNC_INSTALL_TARGET:=YES
-RSYNC_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-ifeq ($(BR2_ENABLE_DEBUG),y)
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  install
-else
-RSYNC_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) INSTALLCMD='./install-sh -c' \
-			  STRIPPROG="$(TARGET_STRIP)" install-strip
-endif
+
+RSYNC_MAKE_ENV = STRIPPROG="$(STRIPCMD)"
+
 RSYNC_CONF_OPT:=--with-included-popt
 
 $(eval $(call AUTOTARGETS,package,rsync))
-- 
1.7.2.3
