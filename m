From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Apr 2020 09:21:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/sg3_utils: link with libatomic when
 needed
Message-ID: <20200426072116.1594619-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sg3_utils uses __atomic_fetch_add_4 since version 1.45 and
https://github.com/hreinecke/sg3_utils/commit/e9445f4efc012d37809342ba21f16360a0208f06

Fixes:
 - http://autobuild.buildroot.org/results/7773ead32375ca9073f45db83dac299aa2edd619

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sg3_utils/sg3_utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 4685169e39..11b3691ffc 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -20,6 +20,11 @@ SG3_UTILS_AUTORECONF = YES
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SG3_UTILS_CONF_ENV += LIBS="-latomic"
+endif
+
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
 define SG3_UTILS_REMOVE_PROGS
 	for prog in \
-- 
2.25.1
