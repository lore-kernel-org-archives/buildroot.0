From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 23:27:57 +0100
Subject: [Buildroot] [git commit] package/rabbitmq-c: needs dynamic library
Message-ID: <20190220223346.31EA88018D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bc9ded5dd0ff5b51abfd218dba9f8e248f6b563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslog-ng expects that rabbitmq-c is built with openssl support however
currently we're disabling openssl on rabbitmq-c in static build.

To fix this issue, add a dependency on dynamic library on rabbitmq-c and
its reverse dependencies (only BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ as
php-amqp already depends on dynamic library)

Fixes:
 - http://autobuild.buildroot.org/results/fce91b98fb199a26ad5f5f726c9bdec4f9d64486

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/janus-gateway/Config.in  |  5 +++--
 package/rabbitmq-c/Config.in     |  5 +++--
 package/rabbitmq-c/rabbitmq-c.mk | 14 +++-----------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 94c00cd34a..6eac763f72 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -67,11 +67,12 @@ comment "MQTT transport needs a toolchain w/ threads and dynamic library support
 
 config BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ
 	bool "RabbitMQ"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_RABBITMQ_C
 
-comment "RabbitMQ transport needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "RabbitMQ transport needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_JANUS_GATEWAY_REST
 	bool "REST (HTTP/HTTPS)"
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index b330c90474..6dbd1467cb 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This is a C-language AMQP client library for use with v2.0+
@@ -7,5 +8,5 @@ config BR2_PACKAGE_RABBITMQ_C
 
 	  https://github.com/alanxz/rabbitmq-c
 
-comment "rabbitmq-c needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rabbitmq-c needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index a3c4f8219f..6385ccb6b6 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -19,28 +19,20 @@ RABBITMQ_C_CONF_OPTS = \
 RABBITMQ_C_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
 
 # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-ifeq ($(BR2_STATIC_LIBS),y)
-RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 else ifeq ($(BR2_SHARED_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
 endif
 
-# CMake OpenSSL detection is buggy, and doesn't properly use
-# pkg-config, so it fails when statically linking. See
-# https://gitlab.kitware.com/cmake/cmake/issues/16885.
-ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=ON
 RABBITMQ_C_DEPENDENCIES += openssl
 else
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=OFF
 endif
 
-# Popt is sometimes linked against libintl, but CMake doesn't know
-# about that, and there's no way to tell manually CMake to link
-# against an additional library.
-ifeq ($(BR2_PACKAGE_POPT):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_POPT),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_TOOLS=ON
 RABBITMQ_C_DEPENDENCIES += popt
 else
