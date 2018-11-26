From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:12:18 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: adjust config scripts
 tweaks for per-package directories
Message-ID: <20181202071559.A6EE27F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a18c828bed99d7e0db5128224ffcda4897cd8e80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adjusts the logic in pkg-generic.mk that tweaks the
*-config shell scripts installed by various libraries to make it
compatible with per-package directories.

This requires two fixes:

 - replacing $(STAGING_DIR) with a relative path from the config script
   to the staging directory, rather than using an absolute path of the
   staging directory.

   Without this, a *-config script provided by package A, but called
   from package B per-package directory will return paths from package A
   per-package directory:

   $ ./output/per-package/mcrypt/host/usr/<tuple>/sysroot/usr/bin/libmcrypt-config --libs
   -L..../output/per-package/libmcrypt/host/usr/<tuple>/sysroot/usr/lib/

   The libmcrypt-config script is installed by the libmcrypt package,
   and mcrypt is a package that depends on libmcrypt. When we call the
   libmcrypt-config script from the mcrypt per-package directory, it
   returns a -L flag that points to the libmcrypt per-package
   directory.

   One might say: but this is OK, since the sysroot of the libmcrypt
   per-package directory also contains the libmcrypt library. This is
   true, but we encounter a more subtle issue: because -L paths are
   considered before standard paths, ld ends up finding libc.so in the
   libmcrypt per-package directory. This libc.so file is a linker
   script that looks like this:

   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux.so.3 ) )

   Normally, thanks to ld sysroot awareness, /lib/libc.so.6 in this
   script is re-interpreted according to the sysroot. But in this
   case, the library is *outside* the compiler sysroot. Remember: we
   are using the compiler/linker from the "mcrypt" per-package
   directory, but we found "libc.so.6" in the "libmcrypt" per-package
   directory.

   This causes the linker to really use the /lib/libc.so.6 from the
   host machine, obvisouly leading to a build failure such as:

   output/per-package/libgcrypt/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: cannot find /lib/libc.so.6
   output/per-package/libgcrypt/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: cannot find /usr/lib/libc_nonshared.a
   output/per-package/libgcrypt/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: cannot find /lib/ld-linux-nios2.so.1

 - Some *-config scripts, such as the apr-1-config script, contain
   references to host tools:

   CC=".../output/per-package/apr/hosr/bin/arm-linux-gcc"
   CCP=".../output/per-package/apr/hosr/bin/arm-linux-cpp"

   We also want to replace those with proper relative paths. To
   achieve this, we need to also replace $(HOST_DIR) with a relative
   path. Since $(STAGING_DIR) is inside $(HOST_DIR), the first
   replacement of $(STAGING_DIR) by @STAGING_DIR@ is no longer needed:
   replacing $(HOST_DIR) by @HOST_DIR@ is sufficient. We still need to
   replace @STAGING_DIR@ by the proper path though, as we introduce
   @STAGING_DIR@ references in exec_prefix and prefix variables, as
   well as -I and -L flags.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 90b3b42731..887dc838a4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -275,12 +275,13 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
-			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
-				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
+			$(SED)  "s,$(HOST_DIR), at HOST_DIR@,g" \
+				-e "s,$(BASE_DIR), at BASE_DIR@,g" \
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
-				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
+				-e 's, at STAGING_DIR@,$$(dirname $$0)/../..,g' \
+				-e 's, at HOST_DIR@,$$(dirname $$0)/../../../..,g' \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
