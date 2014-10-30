From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:39:38 +0100
Subject: [Buildroot] [git commit] lame: Disable debug symbols for Aarch64
	and MIPS
Message-ID: <20141030213943.04DE9B23C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71fcdaca723d64b1bae81ba5b6704ddefbbd3e62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building lame with debug symbols needs the following macros to be
defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
So, if BR2_ENABLE_DEBUG is selected, then we have to force lame to be
built without debug symbols for Aarch64 and MIPS because these
architectures don't have those macros defined.

Fixes:
	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
