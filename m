From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Oct 2016 19:59:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] openzwave: fix compilation of MinOZW
Message-ID: <1477245551-46216-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
libraries. However, as it was unset by default, the cross-compilation
could fail if the host had a library such as libnss3.so in /.
To fix this issue, this patch sets LIBDIR to top_buildir if it is unset

Fixes:
  http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Download patch from upstream

 package/openzwave/openzwave.hash | 1 +
 package/openzwave/openzwave.mk   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index cd1231f..d07961e 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238	openzwave-V1.5.tar.gz
+sha256	98851964fd8de3dd40f00d0032b47c61c17a4cf789ad5792e14149da5ab8755e	599e2a11c6f48dde744012ec45686c08e15f3059.patch
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 2723086..199d9e1 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -13,6 +13,12 @@ OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 OPENZWAVE_DEPENDENCIES = host-pkgconf udev
 OPENZWAVE_INSTALL_STAGING = YES
 
+# This patch fixes incorrect default value of LIBDIR:
+# http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
+# This patch is currently in dev branch and will be a part of v1.6
+OPENZWAVE_PATCH = \
+	https://github.com/OpenZWave/open-zwave/commit/599e2a11c6f48dde744012ec45686c08e15f3059.patch
+
 # Set instlibdir to install libopenzwave.so* in the correct directory
 # otherwise openzwave will check that /lib64 exists (on the host) to
 # know if the library should be installed in $(PREFIX)/lib or $(PREFIX)/lib64.
-- 
2.5.0
