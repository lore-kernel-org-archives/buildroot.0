From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 23:13:53 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/rustc:
 RUSTC_TARGET_NAME is needed to build host-rust
Message-ID: <20200529210618.D9BDE91DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b38126275447e5196feeca65d7e9cc08b166715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

As reported on bugzilla [1], the host-rust package fail when
the target architecture or the target libc is not supported.

The error is the following:
failed to parse TOML configuration 'config.toml': expected a table key, found a right bracket at line 15

In such case BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is
not set thus RUSTC_TARGET_NAME is also not set [2].

But RUSTC_TARGET_NAME is needed to generate the file config.toml [3]

Add BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS in the host-rust
dependency.

The commit [4] that allowed to select host-rust when the target
architecture or the target libc is not supported, should have
allowed to select only host-rustc-bin.

Fixes:
Bug #12691

[1] https://bugs.busybox.net/show_bug.cgi?id=12691
[2] https://git.buildroot.net/buildroot/tree/package/rustc/rustc.mk?h=2020.05-rc1#n10
[3] https://git.buildroot.net/buildroot/tree/package/rust/rust.mk?h=2020.05-rc1#n41
[4] 025b863e6facb7b219b82ee6ee7a7916c2c3c47e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Sam Voss <sam.voss@gmail.com>
Reviewed-by: Sam Voss <sam.voss@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c051c65eee278e54a95ec0f5790e39f9af901c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rustc/Config.in.host | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index d595efbc6f..1df25ae326 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -49,6 +49,9 @@ choice
 
 config BR2_PACKAGE_HOST_RUST
 	bool "host rust"
+	# RUSTC_TARGET_NAME must be set for building host-rust
+	# otherwise config.toml is broken.
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	# triggers ICE on trunc_int_for_mode, at explow.c:56
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
 	help
