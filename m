From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:28:18 +0200
Subject: [Buildroot] [git commit] package/mono: fix install with parallel
	builds
Message-ID: <20150516213338.4B24D7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f28af782655c8c4ccc2d9180d6c9f3ac36d71d00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a race in the 'install' utility, installing the same file twice
in parallel often results in one of the install calls to fail.

Ensure proper ordering of conflicting rules.

Fixes:
    http://autobuild.buildroot.org/results/c32/c3288c5d1fb94474f14a4a889e76135878d403bc/
    http://autobuild.buildroot.org/results/f70/f708e89f613ec0b42cdf49ccbef39b02f4a271fb/
    http://autobuild.buildroot.org/results/3cb/3cb99e5c5672cbaa2a86020129a05dfde47cdb8f/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/0003-fix-parallel-install.patch |   40 ++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/mono/0003-fix-parallel-install.patch b/package/mono/0003-fix-parallel-install.patch
new file mode 100644
index 0000000..c151173
--- /dev/null
+++ b/package/mono/0003-fix-parallel-install.patch
@@ -0,0 +1,40 @@
+mcs: fix installation with parallel make
+
+In mcs/ the install of xbuild_12 and xbuild_14 will end-up installing
+the same files:
+    ${NETFRAMEWORK_DIR}/v2.0/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v3.0/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v3.5/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v4.0/Profile/Client/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v4.0/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v4.5.1/RedistList/FrameworkList.xml
+    ${NETFRAMEWORK_DIR}/v4.5/RedistList/FrameworkList.xml
+
+This is because there is no atomicity when installing each file, and
+xbuild_12 and xbuild_14 may well run in parallel, each trying to install
+each of those files; but the 'install' utility will first check if the
+target file exists or not, and behaves differently if it does than if it
+does not, thus leading to build failures like so:
+    http://autobuild.buildroot.org/results/c32/c3288c5d1fb94474f14a4a889e76135878d403bc/build-end.log
+
+So, ensure ordering of the install of xbuild_12 and xbuild_14 (the
+ordering is completely arbitrary, either way gives the same installed
+files).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
+
+diff -durN host-mono-4.0.0.orig/mcs/Makefile host-mono-4.0.0/mcs/Makefile
+--- host-mono-4.0.0.orig/mcs/Makefile	2015-04-09 16:55:53.000000000 +0200
++++ host-mono-4.0.0/mcs/Makefile	2015-05-16 17:25:44.475542483 +0200
+@@ -43,6 +43,10 @@
+ profile-do--%:
+ 	$(MAKE) PROFILE=$(subst --, ,$*)
+ 
++# xbuild_12 and xbuild_14 will try to install the same files, so they need
++# to be ordered
++profile-do--xbuild_14--install: profile-do--xbuild_12--install
++
+ # We don't want to run the tests in parallel.  We want behaviour like -k.
+ profiles-do--run-test:
+ 	ret=:; $(foreach p,$(PROFILES), { $(MAKE) PROFILE=$(p) run-test || ret=false; }; ) $$ret
