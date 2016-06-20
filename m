From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 20 Jun 2016 01:46:11 -0300
Subject: [Buildroot] [PATCH] tmux: bump to version 2.2
Message-ID: <20160620044611.14225-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove patch already upstream 0001-remove-use-of-sys-cdefs.h.patch
https://github.com/tmux/tmux/commit/7b085136a7291cbcdfcc53182fbd13aaca70306e
- add new dependency on BR2_USE_WCHAR (version 2.2 uses mbtowc())
- add new dependency on locale support
- add note to help text about the need of a working UTF-8 locale
- also rewrap help text to 72 characters

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Some references about the UTF-8 thing:
https://github.com/tmux/tmux/commit/0d6de44a37755f0e5046c04e19e4506a6d59e750
https://github.com/tmux/tmux/commit/1f0b317088aaeb230d69f13f43ed63b7406c6fd1
https://groups.google.com/forum/#!topic/tmux-users/BnMK0ijLSIE
---
 package/tmux/0001-remove-use-of-sys-cdefs.h.patch | 42 -----------------------
 package/tmux/Config.in                            | 13 +++++--
 package/tmux/tmux.hash                            |  2 +-
 package/tmux/tmux.mk                              |  2 +-
 4 files changed, 13 insertions(+), 46 deletions(-)
 delete mode 100644 package/tmux/0001-remove-use-of-sys-cdefs.h.patch

diff --git a/package/tmux/0001-remove-use-of-sys-cdefs.h.patch b/package/tmux/0001-remove-use-of-sys-cdefs.h.patch
deleted file mode 100644
index 929953f..0000000
--- a/package/tmux/0001-remove-use-of-sys-cdefs.h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 29e4794ca396a8db8a468ec74559922d2af5a987 Mon Sep 17 00:00:00 2001
-From: Nicholas Marriott <nicholas.marriott@gmail.com>
-Date: Tue, 24 Nov 2015 18:46:50 +0000
-Subject: [PATCH] -sys/queue.h in proc.c, and nuke the unnecessary C++ header
- guards stuff and sys/cdefs.h in vis.h (it causes problems on some platforms).
- Reported by someone on GitHub, issue 212.
-
----
-Backported from master upstream to fix musl build
-https://github.com/tmux/tmux/commit/7b085136a7291cbcdfcc53182fbd13aaca70306e
-
-proc.c does not exist on version 2.1
-
-Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
----
- compat/vis.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/compat/vis.h b/compat/vis.h
-index 6795139..9f12d23 100644
---- a/compat/vis.h
-+++ b/compat/vis.h
-@@ -73,9 +73,6 @@
-  */
- #define	UNVIS_END	1	/* no more characters */
- 
--#include <sys/cdefs.h>
--
--__BEGIN_DECLS
- char	*vis(char *, int, int, int);
- int	strvis(char *, const char *, int);
- int	stravis(char **, const char *, int);
-@@ -85,6 +82,4 @@ int	strunvis(char *, const char *);
- int	unvis(char *, char, int *, int);
- ssize_t strnunvis(char *, const char *, size_t);
- 
--__END_DECLS
--
- #endif /* !_VIS_H_ */
--- 
-1.9.1
-
diff --git a/package/tmux/Config.in b/package/tmux/Config.in
index 61719e4..756f38a 100644
--- a/package/tmux/Config.in
+++ b/package/tmux/Config.in
@@ -1,10 +1,19 @@
 config BR2_PACKAGE_TMUX
 	bool "tmux"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # mbtowc()
+	depends on BR2_ENABLE_LOCALE # runtime
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NCURSES
 	help
-	  tmux is a terminal multiplexer, it enables a number of terminals
-	  (or windows) to be accessed and controlled from a single terminal.
+	  tmux is a terminal multiplexer, it enables a number of
+	  terminals (or windows) to be accessed and controlled from a
+	  single terminal.
+
+	  NOTE: tmux needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
 
 	  https://tmux.github.io/
+
+comment "tmux needs a toolchain w/ wchar, locale"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
index e732aa2..f3cbe74 100644
--- a/package/tmux/tmux.hash
+++ b/package/tmux/tmux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  31564e7bf4bcef2defb3cb34b9e596bd43a3937cad9e5438701a81a5a9af6176  tmux-2.1.tar.gz
+sha256  bc28541b64f99929fe8e3ae7a02291263f3c97730781201824c0f05d7c8e19e4  tmux-2.2.tar.gz
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 40f1a13..1e1b2b7 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TMUX_VERSION = 2.1
+TMUX_VERSION = 2.2
 TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
-- 
2.9.0
