From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 14:55:21 +0100
Subject: [Buildroot] [git commit branch/next] package/perf: if audit is
 enabled, depend on it
Message-ID: <20201113134208.0B9EB81EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99facff76c1f15e769d2c26b8dca2ae92b03bb17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enables the `perf trace` command.

Signed-off-by: V??clav Kubern??t <sir.venceslas@gmail.com>
Reviewed-by: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
