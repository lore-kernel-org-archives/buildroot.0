From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 19:58:14 -0700
Subject: [Buildroot] [PATCH 2/4] package/polkit: add upstream memory leak fix
In-Reply-To: <20200418025816.1642936-1-aduskett@gmail.com>
References: <20200418025816.1642936-1-aduskett@gmail.com>
Message-ID: <20200418025816.1642936-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch fixes two small memory leaks.

Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/polkit/0002-jsauthority-memleak.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/polkit/0002-jsauthority-memleak.patch

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
-- 
2.25.2
