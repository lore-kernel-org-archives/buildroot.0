From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 16:59:37 +0100
Subject: [Buildroot] [git commit] python-m2crypto: different fix for the
	OpenSSL problem
Message-ID: <20151212155941.93666809A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=539eabe59451dc7ae051c6b36b90770567b9f0dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

m2crypto provides a --openssl option to specify the location of the
OpenSSL library, when not installed in /usr. However, this option does
not apply to the standard "build" command normally called by the
python-package infrastructure, but only to the "build_ext" command.

This already required to override the default python-package build
commands for this package. Moreover, this the last bump to version
0.22.5, things got even more complicated since calling just
"build_ext" does not work, and additional quirks are needed.

This commit proposes to get away with this by relying on the default
python-package behavior, and simply hardcoding the OpenSSL location by
patching the setup.py script in a post-patch hook.

This issue has also been reported upstream at
https://gitlab.com/m2crypto/m2crypto/issues/89.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-m2crypto/python-m2crypto.mk | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 1f038e3..0416957 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -13,20 +13,16 @@ HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
 # We need to use python2 because m2crypto is not python3 compliant.
 HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
 
-HOST_PYTHON_M2CRYPTO_BUILD_DIR = $(@D)/build/lib.linux-$(HOSTARCH)-$(PYTHON_VERSION_MAJOR)
-
-# * We need to override the build commands to be able to use build_ext,
-#   which accepts the --openssl option.
-# * Use python2 interpreter to avoid trying building some python3 objects.
-# * because build_ext is flawed, is forgets to copy the files prior to
-#   the build, so we do it manually.
-define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
-	mkdir -p $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)
-	cp -av $(@D)/M2Crypto $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)/M2Crypto
-	(cd $(@D); \
-		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
-		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
-			--openssl=$(HOST_DIR)/usr)
+# The --openssl option that allows to specify a custom path to OpenSSL
+# can only be used with the non-default build_ext setup.py command,
+# and calling this command directly fails. To work around this, simply
+# hardcode the path to OpenSSL in setup.py.
+# Bug reported at https://gitlab.com/m2crypto/m2crypto/issues/89
+define HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
+	$(SED) "s%self.openssl = '/usr'%self.openssl = '$(HOST_DIR)/usr'%" \
+		$(@D)/setup.py
 endef
 
+HOST_PYTHON_M2CRYPTO_POST_PATCH_HOOKS += HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
+
 $(eval $(host-python-package))
