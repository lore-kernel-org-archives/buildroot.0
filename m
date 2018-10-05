From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 22:02:50 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] lua: fix dynamic library
 install
Message-ID: <20181005200315.47DD78D67B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cea60ba7feb6044375bc1ce62a849a05bce17795
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

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
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca287f204426446fd782544131429030c4825f0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.3.5/0003-fix-revision-number.patch | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

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
