From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 10:37:58 +0100
Subject: [Buildroot] [git commit] package/sysklogd: add option for remote
 syslog retry delay
Message-ID: <20210124091901.22295835F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36bbd4265f92de0c0fe6934fee8c7710a40ef49e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/Config.in   | 13 +++++++++++++
 package/sysklogd/sysklogd.mk |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index e9ee7f9321..3315a6ddc9 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -15,6 +15,19 @@ config BR2_PACKAGE_SYSKLOGD
 
 if BR2_PACKAGE_SYSKLOGD
 
+config BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY
+	int "Retry delay (sec)"
+	default "180"
+	help
+	  Retry delay (seconds) for sending to remote syslog servers.
+
+	  When set up to forward logs to a remote syslog server, the
+	  network may not always be available. E.g., default interface
+	  down, or no route to the remote server. This setting controls
+	  the back-off time before retrying.
+
+	  Default: 180 seconds
+
 config BR2_PACKAGE_SYSKLOGD_LOGGER
 	bool "logger tool"
 	help
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a07af9e91e..18d30400e1 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,7 +9,9 @@ SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKL
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
-SYSKLOGD_CONF_OPTS = --exec-prefix=/
+SYSKLOGD_CONF_OPTS = \
+	--exec-prefix=/ \
+	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
 
 # Disable/Enable utilities
 ifeq ($(BR2_PACKAGE_SYSKLOGD_LOGGER),y)
