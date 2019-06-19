From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 19 Jun 2019 23:30:06 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/iputils: Reenable traceroute6
Message-ID: <20190619213008.7883-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to s20190515 removed traceroute6 build (it's not built by default
since this version in upstream). Reenable it again.

Fixes: 9ffcd9279e ("package/iputils: bump to version s20190515")

This requires fix similar to one in 0003-meson.build-fix-build-with-NLS.patch [1]

traceroute6 is in /usr/sbin, so no need to handle busybox problem
(6e18892733 "package/iputils: move binaries to the location also used by
Busybox").

[1] http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Fix traceroute6 path in IPUTILS_PERMISSIONS, it must be /usr/bin/traceroute6

Kind regards,
Petr

 .../0005-traceroute6-fix-build-with-NLS.patch | 30 +++++++++++++++++++
 package/iputils/iputils.mk                    |  3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/iputils/0005-traceroute6-fix-build-with-NLS.patch

diff --git a/package/iputils/0005-traceroute6-fix-build-with-NLS.patch b/package/iputils/0005-traceroute6-fix-build-with-NLS.patch
new file mode 100644
index 0000000000..70315c551b
--- /dev/null
+++ b/package/iputils/0005-traceroute6-fix-build-with-NLS.patch
@@ -0,0 +1,30 @@
+From b18c6c48e4dabaf8bf9b178b3deca631fc79c96e Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Tue, 11 Jun 2019 21:51:58 +0200
+Subject: [PATCH] traceroute6: fix build with NLS
+
+commit 418d8be ("build-sys: fix build with NLS") fixed problems for
+default packages using libintl. Fix also traceroute6 (build it must be
+enabled with -DBUILD_TRACEROUTE6=true)
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream status: 81bfb31a714641b70c2a7c7d9ce12cf08f98a372
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 2b545b6..85db8a6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -266,7 +266,7 @@ endif
+
+ if build_traceroute6 == true
+	executable('traceroute6', ['traceroute6.c', git_version_h],
+-		dependencies : [cap_dep, idn_dep],
++		dependencies : [cap_dep, intl_dep, idn_dep],
+		link_with : [libcommon],
+		install: true)
+	meson.add_install_script('build-aux/setcap-setuid.sh',
+--
+2.21.0
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 052110878a..c6f380a84a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -49,6 +49,8 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
+IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
+
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
 IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
 
@@ -69,6 +71,7 @@ define IPUTILS_PERMISSIONS
 	/usr/sbin/arping      f 4755 0 0 - - - - -
 	/usr/bin/clockdiff    f 4755 0 0 - - - - -
 	/bin/ping             f 4755 0 0 - - - - -
+	/usr/bin/traceroute6  f 4755 0 0 - - - - -
 endef
 
 $(eval $(meson-package))
-- 
2.21.0
