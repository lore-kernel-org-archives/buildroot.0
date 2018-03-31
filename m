From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:56:46 +0200
Subject: [Buildroot] [git commit] package/xterm: Avoid freetype2 path
 poisoning using imake
Message-ID: <20180331205701.EC1E5815A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d0316dc7b14f6cd2d44e92c6ab581a6ab385234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When imake is installed on the host, it tries to include
freetype headers from host, so we must override ac_cv_path_IMAKE
to avoid this.

Extract from config.log:

configure:14803: checking if we should use imake to help
configure:14820: result: yes
configure:14829: checking for xmkmf
configure:14846: found /usr/bin/xmkmf
configure:14857: result: /usr/bin/xmkmf
configure:14920: testing Using /usr/bin/xmkmf  ...
configure:15015: testing IMAKE_CFLAGS  -I. -I/usr/include/freetype2

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
[Thomas: pass ac_cv_path_IMAKE="" as suggested by Romain Naour.]
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xterm/xterm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 645de92e22..201280fd46 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -14,6 +14,9 @@ XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
 
+# Avoid freetype2 path poisoning by imake
+XTERM_CONF_ENV = ac_cv_path_IMAKE=""
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
 XTERM_DEPENDENCIES += xlib_libXft
 XTERM_CONF_OPTS += --enable-freetype \
