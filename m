Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FCAC531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 06:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4514810FD;
	Fri, 24 Jul 2026 06:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQxsVsjKUW9w; Fri, 24 Jul 2026 06:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC47581105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784873870;
	bh=/OmQmOKRREkOnq3Q8lwi9xF2SghGhUkfGO9MeeTHJIc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FmccBkgbuIPthuRRQ9jycj8V/mlqBjE0Ks5RBiGXampmh58kuV4PMoUXCoYfCiu7F
	 Owtr99Ja1D9FjqKtswq4kdGh1xfZrqo4S3fv5l1FhIvbahiwsHY6Q1+kJjPBEzt8c6
	 Eo4ZMleb24K3WpSBuDk7GYRLDXVBOrkzcT0dmj2N8VfOS5G0QIHRO/oDnGOLuHpv8P
	 FjgqO0POjJeVoTFVOwl1beNCpCBJUpkI3gr0ihU7fZWEhOASX9cTpgDYEfGJzoS24M
	 AItRSGAKPFupkljBthuswiYDW8uVPXnMZm6r6Pc9tahkh0IzuvgEwztrViCCHZDX+t
	 OvbHSiltwKuOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC47581105;
	Fri, 24 Jul 2026 06:17:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5738A47
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AE5781003
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQFxhdmQcpyA for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 06:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.242;
 helo=send147.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8238D81105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8238D81105
Received: from send147.i.mail.ru (send147.i.mail.ru [89.221.237.242])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8238D81105
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:17:46 +0000 (UTC)
Received: from [10.113.165.179] (port=33712 helo=send194.i.mail.ru)
 by exim-fallback-5cf4fc9bf6-mjccc with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1wn9E7-00000000Co1-0ULb
 for buildroot@buildroot.org; Fri, 24 Jul 2026 09:17:43 +0300
Received: by exim-smtp-6c76488b9f-48hmc with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1wn9Du-00000000W6S-0UJ3; Fri, 24 Jul 2026 09:17:30 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 24 Jul 2026 09:17:26 +0300
Message-ID: <20260724061726.80583-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701F47C7C3D94A5A406FA166F666E566FC74182A05F5380850403D2F581222B72E8B3DE06ABAFEAF67058C0AFEBF906144A49F8FCB5AEC84C46900F5F90D052F6071
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70D278D70F8433719EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063757004B04402545C58638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B281D39D9384362C8B2E070BE324C7D3C439864060FF725779BB0A4F435E46E6718B35066C979671628AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C015BBC38BE64FE4678941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B605968FE12AFC105ACC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE74ABCC139FF3F849B731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5A3966DA2B4AC7C3E5002B1117B3ED696CD7D258903D6C07903803A57F48E4E5A823CB91A9FED034534781492E4B8EEADABF80F987DAEDACBC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6590FFCE37715D683417C620E17792E6E0F49046CC9EC79DDAA65811DA59A12EADBD6FB75C7B7559472B8341EE9D5BE9A0A57B97EE3430859BDE2BA14E388D5EA102A34EDAE2201EF5E8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWmxowtcrDwUHMMOCvH64FI=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2BD64CE8E1EB3ACBD7CDBB3B025C5997AD7685777D89C2AA090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B486472E5A48B460E48232B7BA1535077BB3BCC14F54A4587C049FFFDB7839CE9E426FEB9BE75545307F2D4311D753DC5CC6A80E74B3EF0EE45D21B931683A59E5EE85685B73C3473E
X-7FA49CB5: 0D63561A33F958A5E96EC81471984A1C5002B1117B3ED6969534C9CEBF75A745518C0FB0186044C402ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZByQ8cx4vAy9oXJAaMWDS4Q==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=8BcLwLmSNVzy3f6JytThQlk2IfsHX/M5hyxR5f5HSAI=; t=1784873866; x=1784963866; 
 b=RKeYUndSIhTsfh0O4P8iTliw0ZGDLUI8L/V9zejUVjOr0n7UerNO1r/JCfLm7L1oeEsVpW2wiE/
 slssvah2fJdFLhAF48/8veyP5Ss1JNsPFV5wQiFWLrFAOLlUXWmCT1LNRMRQY7IEyxAigX1x/tftM
 tKtu+LJkYB/MXXXq4+KmNrEzIK/m9SuVVS+TSyyjSDHggIB2y0TlfvSS/IefJL+FTFDn5PXh7GvbA
 gzY0fn2l53g/eINjrHmH2WCnxaOOzjw3L6Urfs+kGDIkA9unvzBINAD1KMrCKEzxpisch7n+N3BWJ
 2aYne/3+4o/76HprL/gxCtmUSJdxoNozwrug==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=8BcLwLmSNVzy3f6JytThQlk2IfsHX/M5hyxR5f5HSAI=; t=1784873863; x=1784963863; 
 b=GQgjNFbeTEBfLvRLrVkkdYmIH7W/QINw+0bV9VTdwCLdkjySOBcLb8kWhZaQQyQtA02j7oDwj/0
 j45H1qk4CXA/xL8RKSwcnFyL9hKQX+jA01d0YAkdRnfypVr3C/mpum5TC43nxyQk6EqDcaufCmhnS
 PmaGqzkevJVjhyylnN7b+QHBZ2IRujBhfGU4kYGPutR5Y7/S1R2VGANIW3xlDZPkKNpZhdrxo30cb
 wOof8Ebp3yJIYPdrHs6FdDEKkhjQGVu6AQUvONVMiH2FzV1V5J9rQ5sC4ey3VNTn91pHHicvWADED
 /t9zGZYf+6lZS8Gh/ew6eT9sZdVzS3hfPkrw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=RKeYUndS; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=GQgjNFbe
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.23.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/osmcode/libosmium/blob/v2.23.1/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../0001-Require-a-more-modern-CMake.patch    | 45 -------------------
 package/libosmium/libosmium.hash              |  2 +-
 package/libosmium/libosmium.mk                |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/libosmium/0001-Require-a-more-modern-CMake.patch

diff --git a/package/libosmium/0001-Require-a-more-modern-CMake.patch b/package/libosmium/0001-Require-a-more-modern-CMake.patch
deleted file mode 100644
index 6c39e751fb..0000000000
--- a/package/libosmium/0001-Require-a-more-modern-CMake.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7ab87418a0697ac9b7b5f005fbd64dcd99a01124 Mon Sep 17 00:00:00 2001
-From: Jochen Topf <jochen@topf.org>
-Date: Tue, 15 Jul 2025 17:19:57 +0200
-Subject: [PATCH] Require a more modern CMake
-
-So it works with CMake 4
-
-See #391
-
-Upstream: https://github.com/osmcode/libosmium/commit/7ab87418a0697ac9b7b5f005fbd64dcd99a01124
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 11 ++---------
- 1 file changed, 2 insertions(+), 9 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cfeffa8e..80f6bfe1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,7 +6,7 @@
- #
- #-----------------------------------------------------------------------------
- 
--cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
- 
- 
-@@ -36,14 +36,7 @@ set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel;Dev;Cover
- #
- #-----------------------------------------------------------------------------
- 
--project(libosmium)
--
--set(LIBOSMIUM_VERSION_MAJOR 2)
--set(LIBOSMIUM_VERSION_MINOR 22)
--set(LIBOSMIUM_VERSION_PATCH 0)
--
--set(LIBOSMIUM_VERSION
--    "${LIBOSMIUM_VERSION_MAJOR}.${LIBOSMIUM_VERSION_MINOR}.${LIBOSMIUM_VERSION_PATCH}")
-+project(libosmium VERSION 2.22.0 LANGUAGES CXX C)
- 
- set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
- 
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index 9f09024f74..28cd63532f 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f74e3f6ba295baa7325ae5606e8f74ad9056f1d6ab4555c50bff6aa8246f366  libosmium-2.22.0.tar.gz
+sha256  eb47d8163396c73870dbf27819dcadda0c56f0191935c4f8659d1e61b261552f  libosmium-2.23.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 5b73b3a128..c7736668f5 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.22.0
+LIBOSMIUM_VERSION = 2.23.1
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
