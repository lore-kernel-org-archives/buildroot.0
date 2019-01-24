From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 24 Jan 2019 11:07:17 +0100
Subject: [Buildroot] [PATCH] package/upmpdcli: fix static build issue
Message-ID: <20190124100717.12620-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The spotify plugin requires shared library support and needs <dlfcn.h>.
Explicitly disable the spotify plugin when building upmpdcli in a static
context.

Fixes:
http://autobuild.buildroot.net/results/cb942d3c5f68959d6cbc85535ccff4a275369f91/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
-- 
2.20.1
