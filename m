From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Nov 2015 17:03:50 -0300
Subject: [Buildroot] [PATCH] pkgconf: fix incorrect variable-directory
	sysroot prefixing
Message-ID: <1446494630-2956-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the pkg-config documents ("specification") when
sysroot-prefixing is enabled via PKG_CONFIG_SYSROOT_DIR this should only
be applied to -I/-L directories (includes, library directories), and not
to all of the other variables that can specify a directory.

However xorg uses mapdir/sdkdir in a similar fashion in what could be
considered an abuse of the spec, hence needs to be prefixed as well.

This patch makes pkgconf behave in the pkg-config specified way with the
added exception for the mapdir and sdkdir variables which are still
prefixed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-Fix-all-variables-sysroot-prefix-problem.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch

diff --git a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
new file mode 100644
index 0000000..33a7589
--- /dev/null
+++ b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
@@ -0,0 +1,47 @@
+From cb7638bd24f3b9a40c125338e7b315fbabeb37ed Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 2 Nov 2015 15:36:28 -0300
+Subject: [PATCH] Fix all-variables sysroot prefix problem
+
+According to the pkg-config specifications (or rather documentation)
+only the -L/-I directory entries should be sysroot-prefixed.
+But since xorg uses mapdir/sdkdir with a similar intention disable
+prefixing for all variables except these.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ main.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/main.c b/main.c
+index 6947126..77f3654 100644
+--- a/main.c
++++ b/main.c
+@@ -313,9 +313,9 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
+ 			memset(req->buf, 0, sizeof(req->buf));
+ 
+ 			if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
+-			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
+-				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
+-
++			    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
++			    	(!strcmp(req->variable, "mapdir") || !strcmp(req->variable, "sdkdir")))
++				    strlcat(req->buf, sysroot_dir, sizeof(req->buf));
+ 			strlcat(req->buf, var, sizeof(req->buf));
+ 			return;
+ 		}
+@@ -323,8 +323,9 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
+ 		strlcat(req->buf, " ", sizeof(req->buf));
+ 
+ 		if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
+-		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))))
+-			strlcat(req->buf, sysroot_dir, sizeof(req->buf));
++		    (sysroot_dir != NULL && strncmp(var, sysroot_dir, strlen(sysroot_dir))) &&
++		    	(!strcmp(req->variable, "mapdir") || !strcmp(req->variable, "sdkdir")))
++			    strlcat(req->buf, sysroot_dir, sizeof(req->buf));
+ 
+ 		strlcat(req->buf, var, sizeof(req->buf));
+ 	}
+-- 
+2.4.10
+
-- 
2.4.10
