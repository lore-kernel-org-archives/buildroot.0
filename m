From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jul 2016 15:44:54 +0200
Subject: [Buildroot] [PATCH] package/alljoyn: needs BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1468676694-14108-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After applying a patch like [1], the build failed with the following
error:
liballjoyn_c.a(Message.o): In function `alljoyn_message_destroy':
Message.cc:(.text+0x74): undefined reference to `__sync_sub_and_fetch_4'
liballjoyn.so: undefined reference to `__sync_bool_compare_and_swap_4'
liballjoyn.so: undefined reference to `__sync_add_and_fetch_4'

So, add dependency on BR2_TOOLCHAIN_HAS_SYNC_4 which also disable the
alljoyn build on sparc.

[1] https://git.buildroot.org/buildroot/commit/?id=c5e96d8935016456bea342db170ae6a139a8470f

Fixes:
http://autobuild.buildroot.net/results/cea/cea62a7ed7f1eda6f817d8e27fd645942def25ec

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alljoyn/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/alljoyn/Config.in b/package/alljoyn/Config.in
index 021a07b..6eb417d 100644
--- a/package/alljoyn/Config.in
+++ b/package/alljoyn/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ALLJOYN
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCAP
@@ -19,5 +20,6 @@ config BR2_PACKAGE_ALLJOYN
 
 comment "alljoyn needs a toolchain w/ C++, threads, wchar and dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
-- 
2.5.5
