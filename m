From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:57 +0100
Subject: [Buildroot] [RFC PATCH 5/7] package/ripgrep: depends on host-rustc
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As all providers of rustc also install cargo, there is no need to depend
on the standalone cargo package anymore. Instead add host-rustc to the
dependency list.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/ripgrep/Config.in  | 1 -
 package/ripgrep/ripgrep.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
index 5446ad046c..686ad45d3d 100644
--- a/package/ripgrep/Config.in
+++ b/package/ripgrep/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RIPGREP
 	bool "ripgrep"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_HOST_CARGO
 	help
 	  ripgrep is a line-oriented search tool that
 	  recursively searches your current directory
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 0bb7017a96..832c076f26 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -9,7 +9,7 @@ RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 
-RIPGREP_DEPENDENCIES = host-cargo
+RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 
-- 
2.21.0
