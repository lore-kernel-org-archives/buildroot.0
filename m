Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AEACA5FCB
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E7460C1C;
	Thu,  1 Oct 2026 14:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxlL-F2ZOyoV; Thu,  1 Oct 2026 14:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B0ED60D6B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864587;
	b=pcwqtPTFIurMpNH0Maqfid1OI8YwZTUb7fObSczL8JnAJjVyMZP/FoSzZMJHUM7TaGUZ
	 MorZTWDlSq4yHg8tJmpD9IRzC2nEK5fX9DUsRFwMCet31678lcXFLneJtrkOpb3GQJBL9
	 TyuM2e79fp7XzjF9FnIB7/S3r1Lg/l1ghGPUCNVGct5Zam7/FUZazg55kg9gCZpoD7GW2
	 wiQv3ccl/LZmF3as4uKNqiOPaAi2+LeZNd5nm+O/BZVy72YFufxEILvIIruRAiByI3jvo
	 rq9/4qNLvge9fY91IXV822hUAdNbrQSawDV/3pvDZBxE4brvxIkRZnzTekllnaQcTEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wTg/OQPYeDgJRkg960A/SgLdU6x2Wm8R0LtNKK7H0E4=;
	b=WNCatiMPdxrZxozie5lygjiNlen3g5790iExn7L5j/bGw5/8LEaxDxyeHhOB9k10m1UD
	 c5VgPOWBd/2d8qabgOAvaKoDCTksUjODlkOR1Ia8DiSise1N/uzrWJunqAX4TH4/B+0bF
	 /rL9sUHKE/ErDiftGE41U+Wy6h51e0Rft8kvo6u0C3/BIWzH55YhG5J+7xYtxTuJhhjyL
	 IrEwRQpiumMRg2CqsNj4ixyJuoLtpTdcDp/G8p7w71T42onEgmdaizRTfN0wm7/PPmWdI
	 2loJ30VNer1JVuc8OwXnEb+s898X0LoI+qTksLFYEA5tx1vAkXJsB8VL2qJlRTuyeBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864587;
	bh=wTg/OQPYeDgJRkg960A/SgLdU6x2Wm8R0LtNKK7H0E4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LyaqXNXPnC9L3E8iGL7Aha6n4O0sIQzS+joaWneomjopt8RFgB64b8ss7w+ZNPMDw
	 reUwdCCKwKYua2t4w7P9J1mZY5Te+3egSBFekrhklug8Tf/M4S5oxdiXnq5/q9F14M
	 tbPyM021IMMsQFC0Ldqk4sRYKYWHmkkEKGfGHhn9IQUdhOECymbe/ACJ0CA62eW/OJ
	 JqXeiCQEFHKR2XzTCbAvgMMO6u+iQbDNhh9/2aQYrIDw5v2HMKrPwSiO87KND753t2
	 VBTHfKQPWqWyq9n/N4Ba25aCJweRpCooRIUR/JaIozTzQjyQMWF5kS0gmY8o5DcjMp
	 4yZz0RvjTP3Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0ED60D6B;
	Thu,  1 Oct 2026 14:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C68263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3748E606CA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7vfutx8B5Um for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B2A26070E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864561;
 b=DKRNkw8OXXYfe0MdY55gV2DrWA6FY5fuT++6e+wnseozbHhokKNDfFCy7Tm6YWCwF6lP
 BVsX9isBtOXPIzJp1sRYnVkUxBlaQXSJeHEJN/g+ymwWN1ozCEkCcmNgkG2Pl6pdzZUpM
 0S/GUushAQ10et6MBOvcDZuK6el+XoBxu1lgYnCh2b/6Bn5vPFW1agfmwOyTFk5Qs1lz/
 v8ne84Z87065GxlWrXgSveLhAn31Drxa3+4bOHhlmWyegQEE68timjMrhTMKdGJc7c/f3
 wbIs/oFs7W6dfaWimqZ350x+CGSttoEPlfuBNugTSJYlYadCAP5rwhIw+Ey9qs/Vf1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864561;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9mXHAgZCJCZIMQBW6f+Glwp8vWiiBNKNCVrPourBcIs=;
 b=gxXksgKc4OIrAV4734OHtjLvJNKdeiSR/GxJ0H9NzQlpDrKvDOZngj4dnRaBl3BEwZTs
 m0OdNSLvx1Bohi0zoGdjHpfhycLkcwu/XWY8/N5e8jq54AEOoRlPZK2HdV6BjsxqX1b/8
 jEMibwsECsTvIJTpurypw/sc8jH6v0cNPzVLqCQ8/t3Kf9bVGTWqVo0IzGe12XH/ejwP4
 bYcG8en6Gzizg6FYEOkmZHGU+aWOoo+eXVknvkInjjeD1sbBISsrHRMmx4VIRcHoGJHm8
 d2Yapn9XhmmZwb+vIDhZsq6tH1aZmjd1s6upy1SIqJlnRA00BktwrwoT2WJ/Yc7dBeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B2A26070E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9736B9844E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d54bb2aad3279991e09893d03692dede81c8a1ef
X-Git-Newrev: aaa29d6171c2ab245beb783941032a52b7a8b226
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.9736B9844E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.4.19
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
Content-Type: multipart/mixed; boundary="===============3124286439747506906=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3124286439747506906==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aaa29d6171c2ab245beb783941032a52b7a8b226
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- wnpa-sec-2026-93 · SCTP protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-93
  CVE-2026-95389.

- wnpa-sec-2026-96 · IEEE C37.118 Synchrophasor protocol dissector
  memory leak.
  https://www.wireshark.org/security/wnpa-sec-2026-96
  CVE-2026-95395.

- wnpa-sec-2026-97 · SPDY protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-97
  CVE-2026-95387.

- wnpa-sec-2026-98 · Microsoft Network Monitor file parser large loop.
  https://www.wireshark.org/security/wnpa-sec-2026-98
  CVE-2026-95394.

- wnpa-sec-2026-99 · CSN.1 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-99
  CVE-2026-95393.

- wnpa-sec-2026-100 · MBIM protocol dissector crash. wsbuglink:21549,
  https://www.wireshark.org/security/wnpa-sec-2026-100
  CVE-2026-95392.

- wnpa-sec-2026-101 · Sharkd utility crash.
  https://www.wireshark.org/security/wnpa-sec-2026-101
  CVE-2026-95388.

- wnpa-sec-2026-102 · Frame protocol metadissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-102
  CVE-2026-96422.

- wnpa-sec-2026-103 · USB HID protocol dissector infinite loop and
  memory leak.
  https://www.wireshark.org/security/wnpa-sec-2026-103
  CVE-2026-96421.

- wnpa-sec-2026-104 · RF4CE protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-104
  CVE-2026-96417.

- wnpa-sec-2026-105 · Toshiba file parser crash.
  https://www.wireshark.org/security/wnpa-sec-2026-105
  CVE-2026-xxx.

- wnpa-sec-2026-106 · Profile import crash and possible code execution.
  https://www.wireshark.org/security/wnpa-sec-2026-106
  CVE-2026-96419.

- wnpa-sec-2026-107 · TIFF protocol dissector infinite loop.
  https://www.wireshark.org/security/wnpa-sec-2026-107
  CVE-2026-96418.

- wnpa-sec-2026-108 · X11 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-108
  CVE-2026-96423.

- wnpa-sec-2026-109 · IEEE 802.11 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-109
  CVE-2026-96416.

- wnpa-sec-2026-110 · Catapult DCT2000 protocol dissector crash.
  https://www.wireshark.org/security/wnpa-sec-2026-110
  CVE-2026-96415.

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.19.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 633d368bae51b20081e31d5d8925705e62f806ef)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 3d8fdb6131..b17f4bcf17 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.18.txt
-sha1  482fecbe21a876f53a26bf5beaa5b0ee0ad16e50  wireshark-4.4.18.tar.xz
-sha256  f77a7939983758383797fed0a34a491f785e541cca397a7a44e9cdd7c6f847c6  wireshark-4.4.18.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.19.txt
+sha1  46c2805407197048d90dc7eac9f0a4a19d13815a  wireshark-4.4.19.tar.xz
+sha256  0499dddc0aeea500bc65196714e1e01097742efbc479a2d67a9a8b5dd57d6d04  wireshark-4.4.19.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index c500a49336..a67b915b5b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.18
+WIRESHARK_VERSION = 4.4.19
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============3124286439747506906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3124286439747506906==--
