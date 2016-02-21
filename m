From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:59 +0100
Subject: [Buildroot] [PATCH 10/10] package/mutt: add optional support for
	libidn
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libidn was compiled before, mutt will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mutt | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libncurses.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libidn.so.11]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mutt/mutt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index b07f9b2..14c5be9 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -17,6 +17,13 @@ MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+MUTT_DEPENDENCIES += libidn
+MUTT_CONF_OPTS += --with-idn
+else
+MUTT_CONF_OPTS += --without-idn
+endif
+
 ifeq ($(BR2_PACKAGE_MUTT_IMAP),y)
 MUTT_CONF_OPTS += --enable-imap
 else
-- 
2.7.0
