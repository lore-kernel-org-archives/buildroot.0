Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC6ECC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81A6605DA;
	Tue, 13 Oct 2026 07:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaxBU4elcp1b; Tue, 13 Oct 2026 07:46:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B6B4960760
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877563;
	b=SyztFh9aC4/ND4XnDgs4QBGtKCRUHpzrPlSscjTn17VeCIy/HgxPGH6ybpfPTSHXMzWg
	 ePbceRa0q+N711N/phiSNrgGalwD27pxTUQUAIcDani+gfyNQaZ6Fw4CJ3XPMikWEtgEs
	 tPKgXt1LI04BZ2tkEoC0Ocl1nhDIWMHickF2+ewWVFGGtTltjOLjxiNE9E6qNqIM6WbPZ
	 fn2GO4eiUoX6hchnKIHohMYBuvuReAecd3HrT2IdCjvfJNrTvo3GzTqQyx7yvpneR+vsR
	 CQeYz+7g53r3fw0YMQ19ROT2pr+Bu89/pJ6ReKvyZGPGWwWIn404NEKyA0AQgElCTCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gz7+xpVdR9XW3bLYGLYD509+iyh52V84oiDfQ6mv0dY=;
	b=Tvu0UwCk8d+Y8r4JJ0HPeMzAqk6TSf1zBiZFGlJldSf+vFoDurA85Beyo8DlrnGL3e8T
	 wy68Xq/wwerBeon0X+kE85pnIMCaps5m5qD/YwuscuRJXOM75lnDI+4PmlKD2OzsodDZK
	 sdzNm0efaWwxWbkXoDSISXM6+dnPWsYarHVKo2uBcM44LO2cD6FYsJ0sY4sHvThbeP2SQ
	 GkG5DiAfih8owB9nzHjEb0qckb4qG2xSngY1rNk8xDOlLA8foc6Rs2XcBsVSg1lq4xnsK
	 +/uCaUwEkyrQvVpV4qDYdVzZvdsn4ZgP0AJHyiW4Z97XEJrT61lqA+5N7p7+mk6ozJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877563;
	bh=Gz7+xpVdR9XW3bLYGLYD509+iyh52V84oiDfQ6mv0dY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NiyZ4ARgy28ycndO7nLcp7SP2fInN4odDTQHLE/kDnFu6VLBjB8lLsy5UpRr4eP3J
	 OYOT50l82HYVUrHFxbV4nhAx2wD9cD0s2uHTRKg0+c/2hy1Ybvi7gUYyzfilDURsNI
	 2YxKRXGDaLdzWCXGPAG1y9ZZGXmW3627+hqAxt+Nlflf+M+XTFCCil1cxDKlmHdLhC
	 YeDb++FEzkArWiOyGTWZvfUurZGpGQitI2kmFacUv2i1/g0tJtTJDfE53VpUX3oN2J
	 EH2vF86rrYAh7Kr1tyg7uY24sqO1IRHKl86L2maH3dFf+VsOKYb0ilETY7NQstCaYi
	 mbECxHOrfW8Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B4960760;
	Tue, 13 Oct 2026 07:46:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E07D788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E9F14005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MFwN8xBXMm1 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9084C400D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=dCBfihwhVH+So6xe2svHggJcPOu872sRfeLySEEn69M7e+DgccF5LxlK4imBNiQu7hMs
 agoOxFVLbBIo6tdPryv53SHAhh1XwZ8t32O/PGJvuwjZ7FzjBCiWMJ2ucpt6TzMviSgeb
 Ia7iq52ROt4H7RcPoYNTeeu2KrZ9ZtUPLCNOw77axzHE+sqJcuZTyaUH9sWlCD47h+Je9
 E4cLCLPHeIYoMrLDHdqlYul+ClMRNH0EC6xwG+TGU385Iw6rXjoQAvIKZcZVQes18UPRc
 g0dTFT8LGZDtOF2d/L25VmnNLDRuBVZFDuIhJZSahP0MMidsdYGh5KXWr0d7L7F9O3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nT8tc34FdO5j1uGiBzsDNZ11l1Sn312Y2B+44Lxmr7I=;
 b=Byw+W3RbO+OEnkV2eBIG23X5Q5GZLYkRtGRsYF7kQmBezLTKFsWbjFdNDolVQyfdEK4h
 0CpzCae7mWMr3ys4MQK8WNN86NPSqszbPxkxX73+UGF3bOlpGyBijv8vMOnhYtJn/cIpJ
 rev4D50xVibW0tqtRhriGkDMR4rLFdDPhwxjK4xvp2g7Yf1pqrGZ1uJX38pZDGl/AuabM
 Q4eCZd0t88gpWV6kdAkSwPNi1yASPzQj7a9UuNKDEKDxi1F+xAn442TH/Sp9e+MnWjRQy
 yA5WHJgBcrRIbzf8mHtJUwgS7XEuiwF8IIX/Q9P4Iol9QkSFNJ+jch7rckB7QS6P8iQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9084C400D8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 157F995441; Tue, 13 Oct 2026 07:44:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1361b5fc4b6318a566f1cf33b15b887febbd09a1
X-Git-Newrev: 8c5fd55efa2acf72eb78f7d415bf7f344aabd023
X-Patchwork-Hint: ignore
Message-Id: <20261013074432.157F995441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-net-dns: bump to version 1.57
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c5fd55efa2acf72eb78f7d415bf7f344aabd023
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 6d78a3413f..b5f8f1f001 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  af907c09ce60173408d13b93a0a0ab1e  Net-DNS-1.53.tar.gz
-sha256  04acb4f177d57c147dcedc4bd70e23806af3db75a532f46f95461b2bc9a94959  Net-DNS-1.53.tar.gz
+md5  5bd876dca96f71ab261fa6f25eacad21  Net-DNS-1.57.tar.gz
+sha256  7c98de329cb5d6a99abbb03aaad2866cb041092ed9936a7246908e170005b058  Net-DNS-1.57.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index dc5ba8fd55..6c119c2902 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.53
+PERL_NET_DNS_VERSION = 1.57
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
