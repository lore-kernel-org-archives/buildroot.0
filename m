From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:58:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/python-txtorcon.mk: drop _py3 file for python 2.x to fix pycompile
 issue
Message-ID: <20201002085245.6EB628E84A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3921cdc3a530413ae9f2896b7109b0816548472a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
http://autobuild.buildroot.net/results/76b580000e6311e88584874f942517badd6fadf6/

python-txtorcon DOES support python 2.x, but it contains some optional
python 3 / async code in controller_py3.py which is conditionally used from
controller.py:

try:
    from .controller_py3 import _AsyncOnionAuthContext
    HAVE_ASYNC = True
except Exception:
    HAVE_ASYNC = False

pycompile unfortunately errors out on the async code:

../scripts/pycompile.py ..
error:   File "/usr/lib/python2.7/site-packages/txtorcon/controller_py3.py", line 13
    async def __aenter__(self):
            ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
building for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6728c67307858a103456a05a3daaddbbb49dba36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-txtorcon/python-txtorcon.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index a01c0b2511..4df400c3e7 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -11,4 +11,13 @@ PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_TXTORCON_RM_PY3_FILE
+	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/txtorcon/controller_py3.py
+endef
+
+PYTHON_TXTORCON_POST_INSTALL_TARGET_HOOKS += PYTHON_TXTORCON_RM_PY3_FILE
+endif
+
 $(eval $(python-package))
