From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:26 +0200
Subject: [Buildroot] [PATCH 26/31] package/systemd: Add optional support for
	resolved
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-26-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8e72526..f91684e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -258,6 +258,16 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
+config BR2_PACKAGE_SYSTEMD_RESOLVED
+	bool "enable resolve daemon"
+	default y
+	help
+	  systemd-resolved is a system service that provides network name
+	  resolution to local applications. It implements a caching and validating
+	  DNS/DNSSEC stub resolver, as well as an LLMNR resolver and responder.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
+
 config BR2_PACKAGE_SYSTEMD_RFKILL
 	bool "enable rfkill tools"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1be2b53..d63d1cc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -247,6 +247,12 @@ else
 SYSTEMD_CONF_OPTS += --disable-hostnamed
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
+SYSTEMD_CONF_OPTS += --enable-resolved
+else
+SYSTEMD_CONF_OPTS += --disable-resolved
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMEDATED),y)
 SYSTEMD_CONF_OPTS += --enable-timedated
 else
-- 
2.8.1
