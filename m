From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 15 Jan 2020 14:26:13 +0100
Subject: [Buildroot] [PATCH v2 5/9] package/ripgrep: depends on host-rustc
In-Reply-To: <20200115132617.26604-1-patrick.havelange@essensium.com>
References: <20200115132617.26604-1-patrick.havelange@essensium.com>
Message-ID: <20200115132617.26604-5-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

As all providers of rustc also install cargo, there is no need to depend
on the standalone cargo package anymore. Instead add host-rustc to the
dependency list.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Changes v1 -> v2:
  - ripgrep/Config.in still needs to select HOST_RUSTC
---
 package/ripgrep/Config.in  | 2 +-
 package/ripgrep/ripgrep.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
index 5446ad046c..0ea2902b34 100644
--- a/package/ripgrep/Config.in
+++ b/package/ripgrep/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_RIPGREP
 	bool "ripgrep"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_HOST_CARGO
+	select BR2_PACKAGE_HOST_RUSTC
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
2.17.1
