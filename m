From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:24 +0200
Subject: [Buildroot] [PATCH 24/31] package/systemd: add optional support for
	qrencode
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-24-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The support of qrencode depends of the journal gateway feature as it is
used to display the key used to seal the journal.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e57b595..c79b64c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -141,8 +141,14 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += --enable-microhttpd
+ifeq ($(BR2_PACKAGE_LIBQRENCODE),y)
+SYSTEMD_CONF_OPTS += --enable-qrencode
+SYSTEMD_DEPENDENCIES += libqrencode
 else
-SYSTEMD_CONF_OPTS += --disable-microhttpd
+SYSTEMD_CONF_OPTS += --disable-qrencode
+endif
+else
+SYSTEMD_CONF_OPTS += --disable-microhttpd --disable-qrencode
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
-- 
2.8.1
