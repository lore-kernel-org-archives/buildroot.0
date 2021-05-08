From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat,  8 May 2021 18:24:19 -0400
Subject: [Buildroot] [PATCH 1/1] erlang: support builds when gcc __atomic_*
 exist
Message-ID: <20210508222419.586915-1-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While Erlang will use it's own atomic operations, it can also use gcc
__atomic_* builtins. This is now listed in Erlang's HOWTO/INSTALL.md.

This change was necessary on RISC-V, since Erlang didn't have a built-in
implementation, but it was able to use gcc's __atomic_* functions.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index ab87eab6ff..b6b100f38b 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -6,9 +6,11 @@ config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
 	# see HOWTO/INSTALL.md for Erlang's supported platforms
-	# when using its native atomic ops implementation
+	# when using its native atomic ops implementation or gcc's
+	# __atomic_* builtins
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
-		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel
+		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
+		BR2_TOOLCHAIN_HAS_ATOMIC
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-- 
2.25.1
