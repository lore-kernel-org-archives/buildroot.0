From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  4 Oct 2020 23:49:02 +0200
Subject: [Buildroot] [PATCH 2/2] python-engineio: drop asyncio files for
 python 2.x to fix pycompile issue
In-Reply-To: <20201004214903.32309-1-peter@korsgaard.com>
References: <20201004214903.32309-1-peter@korsgaard.com>
Message-ID: <20201004214903.32309-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/72c/72cfdffeb4d0fb7c3032b52f0a26a4758eea6762/

engineio has conditional logic to load asyncio files when running under
Python 3.x:

if sys.version_info >= (3, 5):  # pragma: no cover
    from .asyncio_server import AsyncServer
    from .asyncio_client import AsyncClient
    from .async_drivers.asgi import ASGIApp
    try:
        from .async_drivers.tornado import get_tornado_handler
    except ImportError:
        get_tornado_handler = None
else:  # pragma: no cover
    AsyncServer = None
    AsyncClient = None
    get_tornado_handler = None
    ASGIApp = None

pycompile unfortunately errors out on these files when running under Python
2.x:

../scripts/pycompile.py ..
error:   File "/usr/lib/python2.7/site-packages/engineio/asyncio_socket.py", line 13
    async def poll(self):
            ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable file from TARGET_DIR if building
for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-engineio/python-engineio.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 36ca326877..d0e073fa95 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -10,4 +10,14 @@ PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_ENGINEIO_RM_PY3_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/engineio/async_drivers \
+		$(TARGET_DIR)/usr/lib/python*/site-packages/engineio/asyncio_*.py
+endef
+
+PYTHON_ENGINEIO_POST_INSTALL_TARGET_HOOKS += PYTHON_ENGINEIO_RM_PY3_FILES
+endif
+
 $(eval $(python-package))
-- 
2.20.1
