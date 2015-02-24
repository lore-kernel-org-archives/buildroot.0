From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 24 Feb 2015 11:53:18 +0100
Subject: [Buildroot] [PATCH master 2/2] logrotate: use pkg-config for the
	opt library
In-Reply-To: <1424775198-1787-1-git-send-email-Fabio.Porcedda@gmail.com>
References: <1424775198-1787-1-git-send-email-Fabio.Porcedda@gmail.com>
Message-ID: <1424775198-1787-2-git-send-email-Fabio.Porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Without using the pkg-config the dependencies are not included for a
static linking so it fails to build.
These failures are fixed by linking the libintl library that is a
dependency of the opt library.

Fixes:
http://autobuild.buildroot.net/results/159bf5730414ca7f73dcdae95090177355193636
http://autobuild.buildroot.net/results/ebe6ab7fc0f2cff98de06b3dc374730da9e9e4f2

Signed-off-by: Fabio Porcedda <Fabio.Porcedda@gmail.com>
---
 ...fig-to-retrive-ldflags-to-use-the-opt-lib.patch | 29 ++++++++++++++++++++++
 package/logrotate/logrotate.mk                     |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/logrotate/0001-Use-pkg-config-to-retrive-ldflags-to-use-the-opt-lib.patch

diff --git a/package/logrotate/0001-Use-pkg-config-to-retrive-ldflags-to-use-the-opt-lib.patch b/package/logrotate/0001-Use-pkg-config-to-retrive-ldflags-to-use-the-opt-lib.patch
new file mode 100644
index 0000000..9dd2f9e
--- /dev/null
+++ b/package/logrotate/0001-Use-pkg-config-to-retrive-ldflags-to-use-the-opt-lib.patch
@@ -0,0 +1,29 @@
+From 1bb790f79a6ed200436f5fcbfa04000af730c023 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail>
+Date: Tue, 24 Feb 2015 11:06:01 +0100
+Subject: [PATCH] Use pkg-config to retrive ldflags to use the opt library
+
+Using pkg-config the dependency are automatically added for a static
+linking, e.g. the libintl.
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 64cc601..05d54ba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,7 +5,7 @@ CFLAGS = -Wall -D_GNU_SOURCE -D$(OS_NAME) -DVERSION=\"$(VERSION)\" $(RPM_OPT_FLA
+ PROG = logrotate
+ MAN = logrotate.8
+ MAN5 = logrotate.conf.5
+-LOADLIBES = -lpopt
++LOADLIBES = $(shell pkg-config --libs popt)
+ SVNURL= svn+ssh://svn.fedorahosted.org/svn/logrotate
+ SVNPUBURL = http://svn.fedorahosted.org/svn/logrotate
+ SVNTAG = r$(subst .,-,$(VERSION))
+-- 
+2.3.0
+
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index dc26d85..b420d9d 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -9,10 +9,11 @@ LOGROTATE_SITE = https://www.fedorahosted.org/releases/l/o/logrotate
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
 
-LOGROTATE_DEPENDENCIES = popt
+LOGROTATE_DEPENDENCIES = popt host-pkgconf
 
 define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
+		LDFLAGS="$(LDFLAGS)" -C $(@D)
 endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
-- 
2.3.0
