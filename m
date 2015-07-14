From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 16:10:03 +0200
Subject: [Buildroot] [git commit] package/qpid-proton: needs host-python2
Message-ID: <20150714141108.20EF981D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d3472d8dec088e2186e83991cb9f34fdca0138
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qpid-proton is using constructs that are not valid in python3, so we
must use a host python2 interpreter. To make this happen this commit
adds a dependency on host-python and explicitly tells CMake to use
$(HOST_DIR)/usr/bin/python2.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qpid-proton/qpid-proton.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
