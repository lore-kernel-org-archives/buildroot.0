Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54174CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE7940A44;
	Thu,  1 Oct 2026 14:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ex3Zdp_EkHhB; Thu,  1 Oct 2026 14:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 01DB340A34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864590;
	b=Uid3efjtrKwD5EFnGO5gHYx2xsiwm2yKLYh7evZYzI3aaGgh6RBxxdAt4vF3yqAkHoET
	 TyzpFL0efTmBOhfigwhkLqGg76llrtkS9aWLLGcw+Unc9RIJWwP7BjWCAOMS5JpFHXyQt
	 X9a/TJOL+xnCtiAXL3G74uR60rKGd7GSQVqJ3BZ2JpCazRZbjqIyNofrh3ZWOGM77iGh+
	 HF3a2M+h6qrbI4rbcUzBRdtgfcSdp5z33QDSVt3586QurJj73++vpf1N8B60W8y5Ff6cL
	 eOlnv2OKf5a/b9ERsPO7kNkR0x/QgjHOLp3vZM3a1bNfTWnoW7gjDuU63hOmHMf3lzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tYwTIlaLIWLwMFRWgsqrOKPRJW3cLgm7Otz1Mz6lFEw=;
	b=rdx1k7fnfJjvxEvJTXCUwIEMydHDCWDuQMCT3xrNG4Sp/ujXpmxz9rWWMgx7W7btf/kQ
	 dfojoFJxve3cJuf03C4DeD7S4815TLf8JjA/U2cAQs4Yp2uoCcNlu0RiXQQPegSMXIT2w
	 ccY42kj+zueMjevXBIwC7Ncnjsnfhrh+ZbGj38TXQJI/lXv6UIgedgHt3aJYS6mM29hDF
	 IKJfQmO7EEh9hLwbXuZAxpsWZUxVDT90woGGnkIAN5H8JuQdz7rd2euD8kGIdY3Dx/Df5
	 qgDgyN/PDWhGSLsNwEBGDoISEPmV34MLvP3EIA+e7VaUcQkrHf3OoGGFXMD7nYgCLVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864590;
	bh=tYwTIlaLIWLwMFRWgsqrOKPRJW3cLgm7Otz1Mz6lFEw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c/ablGLNkHT3dzwA9HQ5ahG64iz1u9f86G1s4UC6sInkBfk9HF2t+AUHGRxRMOibT
	 hxNvicVymRuOgB5KRJi1PRB3TKdymiQqBVcqElVQk0TLpRo3YPleNr/EcMxwpQcKE/
	 m47nOcnWzFHK+HSLhRhxP0klTe0HhGQJhWhL4rECdvmWKzMvmqdhmGrUFKehUPGm9H
	 ikkG97ZLpRzXADcbfoNVoiVvZz5RwrFKM8jOiiyiF5flKROfW7WJ2PNjup6oR8IEdb
	 7Fd9n4bKzzxV/Mg8hjeuj1l/8+1oe9UTqcqc/erhfuvBOJWh39X4ZmbGhcXY3lZ6m6
	 tt78wn4YEZvwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DB340A34;
	Thu,  1 Oct 2026 14:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9B832A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE2B80DD8
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKvcakaEsmCu for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D9A6E80EB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=cxYTSM9xtp6fvoRaS2djQi6OkyQHO+PvNP7HYWzpBV4YmtdbiLAroOv7xC17bfVut5Uk
 14RpC+YyiJZ1lwRa9ZjPzYvl4Mf4jT6Xb0X+xYM1IzFw0emnSxihKbZleu8qSdzi1vrfn
 NGuQxkjNdMrRBfj68Lml8SDcwhBRhMX7iN2eW847dzj5nZ47BYjNKapbwxNdC5Gqf3/fe
 SpdhnpVAyJMnM19xFE/csZJYqhmODrdmV/U5yKTq4Rjrz80cJ9tqLoK8JEZexDbE7x+16
 IkxeH+Z3AbVz5okYdNFJHAgNH0OnZaIUW7kmcA2/V5IvQwpSwuSGMnA6lv3Xe9S/6qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PBhYPjiaP9fKgFOuBvntbzYVTWo/XfOx6oETX2nFSTM=;
 b=Y4Mdt1IGzxVop2dQZ0hDJM/AIanSJ9SSxnUNBZtlupmSL08ww+EjXtbDnCfndciMkrEv
 I5x66Hg311HAxXLYLCrAHy67DvL0383A5SX6xtoDmEHLlmWiutfGbZpDs+qIMm/kowoP3
 DYnILYpMcpqoHQMjMExUwMkXejo2esduGqpc+gX+satM1kq2Qgk9tfKb+qBO2mh5CAbWl
 hjH893GjCLVZndb6NTTyHPmzPisf7+wzeTaGLV+2ZYNZoJclwkmI9PaBCykF5ErIJWBmy
 DP1uMbKcZW/0DT9hGGX2vyw42Dy6k3CrVNgIYii2S3iNu7gixC5xmLwFe5BFWIUnjeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A6E80EB0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE0D95B8E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d6abe0e90650b92e9d22a3d21986f697f3b29f2a
X-Git-Newrev: d91709f4d3a242d58a4df73cda9a9503e0ec4257
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.2DE0D95B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark:
 security bump to v4.4.14
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
Content-Type: multipart/mixed; boundary="===============6597648587266813799=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6597648587266813799==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d91709f4d3a242d58a4df73cda9a9503e0ec4257
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.14.html

Fixes the following vulnerabilities:

- CVE-2026-3201:
    USB HID dissector memory exhaustion in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
    4.6.3 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-3201

- CVE-2026-3203:
    RF4CE Profile dissector crash in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
    4.6.3 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-3203

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 9639bb44c783e19691ebe2aaf94263006a720f7b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 87d5781eed..7572ea8b52 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
-sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
-sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
+sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
+sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 196ac63271..d58fa7a6c5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.13
+WIRESHARK_VERSION = 4.4.14
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============6597648587266813799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6597648587266813799==--
