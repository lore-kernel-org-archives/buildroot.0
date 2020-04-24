From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 Apr 2020 16:47:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 20.4.3
Message-ID: <20200424224752.63673-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autobahn recently added a feature called xbr which we don't support,
let's remove this before building autobahn.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash |  4 ++--
 package/python-autobahn/python-autobahn.mk   | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index a49de07b70..a5aa2a5a7d 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  9702594ee1c5613e9bb31af105140b5b  autobahn-20.4.2.tar.gz
-sha256  1c943f94bb759c07445a6984a3bc4c76f73e2a90a1fc2c3521c211579b73d3db  autobahn-20.4.2.tar.gz
+md5  dcae3cf26203aa4bbd9912137e5c9512  autobahn-20.4.3.tar.gz
+sha256  c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f  autobahn-20.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index d4e52352f2..dc9290b1cd 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,11 +4,23 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 20.4.2
+PYTHON_AUTOBAHN_VERSION = 20.4.3
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/13/0e/b182b46ea437e59003de78c68bb00824d304dcfe58e7235f29c4f275eca0
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/cb/16/38d27874ef827974f44acb6dd64a92a9248b624734c0e84b91083c2d9350
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
 
+define PYTHON_AUTOBAHN_REMOVE_XBR
+	rm -rf $(@D)/autobahn/xbr
+	rm -f $(@D)/autobahn/asyncio/xbr.py
+	rm -f $(@D)/autobahn/twisted/xbr.py
+	sed -i -e "/'autobahn\.xbr',/d" $(@D)/setup.py
+	sed -i -e "/'xbr': \['\.\/xbr\/contracts\/\*\.json'\],/d" $(@D)/setup.py
+	sed -i -e '/"xbrnetwork = autobahn\.xbr\._cli:_main",/d' $(@D)/setup.py
+	sed -i -e '/xbr/d' $(@D)/MANIFEST.in
+endef
+
+PYTHON_AUTOBAHN_POST_EXTRACT_HOOKS = PYTHON_AUTOBAHN_REMOVE_XBR
+
 $(eval $(python-package))
-- 
2.20.1
