From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 29 Apr 2014 22:52:38 -0400
Subject: [Buildroot] [PATCH v2 1/2] ccache: change default cache directory
	path to match config setting
In-Reply-To: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
References: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1398826359-2711-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

Changes v1 -> v2:
* Refresh against latest, rather than building on top of unrelated WIP patch.
* Update patch commit log wording.
---
 package/ccache/ccache.mk |    3 +++
 1 file changed, 3 insertions(+)

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
-- 
1.7.9.5
