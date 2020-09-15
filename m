From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 15 Sep 2020 12:38:06 +0200
Subject: [Buildroot] [PATH v2 1/1] docs/manual: add qemu defconfigs gitlab
 test
Message-ID: <20200915103806.13785-1-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot supports testing qemu defconfigs on gitlab since [1].

[1] : commit 0c7935063851accf3db4c9eb2fc4f11c3da0c391.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
Changes v1 -> v2:
  - remove drive=hd0 from doc.

 docs/manual/adding-board-support.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index 33ed709535..6c7eb93ce2 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -46,3 +46,21 @@ create a directory +board/<manufacturer>+ and a subdirectory
 +board/<manufacturer>/<boardname>+. You can then store your patches
 and configurations in these directories, and reference them from the main
 Buildroot configuration. Refer to xref:customize[] for more details.
+
+=== Adding qemu defconfig gitlab test
+
+Buildroot provides a test script (support/scripts/boot-qemu-image.py)
+to validate all defconfigs under +board/qemu/. Every supported qemu
+architecture should append the comment : # qemu_ARCH_defconfig
+at the end of its command line entry in board/qemu/ARCH/readme.txt (for
+example aarch64-virt includes : # qemu_aarch64_virt_defconfig).
+Once a week, every defconfig is tested under gitlab's pipelines :
+* Launches a qemu instance.
+* Enters root credentials and checks if login shell is available.
+* Powers off the instance.
+The job fails if one of above steps returns unsuccessful status code.
+to trigger qemu defconfigs test jobs:
+
+---------------------
+ $ git push gitlab HEAD:<name>_defconfig
+---------------------
-- 
2.11.0
