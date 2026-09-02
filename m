Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C82C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA1CE40B5A;
	Wed,  2 Sep 2026 19:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bd7nSk-Lw4Ps; Wed,  2 Sep 2026 19:11:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58FED40B57
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788376290;
	b=EMBfibu3qv40+GoM+75h3aZBjeHOZvjyOYbC7qXC3FrFyAcjracvcIKVRMZNYCmGIRhY
	 sJNCMBYW0oVNQ9DKig1v/Ft1rFQY++rLTvKEszrYrQ6GwJE06NOIMW5yRMsfQLzCVyCYe
	 owD8a51dFnA2VqKcKlISoldOFGaVE4xwn1D/EThkd/kW1j7SQb39NEHumNa1RB8M1F433
	 g9wuxej+89rHQhczoHb3TwKeY0G8PXZOALVDOczCPcbb6iXP5jBU2RkOCATsi0LZQICW6
	 WmzuxUtq/rIfygYX3rojJBR82+aq0GqFPMLhE5rusL5qf6w61hzufZPrQkyaZzCEc/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788376290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5SRa9OKzxm4gNf7XExVzEKOft1fCUq+TgZkl1m9+Lxs=;
	b=kt6HzYheyT/w+PpajK72f9OyobZA/AeWK3xqwNTdvw/y/Vnjvv3O6MYw+BDvXVqXOC4P
	 K1CR59F9tWg6UJNzqU+mjGYwhDFqfQRXjCPjeAgvEYDAXSGtn7TrYQNv69jo+0PZ1VrSC
	 QwmHpRIu6KMEpHMOBbVZdpP72wuRoAL6XbFq93f/Lw+bKRPBliRFPQUg9by4LuzUI8xI5
	 KnsJ/k0kuBInl1RH27hguKjP8v6YdJ+BPH9hb4X631Vcy1RF3YS7jCLRZixOvzQVBe8AM
	 E7P3Syuz0POey6kNRIUSCajzmfy7e7d2hHltZNUqjg/PsclYJLFJkTmUosyBsDHVilA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788376290;
	bh=5SRa9OKzxm4gNf7XExVzEKOft1fCUq+TgZkl1m9+Lxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T5fKCWORrI88fuZB8sGj2vpPgEMao/O6u9j4tpWzfcF30Qr1pZAAdbqCBqOBUK3rD
	 gPDR9RKCadni2aMSp4mIpsQhyjv1bsF/MhKoKatPP3iP2XDZ6P6TeCoZQDYU5LHkFr
	 HQbirKwuSyvQnnL7lRGcFWpXik6WiJFg7xOso0KUmVpAmoKdowSea6HLan2n9fnr4k
	 6+b9rG6dyhPzpdAcuy/YD3cA7Ejqbhxk/os5U879HhhoF+EyDqS393eU0zIw4Mv9Yg
	 IXk7+Xcjeg+eU1y3Hf6r7EJTBgjAddHyUj0+FUYbZZTlVJU87fT8BpIhX6fMfjOCDX
	 AbScr/JFbNrVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58FED40B57;
	Wed,  2 Sep 2026 19:11:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB00E2FD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A070140B5A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmGUAEO2SvHz for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:11:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ADC3D40B53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788376288;
 b=c2u4pP6AR7t7cTf8zs3DJmLZGKNlEX6vIuSoYno7scDrl88+jgd0WloaHzsLCBN5lC59
 pTaXsACi01+uwM/iGjhkYbFPkPLzBPDR2kygs7+s5BdgLGyRgmAUpEmi9/gUC8owdQAiW
 u1LoDTGdmHm2WupZVLqJpedRS8dy8jMpbzNk8XJ+GhQdu3g1j2Y8Ua1d5lWLQ75UCGrOu
 AG+KMzEL4BN4Qos1SXdR92+EsHqSySUnGfViC86WilscGochOB6N/c43F5rk3/C83fJKP
 H5i88ZJbK38Oy5r3vG64aP49s0ReE2hdU7QLrj78pQhGNMD96CgHfponbzwNvv2f2kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788376288;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1mObFqhDwmVxNcbegccO5HnrkOTe9CLqh5Qifpx9Mqs=;
 b=shI6dbJ+0ztI7cMcd9w7G9TQhGi5Y0ltdw2QxmnVYsCT8PTCmyykgbBlzqdwU9QDfcFa
 UlFRp7mgdtOq0vnnyy3FaXGNTWAOkXgQnaLErhA1q2vvA7HankIfA1z1BUchHy1a3s1a6
 sQPlLfYwcxhaG7fkFktYU2+OTHcr5E2C/OrbozNOPXQM9+P/YqFqRW5kvnseQO8KRzqDi
 MZ4x5aZNAT5LKvFAk3zcVsauJ4aVAj/aCQU38LOmYY0xlIspoLXlSG//yG8CgcrDEOPgF
 SQaeKTt49YsbEk/mGd3JnRWMAbyzrDtIl80gu7Tbk8I7nDGKO7sNwASGUN39mw55bJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC3D40B53
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:11:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFF84935B0; Wed,  2 Sep 2026 19:10:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 21:04:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79fd6241e4347f67d659cc02669448397b458d52
X-Git-Newrev: 94013c3a95a849b6a8d8db5321f9bfea4c389b10
X-Patchwork-Hint: ignore
Message-Id: <20260902191028.EFF84935B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exiv2: security bump to version
 0.28.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94013c3a95a849b6a8d8db5321f9bfea4c389b10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

CVE-2026-68546: Heap out-of-bounds write in RemoteIo when reading from a
malicious remote server (WebReady/Curl builds)
https://github.com/Exiv2/exiv2/security/advisories/GHSA-3695-mjv8-3r52

CVE-2026-68547: Heap out-of-bounds read in RemoteIo when reading
block-aligned remote CRW files
https://github.com/Exiv2/exiv2/security/advisories/GHSA-jcgh-p9v3-pw6j

CVE-2026-49275: Out of bounds read in CrwMap::decodeBasic
https://github.com/Exiv2/exiv2/security/advisories/GHSA-hxph-pv7w-8649

Out-of-bounds write in RemoteIo::mmap
https://github.com/Exiv2/exiv2/security/advisories/GHSA-vg6c-9f6h-4x5q

Out of bounds write in http.cpp
https://github.com/Exiv2/exiv2/security/advisories/GHSA-9v3x-mhg4-wwv2

Infinite loop in QuickTimeVideo::userDataDecoder
https://github.com/Exiv2/exiv2/security/advisories/GHSA-fgw8-p7pr-37cp

For more details, see the announcement:
https://www.openwall.com/lists/oss-security/2026/08/30/1

Notice: the RemoteIo-related vulnerabilities are not applicable for
Buildroot as exiv2 is not built with libcurl support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index 7c497cf0eb..ff8e82333a 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756  exiv2-0.28.8.tar.gz
+sha256  700b76b97695b2fab4ef8c79619c68ae57d09e0c130724791cafbd39e0eb4aef  exiv2-0.28.9.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index d45acae34e..7c9ac5c6cc 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.28.8
+EXIV2_VERSION = 0.28.9
 EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
