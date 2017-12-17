From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 17 Dec 2017 18:58:08 +0100
Subject: [Buildroot] [PATCH 9/9] rust-cargo: new virtual package
In-Reply-To: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
References: <20171217175808.31392-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171217175808.31392-10-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new host virtual package to provide Cargo, the package manager for
the Rust language.

Currently, two providers are available: host-cargo and host-cargo-bin.

Also remove host-cargo from menuconfig.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host            |  2 +-
 package/cargo/Config.in.host      |  8 --------
 package/rust-cargo/Config.in.host | 41 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 9 deletions(-)
 delete mode 100644 package/cargo/Config.in.host
 create mode 100644 package/rust-cargo/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9856..892e124722 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,7 +2,6 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
-	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cmake/Config.in.host"
@@ -48,6 +47,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/rustc/Config.in.host"
+	source "package/rust-cargo/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
diff --git a/package/cargo/Config.in.host b/package/cargo/Config.in.host
deleted file mode 100644
index 0f1ca305c6..0000000000
--- a/package/cargo/Config.in.host
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_HOST_CARGO
-	bool "host cargo"
-	depends on BR2_PACKAGE_HAS_HOST_RUSTC
-	help
-	  Cargo is the package manager for the Rust programming
-	  language.
-
-	  https://crates.io/
diff --git a/package/rust-cargo/Config.in.host b/package/rust-cargo/Config.in.host
new file mode 100644
index 0000000000..76929395d4
--- /dev/null
+++ b/package/rust-cargo/Config.in.host
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_HOST_RUST_CARGO
+	bool "host rust cargo"
+	depends on BR2_PACKAGE_HAS_HOST_RUSTC
+	help
+	  Cargo is the package manager for the Rust programming
+	  language.
+
+	  http://crates.io
+
+if BR2_PACKAGE_HOST_RUST_CARGO
+
+choice
+	prompt "Rust package manager variant"
+	default BR2_PACKAGE_HOST_CARGO
+	help
+	  Select a Rust package manager
+
+config BR2_PACKAGE_HOST_CARGO
+	bool "host cargo"
+	select BR2_PACKAGE_HAS_HOST_RUST_CARGO
+	help
+	  This package will build Cargo from source.
+
+config BR2_PACKAGE_HOST_CARGO_BIN
+	bool "host cargo (pre-built)"
+	select BR2_PACKAGE_HAS_HOST_RUST_CARGO
+	help
+	  This package will install a pre-built version of Cargo.
+
+endchoice
+
+config BR2_PACKAGE_HAS_HOST_RUST_CARGO
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_RUST_CARGO
+	string
+	default "host-cargo" if BR2_PACKAGE_HOST_CARGO
+	default "host-cargo-bin" if BR2_PACKAGE_HOST_CARGO_BIN
+
+endif
+
-- 
2.14.3
