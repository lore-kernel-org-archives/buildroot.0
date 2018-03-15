From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Mar 2018 21:35:08 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off the
 build time
In-Reply-To: <cover.1521146096.git.yann.morin.1998@free.fr>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
Message-ID: <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As part of the build, we run some instrumentation hooks to gather
statistics about the usage of the target/, staging/ and host/
directories, so that we can generate reports for the user, that
shows:
  - for each file, what package installed it,
  - for each package,the size that it installed.

In so doing, we run a double md5 pass on all files of the affected
directories. These passes were mostly invisible when we were only
scanning target/, but has greatly increased in time now that we also
scan staging/ and host/ (but only in the corresponding _CMDS, of
course).

This md5 wsa mostly aimed at catching packages that would "cheat" with
mtime/atime/ctime somehow. They can't really cheat on md5, though [0].

Timings however speak for themselves, with this defconfig (slightly
biggish-but-still-manageable build) [1].

host/      20965 files    1.2GiB
staging/    4715 files    333MiB
target/     1801 files     44MiB

All instrumentation steps, using md5:    19min 27s
All instrumentation steps, using mtime:  14min 45s
No instrumentation step at all:          14min 31s

So, using mtime is an almost-5min improvement, i.e. about 25% faster,
while removing all instrumentation steps does not gain that much more...

So, we switch to using mtime, because in the end that's still good-enough
for our use-case: generating some graphs. It is not mission-critical, and
if a graph is slightly off, that's not biggy. It can anyway be attributed
to a broken package's buildsystem, which should get fixed.

However, we lose the ability to track directories. Non-empty directories
can be tracked back by a bit of scripting, but empty directories are
simply not caught. If we were to also look for directories using mtime,
we would catch parents of installed files:

  - /foo/bar/ exists
  - a package installs /foo/bar/buz
  - mtime of /foo/bar/ is changed to account for the nex file in it.

So we do not track directories at all, and we lose empty directories.
The existing tracking was mostly happenstance, with the original
submission and comments not really accounting for a real use-case.

Now, we also change the way we handle symlinks. Previously, we would
hash the file pointed to by the symlink. Now, we only look at the mtime
of the symlink itself, which still detects modifications.

Eventually, this also means that we now no longer need to establish a
list before the install step; we can now simply run after the install
step.

[0] Yeah, md5 is very weak, but we're not guarding against malicious
attacks, just about careless modifications.

[1] defconfig used for tests:
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OSMESA=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
BR2_PACKAGE_SYSTEMD_BINFMT=y
BR2_PACKAGE_SYSTEMD_COREDUMP=y
BR2_PACKAGE_SYSTEMD_FIRSTBOOT=y
BR2_PACKAGE_SYSTEMD_HIBERNATE=y
BR2_PACKAGE_SYSTEMD_IMPORTD=y
BR2_PACKAGE_SYSTEMD_LOCALED=y
BR2_PACKAGE_SYSTEMD_LOGIND=y
BR2_PACKAGE_SYSTEMD_MACHINED=y
BR2_PACKAGE_SYSTEMD_POLKIT=y
BR2_PACKAGE_SYSTEMD_QUOTACHECK=y
BR2_PACKAGE_SYSTEMD_RANDOMSEED=y
BR2_PACKAGE_SYSTEMD_RFKILL=y
BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT=y
BR2_PACKAGE_SYSTEMD_SYSUSERS=y
BR2_PACKAGE_SYSTEMD_VCONSOLE=y

Reported-by: Trent Piepho <tpiepho@impinj.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Trent Piepho <tpiepho@impinj.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2a82025a04..293824c601 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -57,53 +57,26 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # Hooks to collect statistics about installed files
 
-define _step_pkg_size_get_file_list
-	(cd $(2) ; \
-		( \
-			find . -xtype f -print0 | xargs -0 md5sum ; \
-			find . -xtype d -print0 | xargs -0 -I{} printf 'directory  {}\n'; \
-		) \
-	) | sort > $1
-endef
-
-# This hook will be called before the installation of a package. We store in
-# a file named .br_filelist_before the list of files currently installed.
-# Note that the MD5 is also stored, in order to identify if the files are
-# overwritten.
-# $(1): package name (ignored)
-# $(2): base directory to search in
-define step_pkg_size_start
-	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_before,$(2))
-endef
-
-# This hook will be called after the installation of a package. We store in
-# a file named .br_filelist_after the list of files (and their MD5) currently
-# installed. We then do a diff with the .br_filelist_before to compute the
-# list of files installed by this package.
 # The suffix is typically empty for the target variant, for legacy backward
 # compatibility.
-# $(1): package name (ignored)
+# $(1): package name
 # $(2): base directory to search in
 # $(3): suffix of file  (optional)
-define step_pkg_size_end
-	$(call _step_pkg_size_get_file_list,$($(PKG)_DIR)/.br_filelist_after,$(2))
-	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
-		while read hash file ; do \
-			echo "$(1),$${file}" ; \
-		done >> $(BUILD_DIR)/packages-file-list$(3).txt
-	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
+define step_pkg_size_inner
+	cd $(2); \
+	find . \( -type f -o -type L \) \
+		-newer $($(PKG)_DIR)/.stamp_built \
+		-exec printf '$(1),%s\n' {} + \
+		>> $(BUILD_DIR)/packages-file-list$(3).txt
 endef
 
 define step_pkg_size
 	$(if $(filter install-target,$(2)),\
-		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(TARGET_DIR))) \
-		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(TARGET_DIR))))
+		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(TARGET_DIR))))
 	$(if $(filter install-staging,$(2)),\
-		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(STAGING_DIR),-staging)) \
-		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(STAGING_DIR),-staging)))
+		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(STAGING_DIR),-staging)))
 	$(if $(filter install-host,$(2)),\
-		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(HOST_DIR),-host)) \
-		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(HOST_DIR),-host)))
+		$(if $(filter end,$(1)),$(call step_pkg_size_inner,$(3),$(HOST_DIR),-host)))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
-- 
2.14.1
