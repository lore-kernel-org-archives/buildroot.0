From: Brendan Heading <brendanheading@gmail.com>
Date: Sun,  2 Aug 2015 22:43:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libatomic_ops - fix compilation
	fail on sparc
Message-ID: <1438551830-3619-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/6d8/6d83fa5d69572cec5c96be4b7651f9b113a1a19c/

libatomic_ops by default requires SPARC v9. buildroot's two supported
sparc arches (SPARCv8, and leon3) are both SPARCv8-based. Unfortunately
libatomic_ops's support for SPARCv8 is incomplete.

The library includes fallbacks but these must expressly be enabled by
defining a macro, enabled by this patch. Note that I'm testing for the
SPARC variants rather than BR2_sparc, in case someone implements SPARCv9
support in the future.

Discussion of this workaround described by the maintainer here :
https://github.com/ivmai/libatomic_ops/issues/9

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/libatomic_ops/libatomic_ops.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 5f698c4..fd45726 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -19,5 +19,9 @@ LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
 
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+LIBATOMIC_OPS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.4.3
