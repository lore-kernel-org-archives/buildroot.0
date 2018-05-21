From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 21 May 2018 12:16:23 -0700
Subject: [Buildroot] [PATCH] util-linux: Bump to version 2.32
Message-ID: <20180521191623.7049-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstreamed patch.

This version of util-linux includes a work-around for a kernel 4.16.4,
4.17 change in the way getrandom() works.  In early boot, getrandom()
can now block for a very long time if there is insufficient entropy,
which can happen on embedded systems or qemu where there are few entropy
sources.  Users of libuuid from util-linux can be affected by this.

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/util-linux/0001-docs-add-ISC-licence.patch | 38 ----------------------
 package/util-linux/util-linux.hash                 | 11 ++++---
 package/util-linux/util-linux.mk                   |  5 ++-
 3 files changed, 8 insertions(+), 46 deletions(-)
 delete mode 100644 package/util-linux/0001-docs-add-ISC-licence.patch

diff --git a/package/util-linux/0001-docs-add-ISC-licence.patch b/package/util-linux/0001-docs-add-ISC-licence.patch
deleted file mode 100644
index aea7b9719c..0000000000
--- a/package/util-linux/0001-docs-add-ISC-licence.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a9e4662d26b10789b28282d7e77ab189ef34cf5c Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Sun, 14 Jan 2018 16:39:31 -0200
-Subject: [PATCH] docs: add ISC licence
-
-Save the top 21 lines of sys-utils/rfkill.c as COPYING.ISC. This is
-useful for Linux distributions an integration tools like Buildroot,
-to collect detailed legal information for each package.
-
-[kzak at redhat.com: - remove C-comments and rfkill header]
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- Documentation/licenses/COPYING.ISC | 11 +++++++++++
- 1 file changed, 11 insertions(+)
- create mode 100644 Documentation/licenses/COPYING.ISC
-
-diff --git a/Documentation/licenses/COPYING.ISC b/Documentation/licenses/COPYING.ISC
-new file mode 100644
-index 000000000..8351a30e3
---- /dev/null
-+++ b/Documentation/licenses/COPYING.ISC
-@@ -0,0 +1,11 @@
-+Permission to use, copy, modify, and/or distribute this software for any
-+purpose with or without fee is hereby granted, provided that the above
-+copyright notice and this permission notice appear in all copies.
-+
-+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-+WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
-+ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-+OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--- 
-2.14.3
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 068bb45e6c..c39e1bf049 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,9 +1,10 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.31/sha256sums.asc
-sha256 1a51b16fa9cd51d26ef9ab52d2f1de12403b810fc8252bf7d478df91b3cddf11  util-linux-2.31.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.32/sha256sums.asc
+sha256 6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734  util-linux-2.32.tar.xz
+
 # License files, locally calculated
 sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
-sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
 sha256 e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
+sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 72a6d18178..5350fa9fd1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.31
-UTIL_LINUX_VERSION_MINOR = 1
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
+UTIL_LINUX_VERSION_MAJOR = 2.32
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.14.3
