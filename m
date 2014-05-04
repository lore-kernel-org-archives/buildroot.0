From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 23:24:25 +0200
Subject: [Buildroot] [git commit] cups: move localstatedir from /usr/var to
	/var
Message-ID: <20140504212453.90C089CA5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de59021d978ca3d0871e152aaada7ed2e939ad58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
