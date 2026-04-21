Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A030F94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4FE60886;
	Tue, 21 Apr 2026 19:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3gJ5chwGVK7; Tue, 21 Apr 2026 19:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C2060882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798234;
	bh=F40slYzaL1yRPE+KRAu3GGSgxVyi9Viub6w9wXc8/pk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M9p/7U/S9vcSsJkmZGCDgFXNWNK4uD6DeJ3pjHa7JyneEGJ61y8b8F70W+dnk4bKE
	 GEpOgNozVQBhn4U/sMsgbelaExuyWNMxNzrZjL+GLvP/2/UssnAIBKzufvjRzebksH
	 jqXq561CwgtxRooavVkEQteqsJMrZf0U3n9vGcG7NRYZMWNi+wewsZVU0sv+wCp8vO
	 b0mhUBoHLYe1whPEbzjRcdZdCXigkdZmldnh3R0Rt0eD9lbWtkNeLKNBiypZFdDlRx
	 DwnLhNve5sfiIDHc0NsY/7zkjlgePsUvot6pvhx1tTHH970FsDRoKxdg8i9sfoRg3X
	 WNNf+yBkOYDUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C2060882;
	Tue, 21 Apr 2026 19:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B64257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3966640380
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv1tkQ7djfFt for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 268E340364
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 268E340364
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 268E340364
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:03:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56325A4C0185;
 Tue, 21 Apr 2026 21:03:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44296)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGNw-000000003tp-44qp;
 Tue, 21 Apr 2026 19:03:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Robert Rose <robertroyrose@gmail.com>
Date: Tue, 21 Apr 2026 21:03:48 +0200
Message-ID: <20260421190348.2722591-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798229;
 bh=If46diAt7PuOgPpx73XepIOKLhsnOPJhcFLpGujrKxE=;
 h=From:To:Cc:Subject:Date:From;
 b=LC+4gCMY2DRxhLtKHjiXE0tt/I/lO1vEjnns2nkN3oSKDnA4mkQUYn2FaPtZNzlTi
 ar3YpBw8bditqpVd7L5g+6e9KaUrLit5/k49OOGVduMzwNPGwQJ1RwjxmWBU06+5Un
 p6Ftno0psjuVn1+gIaVB1lSsXthw/2bUXMpZThAhtaBjSrRsw+7owt7tmJcuhLg7sW
 5a361V9Hoii3WIMzHVnBhGZkxPoshxNFwZgHqLRsriv3NAKAZFRpm4ryNmwUr7TVFa
 Fy+4jqoUOXaGE5E6Ns7AeRuv5bgjYsAm/vjYEe5R7UMzVBrAztta0t6tGu+jQfUw7d
 1flK2PhGqlXag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LC+4gCMY
Subject: [Buildroot] [PATCH 1/1] package/grpc: bump version to 1.80.0
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

https://github.com/grpc/grpc/releases/tag/v1.80.0

Rebased patch 0002 due to upstream commit:
https://github.com/grpc/grpc/commit/4c3996f0da7041ca7d3b4265d9e0299baa0ed4eb
which added a new configure option.
Added this new configure option -DgRPC_BUILD_GRPCPP_OTEL_PLUGIN=OFF to
HOST_GRPC_CONF_OPTS.

Updated license hash due to upstream commit:
https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...o-restrict-building-of-host-grpc-to-grpc.patch | 15 ++++++++++-----
 package/grpc/grpc.hash                            |  4 ++--
 package/grpc/grpc.mk                              |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index d36eb8fca1..3e0aa2909b 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -15,6 +15,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Updated for 1.76.0:
 [build utf8_range_lib as it is now explicitly required]
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+[Bernd: rebased for 1.80.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++------
  1 file changed, 33 insertions(+), 6 deletions(-)
@@ -199,12 +201,15 @@ index bc86c00463..08441ddbd2 100644
  
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
-@@ -52025,3 +52050,5 @@ generate_pkgconfig(
-   "-lgrpcpp_otel_plugin"
-   "-laddress_sorting -lupb_textformat_lib -lupb_json_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
-   "grpcpp_otel_plugin.pc")
-+
+@@ -54105,6 +54105,8 @@
+   "-laddress_sorting -lupb_textformat_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
+   "grpc++_unsecure.pc")
+ 
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
++
+ if(gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
+   # grpcpp_otel_plugin .pc file
+   generate_pkgconfig(
 -- 
 2.43.0
 
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 289a6f8191..6329aff00f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2ace790a5f2d0f83259d1390a816a33b013ea34df2e86084d927e58daa4c5d9  grpc-1.78.0.tar.gz
-sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
+sha256  38f58596277fa632064cc0719b9ece4381c8c77461cb51e9b66ca149574b7865  grpc-1.80.0.tar.gz
+sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index c99863e92b..19250d679c 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.78.0
+GRPC_VERSION = 1.80.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
@@ -83,6 +83,7 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPCPP_OTEL_PLUGIN=OFF \
 	-DgRPC_DOWNLOAD_ARCHIVES=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
