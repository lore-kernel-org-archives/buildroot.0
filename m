Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED87CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10CA0608BD;
	Sat, 10 Oct 2026 09:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKdiGIEzLtvR; Sat, 10 Oct 2026 09:27:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6E066090B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624458;
	b=E59AHj3D+2VlI9SCqzW8XxxEVkt1nquJor1RuM6m4mkYHoTRhLvimRZCipwjNJatsmFq
	 7wnX7FexlMWSUE2xkG13V0goAwdwoXcAskT5005/KM0++J+MVyDpj77PbW8SRHMEFC17B
	 qDuD1hVcRe2c88oYF8KY0Gd/y5YI+gTMBRaYr398oAM6xhTfrQTfLrjRCAsVKqsVQmK11
	 sfKfb8fsgPcwqX45phbHBqI614GodvLlgC1NyDcRiR9xkesL+P8pUtXCMmdJd542AhYkg
	 ZW9HTZQBETq1G/REhC8uovVJ810s410LnEHIrihIE/dIX75N5sIr+uCOb2LXMPXp32A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dhdb8R6/qYZo1VwWipWnO9v6DFyKvV1dIKmVZ5ay4yA=;
	b=T8WKxeRKblDtmWIX5jYE7mfhl83CpBmWqFoH9lS9Q3yGqmeG7o9+L6qYYFg5iO8F79Lq
	 KNpb7OVotw2V/onXCOQAfQPpMvtZdQddglYDH+AAzjNc+PobYsNl0bCpwh19qlbqijQZH
	 4cM2v6/0UwBT6YE/EubJP6P31wb931syh9Z3LPqjBzIoSDrN90I2T4cAIFTIZAz4KvujJ
	 qgxd8LJKqNaju8WhR5SXM2K7aIQKgRAbB8cUvXhfsPchhux3LK0ib9+L73jkxIfX4JLsY
	 X48NuNV8AvlXH/HruotuSbM1bNiZLrFu1or3xVVzQr7eDQVYRTTLMKqNbsUKVKwOstQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624458;
	bh=dhdb8R6/qYZo1VwWipWnO9v6DFyKvV1dIKmVZ5ay4yA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qtNCvF0owbYvChEKV/beMsAP/W01tm9b7afz4j6Sy7qrOmLZoJMKVgyl1o0UTmJBa
	 9XFkKvfHEH8EQYev2J5krtTDtv1OpKqq3vF6FLB82XC0WCOaNAlormo77pEZ3vUhO6
	 dCA6b22qEjmK6I5K9MmxmlNbVibZu0CO/c1JYdS/UBpjzmDYjYCFWuwZSku3zozBRT
	 n7wW7SyUnJJnQzPmf1RHLuioXWY+Cy0nnPByJwn4xYDQ+WqddGeEaLkhJZxGdTMjfe
	 CH5Gu5P8iUCyB6QiLoKpWKL/a7EPMdTpWnZoKHbMEeyH84s2zCqPwX4+hNK96A0151
	 UiHt9nZU+FQLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E066090B;
	Sat, 10 Oct 2026 09:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E704DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D7F81166
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nypj73Z1Mb-v for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E7268115C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=cayFDZUnZBlWelfOB/+bHD9ho3IrgcYA1ZAZBSG2j1OF7nUb9EK9q3zuv9vjCAMXoIl4
 Fr3+twd6a+Ca8q/A08EFcXZgWxspgPzQBmg04RGQEQOjLB/Af8Y8bt7upNThxetHcRKNA
 ZxIRAnvaw+b30tChemSa8fgMvwY35Sv/M3M8Dutdk4doASoTZHO4MH0B3T3Ovkv7H+bzS
 SnMf1ZzyZJ6vZyYAdI9f2hOyR73aLBNm7j0bRonTL2HoaufxDMo0AX7PL2VSy07BIikYN
 l366PO5OsDlBpVEuID3p1r19ehk+i4oaGT/x6g2jfnOluIv6EGKL9CXO5xirVlpPJjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SDV5ThjVSWjVzldCDNoKreqbdtxEXMumrX6ftYWLvq8=;
 b=nyn9v/9nA07ON1AQKiOWCAIA6r8MOqHEBo1wR+DXOqkXoJKphAagzsjGRQr/9hq7SC5k
 mZ0/xeo4pCK/ZWKKxOYqPHcbS9nKDTSotpmmsSpW39ehgUq5ix4iDiqkkucheI/KgVXx6
 YuOj0iV4DrrQHyS3C4f5zNAv/Ocz3c5d5pNH35qZijKtmS3GfDg+D0AWp5CO4T/CBZwC8
 DWCxQnuFnjQeVkW2unwaKq6m5kGUvd3tC085agAPa16aMJHS8nB2S/w85TulfUgL3NHAp
 wWnackNSDE/khCGrOAAVtkwM5Qr7b0vp1YEudAAv3MuilwafzcIodNa6Sc061kPTFkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E7268115C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57E2B8F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:51:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 30f18d0456decbd22d7b92e6bc222250c1274e6b
X-Git-Newrev: f07a7086dc0249fa9e36183eb913be2552f55552
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.57E2B8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.15
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
Content-Type: multipart/mixed; boundary="===============4381151497644047325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4381151497644047325==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f07a7086dc0249fa9e36183eb913be2552f55552
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://www.python.org/downloads/release/python-31215/

This fixes a handful of vulnerabilities:
- CVE-2026-19445 gh-156293 Use-after-free of a server-side SSLContext
  when sni_callback switches contexts

- CVE-2026-19553 gh-156793 SSLContext.wrap_bio() missing validation of
  server_hostname parameter

- CVE-2026-82049 gh-157190 tarfile extraction filters allow file modification
  and content disclosure via hard link to symlink

- CVE-2026-15310 gh-156002 Memory exhaustion in zipfile in
  bzip2/LZMA/Zstandard decompression

- CVE-2026-19672 gh-155999 tarfile extraction filter bypass allows creation
  of directories outside the destination

- CVE-2026-15806 gh-155694 urllib.request.HTTPPasswordMgr credentials for
  one URL scheme sent over another scheme

- CVE-2026-17084 gh-155292 StringPrep algorithm considered Unicode codepoint
  attributes outside Unicode 3.2.0

- gh-158446 Reject float format precision near INT_MAX

- gh-157953 Update bundled Expat to 2.8.5

- CVE-2026-87910 gh-157265 tarfile hardlink fallback ignores custom
  extraction filter rejection via None

(alternative to commit 6e0a068475062968db52c102ec2b7185f8a90d1b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index cf4b6b8667..7949607fb7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
-# From https://www.python.org/downloads/release/python-31214/
-sha256  5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a  Python-3.12.14.tar.xz
+# From https://www.python.org/downloads/release/python-31215/
+sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6266c8220a..a842dab2a9 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).14
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============4381151497644047325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4381151497644047325==--
