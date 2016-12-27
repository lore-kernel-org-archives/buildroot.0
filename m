From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2016 14:03:01 +0100
Subject: [Buildroot] [PATCH 3/3] package/pkgconf: variable pkgdatadir also
	needs sysroot prefixing, wayland patch III
In-Reply-To: <20161227130301.22831-1-bernd.kuhls@t-online.de>
References: <20161227130301.22831-1-bernd.kuhls@t-online.de>
Message-ID: <20161227130301.22831-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed when wayland support is enabled in xserver_xorg-server.

This patch fixes the final build error:

Making all in xwayland
make[3]: Entering directory '/home/buildroot/br5/output/build/xserver_xorg-server-1.19.0/hw/xwayland'
make[3]: *** No rule to make target '/usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml', needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.

when trying to build
http://autobuild.buildroot.net/results/cf0/cf026e9b18e86b9890341612050f4d166a7b822d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-Fix-all-variables-sysroot-prefix-problem.patch | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
index bac9f6208..bc2b5273c 100644
--- a/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
+++ b/package/pkgconf/0001-Fix-all-variables-sysroot-prefix-problem.patch
@@ -14,15 +14,19 @@ the directories may be requested barebones via pkg-config
 --variable=includedir libfool for example.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+Added pkgdatadir to the list of prefixed variables.
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
  
-- 
2.11.0
