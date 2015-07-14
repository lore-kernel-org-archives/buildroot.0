From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:31:50 +0200
Subject: [Buildroot] [git commit] package/uclibc: check for config file
Message-ID: <20150714083403.17091819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e20a60566fff38dcb09c4042c594be45318ff73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a check (before we call kconfig-package) that ensures the user has
set a kconfig-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
