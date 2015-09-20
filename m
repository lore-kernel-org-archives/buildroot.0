From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 21:28:39 +0200
Subject: [Buildroot] [PATCH 19/19] [RFC] ccache: support changing the output
	directory
In-Reply-To: <1442777319-24164-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
Message-ID: <1442777319-24164-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building in a different output directory than the original build,
there will currently be a lot of ccache misses because in many cases
there is some -I/... absolute path in the compilation. ccache has an
option CCACHE_BASEDIR to substitute absolute paths with relative paths,
so they wil be the same in the hash (and in the output).

Since there are some disadvantages to this path rewriting, it is made
optional as BR2_CCACHE_USE_BASEDIR. It defaults to y because the
usefulness of ccache is severely reduced without this option.

In addition to CCACHE_BASEDIR, we also substitute away the occurences
of $(HOST_DIR) in the calculation of the compiler hash. This is done
regardless of the setting of BR2_CCACHE_USE_BASEDIR because it's
quite harmless.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Perhaps we should use $(HOST_DIR) instead of $(BASE_DIR) as
CCACHE_BASEDIR, because most of the time an absolute path will point
into the host dir. Not always, though (e.g. references to LINUX_DIR).
And most people will have $(HOST_DIR) inside $(BASE_DIR) so the latter
works well for them.

It's hard to be sure with ccache, but in my tests I still had the
impression that there were less cache hits when rebuilding in a
different output directory than when rebuilding in the same directory.
Oh well...
---
 Config.in                      | 27 +++++++++++++++++++++++++++
 docs/manual/ccache-support.txt | 20 ++++++++++++++++++++
 package/gcc/gcc.mk             |  4 +++-
 toolchain/toolchain-wrapper.c  | 11 +++++++++++
 toolchain/toolchain-wrapper.mk |  4 ++++
 5 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 74aeb46..d795361 100644
--- a/Config.in
+++ b/Config.in
@@ -286,6 +286,33 @@ config BR2_CCACHE_INITIAL_SETUP
 
 	  These initial settings are applied after ccache has been compiled.
 
+config BR2_CCACHE_USE_BASEDIR
+	bool "Use relative paths"
+	default y
+	help
+	  Allow ccache to convert absolute paths within the output
+	  directory into relative paths.
+
+	  During the build, many -I include directives are given with
+	  an absolute path. These absolute paths end up in the hashes
+	  that are computed by ccache. Therefore, when you build from a
+	  different directory, the hash will be different and the
+	  cached object will not be used.
+
+	  To improve cache performance, set this option to y. This
+	  allows ccache to rewrite absolute paths within the output
+	  directory into relative paths. Note that only paths within
+	  the output directory will be rewritten; therefore, if you
+	  change BR2_HOST_DIR to point outside the output directory and
+	  subsequently move it to a different location, this will lead
+	  to cache misses.
+
+	  This option has as a result that the debug information in the
+	  object files also has only relative paths. Therefore, make
+	  sure you cd to the build directory before starting gdb. See
+	  the section "COMPILING IN DIFFERENT DIRECTORIES" in the
+	  ccache manual for more information.
+
 endif
 
 config BR2_DEPRECATED
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index 992471d..f6746ad 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -33,3 +33,23 @@ make CCACHE_OPTIONS="--max-size=5G" ccache-options
 # zero statistics counters
 make CCACHE_OPTIONS="--zero-stats" ccache-options
 -----------------
+
++ccache+ makes a hash of the source files and of the compiler options.
+If a compiler option is different, the cached object file will not be
+used. Many compiler options, however, contain an absolute path to the
+staging directory. Because of this, building in a different output
+directory would lead to many cache misses.
+
+To avoid this issue, buildroot has the +Use relative paths+ option
+(+BR2_CCACHE_USE_BASEDIR+). This will rewrite all absolute paths that
+point inside the output directory into relative paths. Thus, changing
+the output directory no longer leads to cache misses.
+
+A disadvantage of the relative paths is that they also end up to be
+relative paths in the object file. Therefore, for example, the debugger
+will no longer find the file, unless you cd to the output directory
+first.
+
+See https://ccache.samba.org/manual.html#_compiling_in_different_directories[the
+ccache manual's section on "Compiling in different directories"] for
+more details about this rewriting of absolute paths.
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5fe54b7..41658d7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -251,8 +251,10 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-lin
 endif
 endif
 
+# _CONF_OPTS contains some references to the absolute path of $(HOST_DIR),
+# so substitute those away.
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
-	printf '%s' $($(PKG)_CONF_OPTS) $(GCC_VERSION) \
+	printf '%s' $(subst $(HOST_DIR), at HOST_DIR@,$($(PKG)_CONF_OPTS)) \
 		| sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
 		| cut -c -64 | tr -d '\n'`\"
 endif # BR2_CCACHE
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 3819b9a..2c43a58 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -258,6 +258,10 @@ int main(int argc, char **argv)
 			fprintf(stderr, "CCACHE_COMPILERCHECK=string:" BR_CCACHE_HASH "%s",
 				(debug == 2) ? "\n    " : " ");
 #endif
+#ifdef BR_CCACHE_BASEDIR
+			fprintf(stderr, "CCACHE_BASEDIR=" BR_CCACHE_BASEDIR "%s",
+				(debug == 2) ? "\n    " : " ");
+#endif
 			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
 					(debug == 2) ? "\n    " : " ", exec_args[i]);
@@ -272,6 +276,13 @@ int main(int argc, char **argv)
 		return 3;
 	}
 #endif
+#ifdef BR_CCACHE_BASEDIR
+	/* Allow compilercheck to be overridden through the environment */
+	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
+		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
+		return 3;
+	}
+#endif
 
 	if (execv(exec_args[0], exec_args))
 		perror(path);
diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index ab8215d..01ed2cc 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -21,6 +21,10 @@ ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE='"$(CCACHE)"'
 endif
 
+ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
+endif
+
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
-- 
2.5.3
