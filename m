From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:27:18 +0100
Subject: [Buildroot] [git commit branch/next] rng-tools: bump to version 5
Message-ID: <20141126212723.D00137FEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e987b1cd482b4a6c5c953f71674cfd1e9592279
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add semi-automatic libgcrypt dependency for i386/x86_64 to use RDRAND.
This is exclusively used by rngd for which we don't yet ship an
initscript/service file. Even so the user can choose to disable it at
invocation time via the --no-drng option (which must be accounted for).

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/Config.in      |    2 ++
 package/rng-tools/rng-tools.hash |    3 +++
 package/rng-tools/rng-tools.mk   |   18 +++++++++++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index c50a8c0..43c5a1c 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	# For rdrand ligcrypt is required and it's not obvious to users
+	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
 	help
 	  Daemon to use hardware random number generators.
 
diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-tools.hash
new file mode 100644
index 0000000..09769e4
--- /dev/null
+++ b/package/rng-tools/rng-tools.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/gkernel/files/rng-tools/5/
+md5	6726cdc6fae1f5122463f24ae980dd68	rng-tools-5.tar.gz
+sha1	3092768ac45315a5dcc0170d05566d1d00dbad96	rng-tools-5.tar.gz
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 56858e7..5b89656 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -4,13 +4,21 @@
 #
 ################################################################################
 
-RNG_TOOLS_VERSION = 4
+RNG_TOOLS_VERSION = 5
 RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-RNG_TOOLS_CONF_ENV = LIBS="-largp"
-RNG_TOOLS_DEPENDENCIES = argp-standalone
-endif
 RNG_TOOLS_LICENSE = GPLv2
 RNG_TOOLS_LICENSE_FILES = COPYING
 
+# Work around for uClibc's lack of argp_*() functions
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+RNG_TOOLS_CONF_ENV += LIBS="-largp"
+RNG_TOOLS_DEPENDENCIES += argp-standalone
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+RNG_TOOLS_DEPENDENCIES += libgcrypt
+else
+RNG_TOOLS_CONF_OPTS += --without-libgcrypt
+endif
+
 $(eval $(autotools-package))
