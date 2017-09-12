From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:59:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/gcc: fix ICE on
	xtensa, PR target/82181
Message-ID: <20170912215156.4965D8104D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8afd8781feee7a53eaa3969006615631f626a560
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Memory references to DI mode objects could incorrectly be created at
offsets that are not supported by instructions l32i/s32i, resulting in
ICE at a stage when access to the object is split into access to its
subwords:
  drivers/staging/rtl8188eu/core/rtw_ap.c:445:1:
     internal compiler error: in change_address_1, at emit-rtl.c:2126

Fixes: https://lkml.org/lkml/2017/9/10/151
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gcc/4.8.5/875-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../gcc/6.3.0/872-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/package/gcc/4.8.5/875-xtensa-fix-PR-target-82181.patch b/package/gcc/4.8.5/875-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..a6d1df9
--- /dev/null
+++ b/package/gcc/4.8.5/875-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 65a3028024a5963d9b988d70fe7ebe116c731310 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 11 Sep 2017 21:53:38 +0000
+Subject: [PATCH] xtensa: fix PR target/82181
+
+2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	Backport from mainline
+	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
+	words of DImode object are reachable by xtensa_uimm8x4 access.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index f08854729f50..4b94179636e0 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -599,6 +599,7 @@ xtensa_mem_offset (unsigned v, enum machine_mode mode)
+     case HImode:
+       return xtensa_uimm8x2 (v);
+ 
++    case DImode:
+     case DFmode:
+       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
+ 
+-- 
+2.1.4
+
diff --git a/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch b/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..3d7f8c1
--- /dev/null
+++ b/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 672910e3d1215b781cf0e4757e473f6a25ebf756 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 11 Sep 2017 21:53:38 +0000
+Subject: [PATCH] xtensa: fix PR target/82181
+
+2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	Backport from mainline
+	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
+	words of DImode object are reachable by xtensa_uimm8x4 access.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 67b369f015ad..3d1d981f885d 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -612,6 +612,7 @@ xtensa_mem_offset (unsigned v, enum machine_mode mode)
+     case HImode:
+       return xtensa_uimm8x2 (v);
+ 
++    case DImode:
+     case DFmode:
+       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
+ 
+-- 
+2.1.4
+
diff --git a/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch b/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..ed91d22
--- /dev/null
+++ b/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 329c471661493e48e0fc65fa6c17ef86517483ed Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 11 Sep 2017 21:53:38 +0000
+Subject: [PATCH] xtensa: fix PR target/82181
+
+2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	Backport from mainline
+	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
+	words of DImode object are reachable by xtensa_uimm8x4 access.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 36ab1e370853..bf02fceb416e 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -637,6 +637,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
+     case HImode:
+       return xtensa_uimm8x2 (v);
+ 
++    case DImode:
+     case DFmode:
+       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
+ 
+-- 
+2.1.4
+
diff --git a/package/gcc/6.3.0/872-xtensa-fix-PR-target-82181.patch b/package/gcc/6.3.0/872-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..c16feee
--- /dev/null
+++ b/package/gcc/6.3.0/872-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From dc90c186f755e726a097c9bb8bf6c4e7a45d8a07 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 11 Sep 2017 21:53:38 +0000
+Subject: [PATCH] xtensa: fix PR target/82181
+
+2017-09-11  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	Backport from mainline
+	* config/xtensa/xtensa.c (xtensa_mem_offset): Check that both
+	words of DImode object are reachable by xtensa_uimm8x4 access.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 70f698aba0ae..750b685b23e7 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -601,6 +601,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
+     case HImode:
+       return xtensa_uimm8x2 (v);
+ 
++    case DImode:
+     case DFmode:
+       return (xtensa_uimm8x4 (v) && xtensa_uimm8x4 (v + 4));
+ 
+-- 
+2.1.4
+
