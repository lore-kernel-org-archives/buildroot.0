From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Feb 2018 17:58:38 +0100
Subject: [Buildroot] [PATCH v2] erlang: enable host-erlang for x86/x86_64
 architectures only
Message-ID: <20180226165838.9793-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And make erlang depends on host-erlang.
This patch aims at avoiding the following autobuilder failures:
http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1
http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v1 -> v2:
  - Add references to autobuilder failures (suggested by Baruch Siach).
---
 package/erlang/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 96af5516fd..bf745555e8 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,9 +1,16 @@
+config BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "x86"
+
 config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	bool
 	# see HOWTO/INSTALL.md for Erlang's supported platforms
 	# when using its native atomic ops implementation
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
 		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel
+	# erlang needs host-erlang
+	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
 comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU # fork()
-- 
2.14.1
