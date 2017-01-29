From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Jan 2017 23:06:33 +0100
Subject: [Buildroot] [git commit] package/pkgconf: variable pkgdatadir also
	needs sysroot prefixing, wayland patch III
Message-ID: <20170129221325.5180781F72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e74c1312d35866c05813b4690412548eaaff61a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed when wayland support is enabled in xserver_xorg-server.

This patch fixes the final build error:

Making all in xwayland
make[3]: Entering directory '/home/buildroot/br5/output/build/xserver_xorg-server-1.19.0/hw/xwayland'
make[3]: *** No rule to make target '/usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml', needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.

when trying to build
http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Fix-all-variables-sysroot-prefix-problem.patch | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
index bac9f62..bc2b527 100644
--- a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
+++ b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
@@ -1,4 +1,4 @@
-From abc7a780f2a52a1aa3ee288e17140b817b545cc3 Mon Sep 17 00:00:00 2001
+From aa6bbc09e68426592faf722630fe92b6ede75bc8 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Mon, 2 Nov 2015 18:38:00 -0300
 Subject: [PATCH] Fix all-variables sysroot prefix problem
@@ -14,15 +14,19 @@ the directories may be requested barebones via pkg-config
 --variable=includedir libfool for example.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Added pkgdatadir to the list of to-be-prefixed variables.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- main.c | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
+ main.c | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
 
 diff --git a/main.c b/main.c
-index 6947126..52d16c2 100644
+index 6947126..ce5e18f 100644
 --- a/main.c
 +++ b/main.c
-@@ -313,9 +313,12 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
+@@ -313,9 +313,13 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
  			memset(req->buf, 0, sizeof(req->buf));
  
  			if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
@@ -33,12 +37,13 @@ index 6947126..52d16c2 100644
 +			    	(!strcmp(req->variable, "includedir") || \
 +				    !strcmp(req->variable, "libdir") || \
 +				    !strcmp(req->variable, "mapdir") || \
++				    !strcmp(req->variable, "pkgdatadir") || \
 +				    !strcmp(req->variable, "sdkdir")))
 +					strlcat(req->buf, sysroot_dir, sizeof(req->buf));
  			strlcat(req->buf, var, sizeof(req->buf));
  			return;
  		}
-@@ -323,8 +326,12 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
+@@ -323,8 +327,13 @@ print_variable(pkg_t *pkg, void *data, unsigned int flags)
  		strlcat(req->buf, " ", sizeof(req->buf));
  
  		if (*var == '/' && (flags & PKGF_MUNGE_SYSROOT_PREFIX) &&
@@ -48,6 +53,7 @@ index 6947126..52d16c2 100644
 +		    	(!strcmp(req->variable, "includedir") || \
 +			    !strcmp(req->variable, "libdir") || \
 +			    !strcmp(req->variable, "mapdir") || \
++			    !strcmp(req->variable, "pkgdatadir") || \
 +			    !strcmp(req->variable, "sdkdir")))
 +				strlcat(req->buf, sysroot_dir, sizeof(req->buf));
  
