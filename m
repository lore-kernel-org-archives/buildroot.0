From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 20 Apr 2014 16:05:46 +0200
Subject: [Buildroot] [PATCH 2/2] nodejs: add a patch forcing link command to
	use CXX
In-Reply-To: <1398002746-30716-1-git-send-email-s.martin49@gmail.com>
References: <1398002746-30716-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398002746-30716-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
This patch should fix the host-nodejs autobuild failures but I cannot
confirm it because I am not able to reproduce the failure.

Should fix:
  http://autobuild.buildroot.org/results/114/114df8d99e802b69a39804e0608b022419d912b4/
---
 ...js-0002-gyp-force-link-command-to-use-CXX.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch

diff --git a/package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch
new file mode 100644
index 0000000..a2f02ab
--- /dev/null
+++ b/package/nodejs/nodejs-0002-gyp-force-link-command-to-use-CXX.patch
@@ -0,0 +1,26 @@
+From 00d809e9305241f8636a2d75e22c493293e6971a Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 20 Apr 2014 15:03:01 +0200
+Subject: [PATCH] gyp: force link command to use CXX
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ tools/gyp/pylib/gyp/generator/make.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gyp/pylib/gyp/generator/make.py b/tools/gyp/pylib/gyp/generator/make.py
+index 0de510e..54e4c96 100644
+--- a/tools/gyp/pylib/gyp/generator/make.py
++++ b/tools/gyp/pylib/gyp/generator/make.py
+@@ -134,7 +134,7 @@ cmd_alink_thin = rm -f $@ && $(AR.$(TOOLSET)) crsT $@ $(filter %.o,$^)
+ # special "figure out circular dependencies" flags around the entire
+ # input list during linking.
+ quiet_cmd_link = LINK($(TOOLSET)) $@
+-cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
++cmd_link = $(CXX.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
+ 
+ # We support two kinds of shared objects (.so):
+ # 1) shared_library, which is just bundling together many dependent libraries
+-- 
+1.9.2
+
-- 
1.9.2
