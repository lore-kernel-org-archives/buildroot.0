From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Sep 2018 19:35:18 +0200
Subject: [Buildroot] [PATCH 1/2] lua: fix dynamic library install
Message-ID: <20180928173519.9731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 0002-shared-libs-for-lua.patch, revision number is used to set
library name:
TO_SOLIB = liblua.so.$(R)

However, library is built using PKG_VERSION which is passed only during
build step:
$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?

As a result, dynamic library is not installed in staging or target paths
since bump to lua 5.3.5

So, instead of replacing R by PKG_VERSION and passing this variable in
all steps, simply update R to 5

Fixes:
 - http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../lua/5.3.5/0003-fix-revision-number.patch  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/lua/5.3.5/0003-fix-revision-number.patch

diff --git a/package/lua/5.3.5/0003-fix-revision-number.patch b/package/lua/5.3.5/0003-fix-revision-number.patch
new file mode 100644
index 0000000000..ed2e0460eb
--- /dev/null
+++ b/package/lua/5.3.5/0003-fix-revision-number.patch
@@ -0,0 +1,31 @@
+Fix revision number
+
+In 0002-shared-libs-for-lua.patch, revision number is used to set 
+library name:
+TO_SOLIB = liblua.so.$(R)
+
+However, library is built using PKG_VERSION which is passed only during
+build step:
+$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
+
+As a result, dynamic library is not installed in staging or target paths
+since bump to lua 5.3.5
+
+So, instead of replacing R by PKG_VERSION and passing this variable in
+all steps, simply update R to 5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -47,6 +47,6 @@
+
+ # Lua version and release.
+ V= 5.3
+-R= $V.4
++R= $V.5
+
+ # Targets start here.
+ all:    $(PLAT)
-- 
2.17.1
