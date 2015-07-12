From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:29 +0200
Subject: [Buildroot] [PATCH 7/7] package/uclibc: check for config file
	before calling kconfig-package
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <62fed5cb399404addb30c60c3dc128f46333c9ec.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/uclibc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ecbfa11..7dee6b3 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -474,4 +474,10 @@ define UCLIBC_INSTALL_STAGING_CMDS
 	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING)$(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
+$(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG setting)
+endif
+
 $(eval $(kconfig-package))
-- 
1.9.1
