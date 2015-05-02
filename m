From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 23:16:37 +0200
Subject: [Buildroot] [PATCH] toolchain/external: better report RPC error for
	custom toolchains
Message-ID: <1430601397-2268-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we instruct users to enable/disable BR2_TOOLCHAIN_HAS_NATIVE_RPC
but that is a blind option. The only option users can set/unset is
BR2_TOOLCHAIN_EXTERNAL_INET_RPC.

Use that in the error message.

Notes: the only way for this message to appear is for a custom external
toolchain, either downloaded or pre-installed, so even though we check
the vailidity of the toolchain with BR2_TOOLCHAIN_HAS_NATIVE_RPC, we do
report on BR2_TOOLCHAIN_EXTERNAL_INET_RPC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index cb3b61a..30eb065 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -197,11 +197,11 @@ check_glibc_feature = \
 check_glibc_rpc_feature = \
 	IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
-		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_EXTERNAL_INET_RPC" ; \
 		exit 1 ; \
 	fi ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
-		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
+		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC" ; \
 		exit 1 ; \
 	fi
 
-- 
1.9.1
