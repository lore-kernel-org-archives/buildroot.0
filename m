From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:23:00 +0200
Subject: [Buildroot] [git commit] netperf: bump to version 2.7.0
Message-ID: <20150722152305.B39B181E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2aa1f9c715c1aab3b7747f45fd62c1c97ba303cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.
And work around gcc 5+ defaulting to gnu99, fixes:

http://autobuild.buildroot.net/results/077/077714a0ee67057abcff680b244228a409243bbf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netperf/netperf.hash |    2 ++
 package/netperf/netperf.mk   |    8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/netperf/netperf.hash b/package/netperf/netperf.hash
new file mode 100644
index 0000000..f972740
--- /dev/null
+++ b/package/netperf/netperf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	842af17655835c8be7203808c3393e6cb327a8067f3ed1f1053eb78b4e40375a	netperf-2.7.0.tar.bz2
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 13d44fe..8b22808 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -4,9 +4,13 @@
 #
 ################################################################################
 
-NETPERF_VERSION = 2.6.0
+NETPERF_VERSION = 2.7.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
-NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
+NETPERF_SOURCE = netperf-$(NETPERF_VERSION).tar.bz2
+# gcc 5+ defaults to gnu99 which breaks netperf
+NETPERF_CONF_ENV = \
+	ac_cv_func_setpgrp_void=set \
+	CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
 NETPERF_CONF_OPTS = --enable-demo=yes
 NETPERF_LICENSE = netperf license
 NETPERF_LICENSE_FILES = COPYING
