Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A94CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA3681471;
	Sat,  3 Oct 2026 14:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeiGH7Wq0zTt; Sat,  3 Oct 2026 14:02:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 966988145D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036174;
	b=Fn8oOZ0IWXESfd4YliiZSlpeDXChyojUy9OuwI67G2EP+zbcaIMp3RZVK4a5iRmU6c35
	 cLqDOYvPoS5alqyjdFdYnBH098Us/B2tKlV/QpXktvMUYGYpQux+TeapX4NvUlvEIRM3m
	 HGneQw12E0/+s8JhvVcg5hycU4Lcch78l6g4aI1OJPtY+ZQxnp5SGJzGzKZXc5nK9TdkD
	 BP1KmFs3MSCULHNx94kgiomn+BDdriSf+di2OOBfx1wOdMW9oIqADeKiudaP4gqS9lpmz
	 sIo+c+neyam1OfkxGDS7SfbUC5c50Nwhiy6X9cV9Anlqtiotd3O+GkLNL0s0vyk7yaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036174;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WGspWFtkFRbsTXmKMP8L+G42uptyZICY8WQGPbqhCig=;
	b=lqnZ8CaURHxmKuM59PxxFT/zw+KJmDaS1MEDVnW5Sagx2+QwCWcadFXcr7pDLhNroAfK
	 mDdPFliTGHQcTBrgt1ZswhxTDAWsDHTQSWTG71QI2BNwxly7fjJuBbQqLCdU+6TlzRpmC
	 nZ9wmqM14b8QqMbyAoNKv28C+r+m9EpWJmQ9hy2BrS6f5GaZhwEHNhZ3UqLnk0Yr8jHeJ
	 yqJ9CeoPqNkwPTgPkEr1xKzLcW6HYNgek3+/iW89yb1L1+goo6o+Mf/9FGh+7V5jdqEmk
	 vBm+nq2jhDtj5xWyluEL3dkiS7Qtn/ToQ91Z+fMSQv4oVHUWQGxh5tlG6Ipumhp8uoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036174;
	bh=WGspWFtkFRbsTXmKMP8L+G42uptyZICY8WQGPbqhCig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eaelqo3+yi79/+Eryw+MON38PFQ6VLMtEkW3wejuLRl3DvZa5JN8W4V55cuaSC7NL
	 Yp/s1qgaClqkCnbn3G5U8m0PB8Fc5z3PBWW4EqMEcFQwoXEmnZJDVBt/3pHwvnlew7
	 tXJUqv2Vl4xqDfltFBGzph4YqssSKzLFNrVNqgQZEbBOcPjYnt8UOAeaCBIMf7X6Vh
	 ZSgUWsf+8fACUFa6xPL9erjAEGoSeXQXb648DJVheXEJK5mkkz808Xso93GpaBRwlu
	 65jVJLvLk39ukqEj2JWU5PX28h4ByOWErrPKIgTIIPNKXOrkqw3yU+0q2RzQa7m5GT
	 h8sV2+KD/mHRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 966988145D;
	Sat,  3 Oct 2026 14:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAFBE32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCCA413A3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Dh5PvA1wbOr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1ADBF4127B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036172;
 b=SCbU0m0szyvF5RTmqxUf3UgsM4AdXbbq0GqPyvCZncDLSter8Y6iiEAiJ1H8bb2bmJoX
 y+uj/dQOZ0UxAvniHv8dq7ziR/faaUmwe3JZLzTgtakyGAT4A3U/uh4+rlP2vwxx0i5IS
 Bvf9DZO/H1BQ41+F6h0H5eVwcEmZ4WK+JBq7cUlVDoGnD9sIjCYlabFX4zP1Q63WLqK6e
 2YjN44aPF27EX5S8MxEAFz5krQIPGZmsrjHZ+igHup2XHTGO1pFqeMYTgo+QYAOeLR05+
 BoYhdW4VxZjKg3J8RrIX+eow7n4xLhI5Dxx+nKkVG8TUHW41L5RJvwQCrBnis1jSoqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036172;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=89nIW3NMJbhYa+EK9uDeolOxUy3tujMD5Zz6YnLeiO4=;
 b=UXSTwUq4GwX0d9390SSGAnVe2pZWp55CNve2LGZFIdHx/HWspGbGYIBEKGQ8gInSJSej
 b+q1mRlbAkf9nX7n3qII3uyTUPHWXK2XL9PP6CqvpXVRxifoumZIVMbTsu6dGwOgUGB/p
 QpKOjowL3QUFIIwAfvp2dUOlOSNPM1cEEjAFwVyMEaE8fbbGrqabmbS6P7ijfgXdujfzq
 ljD6TLX0D7iVNIBKDTKom0ot8w0oyrCkngCHMqYw//02/yZsKAlyg/0VaVKuLIFJHUK5N
 TuUntoO60GMwV5pZaxlEg3tkTdjarA/BgULC9+TDgLgFIVHyPErFOzE0lwTqBNTQF3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ADBF4127B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5772B8A309; Sat,  3 Oct 2026 14:01:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:01:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb46327db30fcccf1b7fc0f6726340870c34feb2
X-Git-Newrev: f5a5aa1853e211881f28fc75527cdbcaff1df5c1
X-Patchwork-Hint: ignore
Message-Id: <20261003140137.5772B8A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: bump version to
 20260925
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5a5aa1853e211881f28fc75527cdbcaff1df5c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260925

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 6f465fd679..78aa1fe4df 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7614616d7b2988c278060486f47de716ef44c19317928cb45ac9e288fafd5bd1  intel-microcode-20260812.tar.gz
+sha256  0ec19023dad1e6dd0c5909174b8dff2555b91cf01671e36271a1ef36655c0cfc  intel-microcode-20260925.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 9c97b0aa5e..4c16142a69 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260812
+INTEL_MICROCODE_VERSION = 20260925
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
