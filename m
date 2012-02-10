From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 10 Feb 2012 22:21:00 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: set mtime of toolchain wrapper
	for ccache
In-Reply-To: <201202102220.19533.arnout@mind.be>
References: <201202102220.19533.arnout@mind.be>
Message-ID: <1328908860-28339-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: D M <d_mo1234@yahoo.com>

Also removed the ext-toolchain-wrapper as a target.

When using recent ccache with an external toolchain, a rebuild after
'make clean' will not make use of the cache.  ccache by default looks
at the mtime of the compiler executable and includes that in the
hash of the compiled file.  Since we build a wrapper around the
external toolchain, the mtime will have changed after the recompile
so everything will be rebuild.

As a solution, we give the wrapper executable the same mtime as the
external compiler executable, which will stay the same when rebuilding.
Unfortunately, this would mean that the ext-toolchain-wrapper is
rebuilt all the time (because its mtime is before that of the
ext-toolchain-installed stamp file).  Therefore, ext-toolchain-wrapper
is removed as a target.  Instead, the ext-toolchain-installed target
includes the building of the wrapper.

Alternative solutions are:

- Setting the CCACHE_COMPILERCHECK environment variable to "none", so
the compiler mtime is not included in the hash.  But then, if we change
the uClibc configuration, do a make clean and rebuild, most files will
still use the old object file.

- Setting the CCACHE_COMPILERCHECK environment variable to "hash", which
will calculate a hash of the compiler executable.  However, this hash is
recalculated for every file, so that's expensive.

- Setting the CCACHE_COMPILERCHECK environment variable to "echo $(HASH)",
where $(HASH) is a value that we compute from the toolchain configuration.

Although the last option is the best one, it costs a lot more effort to
implement.  This patch is a much simpler solution.

This patch only works for an external toolchain.  When using an internal
or crosstool-ng toolchain, the cache will still not be used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/ext-tool.mk |   26 ++++++++++++++------------
 1 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 2ac4973..e914ed0 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -315,29 +315,31 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
-	fi ; \
-	touch $@
-
-# Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
-# symlinks for everything else
-$(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
-	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
+	fi
+	# Build toolchain wrapper for preprocessor, C and C++ compiler, and
+	# setup symlinks for everything else.  Give the toolchain wrapper the
+	# same timestamp as one of the executables it wraps, so ccache still
+	# works.
+	$(Q)mkdir -p $(HOST_DIR)/usr/bin
+	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
+		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+	$(Q)cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
 		case "$$base" in \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			ln -sf $(@F) $$base; \
+			ln -sf ext-toolchain-wrapper $$base; \
+			touch -r $$i ext-toolchain-wrapper; \
 			;; \
 		*) \
 			ln -sf $$i .; \
 			;; \
 		esac; \
-	done ;
-	$(HOSTCC) $(HOST_CFLAGS) $(TOOLCHAIN_EXTERNAL_WRAPPER_ARGS) -s \
-		toolchain/toolchain-external/ext-toolchain-wrapper.c -o $@
+	done
+	$(Q)touch $@
 
 # 'uclibc' is the target to provide toolchain / staging dir
-uclibc: dependencies $(HOST_DIR)/usr/bin/ext-toolchain-wrapper
+uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 # download ext toolchain if so configured
-- 
1.7.8.3
