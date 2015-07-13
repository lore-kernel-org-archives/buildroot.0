From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:32:04 +0200
Subject: [Buildroot] [PATCH 7/7 v2] package/uclibc: check for config file
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <a3dfb23b0341c6a442dfe5f06aef393d2a0f4ecc.1436783490.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a check (before we call kconfig-package) that ensures the user has
set a kconfig-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - use BR_BUILDING in its own ifeq, do not coalesce with the existing
    ifeq
  - fix commit log  (Baruch)
---
 package/uclibc/uclibc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ecbfa11..3aceae3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -474,4 +474,12 @@ define UCLIBC_INSTALL_STAGING_CMDS
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_UCLIBC_CONFIG)),)
+$(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG setting)
+endif
+endif
+
 $(eval $(kconfig-package))
-- 
1.9.1
