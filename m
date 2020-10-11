From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 23:10:56 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-autobahn:
 drop asyncio files for python 2.x to fix pycompile issu
Message-ID: <20201011210131.2F0B98EB9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74aed8308047b1048e5725c4de5857f566c0cb8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/234/234913f86da45df0708bbe3bf7361169e2398c9f

Autobahn contains optional logic using asyncio, which causes pycompile
issues when running in python 2.x:

pycompile.py --strip-root /srv/storage/autobuild/run/instance-1/output-1/target /srv/storage/autobuild/run/instance-1/output-1/target/usr/lib/python2.7
error:   File "/usr/lib/python2.7/site-packages/autobahn/xbr/_blockchain.py", line 97
    async def get_market_status(self, market_id):
            ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable files from TARGET_DIR if building
for python 2.x.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-autobahn/python-autobahn.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 6c5c608b9a..4b367177a6 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -11,4 +11,15 @@ PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_AUTOBAHN_RM_PY3_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/autobahn/asyncio \
+		$(TARGET_DIR)/usr/lib/python*/site-packages/autobahn/xbr \
+		$(TARGET_DIR)/usr/lib/python*/site-packages/autobahn/twisted/xbr.py
+endef
+
+PYTHON_AUTOBAHN_POST_INSTALL_TARGET_HOOKS += PYTHON_AUTOBAHN_RM_PY3_FILES
+endif
+
 $(eval $(python-package))
