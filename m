Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67074E63C9B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEDFF4093C;
	Sun, 25 Jan 2026 10:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvvSJBJc-bfN; Sun, 25 Jan 2026 10:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E027840875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769337910;
	bh=Zl0Wtn6ydeWDFOlDNTQPoEtICntk4k1Qhz8RYvCxrW8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FN6tcpVwGdbbqSX/8Y69eTntQ2hUocl7bOApT6OpnnI4WM5z77Cz9/RxrCw106HG7
	 vKliOMs+eTLe+zHbxgYOOIfcFGoRt4qXXWGS7zXX1aU+LwR2u88nQm/P1N+HJY0Ezx
	 VXXz5Dfq0bn51bLDuN1pyQhdgiyP0w/tGt2dfLderlgpCQyW3x/uhZzJx48U4ANHqh
	 DeZdPCK2Rxa9PZx3RonKX02wsYZGIfU6oWKqLMoc/ANh4y3Ch5Gpy+Zap7gdQ/VCNr
	 7E+JRrZlqQwTB4vcFYmMv8JuIr5YDZl9pBPDnPmAa66GVBgwnrnrGLcckNS+IfzyHF
	 bHE9Lf7PB1FYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E027840875;
	Sun, 25 Jan 2026 10:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FF511B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3DF40868
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GajvikxLa9Rm for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 10:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77445407A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77445407A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77445407A4
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 10:45:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6d1.dip0.t-ipconnect.de [79.214.198.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D87E7A4C2050;
 Sun, 25 Jan 2026 11:45:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44156)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjxc6-000000008PS-0Kbn;
 Sun, 25 Jan 2026 10:45:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Sun, 25 Jan 2026 11:45:01 +0100
Message-ID: <20260125104501.433268-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769337902;
 bh=y7dWqsDujLcMkmFQe3N76Yb0VdeR7vFtm3aJ3VqGfYQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rTjhhAdwlVcjBbDIqDMC7ZgIIotLsnG0uZRSX39ovI/oxdNqoQNKEjSva8w5CCA9y
 eNzX/UgGk92h6WF04p3HQKPExcRO8UJDJ/VNYln6ye4jBypU5VM5cUv3EPdMDWsJyh
 9xzdXg5puq/1WqbTBFIAbK/PseczMBMRYgdG7dsm0u+6nVHteeK0+PWqQ2/ymAqg4Q
 3m+Xv4orWKnoXt+181s/0ujnOH4joGIW8fBtB112ewEn2mfznLBZVaWVP5iXVXcEkE
 yy8KkpmukUpfgVH9J3H40GoD0KSF90Bi7LvSlewrJhC/wyKFz4sSymYjk5lC30rYlH
 g2XJUrD6jb+Sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rTjhhAdw
Subject: [Buildroot] [PATCH 1/1] package/netdata: needs C++
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df124ad4 bumped the
package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support
into a mandatory dependency with commit
https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8e31238b06
added to version 1.35.0 causing build errors with toolchains without
C++ support:

  GEN      netdatacli
/bin/sh: line 1: no: command not found
make[3]: *** [Makefile:5502: netdatacli] Error 127

Fixes:
https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/netdata/Config.in                     | 10 +++++-----
 support/testing/tests/package/test_netdata.py |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 3603eb071c..527d4d39af 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETDATA
 	bool "netdata"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
@@ -22,22 +23,21 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
 
-comment "netdata needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+comment "netdata needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
index 6b616398d3..42bcbcdc6f 100644
--- a/support/testing/tests/package/test_netdata.py
+++ b/support/testing/tests/package/test_netdata.py
@@ -6,6 +6,7 @@ import infra.basetest
 class TestNetdata(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
+        BR2_INSTALL_LIBSTDCPP=y
         BR2_PACKAGE_NETDATA=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
