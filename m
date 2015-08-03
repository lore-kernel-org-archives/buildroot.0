From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:20:42 +0200
Subject: [Buildroot] [git commit] package/libatomic_ops: fix compilation
	fail on sparc
Message-ID: <20150803092057.B7E9B7FD7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9741460eaaef510aac9b16a884374d545244fb18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/libatomic_ops.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
