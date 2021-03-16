From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 22:36:06 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/libjpeg: switch
 to s.b.o. as source site
Message-ID: <20210316215256.2D78B8829E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5687464a19d63a56f2cf8b0312009c40bd02bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes #13581

The tarball for version 9d, released 2020-01-12, has been silently
replaced upstream (a unicode BOM was removed from a few files),
causing hash mismatch.

This means that all our versions since 2020.02 will fail the hash
check, and fallback to using s.b.o. so we can't update the copy we
have on s.b.o.

As a consequence, we can't update the hash in master (soon 2021.02)
otherwise it would not match what we have on s.b.o.

This means that users will see hash mismatch by default, which is not
very nice. Although we can't do anything for all previous releases,
we can still try to paper over the problem for the future ones, like
2021.02, by switching the upstream to be s.b.o.

Sigh... :-(

Reported-by: Nick Shaforostov <mshaforostov@airmusictech.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b83184de674a6d68e110d5666685edb0a7374d74)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libjpeg/libjpeg.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b855344f3c..5c15e6fc6d 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 LIBJPEG_VERSION = 9d
-LIBJPEG_SITE = http://www.ijg.org/files
+# 9d was released 2020-01-12, but the tarball was replaced upstream circa
+# 2021-03, causing hash mismatch. Until there is a new version released,
+# use our cached copy from s.b.o.
+#LIBJPEG_SITE = http://www.ijg.org/files
+LIBJPEG_SITE = http://sources.buildroot.org/libjpeg/
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
 LIBJPEG_LICENSE_FILES = README
