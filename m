From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 12 Apr 2017 23:16:13 -0500
Subject: [Buildroot] [PATCH 2/3] python3: ncurses condition for libselinux
	enabled
In-Reply-To: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1492056974-1773-2-git-send-email-matthew.weber@rockwellcollins.com>
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
 package/python3/Config.in  | 1 +
 package/python3/python3.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 35f57e6..fce635d 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_PYTHON3_CODECSCJK
 config BR2_PACKAGE_PYTHON3_CURSES
 	bool "curses module"
 	select BR2_PACKAGE_NCURSES
+	depends on !BR2_PACKAGE_LIBSELINUX    #circular dependency
 	help
 	  curses module for Python3.
 
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2532dee..4fd5d3e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -61,7 +61,14 @@ PYTHON3_CONF_OPTS += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
+# If libselinux is enabled, this creates a circular dependency
+# with busybox, ncurses, python, libselinux, busybox
+# For this case, we disable curses as a opt in python3.
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PYTHON3_CONF_OPTS += --disable-curses
+else
 PYTHON3_DEPENDENCIES += ncurses
+endif
 else
 PYTHON3_CONF_OPTS += --disable-curses
 endif
-- 
1.9.1
