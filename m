From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Dec 2014 14:28:27 +0100
Subject: [Buildroot] [PATCH v2] package/opkg: disable tests and manpages
Message-ID: <1418477307-17867-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changeset f1d3e09 (Build shared libraries only as the default) broke the
opkg package.

opkg wants to link its testsuite statically with the internal libopkg.
But in a shared-only build, there is no static library.

Since for Buildroot we do not care about tests, just disable them.

Fixes numerous build failures;
    http://autobuild.buildroot.net/results/ddf/ddf4b38c1df73b00b76be71db3f1eb8b1d932c55/
    http://autobuild.buildroot.net/results/c1c/c1c9a21b6583c9ef3ddd32681bb13cf91a218e8c/
    http://autobuild.buildroot.net/results/284/284bf7d6f9cebf8633143ca1ce15154de941805f/
    ...

Disable manpages at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Note: we could also easily patch the Makefiles to not require a static
link, and that works quite well, too. But upstream has changed quite a
lot in this respect, so that change would not be upstreamable. Better
just disable tests as we do not use them anyway.

---
Changes v1 -> v2:
  - add patch description

---
 package/opkg/0001-no-tests-no-man.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/opkg/0001-no-tests-no-man.patch

diff --git a/package/opkg/0001-no-tests-no-man.patch b/package/opkg/0001-no-tests-no-man.patch
new file mode 100644
index 0000000..87d3bf9
--- /dev/null
+++ b/package/opkg/0001-no-tests-no-man.patch
@@ -0,0 +1,24 @@
+Disable tests and mapages
+
+Tests are forcibly statically linked to libopkg, which does not work in
+a shared-only build.
+
+Since Buildroot does not care about testsuites, just disable building the
+tests. Disable manpages at the same time for the same reason.
+
+Note: dynamically linking with libopkg is also possible, but that would
+not be upstreamable (too much changes already in upstream).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN opkg-v0.2.2.orig/Makefile.am opkg-v0.2.2/Makefile.am
+--- opkg-v0.2.2.orig/Makefile.am	2014-04-01 22:31:59.000000000 +0200
++++ opkg-v0.2.2/Makefile.am	2014-12-13 14:13:49.684618796 +0100
+@@ -1,6 +1,6 @@
+ ACLOCAL_AMFLAGS = -I shave
+ 
+-SUBDIRS = libbb libopkg src tests utils man
++SUBDIRS = libbb libopkg src utils
+ 
+ 
+ HOST_CPU=@host_cpu@
-- 
1.9.1
