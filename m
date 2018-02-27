From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 13:43:34 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] erlang: enable
 host-erlang for x86/x86_64 architectures only
Message-ID: <20180227124506.C481A81285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0edec09c322744ce1820337487e9bcb9cbcf7ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

And make erlang depends on host-erlang.
This patch aims at avoiding the following autobuilder failures:
http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1
http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 11b5afd6d87faf5c1190366e17fadd239f3ebbaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 1cd93ca955..d60eca989b 100644
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
