From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:50:11 +0200
Subject: [Buildroot] [git commit master] iperf: override bool detection
Message-ID: <20100526215529.13A7F120B29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e13ac0ec8788092c6508636da94fe0198c18dffd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script contains a buggy test for the bool datatype and
it's size. This is normally not a big deal as the result isn't used
for anything, but when BR2_CONFIG_CACHE (default) is used, the
wrong ac_cv_type_bool result is stored in the cache, and other packages
like libcurl DO need the bool type, so that breaks the build.

Fix it by presetting those tests to sane values.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/iperf/iperf.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6dcf97c..af73187 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Updated/fixed packages: aumix, atk, avahi, bmon, busybox, cairo,
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
 	gettext, gmpc, gob2, grep, gstreamer, gst-plugins-bad,
-	gst-plugins-base, gvfs, hal, iconv, icu, libcgicc, libdvdnav,
+	gst-plugins-base, gvfs, hal, iconv, icu, iperf, libcgicc, libdvdnav,
 	libdvdread, libglade, libglib2, libgtk2, libidn, libmms,
 	libmpd, libpcap, libsoup, lmbench, lsof, ltrace, lvm2, make,
 	metacity, mtd-utils, mutt, nbd, netsnmp, ntfsprogs, ntp, olsr,
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 10e5a37..3f8e3fc 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -14,7 +14,9 @@ IPERF_INSTALL_STAGING = NO
 IPERF_INSTALL_TARGET = YES
 
 IPERF_CONF_ENV = \
-	ac_cv_func_malloc_0_nonnull=yes
+	ac_cv_func_malloc_0_nonnull=yes \
+	ac_cv_type_bool=yes \
+	ac_cv_sizeof_bool=1
 
 IPERF_CONF_OPT = \
 	--disable-dependency-tracking \
-- 
1.6.3.3
