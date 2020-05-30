From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 May 2020 15:43:44 +0200
Subject: [Buildroot] [PATCH,for-next] package/rust: remove unneded patch
Message-ID: <20200530134344.24976-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous commit [1] added a patch to remove python2 from the configure script.
While this script is used by the Fedora rust package [2], it is not used by rust.mk.

The configure script is an alternative build system provided by upstream, and
finally calls x.py [3].

Thanks to Thomas for noticing the mistake [4].

[1] 02703108eca8353ff45c0842d9b882a0dc37c04b
[2] https://src.fedoraproject.org/rpms/rust/blob/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2/f/rust.spec#_314
[3] https://github.com/rust-lang/rust/blob/1.33.0/README.md#configure-and-make
[4] http://lists.busybox.net/pipermail/buildroot/2020-May/283610.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...igure-use-default-python-interpreter.patch | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 package/rust/0002-configure-use-default-python-interpreter.patch

diff --git a/package/rust/0002-configure-use-default-python-interpreter.patch b/package/rust/0002-configure-use-default-python-interpreter.patch
deleted file mode 100644
index 34d97bb4cf..0000000000
--- a/package/rust/0002-configure-use-default-python-interpreter.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From aca7abb537f5caf1c9f027cf65dd0f53fb664e73 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 26 May 2020 18:24:25 +0200
-Subject: [PATCH] configure: use default python interpreter
-
-Don't try to use python2 if available, use the python interpreter available
-in ouput/host/bin/python whateverer the python version is.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/configure b/configure
-index eeb8d081d34..6014a982f47 100755
---- a/configure
-+++ b/configure
-@@ -2,16 +2,4 @@
- 
- script="$(dirname $0)"/src/bootstrap/configure.py
- 
--try() {
--    cmd=$1
--    shift
--    T=$($cmd --version 2>/dev/null)
--    if [ $? -eq 0 ]; then
--        exec $cmd "$script" "$@"
--    fi
--}
--
--try python2.7 "$@"
--try python27 "$@"
--try python2 "$@"
- exec python $script "$@"
--- 
-2.25.4
-
-- 
2.25.4
