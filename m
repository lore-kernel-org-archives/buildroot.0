From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Dec 2015 19:10:56 +0100
Subject: [Buildroot] [PATCH] package/nut: disable libltdl (and nut-scanner)
	for static-only
Message-ID: <1450548656-16506-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nut-scanner needs libltdl, a wrapper around dlopen/dlsym. This does not
really make sense on a static-only build.

Disable use of libltdl in static-only builds; this disble nut-scanner.

Fixes:
    http://autobuild.buildroot.org/results/d8e/d8e769709681b1965f36eb5c27f71f3a1f5adcf1/
    http://autobuild.buildroot.org/results/6e4/6e403642069093389acbeeccd7030b76d4ab68be/
    http://autobuild.buildroot.org/results/fa4/fa4c647ce58b91b863d8de5bf9d44b2060a1cf1c/
    and so many others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nut/nut.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index d5babee..b0a92ca 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -50,8 +50,11 @@ else
 NUT_CONF_OPTS += --without-cgi
 endif
 
-# libltdl (libtool) is needed for nut-scanner
-ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+# nut-scanner needs libltdl, which is a wrapper arounf dlopen/dlsym,
+# so is not available for static-only builds.
+# There is no flag to directly enable/disable nut-scanner, it's done
+# via the --enable/disable-libltdl flag.
+ifeq ($(BR2_STATIC_LIBS):$(BR2_PACKAGE_LIBTOOL),:y)
 NUT_DEPENDENCIES += libtool
 NUT_CONF_OPTS += --with-libltdl
 else
-- 
1.9.1
