From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:22:06 +0200
Subject: [Buildroot] [git commit] package/efl: eina: set EINA_VALUE_EMPTY
 during library init
Message-ID: <20190801093809.6F82F82B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b79e7c96e91988f6aaa86a045e91e2a79c74222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build issue introduced with efl 1.22.2.

See https://phab.enlightenment.org/D9348.

Fixes:
http://autobuild.buildroot.net/results/fa8/fa80b558d2df9e02e2997d57ac0e3be63881c5c4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-set-EINA_VALUE_EMPTY-during-library-init.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch b/package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
new file mode 100644
index 0000000000..bfc12fd5b8
--- /dev/null
+++ b/package/efl/0002-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
@@ -0,0 +1,51 @@
+From b8458ed248cf49bfe9a263d708b5e34adf77e275 Mon Sep 17 00:00:00 2001
+From: Cedric BAIL <cedric.bail@free.fr>
+Date: Wed, 17 Jul 2019 11:12:18 -0700
+Subject: [PATCH] eina: set EINA_VALUE_EMPTY during library init.
+
+This is a work around compiler/linker limit on some system as reported
+by Romain Naour.
+
+Reviewed-by: Mike Blumenkrantz <michael.blumenkrantz@gmail.com>
+Differential Revision: https://phab.enlightenment.org/D9348
+
+(cherry picked from commit c46a8143916f0d3f66bbdffc7107c97c88df212d)
+[Romain: backport to 1.22.x]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/lib/eina/eina_value.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/eina/eina_value.c b/src/lib/eina/eina_value.c
+index c75a5f1235..942a6d533e 100644
+--- a/src/lib/eina/eina_value.c
++++ b/src/lib/eina/eina_value.c
+@@ -58,7 +58,7 @@ static Eina_Hash *_eina_value_inner_mps = NULL;
+ static Eina_Lock _eina_value_inner_mps_lock;
+ static char *_eina_value_mp_choice = NULL;
+ static int _eina_value_log_dom = -1;
+-static const Eina_Value _eina_value_empty = EINA_VALUE_EMPTY;
++static Eina_Value _eina_value_empty;
+ 
+ #ifdef ERR
+ #undef ERR
+@@ -5404,6 +5404,7 @@ eina_value_inner_free(size_t size, void *mem)
+ Eina_Bool
+ eina_value_init(void)
+ {
++   const Eina_Value empty = EINA_VALUE_EMPTY;
+    const char *choice, *tmp;
+ 
+    _eina_value_log_dom = eina_log_domain_register("eina_value",
+@@ -5490,6 +5491,8 @@ eina_value_init(void)
+ 
+    EINA_ERROR_VALUE_FAILED = eina_error_msg_static_register("Eina_Value failed to copy/convert.");
+ 
++   memcpy(&_eina_value_empty, &empty, sizeof (empty));
++
+    return EINA_TRUE;
+ 
+  on_init_fail_hash:
+-- 
+2.21.0
+
