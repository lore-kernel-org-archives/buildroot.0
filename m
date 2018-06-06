From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Jun 2018 22:25:00 +0200
Subject: [Buildroot] [PATCH 1/2] host-cargo: select host-rustc
Message-ID: <20180606202501.14535-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot documentation specifies that cargo-based package should only
depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and selects
BR2_PACKAGE_HOST_CARGO but this does not work as host-cargo depends on
BR2_PACKAGE_HAS_HOST_RUSTC which is selected only when host-rustc is
selected.

So instead of having to select both cargo and rustc in each cargo-based
package, replace BR2_PACKAGE_HAS_HOST_RUSTC dependency by
BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and select
BR2_PACKAGE_HOST_RUSTC

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cargo/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
index 0f1ca305c6..c33c6851f2 100644
--- a/package/cargo/Config.in.host
+++ b/package/cargo/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_CARGO
 	bool "host cargo"
-	depends on BR2_PACKAGE_HAS_HOST_RUSTC
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  Cargo is the package manager for the Rust programming
 	  language.
-- 
2.14.1
