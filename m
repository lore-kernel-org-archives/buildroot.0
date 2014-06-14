From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:59:07 +0200
Subject: [Buildroot] [git commit] ccache: change default cache directory
	path to match config setting
Message-ID: <20140614175923.A200D9CFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d93a0b402934309c632d4a825b7fe6183ce8c4c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
ccache directory location to use BR_CACHE_DIR (then BUILDROOT_CACHE_DIR),
which is exported by Makefile based on the BR2_CCACHE_DIR config option.
This allowed the cache location to be changed on-the-fly by setting a
"make" command line variable, but left the default location of ccache's
normal default at "$HOME/.ccache".  Since this location does not match the
default for BR2_CCACHE_DIR, it is basically almost never correct, so
direct invocation of ccache outside of the buildroot Makefile, such as for
increasing the cache size, becomes cumbersome.

This patch changes the last-ditch cache location from "$HOME/.ccache" to
the BR_CCACHE_DIR value defined when host-ccache is configured.  Note that
the ability to later override the cache location by using a BR_CACHE_DIR
command line variable is left intact.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 650290d..df92c5e 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -30,9 +30,12 @@ HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 #    the compiler, because in the context of Buildroot, that completely
 #    defeats the purpose of ccache. Of course, that leaves the user
 #    responsible for purging its cache when the compiler changes.
+#  - Change hard-coded last-ditch default to match path in .config, to avoid
+#    the need to specify BR_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
 	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
+	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
