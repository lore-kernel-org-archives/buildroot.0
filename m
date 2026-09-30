Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC18CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D33B40DDC;
	Thu,  1 Oct 2026 14:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5NrJAHoFH3R; Thu,  1 Oct 2026 14:23:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9B5B740DB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864631;
	b=Ql3FoIz0kIfH72O38v5w0I8Qk6gjyMKWuRPCZT8TiSmXqy1NJAZPKsyXJG2EjposNk4F
	 xl0o05InO15XAW6IquUzmg0XZ5my6BGhun+2lvWhrS5Ue4ApaIbZx96F4+oX41IpTeKlu
	 7mBvj8pbFMD8MEaZIWOy/1fbM8j8nQ9dabbUkMNN2XetLSOaJE0wwZremf6frRS4gqtIQ
	 VltHIz0JhTykqumm4QSA/L1LlE/raOYQWr+GXERoLThaCRQbA5z2bXj+6fBuuhWlxsy+y
	 rGCVRRTYe/Rgsd0U3lpf3K/CjUhRhXxEGO+WbV+e9SQtAJCOSWr2orsAd6sNjKJLRwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864631;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=keg7iZVWaASBViSVu8XVV1n7H/K9SmJXKCt3SClTJSc=;
	b=V9MavYLSLYdy7zmKK0XJLS3nT5CqN6gS5FonJ2REcziB9AwH9tv5zlFXqhkILGStnS6Y
	 uovVIbEWfNCsOrt7g6FQf6+6X73xl/DVNvgg5XDE4i5MGSj8RChAquLv6gmFpz1P9FBUs
	 9MJ1PhpDbamu38mCCBG7u1m9DtnYesE739fZXzsPSpgzALdfg2yboxH5Dj47zpfN1hlTB
	 prqcfeba9nxAR0i32MZsNQ3F2xNxMFAtWj8BV4gd+h/m6KSxQe3jF9CqO2seyEYZozp+F
	 IQlYFYBV34N0iOm8MfieeqDis7oVhDSbLIqmn+aY2UXU1YViBa76Kxk2gomATEROh8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864631;
	bh=keg7iZVWaASBViSVu8XVV1n7H/K9SmJXKCt3SClTJSc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PRpUU7/H2SeeFMdB6mGqFu2RMpBlJIMF54N9H1Hq7Wuu/ZSwb9yh7VsTrVyIncmWu
	 mDShjhMp1JrAj8LS8Kaav9Mpt5dHMouU7/qypi30JmAGaKyjHknyHMPStCvG+MLqOt
	 +PMxvaUzO01EzSSVrZ4Q1S62enESBJYv0REAm93K6v0m7faYIALVRtzrwrr/VJ/G1T
	 lmpe8hz0qFiXjGKzU1HtJNaw3PEgKUtXSUDGiJsTfrIkJWuQONLAajMO2FqruhHzs0
	 zZZLd5J35K811HW9TFVnGdtBzZSdaRsbXSjsXoqi+BajmIRcY+i8Dj78uPgRrs3Bav
	 ZwX8oA2WvviyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5B740DB8;
	Thu,  1 Oct 2026 14:23:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A923D22
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55C4240512
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qMU7XkxqQnp for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 45D1240533
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=O87k0iKyy1Utn8RL8ZY+4BxHvVRqi+3vA/9rWQXG8TeACIQvTWpot+bGdBreH/ZIlDfE
 yULQ1Nl9+YuGE6NzLBPe/NA/Dk2sUXUlQ59UDYgaS8h7t8ZOfJwMz9mO6dIeMQUktKYFh
 cdzV49IBA93HAu5gWEp/TvC6sP9aSCKKG11b1B9ucdtAGShrRKcquPho90o6fZb2+/hS3
 U3ScZyirGs9b80tmTDhr7meYf8q6UPCNGB0+ev36+SC4J31/3MeHq6D0t4T1ZXM4NyQv3
 cBiSGzwyHQIa9olRbBLfAn/d7iTbtD/Ga2Odwe+7OkiuBkuv2SKQVunRyLX8+OoFx9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BaI+kLdd27BbLth8mhFufucoPGBzfNQjhc042QKMnGI=;
 b=or9b+IPcrmi+FQAjtRwEiT3As/yENxMBd4y5uFRkUHCsrZfjMPe4wsKMF858KWsR5wi/
 2xlgxF0Gy1JGZcrTfduaSknEp/BFDfmVYPC07V6e7TKTx1hDUgRsHEzBOyl2ZvqqQzUmU
 xQLafKVRnCUECAwJrhHhnj6kH1vyU95IdX5XQJFgTBdOv1Ssr97fTut6U6DCGbD4+63Dh
 PC9cTRmM5Sikwu4ENMv8BZgcBigX6eZIjRr5gEWxuYkDZ7U89Og6aSIrJKZyyzM8GxXCa
 Yb0QJHnR7m0dEf6NiQsGo8H/UkoecNvR5e5+gs/nVssQuMViMeRDm7KeJIYQHxA8zVQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D1240533
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E1679843D; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:29:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 36df8e9c46d837b9daa86020be82003f4735df44
X-Git-Newrev: 6b94ee9448d32137d1719352286c04c3b1fa415b
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.8E1679843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wireshark:
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
Content-Type: multipart/mixed; boundary="===============1531508979217093645=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1531508979217093645==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b94ee9448d32137d1719352286c04c3b1fa415b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============1531508979217093645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1531508979217093645==--
