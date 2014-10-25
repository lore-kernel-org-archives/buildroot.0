From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 19:29:25 +0200
Subject: [Buildroot] [git commit] libunistring: new package
Message-ID: <20141025173126.79C5CAF65C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2a5b777a5ba923f440a21497a97d32b64f09164
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - adjust the title of the commit
  - remove the thread dependency, by using the --disable-threads
    option when needed
  - remove LIBUNISTRING_SOURCE, since its value was the default
  - use BR2_GNU_MIRROR in LIBUNISTRING_SITE
  - adjust the license, which really is LGPLv3+, not LGPLv2. The
    license file is COPYING.LIB.]

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/libunistring/Config.in       |    8 ++++++++
 package/libunistring/libunistring.mk |   19 +++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 03639e4..9e361b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -907,6 +907,7 @@ menu "Other"
 	source "package/startup-notification/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/libunistring/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/libunistring/Config.in b/package/libunistring/Config.in
new file mode 100644
index 0000000..ebb37d9
--- /dev/null
+++ b/package/libunistring/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBUNISTRING
+	bool "libunistring"
+	help
+	  The libunistring library provides functions for manipulating
+	  Unicode strings and for manipulating C strings according to
+	  the Unicode standard.
+
+	  http://www.gnu.org/software/libunistring/
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
new file mode 100644
index 0000000..3234ddc
--- /dev/null
+++ b/package/libunistring/libunistring.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libunistring
+#
+################################################################################
+
+LIBUNISTRING_VERSION = 0.9.4
+LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
+LIBUNISTRING_INSTALL_STAGING = YES
+LIBUNISTRING_LICENSE = LGPLv3+
+LIBUNISTRING_LICENSE_FILES = COPYING.LIB
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBUNISTRING_CONF_OPTS += --enable-threads=posix
+else
+LIBUNISTRING_CONF_OPTS += --disable-threads
+endif
+
+$(eval $(autotools-package))
