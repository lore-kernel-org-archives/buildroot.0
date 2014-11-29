From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 20:28:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix static linking with
	OpenSSL enabled
Message-ID: <1417289292-7006-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c38/c388b71ae154c062a863a35eca70a8c2ce121524/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 9e997f3..3a0ca35 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -18,7 +18,9 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
 MINIDLNA_CONF_ENV = \
-	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
+	LIBS='-lavformat -lavcodec -lavutil -logg \
+		$(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto) \
+		-lz -lpthread -lm'
 else
 MINIDLNA_CONF_OPTS = \
 	--disable-static
-- 
1.7.10.4
