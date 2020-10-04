From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun,  4 Oct 2020 23:49:01 +0200
Subject: [Buildroot] [PATCH 1/2] python-socketio: drop asgi/asyncio files
 for python 2.x to fix pycompile issue
Message-ID: <20201004214903.32309-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/455f3e09a590f7a6724ab8cd1b86bdf2bba8071a/

socketio has conditional logic to load asgi/asyncio files when running under
Python 3.x:

if sys.version_info >= (3, 5):  # pragma: no cover
    from .asyncio_client import AsyncClient
    from .asyncio_server import AsyncServer
    from .asyncio_manager import AsyncManager
    from .asyncio_namespace import AsyncNamespace, AsyncClientNamespace
    from .asyncio_redis_manager import AsyncRedisManager
    from .asyncio_aiopika_manager import AsyncAioPikaManager
    from .asgi import ASGIApp
else:  # pragma: no cover
    AsyncClient = None
    AsyncServer = None
    AsyncManager = None
    AsyncNamespace = None
    AsyncRedisManager = None
    AsyncAioPikaManager = None

pycompile unfortunately errors out on these files when running under Python
2.x:

../scripts/pycompile.py ..
error:   File "/usr/lib/python2.7/site-packages/socketio/asyncio_server.py", line 84
    async def emit(self, event, data=None, to=None, room=None, skip_sid=None,
            ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable file from TARGET_DIR if building
for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-socketio/python-socketio.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index ece4f65b78..73dab26f3c 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -10,4 +10,14 @@ PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_SOCKETIO_RM_PY3_FILES
+	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asgi.py \
+		$(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asyncio_*.py
+endef
+
+PYTHON_SOCKETIO_POST_INSTALL_TARGET_HOOKS += PYTHON_SOCKETIO_RM_PY3_FILES
+endif
+
 $(eval $(python-package))
-- 
2.20.1
