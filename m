From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:21 +0200
Subject: [Buildroot] [git commit] gcc: remove the --with-pkgversion option
	from the ccache hash
Message-ID: <20151004162325.743DD81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe3395258c29e1290ead64548c05f34b1ea710ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

One of the gcc configure options that we hash for ccache is
--with-pkgversion which is set to something like Buildroot
2015.11-git-00426-ge7e7e4f - i.e., it will change with every buildroot
commit. That's obviously not wanted, so substitute this away.

Also add a \n to the printf so the output is a bit more readable.

[Peter: update documentation to match]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 420c4e9..ead3e15 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -256,10 +256,12 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-lin
 endif
 endif
 
-# _CONF_OPTS contains some references to the absolute path of $(HOST_DIR),
+# _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
+# and a reference to the Buildroot git revision (BR2_VERSION_FULL),
 # so substitute those away.
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
-	printf '%s' $(subst $(HOST_DIR), at HOST_DIR@,$($(PKG)_CONF_OPTS)) \
+	printf '%s\n' $(subst $(HOST_DIR), at HOST_DIR@,\
+		$(subst --with-pkgversion="Buildroot $(BR2_VERSION_FULL)",,$($(PKG)_CONF_OPTS))) \
 		| sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
 		| cut -c -64 | tr -d '\n'`\"
 endif # BR2_CCACHE
