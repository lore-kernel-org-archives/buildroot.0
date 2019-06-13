From: Yi Zheng <goodmenzy@gmail.com>
Date: Thu, 13 Jun 2019 11:05:27 +0800
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
Message-ID: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    systemd-journal-remote was added in systemd v211, so add a new option
    to enable or disable it.

    Signed-off-by: Yi Zheng <goodmenzy@gmail.com>
---
 package/systemd/Config.in  | 15 +++++++++++++++
 package/systemd/systemd.mk |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 92ffc7cc5a..3ec529b214 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -122,6 +122,21 @@ config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY

          http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html

+config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
+       bool "enable systemd-journal-remote"
+       default n
+       depends on BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+       select BR2_PACKAGE_LIBCURL
+       help
+         systemd-journal-remote is a command to receive serialized
+         journal events and store them to journal files. Input
+         streams are in the Journal Export Format[1], i.e. like the
+         output from journalctl --output=export. For transport over
+         the network, this serialized stream is usually carried over
+         an HTTPS connection.
+
+         https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
+
 config BR2_PACKAGE_SYSTEMD_BACKLIGHT
        bool "enable backlight support"
        help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index edc4a9ecc1..b7e36d9eb9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -178,6 +178,10 @@ else
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=false -Dqrencode=false
 endif

+ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
+SYSTEMD_CONF_OPTS += -Dremote=true
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 SYSTEMD_DEPENDENCIES += libselinux
 SYSTEMD_CONF_OPTS += -Dselinux=true
--
2.22.0
