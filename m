Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29390C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 21:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E952283BD8;
	Fri,  1 Mar 2024 21:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MH9Ht4x06CDF; Fri,  1 Mar 2024 21:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C41E83BD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C41E83BD3;
	Fri,  1 Mar 2024 21:04:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 112C61BF990
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2006041F2D
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlKWv-mJjIu1 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C5341FB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C5341FB1
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3781D87E24; Fri,  1 Mar 2024 21:04:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 22:02:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9002b818be9128a6751766a180af7cd284aa7704
X-Git-Newrev: 2bfad952c374258e37ffdf46a2c450d860640e11
X-Patchwork-Hint: ignore
Message-Id: <20240301210411.3781D87E24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: add
 BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bfad952c374258e37ffdf46a2c450d860640e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit ea45b95c0e54866134c63e88e60489a012b3d134:

In file included from third_party/boringssl-with-bazel/src/include/openssl/base.h:78,
                 from third_party/boringssl-with-bazel/src/include/openssl/ssl.h:145,
                 from ./src/core/tsi/ssl/key_logging/ssl_key_logging.h:23,
                 from ./src/core/lib/security/security_connector/ssl_utils.h:42,
                 from ./src/core/lib/security/credentials/tls/grpc_tls_certificate_distributor.h:36,
                 from ./src/core/ext/xds/certificate_provider_store.h:44,
                 from src/core/ext/xds/certificate_provider_store.cc:21:
third_party/boringssl-with-bazel/src/include/openssl/target.h:62:2: error: #error "Unknown target CPU"
   62 | #error "Unknown target CPU"
      |  ^~~~~

Fixes: ea45b95c0e54866134c63e88e60489a012b3d134
 - http://autobuild.buildroot.org/results/36686aca1b45f0bf692a60e67a48424b561930a3
 - http://autobuild.buildroot.org/results/4f79c7b1b2fc3306f300ae3ec0aa4439725814c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-grpc-requests/Config.in     |  3 +++
 package/python-grpcio-reflection/Config.in |  2 ++
 package/python-grpcio/Config.in            | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 3a2740f0f7..1cdd0d3f67 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
@@ -12,4 +13,6 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	  https://github.com/wesky93/grpc_requests
 
 comment "python-grpcio-requests needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index afe8988165..a0ca35c286 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
@@ -9,4 +10,5 @@ config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	  https://grpc.io
 
 comment "python-grpcio-reflection needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 5242eb461e..9657ccb6ed 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
+	bool
+	# see third_party/boringssl-with-bazel/src/include/openssl/target.h
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_riscv
+
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  HTTP/2-based RPC framework.
@@ -7,4 +17,5 @@ config BR2_PACKAGE_PYTHON_GRPCIO
 	  https://grpc.io
 
 comment "python-grpcio needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
