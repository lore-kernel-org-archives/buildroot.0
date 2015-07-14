From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jul 2015 16:03:39 +0200
Subject: [Buildroot] [PATCHv2] package/qpid-proton: needs host-python2
Message-ID: <1436882619-30664-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qpid-proton is using constructs that are not valid in python3.
qpid-proton is hardcoding calls to /usr/bin/python, which can be
whatever version.

So, fix the scripts to use '/usr/bin/env python' so it finds it in the
PATH, and add a dependency to host-python.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes v1 -> v2:
  - really use our python2  (Baruch)
  - no longer patch, it's not used  (Baruch)
---
 package/qpid-proton/qpid-proton.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index eae4589..12fddb4 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -11,12 +11,15 @@ QPID_PROTON_LICENSE = Apache-2.0
 QPID_PROTON_LICENSE_FILES = LICENSE
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
+	host-python \
 	util-linux \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
+
 QPID_PROTON_CONF_OPTS = \
 	-DBUILD_JAVA=OFF \
 	-DENABLE_VALGRIND=OFF \
-	-DENABLE_WARNING_ERROR=OFF
+	-DENABLE_WARNING_ERROR=OFF \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/usr/bin/python2
 
 define QPID_PROTON_REMOVE_USELESS_FILES
 	rm -fr $(TARGET_DIR)/usr/share/proton-*/
-- 
1.9.1
