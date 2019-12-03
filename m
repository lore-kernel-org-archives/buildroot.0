From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 11:05:49 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/faifa: fix
 incorrect library symlink
Message-ID: <20191203120637.E8C4F83C43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1074e1e02bc05a2ffa8463b613edff0c920c6794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

As spotted in
http://autobuild.buildroot.net/results/a61/a612cb7a85927d8cfe55c95c34d2901e7694fab0//diffoscope-results.txt,
faifa installs a library symlink with an incorrect target, which was
detected by the reproducible build logic, but is in fact wrong in any
case:

-lrwxrwxrwx   0        0        0        0 2019-11-07 19:38:04.000000 ./usr/lib/libfaifa.so -> /home/naourr/work/instance-3/output-1/target/usr/lib/libfaifa.so.0
+lrwxrwxrwx   0        0        0        0 2019-11-07 19:38:04.000000 ./usr/lib/libfaifa.so -> /home/naourr/work/instance-3/output-2/target/usr/lib/libfaifa.so.0

In practice, this is not a problem at runtime, as the .so symlink is
not used: the library soname is libfaifa.so.0. However, it still makes
sense to fix.

It is fixed by backporting an upstream commit. We considered bumping
to a newer version, but the latest version requires a new dependency
(libevent), so we preferred the backporting approach.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 14c3e876d3a4865434e39faf4da0183ddf5a411d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...le.in-fix-asbolute-symlink-of-libfaifa.so.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch b/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch
new file mode 100644
index 0000000000..876d2a60f4
--- /dev/null
+++ b/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch
@@ -0,0 +1,32 @@
+From d16abf61049947c451a6411a13fc15dda32feb47 Mon Sep 17 00:00:00 2001
+From: Florian Fainelli <f.fainelli@gmail.com>
+Date: Sat, 6 Sep 2014 11:23:02 -0700
+Subject: [PATCH] Makefile.in: fix asbolute symlink of libfaifa.so
+
+Fixes #7
+
+Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
+[Upstream: da2e279fd736d05bcd0ee6e4609c44fece017ba8]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ba65bee..9dec7ee 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -98,9 +98,9 @@ install: installman strip
+ 	$(INSTALL) -m0755 hpav_cfg $(DESTDIR)$(sbindir)
+ 	$(INSTALL) -d $(DESTDIR)$(libdir)
+ 	$(INSTALL) -m0644 $(LIB_SONAME) $(DESTDIR)$(libdir)
+-	ln -sf $(DESTDIR)$(libdir)/$(LIB_SONAME) $(DESTDIR)$(libdir)/$(LIB_SHARED_SO)
+ 	$(INSTALL) -d $(DESTDIR)$(includedir)/faifa
+ 	cp $(HEADERS) $(DESTDIR)$(includedir)/faifa
++	cd $(DESTDIR)$(libdir) && ln -sf $(LIB_SONAME) $(LIB_SHARED_SO)
+ 
+ strip:
+ 	$(STRIP) $(APP)
+-- 
+2.23.0
+
