Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22ECC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CE84400C1;
	Wed, 10 Jan 2024 20:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CE84400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4dfPUOrXZNB; Wed, 10 Jan 2024 20:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 756DA437D2;
	Wed, 10 Jan 2024 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756DA437D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E161BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81594436D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81594436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw3p7t7pkdBF for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94A6F400C1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94A6F400C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8279985DB3; Wed, 10 Jan 2024 20:49:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:24:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ea38660e01a87ab70c02e38c78a49202e8e5c21
X-Git-Newrev: d702ac5844fb99d5ddc5c1a00d2ec5f83af9d034
X-Patchwork-Hint: ignore
Message-Id: <20240110204909.8279985DB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: needs C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d702ac5844fb99d5ddc5c1a00d2ec5f83af9d034
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit ea45b95c0e54866134c63e88e60489a012b3d134:

/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py:40: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
  import pkg_resources
Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 289, in <module>
    if check_linker_need_libatomic():
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 223, in check_linker_need_libatomic
    cpp_test = subprocess.Popen(
               ^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1026, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1950, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'no'

Fixes:
 - http://autobuild.buildroot.org/results/58ac25b4e426712269c5fc144121c955b714c760

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-grpc-requests/Config.in     | 4 ++++
 package/python-grpcio-reflection/Config.in | 4 ++++
 package/python-grpcio/Config.in            | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 3c266e5976..3a2740f0f7 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
@@ -9,3 +10,6 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	  grpc for Humans. grpc reflection support client.
 
 	  https://github.com/wesky93/grpc_requests
+
+comment "python-grpcio-requests needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index d2ee039c5f..afe8988165 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
+	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  Standard Protobuf Reflection Service for gRPC.
 
 	  https://grpc.io
+
+comment "python-grpcio-reflection needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index e63ac2ae34..5242eb461e 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  HTTP/2-based RPC framework.
 
 	  https://grpc.io
+
+comment "python-grpcio needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
