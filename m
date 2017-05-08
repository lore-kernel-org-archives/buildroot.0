From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 May 2017 21:45:50 +0200
Subject: [Buildroot] [PATCH v2 4/4] mpir: fix build on powerpc64le
In-Reply-To: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1494272750-20723-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The optimized powerpc64 code is not compatible with powerpc64le, so use
the generic MPIR code on powerpc64le.

Fixes:

   http://autobuild.buildroot.net/results/17e523be894b60d7a9b2a3303f02c3fb34816828/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4
