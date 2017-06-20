From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:08:44 +0200
Subject: [Buildroot] [git commit] janus-gateway: add websockets to transport
	section
Message-ID: <20170620211023.0B5B37FBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b447ed4a848823918927fb8da77796b0b6b87a63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: propagate BR2_USE_MMU dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        |  5 +++++
 package/janus-gateway/janus-gateway.mk | 14 +++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 7e170fd..9af4d56 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -64,6 +64,11 @@ config BR2_PACKAGE_JANUS_REST
 comment "REST transport needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_JANUS_WEBSOCKETS
+	bool "WebSockets"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBWEBSOCKETS
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 01021f8..69282a20 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -84,13 +84,6 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-plugin-voicemail
 endif
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
-JANUS_GATEWAY_DEPENDENCIES += libwebsockets
-JANUS_GATEWAY_CONF_OPTS += --enable-websockets
-else
-JANUS_GATEWAY_CONF_OPTS += --disable-websockets
-endif
-
 ifeq ($(BR2_PACKAGE_JANUS_REST),y)
 JANUS_GATEWAY_DEPENDENCIES += libmicrohttpd
 JANUS_GATEWAY_CONF_OPTS += --enable-rest
@@ -98,6 +91,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-rest
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_WEBSOCKETS),y)
+JANUS_GATEWAY_DEPENDENCIES += libwebsockets
+JANUS_GATEWAY_CONF_OPTS += --enable-websockets
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-websockets
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
