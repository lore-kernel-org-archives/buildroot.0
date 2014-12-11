From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 12:17:32 +0000
Subject: [Buildroot] [PATCH] systemd: bump version to v218
Message-ID: <1418300252-3117-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trivial changes:
- Bump version to v218
- Update the hash file

Non-trivial changes:
- Remove upstreamed patch

  The patch was added by this upstream commit:
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2

- Remove non-existent configure options

  --with-firmware-path option was removed by this upstream commit:
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=be2ea723b1d023b3d385d3b791ee4607cbfb20ca

  --disable-tcpwrap option was removed by this upstream commit:
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=7f8aa67131cfc03ddcbd31c0420754864fc122f0

- Select a required dependency

  libmount dependency was added by this upstream commit:
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=8d3ae2bd4c9bf9fc2e57f7b3776325a1c750ca30

  The error for not satisfying this required dependency looks like this:

  checking for MOUNT... no
  configure: error: *** libmount support required but libraries not
    found

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...fine-the-__NR_memfd_create-macro-for-MIPS.patch |   48 --------------------
 package/systemd/Config.in                          |    1 +
 package/systemd/systemd.hash                       |    2 +-
 package/systemd/systemd.mk                         |    4 +-
 4 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch

diff --git a/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch b/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
deleted file mode 100644
index 9ce64c9..0000000
--- a/package/systemd/0004-Properly-define-the-__NR_memfd_create-macro-for-MIPS.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Properly define the __NR_memfd_create macro for MIPS
-
-This is an upstream patch which has been applied to the master branch
-and I have adapted it to make it apply to the v217 version.
-
-Upstream commit:
-  http://cgit.freedesktop.org/systemd/systemd/commit/?id=e6c019026b8cfd27a997e6e6ed1349f8f289b7e2
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From a51496db6edc8168268c86ea55915405f95b0212 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 13 Nov 2014 17:32:52 +0000
-Subject: [PATCH] Properly define the __NR_memfd_create macro for MIPS
-
-This macro exists for MIPS since v3.17:
-  https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=42944521af97a3b25516f15f3149aec3779656dc
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- src/shared/missing.h |   11 +++++++++--
- 1 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index bb4f8f2..66bedcf 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -125,8 +125,15 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
- #  endif
- #elif defined _MIPS_SIM
- #  ifndef __NR_memfd_create
--#    warning "__NR_memfd_create not yet defined for MIPS"
--#    define __NR_memfd_create 0xffffffff
-+#    if _MIPS_SIM == _MIPS_SIM_ABI32
-+#      define __NR_memfd_create 4354
-+#    endif
-+#    if _MIPS_SIM == _MIPS_SIM_NABI32
-+#      define __NR_memfd_create 6318
-+#    endif
-+#    if _MIPS_SIM == _MIPS_SIM_ABI64
-+#      define __NR_memfd_create 5314
-+#    endif
- #  endif
- #else
- #  ifndef __NR_memfd_create
--- 
-1.7.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 58f76a5..b574891 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -21,6 +21,7 @@ config BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 5b7ba7f..e20519b 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a031e6fbcdc7077b37338bae8074d9428ee2fa98033beb4923a62871890f7498  systemd-217.tar.xz
+sha256  1b0768b53b6c6d813a93a4b8fe1f80cf53561b09075010a97c7aa08eee3fd59b  systemd-218.tar.xz
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5362319..dbfce71 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 217
+SYSTEMD_VERSION = 218
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
@@ -38,11 +38,9 @@ SYSTEMD_CONF_OPTS += \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
-	--with-firmware-path=/lib/firmware \
 	--enable-split-usr \
 	--enable-introspection=no \
 	--disable-efi \
-	--disable-tcpwrap \
 	--disable-tests \
 	--disable-dbus \
 	--without-python
-- 
1.7.1
