From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:29:07 +0100
Subject: [Buildroot] [git commit] package/mutt: add optional support for
	libidn
Message-ID: <20160221202912.06A4F817EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=751e58f606ce5e40194ce929d713ccafb1328888
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libidn was compiled before, mutt will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mutt | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libncurses.so.5]
 0x0000000000000001 (NEEDED)             Shared library: [libidn.so.11]
 0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
