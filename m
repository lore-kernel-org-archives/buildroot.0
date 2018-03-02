From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  2 Mar 2018 08:49:29 +0100
Subject: [Buildroot] [PATCH] mono: only available for x86/x86-64 host
 architectures
Message-ID: <20180302074929.21404-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

http://autobuild.buildroot.net/results/3cab7b54390feb5f952407f1e7fa49b9633a5f76/
http://autobuild.buildroot.net/results/ad9fc1f8a598d2c1ee7e6f8884f897f7b8bbb657/

And many others.

Mono needs host-mono, which fails to build on the ppc64le autobuilder.
There is unlikely to be any real use cases of people building mono on !x86,
so only make it available on x86/x86-64 hosts, similar to how it was
recently done for erlang.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mono/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index d45ad376fe..d162237086 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,5 +1,11 @@
+config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "x86"
+
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
+	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
 		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
 
-- 
2.11.0
