From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 30 Oct 2014 10:05:41 +0000
Subject: [Buildroot] [PATCH v3] lame: Disable debug symbols for Aarch64 and
	MIPS
Message-ID: <1414663541-36385-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building lame with debug symbols needs the following macros to be
defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
So, if BR2_ENABLE_DEBUG is selected, then we have to force lame to be
built without debug symbols for Aarch64 and MIPS because these
architectures don't have those macros defined.

Fixes:
	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes since v2:
- Amend the commit message and the comment in the lame.mk file.

Changes since v1:
- Bild lame without debug symbols instead of disabling it. Doing this we 
  avoid propagating dependencies to the packages which select lame.

 package/lame/lame.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index dcd155f..c179cef 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -14,6 +14,15 @@ LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPLv2+
 LAME_LICENSE_FILES = COPYING
 
+# Building lame with debug symbols needs the following macros to be
+# defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
+# So, if BR2_ENABLE_DEBUG is selected, then we have force lame to be
+# built without debug symbols for Aarch64 and MIPS because these
+# architectures don't have those macros defined.
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),yy)
+LAME_CONF_OPTS += --disable-debug
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
 LAME_CONF_OPTS += --with-fileio=sndfile
-- 
1.7.1
