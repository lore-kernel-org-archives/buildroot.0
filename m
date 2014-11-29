From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 20:33:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix static linking
Message-ID: <1417289621-17415-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6bd/6bd8c009056beb67092abd6d18064500302dcecb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This patch depends on http://patchwork.ozlabs.org/patch/416006/

 package/minidlna/minidlna.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 3a0ca35..d483e1c 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -18,8 +18,10 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
 MINIDLNA_CONF_ENV = \
-	LIBS='-lavformat -lavcodec -lavutil -logg \
+	LIBS='-lavformat -lavcodec -lavutil -logg -lvorbis -lvorbisenc \
+		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl) -lexif \
 		$(if $(BR2_PACKAGE_OPENSSL),-lssl -lcrypto) \
+		$(if $(BR2_PACKAGE_OPUS),-lswresample -lopus) \
 		-lz -lpthread -lm'
 else
 MINIDLNA_CONF_OPTS = \
-- 
1.7.10.4
