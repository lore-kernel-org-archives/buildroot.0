From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 14 Jan 2018 17:28:43 -0200
Subject: [Buildroot] [PATCH v2] util-linux: extract ISC licence from rfkill.c
Message-ID: <20180114192843.12352-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Save the top 21 lines of sys-utils/rfkill.c as COPYING.ISC instead of
distributing the whole file. This matches a corresponding patch alreardy
submitted upstream that creates the Documentation/licenses/COPYING.ISC
file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 838d2dcb53..a614190f41 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -6,4 +6,4 @@ sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documen
 sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
 sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3
-sha256 996126b78a42dd2eeea1256d78b7fd6dec090ea196365c0ccb46adc32bc92460  sys-utils/rfkill.c
+sha256 7c219a72182dcc988e9b748fa39c17df3e973994260741750be3e12e94234e28  Documentation/licenses/COPYING.ISC
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5858887b04..c33b73594c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -13,7 +13,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
 UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
-UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 sys-utils/rfkill.c
+UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3 Documentation/licenses/COPYING.ISC
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 # uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
@@ -206,6 +206,12 @@ else
 UTIL_LINUX_CONF_OPTS += --without-audit
 endif
 
+# rfkill contails the license inside rfkill.c
+define UTIL_LINUX_EXTRACT_LICENSE
+	head -n 21 $(@D)/sys-utils/rfkill.c > $(@D)/Documentation/licenses/COPYING.ISC
+endef
+UTIL_LINUX_POST_EXTRACT_HOOKS += UTIL_LINUX_EXTRACT_LICENSE
+
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
-- 
2.14.3
