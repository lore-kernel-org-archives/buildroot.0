From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:46:00 +0200
Subject: [Buildroot] [git commit] package/polkit: add upstream memory leak
 fix
Message-ID: <20200418123232.B73908E1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba70e29fea9fd76ffafd77401073d2142cbdfd21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes two small memory leaks.

Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/0002-jsauthority-memleak.patch | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/polkit/0002-jsauthority-memleak.patch b/package/polkit/0002-jsauthority-memleak.patch
new file mode 100644
index 0000000000..4f0733185c
--- /dev/null
+++ b/package/polkit/0002-jsauthority-memleak.patch
@@ -0,0 +1,28 @@
+From 28e3a6653d8c3777b07e0128a0d97d46e586e311 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Tue, 8 Oct 2019 13:28:18 +0000
+Subject: [PATCH] jsauthority: Fix two minor memory leaks
+
+(cherry picked from commit 28e3a6653d8c3777b07e0128a0d97d46e586e311)
+Signed-off-by: Jan Rybar <jrybar@redhat.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ src/polkitbackend/polkitbackendjsauthority.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
+index 9b752d1..e97b8aa 100644
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
+@@ -567,6 +567,8 @@ polkit_backend_js_authority_finalize (GObject *object)
+   g_strfreev (authority->priv->rules_dirs);
+ 
+   delete authority->priv->ac;
++  delete authority->priv->js_global;
++  delete authority->priv->js_polkit;
+ 
+   JS_DestroyContext (authority->priv->cx);
+   /* JS_ShutDown (); */
+-- 
+2.24.1
+
