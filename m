From: John Keeping <john@metanate.com>
Date: Tue, 10 Mar 2020 12:44:59 +0000
Subject: [Buildroot] [PATCH 2/2] package/libglib2: restore use of system
 printf
In-Reply-To: <20200310124459.908611-1-john@metanate.com>
References: <20200310124459.908611-1-john@metanate.com>
Message-ID: <20200310124459.908611-3-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to commit 4102db0f7a ("package/libglib2: bump to version 2.60.3")
which converted libglib2 to meson, Buildroot used to set a range of
autoconf options to bypass tests that require running binaries.

The meson version of libglib2's build system has many fewer of these
checks, but there are still some and these can be fed the "correct"
answer by adding properties to cross-compilation.conf.

Add the necessary properties to indicate that we have C99 compliant
print functions to avoid pulling in the gnulib fallback.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/libglib2/libglib2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f00818f69c..a206639f74 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -52,6 +52,11 @@ LIBGLIB2_CONF_OPTS = \
 	-Dinstalled_tests=false \
 	-Doss_fuzz=disabled
 
+LIBGLIB2_MESON_EXTRA_PROPERTIES = \
+	have_c99_vsnprintf=true \
+	have_c99_snprintf=true \
+	have_unix98_printf=true
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
-- 
2.25.1
