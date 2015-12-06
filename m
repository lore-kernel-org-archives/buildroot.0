From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 6 Dec 2015 16:10:04 +0100
Subject: [Buildroot] [PATCH] erlang: disable for sparc
Message-ID: <20151206151004.GA23217@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required atomic operations not available for sparc.
Fixes autobuild failures:
http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/erlang/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 0ec01bb..4719420 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -2,12 +2,14 @@ comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Erlang is a programming language used to build massively scalable
-- 
1.7.10.4
