From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:45 +0200
Subject: [Buildroot] [PATCH 12/17] package/pkg-generic.mk: Create CPE ID
 information only if verified
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-13-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CPE ID are created automatically based on the information provided
by the buildroot package. However, it may not match the official
cpeid. To be able to know if it can be trusted, only generate this CPE
ID when a CPE_ID_VALID flag has been added to the package.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dba03a8119..55084bc7d9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -970,6 +970,7 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+ifeq  ($$($(2)_CPE_ID_VALID),y)
 $(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
 $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
 $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
@@ -981,6 +982,7 @@ $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
 else
 $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
 endif
+endif
 
 $(1)-cpe-info: PKG=$(2)
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-- 
2.28.0
