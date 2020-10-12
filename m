From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:57:18 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/python-sentry-sdk: drop asyncio files for python 2.x to fix
 pycompile issue
Message-ID: <20201012084707.69D7F826D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5489b3a6c8c615ba06c1d5357ab584daba08e01b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

sentry-sdk has a set of optional "integrations", some of which use asyncio.

pycompile unfortunately errors out on these files when running under Python
2.x:

../scripts/pycompile.py ..
error:   File "/usr/lib/python2.7/site-packages/sentry_sdk/integrations/sanic.py", line 64
    async def sentry_handle_request(self, request, *args, **kwargs):
            ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable files from TARGET_DIR if building
for python 2.x.

Fixes:
http://autobuild.buildroot.net/results/9e4/9e47ee2a56153379e4e7bc839be5972a2302ba9f/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d62f0042e85c8a39608dc7ad6a491460791dfbfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-sentry-sdk/python-sentry-sdk.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index dd47e7c0c3..2dcf4bce06 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -11,4 +11,14 @@ PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_SENTRY_SDK_RM_PY3_FILES
+	rm -f $(addprefix $(TARGET_DIR)/usr/lib/python*/site-packages/sentry_sdk/integrations/,\
+		aiohttp.py asgi.py django/asgi.py sanic.py tornado.py)
+endef
+
+PYTHON_SENTRY_SDK_POST_INSTALL_TARGET_HOOKS += PYTHON_SENTRY_SDK_RM_PY3_FILES
+endif
+
 $(eval $(python-package))
