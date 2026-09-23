Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259FEC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C0740E2E;
	Thu, 24 Sep 2026 18:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLsuEFeNav5l; Thu, 24 Sep 2026 18:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B444F40E34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276267;
	b=gwLq8wEDSmbxxp1H1lLQ6tnREaT9rt1zuTj3HliKHQRSTg7QkfZVjx+3LS7vc0N4myFB
	 sRRuBty9q0k5nQfA02KjPVoGsbqBpSm7pO1eHMHVXbnHwA2TfVpu0JZxGXQRZPSItHbxS
	 1gHUlzlvbTcKuydwf/xWB9ghT/eWhH0eSDoYjf7dbmKqLzfBPfGaIPxc2xp+8NYRn+LqQ
	 9FqZyvDmhcyhF3J77CVe4JoAKgY+nokoFJnkdD3OYukReW8+tnhickz5i2mjRYpRgrWda
	 caFb1GBI6dsqMUuTk4WMNwcaVhQCTwkzCRuxbECIxdykDWYBKpjgcNRiiPc5JffvaHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pN3dR/NlvX+vKnOacC14ucsHkQSha3jTc+5F/czVeJ4=;
	b=f7Hpr8Er72wmTWhHxOaLGfBQ8PbiTcBrT9u12iT8HcOuGiVnsVjAABg2kLyfCowpvaBg
	 49/jcJlcTn3jI2YAY/RBD7tCGzZ5jn42PI8q3mCUuM45S3V9qJ0x3dkXhPt+ubiPIubYL
	 YWHSK2N2PWUBKIciBOgEh56Y1PWgRFE/YAX2pys+hWFKCUY/J1G5byXeN7RYdmoFQ58/E
	 +XrAOpUtcAf3zCLWtvV3WSXFxBo3QVPnDRwAJOl8DHlkV5IEOTlq5isYWHGKFMeoO3bW1
	 kh+94UfPZz6kX+JtpyPA36YkDnofwPdOWobi/3PzQIO3sxPGBMAx/5f2f2/foS9gvAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276267;
	bh=pN3dR/NlvX+vKnOacC14ucsHkQSha3jTc+5F/czVeJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bGvTRnG+7JD350WWoP5iZK5PWtvQwbysawzREfKl2IuH6l2DVQo8RwRqdLYn877/b
	 v0HssfxcWoA71Ej4lKnrRNYWY2BZh94pEw3RioPrSD4Gbr9F1yqBLT2X+qAa4c3GfR
	 ol9AVz4LBKN92FTEMR856weZNtzjEWv7T/wsmsfGT+G6alUEKE1qRJooWpGCy+MR+w
	 SFYzWUmqs8XeVNAjG7Kq43olYHv2NtI9qiN8xsPJaPMqc0SY5IJoipm2jx6NrtZJbH
	 Zxvf/OiHbOaRnnEv7l/SEfri5sAOlLRj5+PMjB+CuwghEz/CUOf2uKd/mhNuUaGPHn
	 tGXJsNZuComJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B444F40E34;
	Thu, 24 Sep 2026 18:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05E49328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E75BE40ABF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFncGKsoQ4pN for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 69E1140ABC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=HF9uvaSMLdVUzLfFyboCmjq4fK0Yt1SDR0Fo3PwAAMIcMJNplqt37GWNH3PzlJ6icx0M
 ngFkPnlFRngl7crXJ/Yhwqj873WV9L899SBBf7JOKj1+cuzwwnL9vVtcU/RqQBjJxKY4E
 BLwoBBnNc1Oz2pUqxWdyeqYmPJ+VnwP4YxR6GPHMHe8G3L3CzeDJ7+T1fDP/+GcXGauiD
 cit8aTnFlMa8K/jE/LXuKR4kxqhTMa2Gl9ZEDccnd6WKEgS50sTlUfJiYrEKKZRF/PSv8
 qYpjkVmIKCk7uZ8VG3kV8HV+cZj3w3ggPbxQ5EZxEt1VnFNr5Dgn6eJqTxq4vvBSH9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bCRlScjQnoiE95B7unQ9ojwxuOoXWLHB23gK0TFPeWE=;
 b=H3tD9TFw92ZIg4Je1Mb5/LT1K1YQZMYOuBDnZjN1E1EICsUWxcAShAQD4O5mjyI/Orzs
 DsdHzR8FjoKtgTp7zTTAqmXfnxbMOVPaVGfSQaW9LLIlLs+NJOfQObBpCbjt98OQQ4lKQ
 egDFVOn07qUekRHEnOF9Bq8SKuJnnPx1rxxrDzsp6Yc6crekIQb8KRhcwGBFh0N6szAXz
 6ePiDv8dH5cpE+eD3L4viKtIiW/4lhO9EitHltrr2bxUrG+s06HFOxmCDI173w2K5I7d5
 B4p+BAdszp/aboYICvBOOI2lTCFOlaJ50J+cZ8pwuvM3CFFQHH9hV2w+VuHRs23CLWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69E1140ABC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D9268E85A; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 31feeffd69e67590e1410ded429933cc0840859e
X-Git-Newrev: 5ed7fea89998239d4faea6062e95afed9ba7ed9d
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.0D9268E85A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: security
 bump version to 4.100.1
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
Content-Type: multipart/mixed; boundary="===============8948908594336403798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8948908594336403798==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ed7fea89998239d4faea6062e95afed9ba7ed9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.exim.org/lurker/message/20260918.121220.0f87338e.en.html

Contains the following security fixes:

* GCVE-25-2026-09-50-1
* GCVE-25-2026-09-51-1
* GCVE-25-2026-09-55-1
* GCVE-25-2026-09-56-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 267db9da2b4ed1b0e70e46d97db717ca6aab5d47)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index c075b2fe96..49036ecb1e 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
+sha256  e9fb41f6724a5b136d64c9d19dbc5f26494af879a3e7e3190f91639eaa79fa0d  exim-4.100.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
+sha512  42b7d59bca187e0e8b3cd85d97ff40fe8de9d807fb12ce38749c30056c92689ce98b09874aec06f1d83fde806fe6193312a98681b56c8baff1acfcf91244bbab  exim-4.100.1.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index a8395a2309..c52428a800 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.100
+EXIM_VERSION = 4.100.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+

--===============8948908594336403798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8948908594336403798==--
