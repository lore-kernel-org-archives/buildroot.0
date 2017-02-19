From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 19 Feb 2017 19:17:16 -0300
Subject: [Buildroot] [PATCH v2 1/9] support/scripts/check-package: example
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170219221724.27298-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create an example package with many style problems.

These files can be used to test the check-package script.
Ideally each new warning added to the check script will have a bad style
example in these files.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - add example of patch with numbered subject but that does not trigger
    warning because it is not a git patch (based on comments from
    Thomas DS and Thomas P in the "check *.patch files" patch);
  - example of variable of virtual package the package under analysis
    provides (based on comment from Romain in the "check *.mk for typo
    in variable" patch);
  - add example of Config file with different name (bases on comment
    from Thomas DS in the "new script" patch;
---

Notes:
    There are also bad styles inside these files that currently do not
    trigger a warning message from the script in this patch series.
    They provide an insight of what can be tested in the future.

 .../package/package1/0001-do-something.patch       | 24 ++++++++++
 .../package/package1/0002-do-something-else.patch  | 24 ++++++++++
 .../package/package1/Config.in                     | 45 ++++++++++++++++++
 .../package/package1/Config.something              | 10 ++++
 .../package/package1/package1.hash                 |  8 ++++
 .../package/package1/package1.mk                   | 55 ++++++++++++++++++++++
 .../package/package1/wrong-name.patch              | 14 ++++++
 7 files changed, 180 insertions(+)
 create mode 100644 support/scripts/check-package-example/package/package1/0001-do-something.patch
 create mode 100644 support/scripts/check-package-example/package/package1/0002-do-something-else.patch
 create mode 100644 support/scripts/check-package-example/package/package1/Config.in
 create mode 100644 support/scripts/check-package-example/package/package1/Config.something
 create mode 100644 support/scripts/check-package-example/package/package1/package1.hash
 create mode 100644 support/scripts/check-package-example/package/package1/package1.mk
 create mode 100644 support/scripts/check-package-example/package/package1/wrong-name.patch

diff --git a/support/scripts/check-package-example/package/package1/0001-do-something.patch b/support/scripts/check-package-example/package/package1/0001-do-something.patch
new file mode 100644
index 000000000..bcd01dc1a
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/0001-do-something.patch
@@ -0,0 +1,24 @@
+From 79752a7ce44e60e276fd22031f88c796eeebf69b Mon Sep 17 00:00:00 2001
+From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+Date: Mon, 5 Dec 2016 23:03:16 -0200
+Subject: [PATCH 25/39] do something
+
+ Signed-off-bye: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+ file | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/file b/file
+index 8a1218a..8ef9013 100644
+--- a/file
++++ b/file
+@@ -1,5 +1,5 @@
+ 1
+ 2
+-3
++33
+ 4
+ 5
+-- 
+2.11.0
+
diff --git a/support/scripts/check-package-example/package/package1/0002-do-something-else.patch b/support/scripts/check-package-example/package/package1/0002-do-something-else.patch
new file mode 100644
index 000000000..d95ec4876
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/0002-do-something-else.patch
@@ -0,0 +1,24 @@
+From 79752a7ce44e60e276fd22031f88c796eeebf69b Mon Sep 17 00:00:00 2001
+From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+Date: Mon, 5 Dec 2016 23:03:16 -0200
+Subject: [PATCH] do something else
+
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
+---
+ file | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/file b/file
+index 8a1218a..8ef9013 100644
+--- a/file
++++ b/file
+@@ -1,5 +1,5 @@
+ 1
+ 2
+-3
++33
+ 4
+ 5
+-- 
+2.11.0
+
diff --git a/support/scripts/check-package-example/package/package1/Config.in b/support/scripts/check-package-example/package/package1/Config.in
new file mode 100644
index 000000000..a788735b7
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/Config.in
@@ -0,0 +1,45 @@
+config BR2_PACKAGE_PACKAGE1
+	select BR2_PACKAGE_LIBEVENT
+	bool "pAcKaGe"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
+	help
+	  package1 is a bad stylized package. Its only purpose is to exemplify
+          common style mistakes
+	some more help text but no url
+
+if BR2_PACKAGE_PACKAGE1
+ config BR2_PACKAGE_PACKAGE1_OPTION
+        bool "package1 option"
+        depends on BR2_USE_MMU
+        select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+        help
+	  This paragraph is properly wrapped. Since a tab counts as 8
+	  spaces and the help text must be wrapped at column 72, only 62
+	  characters for the text itself are expect per line.
+
+
+	  Another paragraph. - But this time we cross the column 72 by 1.
+	 wrong_line_with_single_word
+	  http://www.example.com/ urls do not have spaces and this line is too long.
+
+	  http://www.example.com/folder/even_long_url_should_not_be_wrapped
+
+config BR2_PACKAGE_PACKAGE1_OPTION2
+	string "option2"
+	default "aarch64-unknown-linux-gnu" \
+		if BR2_aarch64 || BR2_aarch64_eb
+
+config BR2_PACKAGE_PACKAGE1_OPTION3
+	string "option4"
+	default "value" \
+                if BR2_aarch64
+
+source "package/package1/Config.something"
+
+endif
+
+comment "package1 needs a toolchain w/ locale"
+        depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
diff --git a/support/scripts/check-package-example/package/package1/Config.something b/support/scripts/check-package-example/package/package1/Config.something
new file mode 100644
index 000000000..153584860
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/Config.something
@@ -0,0 +1,10 @@
+menu "Extensions"
+
+
+config BR2_PACKAGE_PACKAGE1_EXTENSION1
+	select BR2_PACKAGE_BZIP2
+	bool "Extension 1"
+	help
+	  A wonderful extension.
+
+endmenu
\ No newline at end of file
diff --git a/support/scripts/check-package-example/package/package1/package1.hash b/support/scripts/check-package-example/package/package1/package1.hash
new file mode 100644
index 000000000..78559bd4a
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/package1.hash
@@ -0,0 +1,8 @@
+# some comment:
+sha256 1234567890123456789012345678901234567890123456789012345678901234 package1-1.0.tar.gz 
+sha256 123456789 package1-1.0.tar.gz
+crc16	123456789	package1-1.0.tar.gz
+sha256	12345678901234567890123456789012345678901234567890123456789012345	dl/package1-1.0.tar.gz
+sha256 1234567890123456789012345678901234567890123456789012345678901234
+  
+
diff --git a/support/scripts/check-package-example/package/package1/package1.mk b/support/scripts/check-package-example/package/package1/package1.mk
new file mode 100644
index 000000000..ebd38ceb5
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/package1.mk
@@ -0,0 +1,55 @@
+########################################
+#
+# wrong name
+#
+########################################################################################################################
+PACKAGE1_VERSION=1.0
+PACKAGE1_SITE = https://localhost        
+PACKAGE1_LICENSE = GPL
+PACKAGE1_LICENSE_FILE = README
+PACKAGE1_LICENSE_FILES += COPYING
+PACKAGE1_PROVIDES = provided1 provided2
+PACKAGE1_PROVIDES += provided3
+# now some unneeded flags because they are the default value
+PACKAGE1_INSTALL_STAGING=NO 
+PACKAGE1_INSTALL_TARGET = YES	
+PACKAGE1_INSTALL_IMAGES  =  NO
+ PACKAGE1_INSTALL_REDISTRIBUTE = YES
+PACKAGE1_AUTORECONF = NO
+PACKAGE1_LIBTOOL_PATCH	=	YES
+ # but non-default conditionally overridden by default is allowed
+ifeq ($(BR2_STATIC_LIBS),y)
+	PACKAGE1_INSTALL_STAGING = NO
+endif
+
+
+PACKAGE1_DEPENDENCIES = depend1 depend2  \
+                       depend3
+PACKAGE1_DEPENDENCIES += depend5	\
+	depend4 \
+
+PACKAGE1_DEPENDENCIES = overwriting
+PACKAGE1_DEEEEEEEEEES = typo
+LINUX_DEPENDENCIES = messing with others
+PACKACE1_DEPENDENCIES = typo
+# package1 provides 3 virtual packages and can set variables with that prefixes
+PROVIDED1_LOCK = lock1
+PROVIDED2_LOCK   =   lock2
+PROVIDED3_LOCK = lock3
+NOT_PROVIDED4_LOCK = lock4
+
+define PACKAGE1_INSTALL_SOMETHING
+        mkdir -p $(TARGET_DIR)/var/lib
+	$(INSTALL) -m 0755 -D file1 \
+		$(TARGET_DIR)/var/lib/file
+	$(INSTALL) -m 0755 -D file2 \
+	$(TARGET_DIR)/etc/file
+endef
+
+define PACKAGE1_INSTALL_TARGET_CMDS
+	$(PACKAGE1_INSTALL_SOMETHING)
+        $(PACKAGE1_INSTALL_SOMETHING_ELSE)
+endef
+
+$(eval $(autotools-package))
+	
diff --git a/support/scripts/check-package-example/package/package1/wrong-name.patch b/support/scripts/check-package-example/package/package1/wrong-name.patch
new file mode 100644
index 000000000..c260ccda2
--- /dev/null
+++ b/support/scripts/check-package-example/package/package1/wrong-name.patch
@@ -0,0 +1,14 @@
+Subject: [PATCH 57/99] upstream does not use git
+no sob
+---
+diff -purN package.orig/file package/file
+--- package.orig/file	2000-01-01 22:07:43.275324499 -0300
++++ package/file	2016-01-01 22:08:16.171453283 -0300
+@@ -268,7 +268,6 @@ line
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <string.h>
+-#include <termio.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <curses.h>
\ No newline at end of file
-- 
2.11.0
