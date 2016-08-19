From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Aug 2016 14:19:35 +0200
Subject: [Buildroot] [PATCH v2 2/3] tinycbor: fix issue on unnamed union
In-Reply-To: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
References: <1471609176-3397-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <1471609176-3397-2-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/f4d/f4d15afb44f471878dbdee7c67cd836bd2b79904

Until tinycbor 0.4 is released, patch from dev branch is needed to
remove the usage of unnamed union which are not supported by all
targets such as blackfin, more details can be found here:
https://patchwork.ozlabs.org/patch/652187/

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Update commit message

 package/tinycbor/tinycbor.hash | 1 +
 package/tinycbor/tinycbor.mk   | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 258e0e6..8757047 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	f70de1e6b7e3750abb4ceacf0059e47b47c769f113434de10293b33867ce54c2	tinycbor-v0.3.2.tar.gz
+sha256	7d3aa839ae246e9e14fc73e67869d88c684802c1578fb75503f3fdde1482dcf6	ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 1519680..6af2eef 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -9,6 +9,12 @@ TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
 
+# This patch fixes the issue on unnamed union which are not supported by some
+# targets like blackfin
+# This patch is currently in dev branch and will be a part of v0.4
+TINYCBOR_PATCH = \
+	https://github.com/01org/tinycbor/commit/ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
+
 TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
-- 
2.5.0
