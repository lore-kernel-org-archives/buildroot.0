Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17461C9833E
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 07:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D17E6069B;
	Mon, 28 Sep 2026 07:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcdW_q4bGo3t; Mon, 28 Sep 2026 07:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 700466067D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790581879;
	b=EPGGJ04d363S2TZX6JT/m4wvNnF+jrBlbSl3R2FJu7bhzcj8fmNhIcGGOwUAa7D+W5gK
	 6GOifrvWkKY/ehQXrKTIT4uepei0BPNd0FH/8J2pglAEXANVoeprZUz1t4N8APLOwTWRJ
	 mhbpyz7nkD2TrVFLUbvVvQoT8k0W8Q2aD9XeBhp/BueWVCGJ7zweJycTgYUjVdDgxJb16
	 dR6yu1JIdkvfYX0O8DVAhjVOtsAFct22fs3dC9uN3ejofvhL2nWxLsre+ap70L+/WUnUJ
	 BjsXT2cQEDnjn1XuqoD0YXMbs3lLh3aj1DUltYARk1si15bxiX0HzeGTeMZMxy/fmhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790581879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tpIuyTRSL0xr2mroXHGnMs4gKB1Ylz6N0NuiKrU7Z+o=;
	b=bxv0Z7sKaMo7GmDIo9pGWB/OhI/XbGVhiHmF0Cb7voXzY79lqf56N+C/BzPc1ZuXSwKu
	 ybE7So1POBCYhRJwOJMfsfq/8G7vTy2Bwyrm9ZQnr+zBWZKBVju0AoZ5rs3HK1O8H2M9D
	 uQCjvx3uF98aWpnpg4yTa5DNtMcwNKDV5syZxiFLzXPL+p80YNJ53ZdYFA8etOnrmyR2O
	 h3EKWROpb3xe0Pk31Os5CrbRjZebGWlyAfkQDpQb9znBMmupMS1rYEUIEAPU+dERmPT0a
	 +K/kZXOZ2E2hZ7K8nb/XuHUMu0RicKdI1CT4ldOWxWDDIVDFoldYb6ieSNGvYVU7Y5g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790581879;
	bh=tpIuyTRSL0xr2mroXHGnMs4gKB1Ylz6N0NuiKrU7Z+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q3Va/8WPGg36Fl13JnT8YeccwJu+XixLDEYRY9lJ+Mt0NISlrbemgqdI+JdCgSz6y
	 Q5hcfxZ2AnTsm2gUsyMuwx8044vIo0i2Qmtt/fiu91EZAJhRNgvl3wrJggb/fTKsei
	 524gxKs3A2AzH0/sqtaAQSg9SGWFHJe/WVmE2KuLKcMEjCvvHunvzi77CyoTBqxjTA
	 Ql5YHiPEHyKwK8zaBdv4cBwbS3HUWNERGS0LSeAY+5QrJzMB7Bfd5lapbhmOUTiHUg
	 9eIzHyH8DhtUP46qdBSSd9RsjoNZBj/rxNGKQMWcfUQs7H06V3XGoywitHD2dB6boa
	 MpnVTTFEHEJsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700466067D;
	Mon, 28 Sep 2026 07:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D68E23D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7C0C80DAF
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLSpG9B0-UCZ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11D2A80D60
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790581876;
 b=O/+FIvXXj3w3TDKEOnu0vA2WDsZhs09AGqsiS9IZXGwJ7Cc2yuNI+1feJzYWI6k3WqyW
 Rl55hYYIfJVkla6lnpJRcRnpYYWlE8/Kehb7PcqHQadqM0UeVHz5h3AhnnubeR0TKBz9J
 YgtnfGnC+aELk8ivIpv8D3/Qq3+HfKZdjwIz3SzrQb+189kYUwte6ND6okeq3gFfbUVWj
 sDelAYF7mv0QwxwHL/xOuSrJOqfAuqifHFrCMG7OM9gizhcTMWJ26nIVqBBAkC8SlQ/MT
 pi3G0idY04ZSpJ7/1dr0UB7KQEaYpo9TkjS0iPr0+hYuzvcQCNYSkKaUlWxvM5SDrYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790581876;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9nl/vGMDh/bOwSo11KYH21vtOOU6uEzgDokqkTBGcQM=;
 b=gSakrf8z8mDaPW9kS8DS1dSHT/zoF0bJIFYstJQJW4HcOEd0Ifq7PeaQl4SPtxBg6Jz1
 32T2//VaacG/Xn5kn2VZp1hqdHXtKxHcNr1z/MipCXPADO3FzTNdmj+w6wOW6X5+hDlJA
 s0fVqUVg3MRqp2M9e0V4ak9TwK8JScNYicVPPgfTC0Yy4Uy4V7D+Ay0jTHQGLLfDZEbQC
 r7UB/WGn+BveLIiO4lW0+teWRkD4LlHC+PkiXu6gNZ2fCqg3VX3snHZwDI8poNqvDygNu
 KcSgRfbQMu2l3vbiHMtJuh75WyUEwvZu8YyNUfoJ0PdwXPP4YF4EOLexKbyC3oH1ZvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D2A80D60
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 07:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF51C95C98; Mon, 28 Sep 2026 07:50:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 18:56:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96a2337bd4c48cda53ba9273e9531d7eb691c8f4
X-Git-Newrev: e523c64d3b2fbcfe7bfaa7e41ad552f902a46b2d
X-Patchwork-Hint: ignore
Message-Id: <20260928075003.DF51C95C98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: bump version to 22.11.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e523c64d3b2fbcfe7bfaa7e41ad552f902a46b2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 1ea335412d..0be8249fe2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -6,10 +6,10 @@
 
 # When bumping asterisk's version, verify that the versions of pjsip,
 # libjwt and sounds below are still matching.
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
