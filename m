Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AECCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07557612E1;
	Fri, 16 Oct 2026 13:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5CAJzuRU5lh; Fri, 16 Oct 2026 13:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E7958612F1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156387;
	b=YPS0HyOBy83pW1fAaDppgEpij8U1AgJ+7LRebPcDh4d7yRv6sqJ3eduuxgo4o4FBn2fo
	 tg0h1NF3TXnjoCQkiVLpXffklwZx86em52o29z/oQM3IxnXW3nyX74OJOGbI3y9o8oMe2
	 xHeAdxiu4tiQ2Aj4XF16V8owzGiK6MgcpUubO3S92lwn9ibkh0dWFlS2ON9ncOYh2rlMJ
	 vdkRTCeQF6vafBpnjh8LRD7xFM5iSIRM8XTlYE+1HDinxntH6yxC9KuFICdgEHg61/PXg
	 86xX4wmCljMxNYcr92yaceOQufZm8kX2/MQ2g+Ss23yegEt4gkGUq8UWaB+yn3xYRpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156387;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tWY0ZgKqg2eMH57Ki1F3dBNmKwAGiv0HdLWY35396FY=;
	b=Hftli2nqRPFerPTJ17HzthaMS7KS1ffpJJ5VGkyPbXNwWOXWH7Jc/0cI/IdG3qLwxjhT
	 g5YT4OX29ef/9C/qrpbTqURE/chDvQDL5E+gZsY/mKXojdX7iZ5Nwt3Ik/PBZ6YlCHeoC
	 hhqIuzc/pulqB2Ai1Mp71W1QhoFxuf/IXXGya0RhmfcG+VMxS95U39aJpOrSKst1p5b0L
	 Ip6XpjR8DSgGDNN+k46//qiyyETXcNrGgNWiErPWaqYk6LYLRbVkhIowjprMwTKFljNtb
	 N9RDhz8Hv7i7pB8+Gc1utH8SEMSzZveN+p3psj5WptQADCMxn3XOZ1SikLpRZB56Ulw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156387;
	bh=tWY0ZgKqg2eMH57Ki1F3dBNmKwAGiv0HdLWY35396FY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=clnOmsCnegDr18pVxIYvSIZELAXneHleT9O8dSOm45FRYoe/sKRvhMTNz55FEHFGE
	 lNrf2EdmOZbv7WdeVMvd3dc45AN8oSJRjmEk0TGXPerGEe8cGjCtOCsAzC90zARb5H
	 l9YyivLe5Bqu+uTJD9KqCGRsuXy6W0fLUQjJnJd3cPpVaO9QbpXHCSIr7DFQWRFqIt
	 I857lukT3/p8mc7xPetsxm9Q/i3CxvxGUreaen0l5+SXzZPHDYeZX8EdBqyfEoyblC
	 N2hxD18gck5iR2Kaj2EAHQ8UwkI86nXt8eL/jSgzBIPfc2sRgB3z31BQ5YKSG+CUbJ
	 N76Bt0tG84j4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7958612F1;
	Fri, 16 Oct 2026 13:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA12FF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E650B60F1B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpQ1QLHGznE8 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C33360F35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=cxegcWb7XFs4IJIZuAucmZtCfVvQMKifLimcg9rLMVeFVnstAc0kI4en3U2oGEtCykdK
 OVQcorxeT+HkwIQqImzMQOABjZ24M1n9WR3kiBFqWgeNVG3JwNzQ8OoFHQSb2Pjb2wV0f
 TZq1IAuPVgO8Wotem2L/MXkRIquSXnkQdTOtvTWg7V/auysMTG56HQao1gdq6Z0kpBmnl
 P8VJSOySd+y5XmzpfXZlmC1peLhTCjzi+2gKnCzJK6FA4IOFy2sZ59AcfOMfrEWId/LjF
 TnOX+SJlL7JQ/6JjHLjei89yPvuHghgYlu4oh7+KKfq/2mq/khI/ccoaABPGw0t8qwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4sV1PlRilzYJZlgEJgsKRpeR8VHc3KUp7UFNgUdslzQ=;
 b=EMp8S3inon7xlOoodZ4ceqkgX/ecXcTUWJNfhbbJlch+qge8j4pbDouXihuEPxJWJNAZ
 g7gPy7qSRBf91qn5nDJkFkBcHLP1Q/zDAF5Yix7BmdBSK6eXrZ4lVM0JKTaAamh0HRAzV
 Y6SDX57SDYHodfqyVbdTZpqPuE51hzkMuDryjHHVDbyhWv3lzSZ1OOxo7qy+4vJAr3+Ui
 7mD7rdooJsCr1rNw7pZSU8hmywFyqPRBMmcxTWLOCLrR950zlhRDpkXr4R2sQ28eGdKSC
 4zjYGSCS+A7HtYTNp4lun5z7MZDab4EiC5Rod0/b66UcuCywqQjTlBvhR8WNi/9ntcQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C33360F35
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A30B8F057; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:35:45 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1cde8415afc563e038d02fa536f09af11aa1c087
X-Git-Newrev: 8ad5be182ce19e3083827f40120da06f77069c94
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.7A30B8F057@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/qt6/qt6declarative: add CPE
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8633716718945646187=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8633716718945646187==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ad5be182ce19e3083827f40120da06f77069c94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The resulting CPE ID is:

cpe:2.3:a:qt:qtdeclarative:6.11.2:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2025-14576

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ef0f032677d8013db9782029026b63938a6eb275)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qt6/qt6declarative/qt6declarative.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index edec67649f..02a17a580a 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -8,6 +8,8 @@ QT6DECLARATIVE_VERSION = $(QT6_VERSION)
 QT6DECLARATIVE_SITE = $(QT6_SITE)
 QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
 QT6DECLARATIVE_INSTALL_STAGING = YES
+QT6DECLARATIVE_CPE_ID_VENDOR = qt
+QT6DECLARATIVE_CPE_ID_PRODUCT = qtdeclarative
 
 QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
 

--===============8633716718945646187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8633716718945646187==--
