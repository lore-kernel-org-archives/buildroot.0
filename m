From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Mar 2012 23:38:17 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: add option to enable
	AI_ADDRCONFIG support in uclibc
In-Reply-To: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1331159898-25350-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages need ifaddr.h which is only included in uclibc if
UCLIBC_SUPPORT_AI_ADDRCONFIG is selected. Make this configurable
as a buildroot option so that those packages can select it.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 toolchain/toolchain-buildroot/Config.in.2 |    7 +++++++
 toolchain/uClibc/uclibc.mk                |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 7f2f68f..700d728 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -25,6 +25,13 @@ config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 	  Enable this option if you want your toolchain to support
 	  RPC (needed for NFS, for example).
 
+config BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG
+	bool "Enable AI ADDRCONFIG support"
+	help
+	  Enable this option if you want your toolchain to support
+	  the AI_ADDRCONFIG flag to query interfaces to find both
+	  ipv4 and ipv6 support.
+
 config BR2_TOOLCHAIN_BUILDROOT_WCHAR
 	bool "Enable WCHAR support"
 	select BR2_USE_WCHAR
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index ee474bb..638f918 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -259,6 +259,13 @@ else
 		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g' \
 		$(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG),y)
+	$(SED) 's,^.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*,UCLIBC_SUPPORT_AI_ADDRCONFIG=y,g' $(UCLIBC_DIR)/.oldconfig
+else
+	$(SED) 's,.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*,UCLIBC_SUPPORT_AI_ADDRCONFIG=n,g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*/d' $(UCLIBC_DIR)/.oldconfig
+	echo "# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
 		-e 's,^[^_]*HAS_FPU.*,HAS_FPU=n,g' \
-- 
1.7.5.4
