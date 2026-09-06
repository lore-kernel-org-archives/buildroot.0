Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C289C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C236480DCC;
	Sun,  6 Sep 2026 09:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5_ECpAbZukR; Sun,  6 Sep 2026 09:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AE3FF80D77
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686063;
	b=NQyDjLiDZQdPKz6NO6F36bXwxLekg1cJav/c7Ni/B00LGEDGqJpoMLKNX48dwT41+fmj
	 U3vk0FcF6tNdgG9MpyTW8STfsA0rThYKvFLp/ELHNVPdpWulzH1QCgIG6FMZMhWfsuasO
	 RuiEK1hnV++c0zUR0uBsDSsx4xQW8e7yr0zUSlswxJ3YufUz2Mm4v7oGUWqKrlhICgBgy
	 V5AIUFDypULOwr2RHQiw+PDxP9yevJL1TZMUZHRfmh1C5vDpXf2/7IKpJd38uFBOUhUbU
	 Akdp+/4iOwQ5CsAiRzckL27l6kHehZTKY5jNPEp9QCviJble4JaU8tFgDOE9Y6uMT4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=S8M+NQa6rd2A/k3ouaOmTVqegTxicLbejir6kxWadeQ=;
	b=TLCivKZpjkM8Rryku3gqptFfkn5TH5CUWXcPmZk+iZce5AaYJznOdoJFTi7aomSbBEaZ
	 oa/M+E9tyqOW7qzcP149PebJjzCP3g70lACv2qg4uhrG0rqOqYSonl3xzHfLocCAHvAvc
	 mEOStwnUDuNcj4MbLcYCH3bKKhG6nlawYJjqHqFWggpOHRzqrhZrWY40akTgcQ7E+IvsN
	 Mp11VE/GdJrFdroh3jImz6fEfQ/JPowKZz/FQzIyodc00BRBL3xuvnm2gfpO535dTYe8t
	 4YJbbDetPqCk5H33ILEnWJu1hEUoQSnbG/PvGnhhC+zGPf9rGdKMTQO4BzSatdLBmBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=iQlYQlM3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686063;
	bh=S8M+NQa6rd2A/k3ouaOmTVqegTxicLbejir6kxWadeQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NNDETgk6RNGFD26CJ4mwt9a0h0D6yY1vZ8xwI0hZlwnlDwA69VPQ2rs/ADv5iuu2F
	 V8mo6ATEriQ2J/41K8AOEc87+vRIowy+XGCIWx+OVBXAqfOMnYu16BJq/JEW9Faecx
	 KbQ5W+WMR4NMQppXrgXy28QjAL844uY2eu3Q38A59DiDo9Yn3jwTjg+r7BblX574tf
	 IYawICOfC1TC9hhm7rlKUwZyboF/u64Rbfb98CXz0J6GEcTeznark5ZgTEYGURFb/W
	 YZk9B/8rEjLHwvl8hUrrsvYES+V6Z0mV99l2wbQ1KrJOVzxHNW6IbSBigSecZO0uRG
	 nYrFynPAOGgIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3FF80D77;
	Sun,  6 Sep 2026 09:14:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C535472C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB35280D73
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xob3PYfUyi1 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4606180D77
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686061;
 b=YQQXg0WRd4ZQNReQNltg/irY28d1JaRpcR+6Zqjke78hUUag13XK6AHo41ezz88tbyuV
 zxiNn02lAMrSS+p1csRosTS66AVqiv9cmuWzhDGNXiS5qd0VKXiUQwQNFEBfqA0HWD2L4
 I24HZWZUHwf5f8Zp1cL0l5T3N0V9M/qN+o+To2tMQP1v3KYmOxGHyf5hRVHkzCfXel6qf
 nhLrYXIzU3tm319/FrAJVCmlmlbu6UGWbFbvqivSGJOcwIBdUO/WkvVq8NvuMvCYNxJjg
 isSRpzToHSDOajP6Yi8qHVaLOw+H33LdEizImkT+EwsGhOxHBLtEoYSpFSG+zpX4hcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686061;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=YipB38qNqqCSPovK12cmHNarS69PhmEWrWohg734TZI=;
 b=sqXTGd6YleV98dUXAIPB906hEUs3JtSbE3qdWO9gt+KzjU/kasjdA35UPRtJafQshWcm
 gAar2ZQJNrFz5+Rw0HTZQIFwEbpzdh6QPU8ekq25kj0juOAxPFrjTbwOLmLYoruJw25UP
 KIlG1CzPNgEVXC3EXebfDGenkFBqi0eJrS8e4x8VkwZ2laDOfb4zb3iOeYfMSsa6VqIqb
 QrPfzwiKfjkJVs2PXC64IBZjQuHFCHdqvf4Ghyz8zcVSuWzf8cBaO8W9DYxD9LsJohJBJ
 PeuysdrdnpJ1wM47dyvhy10VbjPI5WeJcvwhjSvqoSv4Z5fjz1IACXBPGcJkQXqM25g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iQlYQlM3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iQlYQlM3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4606180D77
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788686059;
 bh=YipB38qNqqCSPovK12cmHNarS69PhmEWrWohg734TZI=;
 h=From:To:Cc:Subject:Date:From;
 b=iQlYQlM3xTl+OJxAsyCFTMWiY5il7qsR7ew7MzhMOGJGavX/ROLuxWW8qpbcS/U6W
 Bcximtv15NsPO3fwNCLQgE3L4IHBBuiVcZ6wT0YSQgkynjeGWnsx4Foj89X5+kV/Oq
 oIdsHwB6g9xWWPoQjZDBNYZ3bqnAdnXfCQcP0Ui2Nk/soY7qWAIRAyDWNq4ir87wFx
 LuNWyntFZmlqSGGLU831OAVlIPctLmE5jy971yFwiBIRlkw3CWuFo7x+Pvi4Cu5nwK
 kBYIiHH1JN0QKtovoZbY9bzjjYISp3LPBs1gF7tgi8Jwk4q1uVzV67GVOulRiSj6fB
 ou92/zk1xi20A==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 385A2A4C202E;
 Sun,  6 Sep 2026 11:14:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34562)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x38x8-000000001Kn-134E;
 Sun, 06 Sep 2026 09:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Robert Rose <robertroyrose@gmail.com>
Date: Sun,  6 Sep 2026 11:14:17 +0200
Message-ID: <20260906091418.3584407-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/grpc: bump version to 1.83.1
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

https://github.com/grpc/grpc/releases/tag/v1.83.1
https://github.com/grpc/grpc/releases/tag/v1.83.0
https://github.com/grpc/grpc/releases/tag/v1.82.2
https://github.com/grpc/grpc/releases/tag/v1.82.1
https://github.com/grpc/grpc/releases/tag/v1.82.0
https://github.com/grpc/grpc/releases/tag/v1.81.1
https://github.com/grpc/grpc/releases/tag/v1.81.0

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/92da967ed0e73f81a0cc0fd92bbd73658f7351da

with the exception of bootlin-mips64el-glibc where a build error
unrelated to this bump occurs with the libabseil-cpp package, also seen
by the autobuilders:
https://autobuild.buildroot.net/results/f37/f375584f3721d61238b9e43d9926e037802f6141/

 ...n-to-restrict-building-of-host-grpc-to-grpc.patch | 12 ++++++------
 package/grpc/grpc.hash                               |  2 +-
 package/grpc/grpc.mk                                 |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
index 3e0aa2909b..03ca1d7bf4 100644
--- a/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
+++ b/package/grpc/0002-Add-option-to-restrict-building-of-host-grpc-to-grpc.patch
@@ -15,7 +15,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Updated for 1.76.0:
 [build utf8_range_lib as it is now explicitly required]
 Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
-[Bernd: rebased for 1.80.0]
+[Bernd: rebased for 1.83.1]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  CMakeLists.txt | 39 +++++++++++++++++++++++++++++++++------
@@ -138,8 +138,8 @@ index bc86c00463..08441ddbd2 100644
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc++
-   src/cpp/client/call_credentials.cc
-   src/cpp/client/channel_cc.cc
+   src/core/client_channel/virtual_channel.cc
+   src/cpp/client/call_context_registry.cc
 @@ -5263,6 +5284,7 @@ if(gRPC_INSTALL)
    )
  endif()
@@ -155,8 +155,8 @@ index bc86c00463..08441ddbd2 100644
 +if(NOT gRPC_BUILD_PLUGIN_SUPPORT_ONLY)
 +
  add_library(grpc++_unsecure
-   src/cpp/client/call_credentials.cc
-   src/cpp/client/channel_cc.cc
+   src/core/client_channel/virtual_channel.cc
+   src/cpp/client/call_context_registry.cc
 @@ -6285,6 +6309,7 @@ if(gRPC_INSTALL)
    )
  endif()
@@ -202,7 +202,7 @@ index bc86c00463..08441ddbd2 100644
  if(gRPC_INSTALL)
    install(EXPORT gRPCTargets
 @@ -54105,6 +54105,8 @@
-   "-laddress_sorting -lupb_textformat_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
+   "-laddress_sorting -lupb_textformat_lib -lupb_reflection_lib -lupb_wire_lib -lupb_message_lib -lutf8_range_lib -lupb_descriptor_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib"
    "grpc++_unsecure.pc")
  
 +endif() # gRPC_BUILD_PLUGIN_SUPPORT_ONLY
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 6329aff00f..42b1120c8a 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38f58596277fa632064cc0719b9ece4381c8c77461cb51e9b66ca149574b7865  grpc-1.80.0.tar.gz
+sha256  60caa8397426d8a500e3e57ab6a49d1cb5aa62a36f2591eb9da3d77fa38ad8c9  grpc-1.83.1.tar.gz
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 19250d679c..d504eeb992 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.80.0
+GRPC_VERSION = 1.83.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
