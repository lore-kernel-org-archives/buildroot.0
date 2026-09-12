Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A52AC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B30180E75;
	Sat, 12 Sep 2026 10:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2MU9T0AYlpt; Sat, 12 Sep 2026 10:49:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9DA3E80DE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210145;
	b=T7k5DSovXUC4Xb8jLTFl9+5moabj2NJ+HEEV1n63qzkH1vuAY4ZaSyMBqyODhErb9Ci7
	 RXH0FmOWju2MicDDJMW3Jpp6UUyjFM3JP4/gPeTQgTLteh0hSOeZHx7rCM1wjo7/6VVST
	 oJ17Wy58VTh1XuDcOvpk/9K9pCrBewngD2rMt/xUGorljR4xu+PwYq5RXOH46zfvovL5E
	 IPSPQl0BVWqTN8HgTP0bDh46ZI/bmPG8B821HZUa5LLHyRbSSsJAZVbve0K8xsH4PxmG0
	 IXEnXIeMPUFeAhU6gjQuYwtKLLraCN6ire3NTeoePSnNZoQ2eSNXFxKcJwwWjGVt44Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210145;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vDBOvGWUniW+d1uSgmBwDMmuAJPuf1kmnm2jIUv1bfE=;
	b=qIq54JY47YaI2MTtVZ1oCwOnwimZDS3vd91oaItll9X+yH/MbkDJxoilMM1Rj6tVZ0fw
	 vY0JnZ1+MknLCTTOkpqlU5kwe0gv1TKahLxONihb9nTBT2yUPbaijneokVo08YWf6RXmI
	 N0N1Rv+2p9Cp/cBb/KAPgaY29GD82/cLC8z5eZMjlY2wZvftninNkgwqBQNfR+UQXRB2h
	 tXweA2U0pMCrFyq8jFOJlnnlJhpEI+yfg7HvVpcHvADTitpuXtC2H4BdiS17H8gBkg0G/
	 so52gAg4ZdP5HjviStBLlf9j79onGjwGVgv1jJq7TlJjmwsJdKlqvWSD0C3w+sGVsmg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210145;
	bh=vDBOvGWUniW+d1uSgmBwDMmuAJPuf1kmnm2jIUv1bfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Im4OMjyCqU1aBJRQSsssukloabeNmUxTcRBH2IpZp3nrLDlxc1L5TrIKjTT6qOjg0
	 7h0uF8C/0xtfxkAO80QTAIypXGUZbRP69mnFjVC4QaI8dKCtqW4MivIoHa6K9tuPvC
	 ENCfuGG4ZEIx/fbxBzfe3cUkJ9ygebxaui+47dPnmIMhPWXivh2s4kCCW037XN1RxJ
	 VHh5uT2+ev5OSpg7g/02vFsdo2J61hekjGzf52MOiY5ISFS/UspOvSmoFgTYKHA+5S
	 DLZCoEWY0kv6zQzIniPkUFsSSQLRQc7072ce+PIxv41WdxPfYF9Xn9ovQDaxii1dLr
	 T45r5DjQNoMkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA3E80DE8;
	Sat, 12 Sep 2026 10:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABAE42D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91B2A40076
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPg4mnX0vK0T for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 63FC940068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210142;
 b=cxg1eq39yv4skFkanDTSMd6LqCCUnPZfXh5T10RWt6zL2IMRKFOZW1m4OI9HOV16lt3G
 Fxl6wD8NuJTfImV5zbjVtZfdzIILiSIKYYVJCoFCxlntP70Y75z99Ifj6sQodD7irBdFG
 +XuqW4T1DDt8TmFgqCdvCuxwqDcYu0GqsXEIDUF38hPhs5l7zOOpei3yaImCP1Anj88Ct
 Q6ak8O3FI+fQlfCmMugClapbX5OHmqHxccLq4yX0KV3+64GU3jeW6Log4x1uDlC91B/wM
 9/UXUOn8vmMxAtClvcOK3dsaY2thbeUterRhMjGywlGIIsw86slpcjPOAIKJ675BBhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210142;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XDZQrcjl8iSzaXUZg16yFCj5aGsvl15tzbWp5otNS4I=;
 b=XbmchH04JS6q3o0UDYXaFHfYpCx4xlG/746fjkE/38gIxXaGSMf71v5YghPZ8CvUDNTq
 Qf53YgcIQtCct0QxJtxGSv7L2OVZpk6bSIx/YOl0eeGfnKlO7xUGYVU29YPqPxMO+m5my
 5Bk9WAL9jA88DVML9wbA/lHV3fi97xZd//PMvczM6H3pbqXuKBiI04hzhob2UDtpOl5dF
 4zhOZlbI+6FMHf7LZs+dcQhvjHS7/wtukZ9XrnAEVxXpk9GsTPvmXP6wjKGoCTaRvy9Qa
 EyEjMMIWtJ/bRk0r/IP8+uEFnxJfKY3vfi6eMJYvoY2bS8S3UQSXZo0XOmRgcFhsHBA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FC940068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA92F95586; Sat, 12 Sep 2026 10:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 11:33:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5839ccb520f51ca5c6381b2c0eb32b33e8ebf4b5
X-Git-Newrev: d5f5eeaff46f44480a76b3175b273600ceb09969
X-Patchwork-Hint: ignore
Message-Id: <20260912104757.EA92F95586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump version to 1.83.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5f5eeaff46f44480a76b3175b273600ceb09969
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/grpc/grpc/releases/tag/v1.83.1
https://github.com/grpc/grpc/releases/tag/v1.83.0
https://github.com/grpc/grpc/releases/tag/v1.82.2
https://github.com/grpc/grpc/releases/tag/v1.82.1
https://github.com/grpc/grpc/releases/tag/v1.82.0
https://github.com/grpc/grpc/releases/tag/v1.81.1
https://github.com/grpc/grpc/releases/tag/v1.81.0

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...dd-option-to-restrict-building-of-host-grpc-to-grpc.patch | 12 ++++++------
 package/grpc/grpc.hash                                       |  2 +-
 package/grpc/grpc.mk                                         |  2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
