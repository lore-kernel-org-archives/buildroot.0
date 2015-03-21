From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 09:52:59 +0100
Subject: [Buildroot] [git commit] libcec: add patch to fix build on Blackfin
Message-ID: <20150321085343.659D180753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=450023b2a2819afe408e318be2316282381f276c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Blackfin uses a gcc 4.3 compiler, which does not support the
-Wno-psabi option. Since it is non essential, this commit adds a patch
to remove the usage of this option.

Fixes:

  http://autobuild.buildroot.net/results/3ab/3ab146583fa57ef7d6e67530b3274df1a844c7e1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcec/0001-remove-Wno-psabi.patch |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/libcec/0001-remove-Wno-psabi.patch b/package/libcec/0001-remove-Wno-psabi.patch
new file mode 100644
index 0000000..4956c14
--- /dev/null
+++ b/package/libcec/0001-remove-Wno-psabi.patch
@@ -0,0 +1,21 @@
+Do not use -Wno-psabi option
+
+This option was added in gcc 4.5, and Buildroot still uses gcc 4.3 on
+some architectures. Since it's non essential (only disables some
+warning), let's get rid of it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,7 +137,7 @@
+ use_udev="no"
+ use_adapter_detection="yes"
+ use_lockdev="no"
+-SUPPRESS_MANGLING_WARNINGS=" -Wno-psabi"
++SUPPRESS_MANGLING_WARNINGS=""
+ case "${host}" in
+   *-*-linux*)
+     ## search for udev if pkg-config was found
