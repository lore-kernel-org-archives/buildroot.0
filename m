From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 21:46:03 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: fix static build issue
Message-ID: <20190127204512.943928118F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb06035e6a1b41f1cb348a3eaa7d6c1184d0d97e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The spotify plugin requires shared library support and needs <dlfcn.h>.
Explicitly disable the spotify plugin when building upmpdcli in a static
context.

Fixes:
http://autobuild.buildroot.net/results/cb942d3c5f68959d6cbc85535ccff4a275369f91/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/upmpdcli/upmpdcli.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index d88caac78b..22a5bf2429 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -10,6 +10,11 @@ UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
+# Disable spotify plugin which requires dlfcn.h
+ifeq ($(BR2_STATIC_LIBS),y)
+UPMPDCLI_CONF_OPTS = --disable-spotify
+endif
+
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
 	upmpdcli -1 upmpdcli -1 * - - audio Upmpdcli MPD UPnP Renderer Front-End
