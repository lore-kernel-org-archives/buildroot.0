From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 22:23:10 +0100
Subject: [Buildroot] [git commit] python-pycrypto: do not include host
	headers
Message-ID: <20131220212714.D7AB79A49C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fd8e8ddb404b226c9ebd27f4f36eced8827a3dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to python-pycrypto that removes /usr/include
for the headers path, which is wrong when cross-compiling.

Fixes:

  http://autobuild.buildroot.org/results/5bf/5bf5e31c485a4ee8c0b0a5721205f0fed9b5ae5d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ycrypto-0001-remove-incorrect-header-path.patch |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/python-pycrypto/python-pycrypto-0001-remove-incorrect-header-path.patch b/package/python-pycrypto/python-pycrypto-0001-remove-incorrect-header-path.patch
new file mode 100644
index 0000000..9268d31
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto-0001-remove-incorrect-header-path.patch
@@ -0,0 +1,21 @@
+Do not use /usr/include for headers
+
+Using /usr/include is wrong when doing cross-compilation, so get rid
+of it, and rely on the compiler to use the appropriate default paths
+for headers.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -370,7 +370,7 @@
+       'ext_modules': plat_ext + [
+             # _fastmath (uses GNU mp library)
+             Extension("Crypto.PublicKey._fastmath",
+-                      include_dirs=['src/','/usr/include/'],
++                      include_dirs=['src/'],
+                       libraries=['gmp'],
+                       sources=["src/_fastmath.c"]),
+ 
