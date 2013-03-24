From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 22:15:58 +0100
Subject: [Buildroot] [git commit] Fix autoreconf libtool patching
Message-ID: <20130324211543.51BC39B2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3400663620e039427c704f6c73b061d23ac54a4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some ltmain.sh files enclose the version number in quotes. This is
already handled corretly by pkg-autotools.mk in LIBTOOL_PATCH_HOOK.
This patch adds the same fix for AUTORECONF_HOOK.

Signed-off-by: przemyslaw <przemyslaw.wrzos@calyptech.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-autotools.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 995c685..d8d7e6d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -185,7 +185,8 @@ define AUTORECONF_HOOK
 	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
-			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | sed 's/\([0-9].[0-9]*\).*/\1/'`; \
+			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
+			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = "1.5"; then \
 				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
