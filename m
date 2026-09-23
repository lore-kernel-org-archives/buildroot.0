Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10FCC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBD741182;
	Thu, 24 Sep 2026 18:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhpvS9vu9p_F; Thu, 24 Sep 2026 18:59:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 77DD64116A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276367;
	b=AbfowVDnKVZlgdX+I2Vhpwqspiw70sJqWPhxP1mFzKleTsRRkCw4AJYcWKxTZZU2AftV
	 2oWEYcmDVqhYn9I13C7TFIueygOLWVnRYMfT0iCu5AFKTYxPlLdbFv0ldqRQScd0THufK
	 SxKJoynMPt+5sGkG7TBKBsGbvMCpbde+M+VO+xOdtxIkq/qb4duS1R7zGl/V+14iMQQm6
	 DbhvEtNTNSdsIb0IdMA8WrolDcr/xZJGYcQRCAw/kumSgdYv21X2as1iYyjCVYuZxsV+z
	 VDRTc/D4xZP90qiXUoEe1s8iURaXW5MpGj1VeU7pSLkheD9nIX7h7/PdSqU+sLUwF1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xtdyWroVoXjT/rDK0V0Pr4Y3XZQinXEPWp++0bjoLo8=;
	b=hUce72fBlEBoZUFtmQJO7CCq8zgKGCKh8rEnWKkwc0+xOlh/mdaesuvVF/YTOYLJB96e
	 QikgK2idkuSpeaHmCB3Rb7N293yjABczbN5w0RSAou+WIX4tqS26l0idR+TDAjQxzrRqb
	 ys0X7s21Fw+wATlIYgA//G/B13cWL/ZAGBQLNglaC9u4sjosqxVmRz4Ex0xOBGFr1Enb8
	 V2WjSR6pCxuJgkbAS9iP8RjbP6Cc12rzzFWmvzTPm2lFW7Cxk80BDMtU+wwPLkGrIIB9y
	 zf0cfHx5HRaTbchVm+DIhB7aUKD7fJPlqv27Jp5wFtmEW0Lp5KERS9vDpc6c77z/sbw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276367;
	bh=xtdyWroVoXjT/rDK0V0Pr4Y3XZQinXEPWp++0bjoLo8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hikkVPsiihhg1FPGSBKn6niHKYBKJSrbsREyyFzBpL44JLOGmyaZlNm8zPh6hztvX
	 MyiVrJp8UnrkNCCA92kY9h6Ex+bJwMOcjaFnII07wACEPoVrKJrN++FjAzvEIkLemo
	 pK/iWqzEHgyAxHlLdkdt0Lcy7zSt6kHSzFeCFrM9nsSNBXIq2ORzhsTmSYLL8CHvNb
	 2EyZWClRRrC/YqxWWhlQUM53v4zmH2k6NMp7OHAVbmU/rYx0l/XEyJLExHu4lrajTN
	 zBwRyZB096H2VvmrE594lkqyn+Om2u3TF/VtbiFxOxtK73vq6fPb13CknMwQNIHhab
	 xV9Rj3PZtix2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DD64116A;
	Thu, 24 Sep 2026 18:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23716392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 099F8404D6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ9gd6IFuW_y for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 373D6404CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=S2gux1TeFm+SJKL2hJ7hGsEYLae4siD7EtZjGW3lHCnllnx0V9/VwCm4bUZKvlFXzVPd
 GqE9rEh8wTG8NO/wUsaDilBZxzNEP1O5OBJJBbyKil3AFoQJjp9wHuzNzYNPzuYpbWlX5
 bagcnzpQZKgoriMu73HtuD+LcRrl5VFo+UXTiJW8MidXVJPq0XmQLRbGy/+rShxK3/ru+
 vl993uN0C8SUOzOx4fl6oBfMs8K0yXF9MKbDCGfvlqrPD68uzFp99i+4KhlHwXuU4oIbm
 uh8VdKKZCwlkr1wQP/32VOyN65k0oXiKk0DVjebRx8NKhC6xO6xWj87oVuJ2oZIfDfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FHBhI2S5yxSPKzw5JQsROWP6ZpH47Hvj/dlgj3SM8rA=;
 b=m/i3vJPVzvZG7rgJz07W2OyCWc0saggccmRnWAF/Cz3jv2RBVi6g0/2DNuJbWH5JyB01
 sK0peQjYv9ESp39gtbC6zpYhTKTYf4tvfVlaefqbX2eKqTEVZqLypj407MXfypa2TuB9g
 jHHDyeN4IT2NXPOjBqIVxcqVc7KEw/Xo94zTUf2RIHCRLkDJa/fTCf3I9O2c2gLc6e1gs
 mDLMkhZ7svBkh9Jq/BFRV7lbmWVGdqg01FZSXkRWHZYuYDb2PAzKIWdPiEz8YfmeoCyFv
 /5si84VHVLjcKFJK/8JLYki2m0WfVwv8TodOu/1peLANaGIXfY0HTBXRYrBs1gHOZsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 373D6404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE739982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0897fac6ac0c7d4bc5fa74caef196e8a2cb89f21
X-Git-Newrev: 4a11b107c05cfc58402546d99110e2ae71b73976
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.CE739982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/exim: security
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
Content-Type: multipart/mixed; boundary="===============6735755050346751431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6735755050346751431==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a11b107c05cfc58402546d99110e2ae71b73976
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============6735755050346751431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6735755050346751431==--
