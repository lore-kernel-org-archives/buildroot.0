From: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 22 Jan 2021 16:43:33 +0100
Subject: [Buildroot] [PATCH 3/3] package/sysklogd: menuconfig support for
 remote syslog retry delay
In-Reply-To: <20210122154333.1927190-1-troglobit@gmail.com>
References: <20210122154333.1927190-1-troglobit@gmail.com>
Message-ID: <20210122154333.1927190-4-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/Config.in   | 13 +++++++++++++
 package/sysklogd/sysklogd.mk |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 52bed0cc18..91db7b348c 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -15,6 +15,19 @@ config BR2_PACKAGE_SYSKLOGD
 
 if BR2_PACKAGE_SYSKLOGD
 
+config BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY
+       int "Retry delay (sec)"
+       default "180"
+       help
+         Retry delay (seconds) for sending to remote syslog servers.
+
+	 When set up to forward logs to a remote syslog server, the
+	 network may not always be available. E.g., default interface
+	 down, or no route to the remote server. This setting controls
+	 the back-off time before retrying.
+
+	 Default: 180 seconds
+
 config BR2_PACKAGE_SYSKLOGD_LOGGER
 	bool "logger tool"
 	help
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 235219c4fc..3dbf886361 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -12,7 +12,7 @@ SYSKLOGD_CPE_ID_VALID = YES
 SYSKLOGD_CONF_OPTS =  --prefix=/usr --sysconfdir=/etc --localstatedir=/var
 
 # Disable/Enable utilities
-SYSKLOGD_CONF_OPTS += \
+SYSKLOGD_CONF_OPTS += --with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY) \
 	$(if $(BR2_PACKAGE_SYSKLOGD_LOGGER),--with-logger,--without-logger)
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
-- 
2.25.1
