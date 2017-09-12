From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 22:09:42 +0200
Subject: [Buildroot] [git commit] package/gcc: fix ICE on xtensa,
	PR target/82181
Message-ID: <20170912201316.CA8C8802CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fecb16cef7eec92d12d794348579cfd0ed756b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 .../gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch | 31 ++++++++++++++++++++++
 .../7.2.0/0870-xtensa-fix-PR-target-82181.patch    | 31 ++++++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch b/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..266e659
--- /dev/null
+++ b/package/gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 8dd3af97bb6ccb3dfd6cbe20c5a28ce80fcd0de7 Mon Sep 17 00:00:00 2001
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
+index 3c0096113775..3eb4db85b971 100644
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
index 0000000..cbcca00
--- /dev/null
+++ b/package/gcc/5.4.0/877-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 136e0f6b0c0acbe547894c6f8c855e3246c558b4 Mon Sep 17 00:00:00 2001
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
+index 8e62d631bce0..a30aa1bcfc33 100644
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
diff --git a/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch b/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..5fe3841
--- /dev/null
+++ b/package/gcc/6.4.0/870-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 3bc2ee6886f1619bc6a2257a0775142526b1a57a Mon Sep 17 00:00:00 2001
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
+index 2bdf5ccef979..92fdeb08046d 100644
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
diff --git a/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch b/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch
new file mode 100644
index 0000000..7ac7cd9
--- /dev/null
+++ b/package/gcc/7.2.0/0870-xtensa-fix-PR-target-82181.patch
@@ -0,0 +1,31 @@
+From 3ed0c49a8d52e88648c7bb9f21a204b23595a6a9 Mon Sep 17 00:00:00 2001
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
+index 25e4a2894c3b..8c404187107b 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -605,6 +605,7 @@ xtensa_mem_offset (unsigned v, machine_mode mode)
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
