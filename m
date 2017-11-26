From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 20:57:06 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] python-config.sh: don't
 reassign ${prefix}
Message-ID: <20171126213855.113807FAD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb2f02ebaf76dfc4405deb9b5983d601392faafa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

When prefix is set to a path like /usr during crossbuild
the sed operations end up executing twice, once for the prefix
reassignment and another for includedir if it is set as a string
including the ${prefix} variable.  This results in an issue
when the build directory is under /usr.

This patch updates the remaining location which uses the prefix
variable to also sed and update to use the real path.

Upstream bug report:
https://bugs.python.org/issue31713

Buildroot bug:
https://bugs.busybox.net/show_bug.cgi?id=10361

Fixes failures like the following:
dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: refer to autobuild failures that still exist]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 04d1699ba4cecaa77f688b4effbcac5e84419b15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...29-python-config.sh-don-t-reassign-prefix.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
new file mode 100644
index 0000000..49137f2
--- /dev/null
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -0,0 +1,53 @@
+From 21f787cb9bf0c1440981262f03bc881c5b77c0d8 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Fri, 6 Oct 2017 09:54:15 -0500
+Subject: [PATCH] python-config.sh: don't reassign ${prefix}
+
+When prefix is set to a path like /usr during crossbuild
+the sed operations end up executing twice, once for the prefix
+reassignment and another for includedir if it is set as a string
+including the ${prefix} variable.  This results in an issue
+when the build directory is under /usr.
+
+This patch updates the remaining location which uses the prefix
+variable to also sed and update to use the real path.
+
+Upstream bug report:
+https://bugs.python.org/issue31713
+
+Buildroot bug:
+https://bugs.busybox.net/show_bug.cgi?id=10361
+
+Fixes failures like the following:
+dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ Misc/python-config.sh.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
+index f905a71..e06be0f 100644
+--- a/Misc/python-config.sh.in
++++ b/Misc/python-config.sh.in
+@@ -29,7 +29,7 @@ prefix_real=$(installed_prefix "$0")
+ 
+ # Use sed to fix paths from their built-to locations to their installed-to
+ # locations.
+-prefix=$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#")
++prefix=$prefix_build
+ exec_prefix_build="@exec_prefix@"
+ exec_prefix=$(echo "$exec_prefix_build" | sed "s#^$exec_prefix_build#$prefix_real#")
+ includedir=$(echo "@includedir@" | sed "s#^$prefix_build#$prefix_real#")
+@@ -47,7 +46,7 @@ LINKFORSHARED="@LINKFORSHARED@"
+ OPT="@OPT@"
+ PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
+ LDVERSION="@LDVERSION@"
+-LIBDEST=${prefix}/lib/python${VERSION}
++LIBDEST=$( echo "${prefix}/lib/python${VERSION}" | sed "s#^$prefix_build#$prefix_real#")
+ LIBPL=$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
+ SO="@EXT_SUFFIX@"
+ PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
+-- 
+1.8.3.1
+
