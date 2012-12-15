From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 19:06:29 +0100
Subject: [Buildroot] [git commit] python: build host-python with MAKE1
Message-ID: <20121215201828.D1FB69A1F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e7b07b4d513dc481b5a0a8c49180f2824fcc967
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building host-python in parallel sometimes causes "Bus error" during
the installation step on our autobuilders, such as:

  http://autobuild.buildroot.org/results/04bcc907c5e075fe1f39d4f49dcc50ec93708eb4/build-end.log

Extensive testing on one autobuilder has shown that building
host-python with MAKE1 work arounds this strange problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 6e960cd..71591b7 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -39,6 +39,14 @@ HOST_PYTHON_MAKE_ENV = \
 
 HOST_PYTHON_AUTORECONF = YES
 
+# Building host python in parallel sometimes triggers a "Bus error"
+# during the execution of "./python setup.py build" in the
+# installation step. It is probably due to the installation of a
+# shared library taking place in parallel to the execution of
+# ./python, causing spurious Bus error. Building host-python with
+# MAKE1 has shown to workaround the problem.
+HOST_PYTHON_MAKE = $(MAKE1)
+
 PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
