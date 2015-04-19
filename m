From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Apr 2015 06:48:18 -0300
Subject: [Buildroot] [PATCH v3 03/11] harfbuzz: add host variant
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429436906-15222-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required for host-pango, which in turn is required for host-librsvg and
at last midori.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/harfbuzz/harfbuzz.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0a69b09..9cfd613 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -11,6 +11,20 @@ HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
+
+# freetype & glib2 support required by host-pango
+HOST_HARFBUZZ_DEPENDENCIES = \
+	host-freetype \
+	host-libglib2
+HOST_HARFBUZZ_CONF_OPTS = \
+	--without-corext \
+	--without-uniscribe \
+	--without-graphite2 \
+	--with-cairo=no \
+	--with-icu=no \
+	--with-freetype=yes \
+	--with-glib=yes
+
 # beta libtool version
 HARFBUZZ_AUTORECONF = YES
 
@@ -48,3 +62,4 @@ HARFBUZZ_CONF_OPTS += --with-icu=no
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.5
