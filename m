Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5EEC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2868560710;
	Tue, 22 Sep 2026 20:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLABghIMezKE; Tue, 22 Sep 2026 20:39:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 50B8F60667
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790109595;
	b=L8ME1MrjvSM43+Yp95xQfbYyDxArpkEWpSRlj45q7TjGEGTgYe/x/viGYuGMSeLfpA/u
	 Y6AOSH2Md+rCdM8VfE+BXnjZHgegLq1XbX9Z/aU6JEygEharGzMSA6X+Th06VQOtXdwXu
	 nMNgS5Ead+vgziUINw6KskDFDuMYMPbu1pRg0rfyLED9zezP7rL+wDBwzoIwPigiV/urx
	 PB6N5qJbUfeD3L589kCunmj/k+wlmX1GsMKDi4WVyxbrizTkmQg0bAiToxFhvRhHZ43V2
	 OcQ1LUzpobZz3egwoFbF1gvSpVjzRTqQsSnXBdIcSKWokYWNLMl1Ph0noGDR2ows4aQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790109595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NMQGzJ6pJpoOq5gKIwR+MEQQ7qmeOnFu0P6kl748o7g=;
	b=HVsRtVE+O0/c9eMiSpl6IbrKL/Woen2fY55/jn6vqjoHY72M3rmRdZ3VNzfJC5jcMD2U
	 2/WLqGMut5uSXjjCmKyCYpMHDC98ZzR1LidQYT651ZTy+dUdF5E4q+s4+EKf6Vr1VC5/f
	 70dQHcXelqNFs9lLe6/dX/kPn4pYxc8Zc6N/M/RTsl33wRxlX0vkExF1cBmnbg3qdkiKR
	 B5EWh1blH+diOjTMP1Q94CodS8/Q1OLysTz3K4oXMpFBLIUCIVeshENKsPaX6wdheq837
	 IEtGFXA+UBskviKkKhE7Y0Haad9TeQzCrjX+3s17rrcwE/r4Cnrm4ajUV2XzPDtBBTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790109595;
	bh=NMQGzJ6pJpoOq5gKIwR+MEQQ7qmeOnFu0P6kl748o7g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mc1N5QwEkPtjaLQpjphbf0TQ4B1+mUeWA/xhjNFWmOVwQddVKFwP/pj2SxTJ7/f/y
	 N4eUU5xTMDn9KIlRvoWPq/Gta/oldY1TUco4BN584/V1MRH+uGq3ZPfd11FOfhKLsc
	 wrx+TZPbf49/HNOFTy1te9zmJG4AIgcCfD6r/mZFLMqzmS5P+me1PUo/kuI7EgEd9d
	 hSnScrQqg+pCCyKTlnztYD6X4aVwxjYgOOHUFPNtcv7nxctbHCh5TdK0AjGKDu3mGs
	 0s+vs3s5B/F397PQR+ps/pvBQQ7IgQBfLmlDk8XN5xDkqbmrRGaCWWtbMZ6b++VnuE
	 ilVvVZDuBAktA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50B8F60667;
	Tue, 22 Sep 2026 20:39:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B50C35A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 118BE60667
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73szq8zVrdHD for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:39:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 09E8D6063E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790109593;
 b=oluoWgp8MLt4LAuOwKaXtb3Tl0XgwqcfIHiW99NtIVV3iqrxEplnLkI85LCQYme2liZ9
 VhAoaendDD5TY2D4jn3tO6aOrNjD/h3xXOaXkK8C7FWWyzx4IC2grGr4CI+agjAYJE/uN
 mzWlp4paUxhAV4MhUTDkk40EqB/2wpP2AkK2NnjeSbkkU1UXHF4O+QYk2dqBJiRzQQ53T
 Ze5+gJ1PuevzGCNL7FgKkmgzQ2RBVRGoCR4mvkzpqSPk/E0LVs776UAfChqsGbCAPi3v8
 mTtrjYysSC3LqkAEgUueVtcIjiCj5OrUUCylM+i24f9itZThsOigHYnIA7pkuPsKdpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790109593;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0nodq/fEWdVzrVbc7C/JWXavwoQ7BYvI7MzgAU7248k=;
 b=kEbQFAACD6Tmi041wFcRj22bGmJAU5T5/Yhc8k9H23Gy51mGxaTGAh1uWRSxIY5710OL
 zRFlqcPKbzRFCMe20slEDA6QylDMmUS8pkIdM3P2FPOe0ex3biA86U8QVoCGJV1SjCrST
 2CUQxxRHZH4EvzLLjEKoMRhAs22g9iRW1jN0+2hDAc9J1D2K/sbguSIPSeJNo34MA/cbD
 YwojMJ8r0mXF7H7tJS5XX9X2l1BcTGfUaHLhIdTq19x3QLuTaf+t/0Lgoq93obWVIY8cw
 ntnIDvdJMcT3XIicxOmGD1OvXpB1REEUzZ5WVl5TOKv9a75LSCiDdT3PalCvcgXgjRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09E8D6063E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:39:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82ED795CB3; Tue, 22 Sep 2026 20:38:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 22:38:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e4036e3a0a0f336bbd71722ba8f7587ac1f3233
X-Git-Newrev: 74fe3559d6d415d30833596afdb23586c95876e4
X-Patchwork-Hint: ignore
Message-Id: <20260922203843.82ED795CB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl3_image: security bump to
 version 3.4.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74fe3559d6d415d30833596afdb23586c95876e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/libsdl-org/SDL_image/releases

3.1.1 was a preview release. Among the changes since, it fixes the XCF
loader issue reported as CVE-2026-35444 (fixed in 3.4.2). See:
https://github.com/libsdl-org/SDL_image/releases/tag/release-3.4.2

The LICENSE.txt hash changes because the copyright year was updated
upstream. The license itself is unchanged (Zlib).

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdl3_image/sdl3_image.hash | 4 ++--
 package/sdl3_image/sdl3_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
index 83f5e7eaf1..e0eb2d2cc8 100644
--- a/package/sdl3_image/sdl3_image.hash
+++ b/package/sdl3_image/sdl3_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
-sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
+sha256  d2e4637ae700f72e5196b8fbd749850ed2e5e1e09c5a5be8d06ff55aaccf3b01  SDL3_image-3.4.6.tar.gz
+sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index fadb870b6f..43127c463c 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL3_IMAGE_VERSION = 3.1.1
+SDL3_IMAGE_VERSION = 3.4.6
 SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
 SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
 SDL3_IMAGE_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
