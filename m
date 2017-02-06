From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Feb 2017 22:49:44 +0100
Subject: [Buildroot] [git commit] python-gunicorn: fix build issue with
	python2
Message-ID: <20170206215559.6259882140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b76356bd2e7ae06cc8b5341d2e90fceb42727f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix:
    http://autobuild.buildroot.org/results/b2d/b2d43dd3c52cc9f586009a10a40f97b07548322d/build-end.log

The issue arise from the fact that we compile all *.py files, but the
_gaiohttp.py file is using Python3 ("yield from") syntax which causes an
error.

So if we are using Python2, delete this file as it won't ever be imported
anyway as it is checked by gunicorn in the __init__.py file of the worker
module.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-gunicorn/python-gunicorn.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index 426e809..cfb7da1 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -11,4 +11,16 @@ PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
 
+# At the end of the build, we try to compile all py files using the host python
+# that has been built.
+# The GAIO HTTP Worker is only compatible with Python3.4.2 and up. So don't try
+# to compile it with python 2.x
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define PYTHON_GUNICORN_REMOVE_GAIO_WORKER
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
+		-name "_gaiohttp.py" -exec rm -f {} \;
+endef
+PYTHON_GUNICORN_POST_INSTALL_TARGET_HOOKS += PYTHON_GUNICORN_REMOVE_GAIO_WORKER
+endif
+
 $(eval $(python-package))
