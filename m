From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue,  5 Mar 2013 01:47:20 +0800
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
Message-ID: <1362419240-7979-1-git-send-email-roylee17@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: roylee17 <roylee17@gmail.com>

Stress is linked statically if the --enable-static is specified.
However, this option is always specified in the global
SHARED_STATIC_LIBS_OPTS to tell packages to build static libraries,
if supported.

If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
--disable-static explicitly to get stress linked dynamically.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/stress/stress.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

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
-- 
1.8.1.5
