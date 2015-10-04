From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 17:06:01 +0100
Subject: [Buildroot] [PATCH] gcc: remove the --with-pkgversion option from
	the ccache hash
Message-ID: <1443974761-2081-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the gcc configure options that we hash for ccache is
--with-pkgversion which is set to something like Buildroot
2015.11-git-00426-ge7e7e4f - i.e., it will change with every buildroot
commit. That's obviously not wanted, so substitute this away.

Also add a \n to the printf so the output is a bit more readable.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/gcc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 420c4e9..e1d4bcf 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -259,7 +259,8 @@ endif
 # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR),
 # so substitute those away.
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
-	printf '%s' $(subst $(HOST_DIR), at HOST_DIR@,$($(PKG)_CONF_OPTS)) \
+	printf '%s\n' $(subst $(HOST_DIR), at HOST_DIR@,\
+		$(subst --with-pkgversion="Buildroot $(BR2_VERSION_FULL)",,$($(PKG)_CONF_OPTS))) \
 		| sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
 		| cut -c -64 | tr -d '\n'`\"
 endif # BR2_CCACHE
-- 
2.5.3
