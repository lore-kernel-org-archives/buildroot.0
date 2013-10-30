From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:46:18 +0100
Subject: [Buildroot] [git commit] cjson: link with libm,
	unavailable for static
Message-ID: <20131104211054.740579BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=339a4880821d8a574deb5f3c490411d9dd4a29e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with libm as stated in the README, fixes:
http://autobuild.buildroot.net/results/57f/57fc124e14263ee2447e20a5b910ed3ae0a5b7db/

Also disable the package for static builds since it doesn't work that
way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/Config.in |    2 ++
 package/cjson/cjson.mk  |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index ff90074..fed61d7 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CJSON
 	bool "cJSON"
+	# For static build with cJSON.c directly see README
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  An ultra-lightweight, portable, single-file, simple-as-can-be ANSI-C
 	  compliant JSON parser, under MIT license.
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 7e1d72d..2093b02 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -12,7 +12,8 @@ CJSON_LICENSE         = MIT
 CJSON_LICENSE_FILES   = LICENSE
 
 define CJSON_BUILD_CMDS
-	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC cJSON.c -o libcJSON.so
+	cd $(@D) && $(TARGET_CC) $(TARGET_CFLAGS) -shared -fPIC -lm \
+		cJSON.c -o libcJSON.so
 endef
 
 define CJSON_INSTALL_STAGING_CMDS
