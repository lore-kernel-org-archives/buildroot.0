From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:38:43 +0100
Subject: [Buildroot] [git commit] lcdapi: fix build error for m68k/coldfire
Message-ID: <20170214193921.DDBCB807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42032213968f203bc4099384e4945e6da8fb7ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/d47/d47fa41aa860d82471b83ac90967d3a3dacd8611/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcdapi/lcdapi.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 5d8c2ee..7539042 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -11,6 +11,12 @@ LCDAPI_LICENSE_FILES = COPYING
 LCDAPI_AUTORECONF = YES
 LCDAPI_INSTALL_STAGING = YES
 
+# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
+ifeq ($(BR2_m68k_cf),y)
+LCDAPI_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
+endif
+
 define LCDAPI_CREATE_M4_DIR
 	mkdir -p $(@D)/m4
 endef
