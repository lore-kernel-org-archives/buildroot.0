From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 13:18:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/vnstat: fix build failure due to
 double install of programs
Message-ID: <20191031121848.7914-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3aefa8d63f710b71720fc114450110d2f885820b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...build-failure-due-to-double-installa.patch | 59 +++++++++++++++++++
 package/vnstat/vnstat.mk                      |  2 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/vnstat/0001-Makefile.am-fix-build-failure-due-to-double-installa.patch

diff --git a/package/vnstat/0001-Makefile.am-fix-build-failure-due-to-double-installa.patch b/package/vnstat/0001-Makefile.am-fix-build-failure-due-to-double-installa.patch
new file mode 100644
index 0000000000..a1c0bb3563
--- /dev/null
+++ b/package/vnstat/0001-Makefile.am-fix-build-failure-due-to-double-installa.patch
@@ -0,0 +1,59 @@
+From 6126d04e995d6791377214433e54481b8084a42f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 31 Oct 2019 11:02:22 +0100
+Subject: [PATCH] Makefile.am: fix build failure due to double installation of
+ programs
+
+install-data-hook should not depend on install-exec otherwise build
+could fail due to the double installation of vnstati:
+
+PATH="/data/buildroot/buildroot-test/instance-0/output/host/bin:/data/buildroot/buildroot-test/instance-0/output/host/sbin:/data/buildroot/buildroot-test/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"  /usr/bin/make -j12 DESTDIR=/data/buildroot/buildroot-test/instance-0/output/target install -C /data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4/
+make[1]: Entering directory '/data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4'
+Making install in .
+make[2]: Entering directory '/data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4'
+make[3]: Entering directory '/data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/bin'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/sbin'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man1'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man5'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man8'
+  /usr/bin/install -c vnstat vnstati '/data/buildroot/buildroot-test/instance-0/output/target/usr/bin'
+  /usr/bin/install -c vnstatd '/data/buildroot/buildroot-test/instance-0/output/target/usr/sbin'
+ /usr/bin/install -c -m 644 man/vnstat.1 man/vnstati.1 '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man1'
+ /usr/bin/install -c -m 644 man/vnstat.conf.5 '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man5'
+ /usr/bin/install -c -m 644 man/vnstatd.8 '/data/buildroot/buildroot-test/instance-0/output/target/usr/share/man/man8'
+/usr/bin/make  install-data-hook
+make[4]: Entering directory '/data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4'
+Making install-exec in .
+make[5]: Entering directory '/data/buildroot/buildroot-test/instance-0/output/build/vnstat-2.4'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/bin'
+ /usr/bin/mkdir -p '/data/buildroot/buildroot-test/instance-0/output/target/usr/sbin'
+  /usr/bin/install -c vnstat vnstati '/data/buildroot/buildroot-test/instance-0/output/target/usr/bin'
+  /usr/bin/install -c vnstatd '/data/buildroot/buildroot-test/instance-0/output/target/usr/sbin'
+/usr/bin/install: cannot create regular file '/data/buildroot/buildroot-test/instance-0/output/target/usr/bin/vnstati': File exists
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3aefa8d63f710b71720fc114450110d2f885820b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/vergoh/vnstat/pull/145]
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 20578e6..c65e0aa 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -143,7 +143,7 @@ release: distcheck
+ 	rm -fr $(PACKAGE_NAME)-$(PACKAGE_VERSION)
+ 	ls -l $(PACKAGE_NAME)-$(PACKAGE_VERSION).tar.gz
+ 
+-install-data-hook: install-exec
++install-data-hook:
+ 	if [ -f $(DESTDIR)$(man1dir)/vnstatd.1 ]; then rm -f $(DESTDIR)$(man1dir)/vnstatd.1; fi
+ 	$(MKDIR_P) $(DESTDIR)$(sysconfdir)
+ if IS_CROSSCOMPILED
+-- 
+2.23.0
+
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index f0ef1cc69d..79e558628e 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -10,6 +10,8 @@ VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
 VNSTAT_DEPENDENCIES = host-pkgconf sqlite
 VNSTAT_CONF_OPTS = --disable-extra-paths
+# We're patching Makefile.am
+VNSTAT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 VNSTAT_DEPENDENCIES += gd
-- 
2.23.0
