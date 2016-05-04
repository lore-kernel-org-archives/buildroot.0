From: Martin Bark <martin@barkynet.com>
Date: Wed,  4 May 2016 15:17:54 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ca-certificates: depend on
	host-python or host-python3
Message-ID: <1462371474-27987-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ca-certificates Makefile directly calls python but if python3 has been
selected then it is possible for $(HOST_DIR)/usr/bin/python to not exist
in the PATH at the time ca-certificates is built.  This means the Makefile
will use python installed on the build host. If the build hosts python is
less than python 2.7 then the build will fail.

ca-certificates will build using host-python3. Fix the issue by depending
on host-python3 if python3 is being used otherwise depend on host-python.

This fixes:
 http://autobuild.buildroot.net/results/a2a4fed293c836b9cf63ff2aaa463b0704dec07e/
 http://autobuild.buildroot.net/results/bbed4afa8e30382b8892062f31ba64cbb0ea14e4/
 http://autobuild.buildroot.net/results/1af5562be3c0d233cea81834a898f7ac6ae48271/

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2
 - Depend on host-python or host-python3 instead of directly calling
   $(HOST_DIR)/usr/bin/python2 (Suggested by Arnout Vandecappelle)
 - Added comments to ca-certificates.mk (Suggested by Arnout Vandecappelle)
---
 package/ca-certificates/ca-certificates.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index da1b70d..393c8cd 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,11 @@
 CA_CERTIFICATES_VERSION = 20160104
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20160104T220912Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
+CA_CERTIFICATES_DEPENDENCIES = host-openssl
+# ca-certificates can be built with either python 2 or python 3
+# but it must be at least python 2.7
+CA_CERTIFICATES_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
-- 
2.8.0
