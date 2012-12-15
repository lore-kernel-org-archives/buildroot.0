From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Dec 2012 18:29:38 +0100
Subject: [Buildroot] [PATCH 1/5] python: build host-python with MAKE1
In-Reply-To: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355592582-31374-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building host-python in parallel sometimes causes "Bus error" during
the installation step on our autobuilders, such as:

  http://autobuild.buildroot.org/results/04bcc907c5e075fe1f39d4f49dcc50ec93708eb4/build-end.log

Extensive testing on one autobuilder has shown that building
host-python with MAKE1 work arounds this strange problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

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
-- 
1.7.9.5
