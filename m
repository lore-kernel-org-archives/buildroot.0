From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Aug 2009 07:23:59 +0200
Subject: [Buildroot] [git commit master] ctorrent: build with ssl support if
	available
Message-ID: <20090831052541.125F377739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cc8a9175980d6f58d3c60071a6e9d64cf9485bda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #557

Build with openssl support if that is enabled.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/ctorrent/ctorrent.mk |    8 +++++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index a0e39f7..9175724 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,6 +3,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#529: util-linux doesn't find headers and include libs correctly
+	#557: Build ctorrent with SSL support if available
 
 2009.08-rc3, Released August 26th, 2009:
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 2560881..aa22153 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -6,6 +6,12 @@
 CTORRENT_VERSION:=dnh3.3.2
 CTORRENT_SOURCE:=ctorrent-$(CTORRENT_VERSION).tar.gz
 CTORRENT_SITE:=http://www.rahul.net/dholmes/ctorrent/
-CTORRENT_CONF_OPT:=--with-ssl=no
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CTORRENT_CONF_OPT+=--with-ssl=yes
+CTORRENT_DEPENDENCIES+=openssl
+else
+CTORRENT_CONF_OPT+=--with-ssl=no
+endif
 
 $(eval $(call AUTOTARGETS,package,ctorrent))
-- 
1.6.3.3
