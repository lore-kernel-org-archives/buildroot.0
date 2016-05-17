From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:48:10 +0200
Subject: [Buildroot] [git commit branch/next] python-crossbar: fix
	byte-compilation of .pyc files
Message-ID: <20160517205049.0454481E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1ff2b7faa52c3ce23c4735d221da49a15188e9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For its continuous integration tests, python-crossbar includes one .py
file that intentionally has a syntax error. Until now, this wasn't
causing any problem, but with the introduction of a Python
byte-compilation process that errors out when there is a failure, it
is going to become a problem.

We simply add a patch that removes the syntax error, as we don't care
about it in the context of Buildroot. The problem has been reported
upstream to see if a better fix is possible.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Avoid-intentional-syntax-error.patch      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch b/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
new file mode 100644
index 0000000..fb8e4a2
--- /dev/null
+++ b/package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
@@ -0,0 +1,29 @@
+From 9ab2b96c2ee679c6dcb387174be211db5d70fa97 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 1 May 2016 15:35:32 +0200
+Subject: [PATCH] Avoid intentional syntax error
+
+This file has an intentional syntax error, meant to validate QA, but
+it breaks byte compilation of this package.
+
+Issue reported upstream:
+https://github.com/crossbario/crossbar/issues/750.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ crossbar/worker/test/examples/syntaxerror.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/crossbar/worker/test/examples/syntaxerror.py b/crossbar/worker/test/examples/syntaxerror.py
+index a5947cc..585c995 100644
+--- a/crossbar/worker/test/examples/syntaxerror.py
++++ b/crossbar/worker/test/examples/syntaxerror.py
+@@ -29,5 +29,3 @@
+ #####################################################################################
+ 
+ from __future__ import absolute_import, division
+-
+-class # noqa
+-- 
+2.7.4
+
