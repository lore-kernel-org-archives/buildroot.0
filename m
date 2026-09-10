Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E396C79FB7
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 07:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA3CE409F9;
	Thu, 10 Sep 2026 07:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBBZjio4U5Rw; Thu, 10 Sep 2026 07:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 94E3040866
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789025835;
	b=DsSqZ0TTEOA7xiFJp/CYX27Z5yq1E0mx8ymXuOtVx0izh0ZGHWwHj0sdY/QrEoIInWm0
	 +rczdXEkmIIpVR/o65zqVNeTSBHl4k/IDOnnVu8iC2LG/D7wj69rfOo2K+2Uxc3ScdoAn
	 22GJwtpgUio3LzpcEBUPv2m+UTzEWUEBRAfmly3ZZ7mQaDJX70RoPhRYI1xoQ2FRR9/M3
	 pefUAXEPZ4Q9lRPWfxKSPXGn1pK7jjUGxGAB8HEUCbyMjct+1a0i3IxQHWLqgCUZcxIq+
	 y4Hfe7rhTR22u9XzCWJLF4UZUNDtSiIEN9S4jBHCBa4SvVKGxctPw1MbIu/uygB+dkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789025835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=YbvbH2ulPhfUBej9muHo5yQ9wtLIJ6+kEzKBtutSQdg=;
	b=jBrQ0jikH+A7LVHiIYQGP7/a4tQ9ouGGgFm4I+XUqOhxg400NgGUkSCCQdCriiyJJWXX
	 Qv9GlO3Q1c5rzo5Al+2FmgzGXbQf6rJj5nhrB0qx9BwUzZKZKb6awNj4V76/xQCRwlAVx
	 QW3w84eAfkuIlSSuid0UZhragYnSU7hWYSCsni2DpkKBp1ca/Xhg+XQUbJlOXsFM8VaWb
	 MeO9ibABtsn7ftLbrb2Cz2gj5oA5rdPsgHsI/HLIyZQiE+PpFTnato7Yl20nAn/3te98H
	 GDiuteTuytDEmmf2dfWWqYnsAoierYttY3T4kK2eC1uNjHHiiMOfqqcoafvhno2JwsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=stwHzfOU;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789025835;
	bh=YbvbH2ulPhfUBej9muHo5yQ9wtLIJ6+kEzKBtutSQdg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ad9V6T83SX41gQQVNBcged1/0nhiDKGXNegO6E3gDxqXW7JZay5z0Is+S+dkR3qPs
	 sl76oZ8beHBi328orWZe5w+F6wicMCgBIqniyN3mdQVYl5FFjvmqgMhtzw0v7gLBhv
	 NZPlGQT107NROGjlAiZajm6qypF8hS29idHYvipgH6aV15T+coWquIuwtOv2InmLjO
	 IrqIXLIy6on0i8Hb0DjjXSsWU6Hdj4FuDNH+uiBHfEbr0fgdVh91JIBGUdVl2NTJd6
	 bTgKsv3SihZM9xsNMGhQU745iUQBRmUvAbUKwjeqXN0QMAcvpWHVGAos6v7OXjynVN
	 Y6tW5uuxncc7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E3040866;
	Thu, 10 Sep 2026 07:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 338BE2E3
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 07:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25AE240866
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 07:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pottq9EAK9qz for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 07:37:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C619140848
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789025833;
 b=RV+3sI6amYcXmxiT9iHKBaktH8sUiRlNnlD/l6TCcxgy8kzdGFx07AXEBbbXkjo95ZLu
 EjLNmQm6DW+EtCKkyH7w9mP61vcotoT8TeLWUfu6mUF7pLuUDWf7KySBfOTiYZnvun8ON
 iX9oiHubPbzDWsXj/4cfNneskrWXryMmBMTsi8ankAK0vqem3ELmlLTlgbAfDXKypD2Nm
 8jUjsWAg55RLO5SfIE/xRU1IYS+iWLevf9wEDswzqXZQz3Lbq5mYBA/zcnbF5lWYXICWs
 +Qpj1VcwQbKwmFjy7ATAxqyiitbuMiaDoXg0r/42GOZOPldJIrgOVY/Aj8tPcBRQgJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789025833;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=U0XzYpN/K831rHMkzi114SWB2vmj/XIp6cOpcKM2yRA=;
 b=YTggSyurr5N38mTM61N/nPEGuC0x2CzgAaMdfLk9Q+saFESYkuY+EruXbcu6XkgmB3mh
 fQdPAl0+3V8/XWK7Tkh2rgKPwfpaqjBwD3h8OnNKM9i4X6BuEx1unIweIqFokeX2RrbQY
 gEKec1QC1J9eduS7E1BpYxa2hRy4HzMG8iiVNpGPXNrwKpgMictZI98HgGXpN0vRYCcyK
 Fc8SysiHIn2MYmt0XVjT6oUwyLd7sRdL+VGXqXmpwVu75ubuF7J/zS2t2465WuwmV4PPp
 S7+iwFS+e81R5QVYtllu2khkqjf6QFor9IUP8D7wXV8GT0jhudUcvaSziNus4A8PSXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=stwHzfOU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=stwHzfOU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C619140848
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789025827;
 bh=U0XzYpN/K831rHMkzi114SWB2vmj/XIp6cOpcKM2yRA=;
 h=From:To:Subject:Date:From;
 b=stwHzfOUSsY/BuO1icRxG0v4WG1be2izIljV7RdwtQs6s5o8YH4C3NzHIuM9g2rJK
 cK/7iAV6DXDjSgaMu+fT8tWdywmPyKr7BZfE3CQxZ8u8WYc57FhhDWPbJzfJPd3b0R
 uJU4UTY35MxiRlC6UF5SjhBS6NktTEqAtoErQRj/en4d5IcsTwgXltdzCBEtoI+l2n
 YnPv8xxowxqOR2N3ESXjL2FNMW5/b5/CwJkrRFKTWAX2JInqKvNcw5HLs4AEK8iR4W
 yst2fj4zcKhfAear9c2KDO6SmrR+LbCtrx74OIxcZG5KgS/zQoOMl/YXkxfud0eSUC
 CQRb06WRH7Dpw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AE65A4C3C65
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:37:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50056)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4ZLC-000000002M0-0jUl
 for buildroot@buildroot.org; Thu, 10 Sep 2026 07:37:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 09:37:01 +0200
Message-ID: <20260910073701.6776-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.48
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48

Fixes the following security issues:

(Security fix for specific API usage, GHSA-2p8c-ff85-vh9x)
 If pcre2_jit_compile() is called with options for some match modes, and
 then pcre2_match() is used to perform a match for a different match
 mode, an out-of-bounds read can occur if the match is attempted against
 invalid UTF input.

(Security fix for pattern conversion, GHSA-q8g2-wprr-34m9)
 If pcre2_convert() is called on untrusted input on platforms with
 32-bit size_t, an out-of-bounds heap write can occur.

(Security fix, GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA
 matching when using a heap limit; also fixed possible integer overflows
 which could cause under-allocation of the workspace.

(Security fix, GHSA-fmgr-6ggq-9859) Added bounds checks for several
 integer overflows while compiling patterns on 32-bit CPUs, which could
 cause under-allocation followed by out-of-bounds writes.

(Security fix, GHSA-9qww-pwc4-77qq) Applied lower buffer bound to
 prevent two out-of-bounds reads while scanning backwards through
 invalid UTF data with PCRE2_MATCH_INVALID_UTF.

(Security fix for specific API usage, #937) Fixed a leak and later
 invalid free when calling the fast-path pcre2_jit_match() function with
 a match data object previously used with pcre2_match() and
 PCRE2_COPY_MATCHED_SUBJECT.

(Low-severity security fix, GHSA-q7rw-r7qq-2hx6) Fixed exposure of two
 uninitialised bytes from malloc() via pcre2_serialize_encode().

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a621579b98b143ec2e87173d63a45f475ccbce08

 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 17f15c0fdc..90991322a2 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
-sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
+# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
+sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
 # Locally computed
 sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
 sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index f2b5608150..ea841f482e 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.47
+PCRE2_VERSION = 10.48
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
