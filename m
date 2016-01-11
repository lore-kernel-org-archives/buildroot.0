From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon, 11 Jan 2016 13:52:33 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: needs a toolchain with posix_spawn
	support
Message-ID: <1452516753-1555-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/rabbitmq-c/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index b330c90..ec72f82 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_RABBITMQ_C
 	bool "rabbitmq-c"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG \
+		|| BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
 
 	  https://github.com/alanxz/rabbitmq-c
 
-comment "rabbitmq-c needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rabbitmq-c needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG \
+		|| BR2_TOOLCHAIN_USES_GLIBC) 
-- 
1.8.3.1
