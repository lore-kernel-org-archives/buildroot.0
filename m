From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Dec 2013 18:39:48 +0100
Subject: [Buildroot] [PATCH] package/python-pycrypto: fix legal-info
Message-ID: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The pycrypto package contains a LICENSE.orig file, but apply-patches.sh
removes all .orig file, so we can't list a .orig file asa license file,
as it would have disapeared by the time 'make legal-info' sould be called.

Add a post-extract hook that renames this license file, so it is renamed
just before we apply patches and remove .orig files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/python-pycrypto/python-pycrypto.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index eda48bd..f872ccc 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -11,7 +11,17 @@ PYTHON_PYCRYPTO_SETUP_TYPE = distutils
 
 PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
 PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
-		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
+		LEGAL/copy/LICENSE.python-2.2
+
+# The pycrypto package contains a LICENSE.orig file, but our patching
+# infrastrucure removes all .orig file, so we must rename that license
+# file prior to patching, so it is still available to the legal-info
+# infrastructure
+define PYTHON_PYCRYPTO_RENAME_LICENSE
+	mv $(@D)/LEGAL/copy/LICENSE.orig $(@D)/LEGAL/copy/LICENSE.original
+endef
+PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
+PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
 
 PYTHON_PYCRYPTO_DEPENDENCIES = gmp
 
-- 
1.8.1.2
