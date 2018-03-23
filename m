From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:26:46 +0100
Subject: [Buildroot] [git commit] util-linux: bump to version 2.32
Message-ID: <20180323152955.AE768815A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b54bd3ae87058af72797a7febf2d02f9aabfec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Leave both _VERSION_MAJOR and _VERSION to reduce churn. We are likely to
need _MAJOR on the next bump.

Drop ac_cv_header_sys_timex_h override; not needed with current
uClibc-ng.

Drop scanf_cv_type_modifier override; not used in configure script since
v2.21.

Drop upstream patch.

Cc: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/0001-docs-add-ISC-licence.patch | 38 ----------------------
 package/util-linux/util-linux.hash                 |  4 +--
 package/util-linux/util-linux.mk                   |  9 ++---
 3 files changed, 4 insertions(+), 47 deletions(-)

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
index 068bb45e6c..8f93d793c8 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.31/sha256sums.asc
-sha256 1a51b16fa9cd51d26ef9ab52d2f1de12403b810fc8252bf7d478df91b3cddf11  util-linux-2.31.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.32/sha256sums.asc
+sha256 6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734  util-linux-2.32.tar.xz
 # License files, locally calculated
 sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 72a6d18178..80a8a08051 100644
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
 
@@ -16,10 +15,6 @@ UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libm
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 Documentation/licenses/COPYING.ISC
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-# uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
-# (used in logger.c), and the common default is N.
-UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no \
-	$(if $(BR2_TOOLCHAIN_USES_UCLIBC),ac_cv_header_sys_timex_h=no)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
