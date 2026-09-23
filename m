Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819C1C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D938141E;
	Thu, 24 Sep 2026 18:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id DIegt4R2sMCx; Thu, 24 Sep 2026 18:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 375CC813D0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276351;
	b=NICwsiXQFDc382y7qgz/RyjwqUXG0uQzZqwGoAIh4SoXOeQmL7QpaCTHqBdlln8mbkmW
	 vKwoh+B5gFRiJxdmfsmH+f6zhzVA+GuWVamvTl1lNi7EGTuIEaLYPzzh7z0en5SA+dmhA
	 toXdgK5u5eJ3z6kqlPJxn9wD29ADJdVSZBiPFoZAXqg0X7CLDoFh9i0rw+mzkT09D8BCS
	 x9xYrnJUdsI4CB0EBFXAx4iScPo0VqCBRkZUAbCyYTmxotzaR2lT0VU25WfbPmoN6jKXp
	 53zQf2oraKaXloMHYO4C39JLPssN+BNxTiLyN/n7BMIc5Tj2IwP5Au3eyaDCS246sKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276351;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gG/LRdJDBUobjBpDFPgP/Rx7j+An2QHklZkC5ZCyD/E=;
	b=UVg6Pifo5Y6yZ0JZHR+b94Ge7pJwIg41kJ0MN1cairwXMIoir6fAC/RNEL8PfpOrJzwi
	 w0nU5V1OOpspQegZzx7LPGoDB1kIw/UIVgfsoYdSVJ5a0d6clqYCHFngDDIPsrhoehLdK
	 rUxJVAXUcAaV6JomPLj/hwEsDjye7OWOIgd0ulDAhYxazJ7ObNl8p+vWF6M+vLz431IVm
	 t4P4su63eRr3YYEh95XcKeT8O4ORVJ3DI8aETVq6oyzzSADv7X7DA0ACqZ9wpn8E9boeU
	 49tW6DAkeB6q+n/p+1rTgzPqhpCRyTGqP2KGtZizi/gI8vgyKx+Cs0y7xMYS4abUBAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276351;
	bh=gG/LRdJDBUobjBpDFPgP/Rx7j+An2QHklZkC5ZCyD/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hZLO9jUCbfZdnxoQFt8Bzx6hKMmsZRpBgFzD7Usl5eab6G2hIuVWHoksBUCs6c3G/
	 hcbjlfjg4VmqmFpJDX5HOExi+bH/L/eo4Olg5fRHIzZQbZxT274/CMMV96/b/ERgJz
	 06Nb5qNxsybFpuQ+gusGP+mAzdByF3pVww94GS9xSbaLp9NIvjpORj/2a0myGEERG4
	 eZkPitw0KVcYJzGCyyMDZLBD4TcBfTeE42+kKH2oA0GZ9S5C7IP8Iq9+tjoLgA8sru
	 xCbJU7eVTFueG6J1VrKW2SkP7KT/ZaQUcQPvotWxCkep2P+YdaVSrUSxngoPWZoU9o
	 PWYxVZmtx+4Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375CC813D0;
	Thu, 24 Sep 2026 18:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D4B53B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51851404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHYXUK4SbT5j for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8D8FA404C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=E80n4CoqWy+Ethf4guI859bjopOKXc09dQYHScrq2rty1hlNDCPykeOU9J+vDI9D7wY4
 Jkhwkg203jsFob/JrGA2PA1LrzYFRjzRV8KR+/zmqCW8R9966mL62l0Ro/6kqE08+KGOG
 vyRSSYlgx7o4MHGYmSTgSm6aEuzzfLQ5rNWQQSbkjuxyI1i9vaCf7s7vkhvMCQzXBZPSd
 dLM+zYyHES7KqvrRaYPjcYQoAR3rhIYJMQrJnu0HIAqI/WWRwPf7KnMcr65MZzM441TgS
 25Zi8ovBjbqu8E6lKhv8FbYZfALQatz48lWMZ5+n2l9dwn+SzdWZSZgXYUTJoEMDYJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wXfxAm+1yr1WgjubUTIfFQNbotAXhmK76+NYlHYZ2wA=;
 b=FtIPMWSfPFuL63JmPeQm+Qh1z3AMdanMpKPKwaQSq65cnGqLUKhTM8UPb2s9Sw7KVUno
 YSeo68ykDsW72pHpiaV+pUa7x1IHOT1bDzopdheH5ZfBr72T+wvtJS5DEgNtDqek3w14k
 77PmumaBgYNINRjWBoVqPQDYmqqxKxu6TDShQkIc813NxP4Geq+FW7LRox6IxPIBUjreD
 xR1HdMmwICAp5RgTvPcy6woEf0lYpAOmccsn2SUXrmIJ3JNuKJUlYpbBTd6GrRyaRGsTQ
 EkHD9s+fmqI3Nmq1lGmKu4tkSLrXuea51e7KD7UyrJ8fvgGebiaMMkT38XCf8xhSFXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8FA404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 309CD982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:16:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 31260954c4403b34d0aa5a09d17edebc3174952a
X-Git-Newrev: c5d82647ffab64ae0fd05ebea99bd6acdc783440
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.309CD982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/fcft: use release
 tarball instead of archive
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
Content-Type: multipart/mixed; boundary="===============1842430435784256073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1842430435784256073==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5d82647ffab64ae0fd05ebea99bd6acdc783440
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]).

This change affects tarballs generated by Codeberg, but not release
artifacts.
fcft turns out to have a proper release available, so use it.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Fixes:

  https://autobuild.buildroot.net/results/6792109a982924f4cf2b8bcc9a2ac7c12f5ddc55/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7cfa2371bc1ebe83ea1c74db7fa45f360a2138a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index f5a499edcc..0a4c633f24 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79e52aaafc0b57fa2b68ed6127de13e98318050399a939691b8ca30d44d48591  3.3.2.tar.gz
+sha256  8dffe750027618e01dd4e6bc9aa9c889033c7abe4a661e9294192b58b4556264  fcft-3.3.2.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index b9ce43b454..40b2d45a8f 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FCFT_VERSION = 3.3.2
-FCFT_SOURCE = $(FCFT_VERSION).tar.gz
-FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_SITE = https://codeberg.org/dnkl/fcft/releases/download/$(FCFT_VERSION)
 FCFT_LICENSE = MIT
 FCFT_LICENSE_FILES = LICENSE
 FCFT_INSTALL_STAGING = YES

--===============1842430435784256073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1842430435784256073==--
