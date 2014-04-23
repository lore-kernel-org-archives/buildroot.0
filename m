From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 22 Apr 2014 20:49:09 -0400
Subject: [Buildroot] [PATCH 1/1] cups: move localstatedir from /usr/var to
	/var
Message-ID: <1398214149-1914-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to commit f64a1b850fc897357040bb4c58b6e5e50e71e094 ("cups:
convert to autotargets"), cups was explicitely configured to
put its modifiable single-machine data under /var.  After that
commit, the --localstatedir was not specified, so it remained at
it's default value, "PREFIX/var" - making cups use "/usr/var".

Using /var to store state files seems preferable to /usr/var,
as /usr might be read-only on some systems.  This patch
re-introduces the --localstatedir specification to build cups
to use /var.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cups/cups.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index bcd6f1e..ee53735 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -17,7 +17,8 @@ CUPS_CONF_OPT = --without-perl \
 		--without-php \
 		--disable-gnutls \
 		--disable-gssapi \
-		--libdir=/usr/lib
+		--libdir=/usr/lib \
+		--localstatedir=/var
 CUPS_CONFIG_SCRIPTS = cups-config
 
 CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
-- 
1.7.9.5
