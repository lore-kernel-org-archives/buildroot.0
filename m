From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:14:18 +0100
Subject: [Buildroot] [git commit] gcc: preserve CXXFLAGS_FOR_TARGET
Message-ID: <20160315221556.AD3B480469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f67a4f50e2ace3a2c83ac707807ec00a1a4a39b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc-4.7.x, gcc-4.8.x and gcc-4.9.x don't propagate CXXFLAGS_FOR_TARGET to
CXXFLAGS for libstdc++ build. As a result libstdc++ is built without
TARGET_CFLAGS and may fail to link with applications using it, see e.g.

  http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/

Instead of passing TARGET_ABI or TARGET_CFLAGS for libstdc++ in
--enable-cxx-flags parameter backport the patch that fixes propagation
of CXXFLAGS_FOR_TARGET to CXXFLAGS.

This issue is fixed in gcc-5.x

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.7.4/130-pr43538.patch | 25 +++++++++++++++++++++++++
 package/gcc/4.8.5/130-pr43538.patch | 25 +++++++++++++++++++++++++
 package/gcc/4.9.3/130-pr43538.patch | 25 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/package/gcc/4.7.4/130-pr43538.patch b/package/gcc/4.7.4/130-pr43538.patch
new file mode 100644
index 0000000..19e57bb
--- /dev/null
+++ b/package/gcc/4.7.4/130-pr43538.patch
@@ -0,0 +1,25 @@
+From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
+From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 25 Apr 2014 08:03:08 +0000
+Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
+
+	PR target/43538
+	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ config/mt-gnu    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/mt-gnu b/config/mt-gnu
+index 15bf417..5c696f5 100644
+--- a/config/mt-gnu
++++ b/config/mt-gnu
+@@ -1 +1 @@
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
+-- 
+2.1.4
+
diff --git a/package/gcc/4.8.5/130-pr43538.patch b/package/gcc/4.8.5/130-pr43538.patch
new file mode 100644
index 0000000..19e57bb
--- /dev/null
+++ b/package/gcc/4.8.5/130-pr43538.patch
@@ -0,0 +1,25 @@
+From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
+From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 25 Apr 2014 08:03:08 +0000
+Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
+
+	PR target/43538
+	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ config/mt-gnu    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/mt-gnu b/config/mt-gnu
+index 15bf417..5c696f5 100644
+--- a/config/mt-gnu
++++ b/config/mt-gnu
+@@ -1 +1 @@
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
+-- 
+2.1.4
+
diff --git a/package/gcc/4.9.3/130-pr43538.patch b/package/gcc/4.9.3/130-pr43538.patch
new file mode 100644
index 0000000..19e57bb
--- /dev/null
+++ b/package/gcc/4.9.3/130-pr43538.patch
@@ -0,0 +1,25 @@
+From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
+From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 25 Apr 2014 08:03:08 +0000
+Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
+
+	PR target/43538
+	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ config/mt-gnu    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/mt-gnu b/config/mt-gnu
+index 15bf417..5c696f5 100644
+--- a/config/mt-gnu
++++ b/config/mt-gnu
+@@ -1 +1 @@
+-CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
++CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
+-- 
+2.1.4
+
