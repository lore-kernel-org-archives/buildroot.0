From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2020 08:03:55 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/python-fire.mk:
 drop test_components_py3.py file for python 2.x to fix pyfile issue
Message-ID: <20201005060201.013188D696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89051f8f2157107b5f84a67398abbaf5a3623e7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
http://autobuild.buildroot.net/results/72e0cc78194a1b93bf26a50742e59a1e93bde1d1/

fire has conditional logic to load test_components_py3.py when running under
Python 3.x:

if six.PY3:
  from fire import test_components_py3 as py3

pycompile unfortunately errors out on it:

../scripts/pycompile.py ..

error:   File "/usr/lib/python2.7/site-packages/fire/test_components_py3.py", line 18
    def identity(arg1, arg2: int, arg3=10, arg4: int = 20, *arg5,
                           ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
building for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6bfedaf57798c12f0e6279b8361fd5ec4244db8c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-fire/python-fire.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 343abbca7d..f6a2e073f0 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -11,4 +11,13 @@ PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_FIRE_RM_PY3_FILE
+	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/fire/test_components_py3.py
+endef
+
+PYTHON_FIRE_POST_INSTALL_TARGET_HOOKS += PYTHON_FIRE_RM_PY3_FILE
+endif
+
 $(eval $(python-package))
