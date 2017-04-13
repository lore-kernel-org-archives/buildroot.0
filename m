From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 12 Apr 2017 23:16:14 -0500
Subject: [Buildroot] [PATCH 3/3] python: ncurses condition for libselinux
	enabled
In-Reply-To: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1492056974-1773-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libselinux is enabled, a circular dependency is
created.  Disable ncurses python support when libselinux
is enabled so that the circular busybox, ncurses,
python, libselinux chain is broken.

Resolves
http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/python/Config.in | 1 +
 package/python/python.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/python/Config.in b/package/python/Config.in
index fa83e77..47001c5 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_PYTHON_CODECSCJK
 
 config BR2_PACKAGE_PYTHON_CURSES
 	select BR2_PACKAGE_NCURSES
+	depends on !BR2_PACKAGE_LIBSELINUX    #circular dependency
 	bool "curses module"
 	help
 	  curses module for Python.
diff --git a/package/python/python.mk b/package/python/python.mk
index 7ba5e37..ae90181 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -71,7 +71,14 @@ PYTHON_CONF_OPTS += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
+# If libselinux is enabled, this creates a circular dependency
+# with busybox, ncurses, python, libselinux, busybox
+# For this case, we disable curses as a opt in python3.
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PYTHON_CONF_OPTS += --disable-curses
+else
 PYTHON_DEPENDENCIES += ncurses
+endif
 else
 PYTHON_CONF_OPTS += --disable-curses
 endif
-- 
1.9.1
