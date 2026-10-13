Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A17CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9582D60760;
	Tue, 13 Oct 2026 07:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9GMdmvOcGdC; Tue, 13 Oct 2026 07:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 913816077D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877565;
	b=ArZLat8iflJTin3WIPGGlojeSwZmkdg5f3tPrzdXOzlvfXDElk70MbRDyjSjIk74mXq+
	 Pi52/y4hu7lUn5ldjVQWltTsZ6LsVmscH+MbquFNJXvOrMo6Pkt7FQuYewmG2MT1hj/e5
	 Yycv8JYS48u6pmlxSSZkqepogkSJ4fo/vl/0/gETC9eIer6qEPrszPeeC9OcVEEewPctR
	 4dnrE4HoKNVnYpC1IGqd8E/VnDNB4rO2XnA9bxiiUJH7sVCXyvHhr2Fs9ikvCxJ0E+oBF
	 1VeK6dq3IDo8MG+rjB6WxPfQiGsjX5COqECV3YZNZZMaftFR5S78Mq4aserz+FM563w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lwn3O6mIf4/sZx8aW05EnDUrkCC+Iveskc/Fey0jUpI=;
	b=LEpl145Muz8F+yP8x7S4g2BibAvfg0jwCCTLEEXesgmJ8cY+ejnaqCgdM5Ku1u3xEJaI
	 F1691waOQol9z89gVbRZMwXKtJ+Z3WKaSVGNjYrABQ72OF516LynM1Vypgf1judx8Iu3/
	 ZCeSWCDQr3B5mHL6VrC/jQYh4L5mtebtPo4m7OMSMMgrFdtvym6x8iKbQQGNcGdjEsZIf
	 /27Pb2uDbvCG3ZjRRxibu5gO9d6H6OHJP1JhN83hFWBPx8nEibn26Va2gNq1INDRLDpAp
	 9Egt7z9P7VpxxvFZP+693cicfzr30/Q8QicjA43i0WIH+tu/gmVvRvux+D1xvZvMZOA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877565;
	bh=Lwn3O6mIf4/sZx8aW05EnDUrkCC+Iveskc/Fey0jUpI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TPVfwgq2L35LIaCSwHg145riQkyyo+qcSw1mvBE74wYl7BboNl102ENruE7EGMbAm
	 vLZz/1itIMYqZq3IPl9zHIr0+SwC4AunHD2caJmETKSrCOcUn4xPXPykYd+75SNxRx
	 Q4pkoLLN8zPWeXwNLRzdtOCfEriFSSGt+P7f0Q0Vy2rHauY5tXAtsgLPxSbCqW5WoV
	 eO6h9uleWzsy8nd91XlfZGnRUpyYHa9ZYTd0h+6ffV1wbU18MvzFm27HrAD8drOIxM
	 oeXOiXtML20jydd1OVYjgzIXdC7duaCxorGdpKwUfO/6wDf9K91ssOJuIKOEZIolJr
	 NAngvtxwD9R6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 913816077D;
	Tue, 13 Oct 2026 07:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6993E129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F5D74005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilVbSUBiOtDR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9C91F401EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=RJLfj2ntZcXae2vNr0JEdcBdxQ7i1HaEmdRU/klBZKij12hjF/GLs5VOHIfI87BM940e
 SO6yIcI+ZREeTnZ4a14t8uTX82iOBouzXtRHPx405f0NRiz+WYgbG9EZtg40u+b2sb5QM
 GpwRh4PTia6HADoY+qX4DRIv7TBYxLwXseF60d+NSd44OTpjC/xC+h5gtbNvVaJnvSq4x
 W4XHpBMiyHhFPpd1wnNozMZwTYvC/Rj5D2lfmPx7i3yQ4JeKs56OiMEmLjnIXUPvWX7wk
 H9m6SYV95KQLr0/qzxwgi5LTbiSKmEfYWgqwyjt4T8lWkcayDof3GTTtdTE4VLCx5Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UJDa6yncE8cfHNqR902fqgItAL/m48gI7WRF+Kb808g=;
 b=WjShfhwugEdWrje1P7Io01hU5QBf4GDAMLiujQ9tEsMG4PwzlJlVJHxdoNZvV75gaqzF
 iOqxBG4f24c8GsWK4IOnKzp28Fxf7pCFXwYXgY3vHVPmdonxlfxMCCWJsZK/jhuH+tRv6
 tY6JSeGDgiTRSwv3BozCitWltvjn7IShL/Vp3hdSNYiEMxchQs9z7f4p16x7B6xx4KJ+a
 e49HDehGb+gtvMGfM7uEkstPjziWZJkO1GlYUy5XZW2+Q4DCwnopiObfPi5z2Gphd4oES
 G7Ytf+DQGiEPFqSIKm1CSTqQ3oPH5Wahhis9C47onmw0jgHXbFjv5CcHf9S8YXHL6Qg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C91F401EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 211FC95443; Tue, 13 Oct 2026 07:44:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:42:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c5fd55efa2acf72eb78f7d415bf7f344aabd023
X-Git-Newrev: b35bd725dcca6d2ba3b36447da860964bf352993
X-Patchwork-Hint: ignore
Message-Id: <20261013074432.211FC95443@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mozilla-ca: bump to version
 20260813
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b35bd725dcca6d2ba3b36447da860964bf352993
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index bd396d1dec..9e0b6ff142 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  c28848458e8ae2325e46b15a243f1918  Mozilla-CA-20250602.tar.gz
-sha256  adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481  Mozilla-CA-20250602.tar.gz
+md5  c1afba5f4fef71dfe7b6328ddd3c26d3  Mozilla-CA-20260813.tar.gz
+sha256  81f0bd9665eacbb6feef13b0fa16fbb30162c09292542b1206434e569196dd9b  Mozilla-CA-20260813.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 02b4cf3d5c..a8cfdd66c6 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20250602
+PERL_MOZILLA_CA_VERSION = 20260813
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
