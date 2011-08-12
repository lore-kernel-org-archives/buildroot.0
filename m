From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Aug 2011 09:45:50 +0200
Subject: [Buildroot] [git commit] util-linux: fix install when locales are
	enabled
Message-ID: <20110812081517.EE16E8C57B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71f279f9a2bd3f086f3d31fa5a669d3f638bee99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

util-linux uses mkinstalldirs to install .po files when locales are
enabled, but the definition of MKINSTALLDIRS comes from a tweaked
nls.m4 (based on the one from gettext).

When we autoreconf the package, we end up using the system (staging)
version of nls.m4, so MKINSTALLDIRS doesn't get defined.

Fix it by passing a definition of MKINSTALLDIRS to make during the
install steps.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index dd6ee5c..9d2f9be 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -68,3 +68,8 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
 
 $(eval $(call AUTOTARGETS,package,util-linux))
+
+# MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
+# one, so it disappears
+UTIL_LINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+UTIL_LINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-- 
1.7.3.4
