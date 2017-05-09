From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:04:20 +0200
Subject: [Buildroot] [git commit] mpir: fix build on powerpc64le
Message-ID: <20170509151441.554688285A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1d1879abaa4f5c7c9c8f0d7304ebb683dc9c679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The optimized powerpc64 code is not compatible with powerpc64le, so use
the generic MPIR code on powerpc64le.

Fixes:

   http://autobuild.buildroot.net/results/17e523be894b60d7a9b2a3303f02c3fb34816828/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpir/mpir.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 03f21d8..697e838 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -31,4 +31,9 @@ ifeq ($(BR2_mips_32r6)$(BR2_mips_64r6),y)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+# Optimized powerpc64 code is not suitable for powerpc64le
+ifeq ($(BR2_powerpc64le),y)
+MPIR_CONF_ENV += MPN_PATH="generic"
+endif
+
 $(eval $(autotools-package))
