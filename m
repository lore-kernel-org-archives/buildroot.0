From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:58:54 +0200
Subject: [Buildroot] [git commit] janus-gateway: add HTTP/REST to a new
	transport config section
Message-ID: <20170620211022.E932481762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2083c40b548ed791eeb804d4f9a23fc3e399bba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janus-gateway supports many different transports, and currently there
is no implicit way to turn them off or on. Instead, if the dependency
happens to be built, then the transport is enabled.

Create a transports section in the config file and add
BR2_PACKAGE_JANUS_REST as the first transport.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
[Thomas: propagate thread dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/Config.in        | 10 ++++++++++
 package/janus-gateway/janus-gateway.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index e07b4ad..7e170fd 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -54,6 +54,16 @@ config BR2_PACKAGE_JANUS_VOICE_MAIL
 	bool "voice mail"
 	select BR2_PACKAGE_LIBOGG
 
+comment "transports"
+
+config BR2_PACKAGE_JANUS_REST
+	bool "REST (HTTP/HTTPS)"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBMICROHTTPD
+
+comment "REST transport needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
 
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index b79e340..01021f8 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -91,6 +91,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_JANUS_REST),y)
+JANUS_GATEWAY_DEPENDENCIES += libmicrohttpd
+JANUS_GATEWAY_CONF_OPTS += --enable-rest
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-rest
+endif
+
 # Parallel build broken
 JANUS_GATEWAY_MAKE = $(MAKE1)
 
