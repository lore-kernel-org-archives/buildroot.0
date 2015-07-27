From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:54:22 +0200
Subject: [Buildroot] [git commit branch/next] package/xterm: compile with
	libXft support when it selected
Message-ID: <20150808105644.493C97FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a815e1cb464eb475b7f52b42007adbd32cf43673
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When libXft (FreeType) library is selected, xterm will use it.
host-pkgcong is used to search for libXft during configure, so it
is in the dependencies.

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xterm/xterm.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 778b40c..e7afff2 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -7,11 +7,19 @@
 XTERM_VERSION = 314
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = ncurses xlib_libXaw
+XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = version.c
 XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+XTERM_DEPENDENCIES += xlib_libXft
+XTERM_CONF_OPTS += --enable-freetype \
+	--with-freetype-config=auto
+else
+XTERM_CONF_OPTS += --disable-freetype
+endif
+
 $(eval $(autotools-package))
