From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 10:33:30 +0100
Subject: [Buildroot] [git commit] package/yajl: add patch to fix static
	build issue
Message-ID: <20151122123711.BB27D81E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b18e4b58499a90694b2447db4e4ceef3af8d897c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpd's plugin soundcloud requires yajl. In static build context yajl library is
named yajl_s so linking against yajl fails:
  /bin/ld: cannot find -lyajl

Use a pull request patch [1] to let the shared and the static library
have the same name. They will be differentiated by the extension (.so or .a).

Fixes:
http://autobuild.buildroot.net/results/5ac/5acba9b0ed852512fc88e83973a3b5389e6d54be/
http://autobuild.buildroot.net/results/739/73934ad67efa121fedeaa03fdad290aa63f1485e/

[1] https://github.com/lloyd/yajl/pull/174

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yajl/yajl.hash |    1 +
 package/yajl/yajl.mk   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/yajl/yajl.hash b/package/yajl/yajl.hash
index 6e025a2..315d847 100644
--- a/package/yajl/yajl.hash
+++ b/package/yajl/yajl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	0e78f516dc53ecce7dc073f9a9bb0343186b58ef29dcd1dad74e5e853b216dd5  yajl-2.0.4.tar.gz
+sha256	0f075b5f9a38bc02077370d4d57d12e615cfaaf7f634e3f2fc746b6582854e53  6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index ff64123..81f29e7 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,5 +9,6 @@ YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
+YAJL_PATCH = https://github.com/vriera/yajl/commit/6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
 
 $(eval $(cmake-package))
