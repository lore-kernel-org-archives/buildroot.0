From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 15:24:52 +0100
Subject: [Buildroot] [PATCH 1/5] package/Makefile.in: add HOST_BIN_CROSS
In-Reply-To: <20200204142456.1537358-1-arnout@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
Message-ID: <20200204142456.1537358-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages make use of configuration scripts to find various paths
(includes, libraries, etc.). In the best case, pkg-config is used, but
there are dozen of other scripts as well. These scripts have to be
configured or called differently depending on whether we're doing cross
compilation (i.e. building a target package) or native compilation (i.e.
host compilation). Currently, we use various ways to make sure the
correct configure script with the correct settings is used - mostly by
passing environment variables in the configuration step.

To create more convergence and simplify our understanding of what is
going on, let's make a separate directory for cross-compilation
configuration scripts. This is particularly useful for meson, because
meson makes an explicit difference between native and cross compilation,
with a full configuration file for both.

Define HOST_BIN_CROSS as a subdirectory of
$(HOST_DIR)/$(GNU_TARGET_NAME). This makes it easy for the wrapper
script to use a relative path to ../sysroot to find STAGING_DIR, which
makes them relocatable. Note that we can't use
$(HOST_DIR)/$(GNU_TARGET_NAME)/bin, because for an internal toolchain,
gcc and binutils install the cross-executables there without target
prefix. Putting that directory in PATH makes it impossible to do native
compilation at all, because gcc will call 'as' and 'ld' from PATH, i.e.
the cross-tools instead of the native tools.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 285e2837ef..c82e30069e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -230,6 +230,9 @@ HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
 
+# Location of scripts/wrappers for cross-compilation
+HOST_BIN_CROSS = $(HOST_DIR)/$(GNU_TARGET_NAME)/cross-bin
+
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/bin and therefore appears
@@ -241,7 +244,7 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/lib/perl
 
-TARGET_MAKE_ENV = PATH=$(BR_PATH)
+TARGET_MAKE_ENV = PATH=$(HOST_BIN_CROSS):$(BR_PATH)
 
 TARGET_CONFIGURE_OPTS = \
 	$(TARGET_MAKE_ENV) \
-- 
2.24.1
