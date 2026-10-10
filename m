Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27EB408AC;
	Sat, 10 Oct 2026 17:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uLak2Os5esL; Sat, 10 Oct 2026 17:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DA5134080D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653037;
	b=O9JCmzfsR/CR6kFDdy/ub7W/WsNo95/cMF/8L/PrqKY2k4KLxC8HkoWd4B0i4KX6Ak27
	 lqSfT0Gdlbc5D1i71lQdofU2zK1xRnNbajWCnbmiLRFxjKuCu2XEoDKD6ZcyITv/5O2jv
	 IorE2cIsc6rfLyVgPdKOW3kxQS3XKcGkuzDccS0LSijqFMv1EEdKxhS1sGi4h1E+biaRE
	 fpfCxp2RzqizNKxEtJICmOUeIZKVsdpFGd3kmUsiNGqszGirjZiahbXaokIFLxz3szImO
	 Wbdk4X+nmLc3eztWApGn+JWEIASCw0lvpYD84ub27QzMSCmehhf+VT35jfpmB1A/A/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tnUu1om+pXsFYj3sQzm+uGoula+6iMAr/aZ1o7RPeJY=;
	b=nY+p4HRf0xUYF4IDZtEmzwOw2GMwcnWtVS2h8dfzLCF4guitL4TyHtKdmkF2KY5aSTEf
	 l28ASLInPdL80HEEKvCkuzNDFk2NsJd3ShZ/HtCdt5sD83VlffSYWo2VwmT1dzDzsURpQ
	 Ui+vuI8/DmPsc0DBbIdjexc9ezNZ5nt+OByyPr/J324VlANTPS3FznQCgZppKuQtEF7bV
	 aVJSqN6Ly9hrSOf1Bh89kDrvqKQ3B7Xt+KeR7K3dcZk1WqeMCI6avK4RR79PKwqZg4wVV
	 0nK4a0YdOq8nOKPDLxcLY2vl7aMJOFWKbjtwWC58r4D9qGy1Iqbdq4gL1iNMsl46drg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653036;
	bh=tnUu1om+pXsFYj3sQzm+uGoula+6iMAr/aZ1o7RPeJY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FWgnBSPIru2BNE7OhooAtnPOKzDFO5boWTz5w70TYRpx+XmKgmKZmI8AWhqv1yN3X
	 K7ehc/GZuyABVDm2iR2Cer85Xcm8avs3bqZ2pUG7PRZuTLn+t9kCm0yDOJJxf3uwhs
	 m0U6sUNIF4BTpLJVJZ53mGCPocsMwmxGiqpYPtcOjlMfNxikMCZ+T8hG3/PcSiie2L
	 /L9r8eLtDjm23Wa9M0bu9DOYn4m/S4mvslZ0RT/PW24h4MVwXO3ALSFkvhdE3YcNdF
	 /AkP0q4Lw84ZayPpa17PeJlvcnfrY2e0p2VCsGDjEM8bjy8I1jmX5YKNXouTi8Ia8I
	 osaU/FAtTH4qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA5134080D;
	Sat, 10 Oct 2026 17:23:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C11DB1A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6FBF60668
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqavXKu_F9io for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E6E836062D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653034;
 b=J5N9uRHgpKHG+BUl2EcJAY1TFDzwzRXDZMPbPJ9XOe15Y0qbODd12Q5br3Da4Oto/QxX
 ydNPQZ5E+SkGSnNf0b4BrDaly+Lza16afYOEYHTc5mx7slDUALJxMGmTYJHs64zTDan77
 mpLkYWnugcwr25gam+nM44x82n3Fumvf4ysi2CEdPvwNL9e+hQg4tVylbTjwD/j6EtNo3
 KyJuPUhjL46lqtiZ/0tProCA+KBxgBT8QW7moZeXJXqikncvBUIFnrbg+bA+/ZEJx5xsx
 hk0UL0IIHZxjY+Kc7vghDMqGUHu+FlytQBQZhHFo2xualIjdtjoUfGJURifcsCxjSuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653034;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hp5aPgImHviih5TxH1k+90ryn3Puwg0v08i7IGUh13Y=;
 b=B1nFMlYMkdlkvKqksPYNs1X261PZKk0TLvmCMO8ST0fwtuNtyT45gukBJEwwsiJoDrjj
 J0xTpxOpJQ0+unDJC1TNph3Cp5sM3cZf/HdCXve8yBAUTyWmvSSwtRuAwZ2pdKDI0SdGT
 d/1sW8S3T4PKcq9G9fp2BUArtFR3AZnNGFd5H8vdwhOvdz+xQHrp4BgMvs8JR2cnwKf7o
 EXekSefqQDH5NLWBe9XRvDUMLDNG3yH2RY+nDIeeyjUN451+/4tV3Qo20jg/UmiDtvimE
 lrcDxUaguXvG4blyaPEHUb5F3TQSHCqCCb/qSBG3IcP3IpFeT30y/H3Nx8Csnl07/FQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E836062D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4C4792384; Sat, 10 Oct 2026 17:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 19:21:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eedb2067d8660b31a376ccdc05dc0ae2ba3ba4c5
X-Git-Newrev: 2b9d1a8aa671982583864ca050380120ccf6ee53
X-Patchwork-Hint: ignore
Message-Id: <20261010172236.A4C4792384@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: add optional dependency
 on libtirpc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b9d1a8aa671982583864ca050380120ccf6ee53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

iproute2's configure script probes for libtirpc through pkg-config and,
when found, enables HAVE_RPC and links ss against it. libtirpc was never
listed in IPROUTE2_DEPENDENCIES though, so whether the feature ends up
enabled depended on whether libtirpc happened to be built before
iproute2.

Add the missing optional dependency to make the build reproducible.

iproute2's configure script checks for libtirpc availability since
v5.18.0 of iproute2, which Buildroot started using in commit
10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")

Fixes: 10990c576b2ddd7636f094f510a2ad1a5a80e50d ("package/iproute2: bump version to 5.18.0")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fe7a6fc304..344a6fa8e4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 IPROUTE2_DEPENDENCIES += libselinux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+IPROUTE2_DEPENDENCIES += libtirpc
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
