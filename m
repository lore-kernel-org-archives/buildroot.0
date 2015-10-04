From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 18:22:21 +0200
Subject: [Buildroot] [git commit] ccache: support changing the output
	directory
Message-ID: <20151004162325.68BDE81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e97b2787331c5f4452d8c9a76961a89ec355d9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building in a different output directory than the original build,
there will currently be a lot of ccache misses because in many cases
there is some -I/... absolute path in the compilation. Ccache has an
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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                      |   27 +++++++++++++++++++++++++++
 docs/manual/ccache-support.txt |   20 ++++++++++++++++++++
 package/gcc/gcc.mk             |    4 +++-
 toolchain/toolchain-wrapper.c  |   11 +++++++++++
 toolchain/toolchain-wrapper.mk |    4 ++++
 5 files changed, 65 insertions(+), 1 deletions(-)

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
index 103cbe1..420c4e9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -256,8 +256,10 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-lin
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
index d52115f..11f93f0 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -268,6 +268,10 @@ int main(int argc, char **argv)
 			fprintf(stderr, "%sCCACHE_COMPILERCHECK='string:" BR_CCACHE_HASH "'",
 				(debug == 2) ? "\n    " : " ");
 #endif
+#ifdef BR_CCACHE_BASEDIR
+			fprintf(stderr, "%sCCACHE_BASEDIR='" BR_CCACHE_BASEDIR "'",
+				(debug == 2) ? "\n    " : " ");
+#endif
 			for (i = 0; exec_args[i]; i++)
 				fprintf(stderr, "%s'%s'",
 					(debug == 2) ? "\n    " : " ", exec_args[i]);
@@ -282,6 +286,13 @@ int main(int argc, char **argv)
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
index 749afd7..c78363a 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_CCACHE),y)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
 endif
 
+ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
+TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
+endif
+
 # For simplicity, build directly into the install location
 define TOOLCHAIN_BUILD_WRAPPER
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
