From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:31:59 +0200
Subject: [Buildroot] [git commit branch/next] python-pexpect: fix
	byte-compilation with Python 2
Message-ID: <20160522193223.027F4807E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=944d0a95454306a000e604388014eebf7a6affc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pexpect contains one file, async.py, that is only meant to be used
with Python 3. Due to this, it fails to byte-compile with Python 2,
which will become a problem once we make byte-compilation failures
fatal failures that abort the build.

As suggested by upstream at
https://github.com/pexpect/pexpect/issues/290, we simply remove the
problematic file when building with Python 2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pexpect/python-pexpect.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index b74bf83..40a1741 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -11,4 +11,14 @@ PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
 PYTHON_PEXPECT_SETUP_TYPE = distutils
 
+# async.py is not usable with Python 2, and removing is the solution
+# recommended by upstream:
+# https://github.com/pexpect/pexpect/issues/290
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define PYTHON_PEXPECT_REMOVE_ASYNC_PY
+	$(RM) $(@D)/pexpect/async.py
+endef
+PYTHON_PEXPECT_POST_PATCH_HOOKS += PYTHON_PEXPECT_REMOVE_ASYNC_PY
+endif
+
 $(eval $(python-package))
