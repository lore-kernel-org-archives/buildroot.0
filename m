From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 09:25:30 +0100
Subject: [Buildroot] [git commit] package/mysql: do not force a static build
	for internal programs
Message-ID: <20141222082537.6739E7FB41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=574f2f2bb8ac84930761b3a78e6e835134e731a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mysql wants to statically link some of the programs it uses internally,
like conf_to_src (whatever it is used for) which links against -lz.

This does not work for a shared-only build, as we would be missing
libz.a in that case.

Fix that by not forcing static builds for internal programs.

Fixes a slew of autobuild failures:
    http://autobuild.buildroot.net/results/018/018a579f37c9c8eca5a36fc76e93508dcf9bba35/
    http://autobuild.buildroot.net/results/2cc/2cc481b0ae43713a6fc50a1ca720f91384892af7/
    http://autobuild.buildroot.net/results/d98/d985c5824f9012374d64e6085d6c8ec9b3cd932b/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/0006-no-force-static-build.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/mysql/0006-no-force-static-build.patch b/package/mysql/0006-no-force-static-build.patch
new file mode 100644
index 0000000..8172a98
--- /dev/null
+++ b/package/mysql/0006-no-force-static-build.patch
@@ -0,0 +1,18 @@
+configure: do not force a static link for non-installed programs
+
+Otherwise, it tries to link against a static libz, which may not exist
+in a shared-only system.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN mysql-5.1.73.orig/configure.in mysql-5.1.73/configure.in
+--- mysql-5.1.73.orig/configure.in	2014-12-22 00:04:46.550508208 +0100
++++ mysql-5.1.73/configure.in	2014-12-22 00:05:56.415307480 +0100
+@@ -562,7 +562,6 @@
+   AC_MSG_ERROR([MySQL requires an ANSI C compiler (and a C++ compiler). Try gcc. See the Installation chapter in the Reference Manual.])
+ fi
+ 
+-NOINST_LDFLAGS="-static"
+ 
+ static_nss=""
+ STATIC_NSS_FLAGS=""
