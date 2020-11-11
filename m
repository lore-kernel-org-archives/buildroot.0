From: =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <sir.venceslas@gmail.com>
Date: Wed, 11 Nov 2020 17:00:07 +0100
Subject: [Buildroot] [PATCH 1/2] package/perf: if audit is enabled,
 depend on it
Message-ID: <20201111160008.2010373-1-sir.venceslas@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables the `perf trace` command.

Signed-off-by: V?clav Kubern?t <sir.venceslas@gmail.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 53b7c5b9cd..e54f019888 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -21,7 +21,6 @@ PERF_MAKE_FLAGS = \
 	DESTDIR=$(TARGET_DIR) \
 	prefix=/usr \
 	WERROR=0 \
-	NO_LIBAUDIT=1 \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \
 	NO_LIBPYTHON=1 \
@@ -64,6 +63,12 @@ else
 PERF_MAKE_FLAGS += NO_NEWT=1 NO_SLANG=1
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+PERF_DEPENDENCIES += audit
+else
+PERF_MAKE_FLAGS += NO_LIBAUDIT=1
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 PERF_DEPENDENCIES += libunwind
 else
-- 
2.29.2
