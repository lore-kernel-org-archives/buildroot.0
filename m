From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 20:58:39 +0100
Subject: [Buildroot] [git commit] stress: honor the BR2_PREFER_STATIC_LIB
	preference
Message-ID: <20130304200437.06FFD9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b9a4f1e91ac98d836775c293acb9a947b846de1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stress is linked statically if the --enable-static is specified.
However, this option is always specified in the global
SHARED_STATIC_LIBS_OPTS to tell packages to build static libraries,
if supported.

If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
--disable-static explicitly to get stress linked dynamically.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/stress/stress.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 3a047b5..a20b0c6 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -10,4 +10,14 @@ STRESS_VERSION = 1.0.4
 STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 STRESS_AUTORECONF = YES
 
+# Stress is linked statically if the --enable-static is specified.
+# However, this option is always specified in the global
+# SHARED_STATIC_LIBS_OPTS to tell packages to build static libraries,
+# if supported.
+#
+# If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
+# --disable-static explicitly to get stress linked dynamically.
+STRESS_CONF_OPT = \
+	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
+
 $(eval $(autotools-package))
