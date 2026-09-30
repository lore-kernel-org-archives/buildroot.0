Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF253CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F8D60D77;
	Thu,  1 Oct 2026 14:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECHJh84q6awe; Thu,  1 Oct 2026 14:22:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 83BF060C0B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864576;
	b=QTmt6106lf5B2oxGxlHjjlKWpGfY1JOjIRIv22/1uFnj6BBT5EhP2mXV5YhnR9hoRbHN
	 MyG9gV6h93ZxqPmF7mofOWoTTkMCz69Jm7yEDkG+9wvBncD9eQ/v6nPlqO2XezZ4IHrci
	 HDHg2pEx+yRnBSubYDQcmG8gcybSkgSm3ciccimS2tsOntAyNPbcYrPydgxt6edDIYJ6Q
	 Vk0Jg1/7r3eJhKpnKPqmVAZI0gOetmjJFN0ZO+xiB+5isA0RBRbm4idvXXOMmYTL1ZEhw
	 KQm+L+b1XPQ1p2xYALNCzWKXmx6g33UeP/xkcS7YAlzDyp2SwLiNiGqVd2Cj/65sSjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864576;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hAGZF5BQH3ABRzZsz2eboYYhC1pkMtiUj4Zck30WQr8=;
	b=AStlFLc+NcmQQ+N71ASxZmW6CY1CMgnbGzHkK6HEnxDkmXAdHgPiwvP+x8JG13a1kFpZ
	 XpzaV/Z/Y4/F1cJdcc8DDnqJiH3rB7zOarXFJ0pKcLQcGJQOkjvX5Hh6e+EVX3d0Ixds0
	 nCFUbBANzB1vhcKfNtPHg8oBd8i/9rgn/SyyHDkcL5hvQJpLMkmDdWetXazU+i9NnLXZQ
	 zFbZsKhSPIcPuHQ3xUiBqrO+54T+yjVgPoAwi7X+RsTgYPK7fsFplfupHiNbDdyNAzZ4r
	 5BkszeHazgrU/sGyC29hrDMG4DGWmK6y35YmRYWFTnYuQKjQKzUGjFd8dLLNB+Xd2ww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864576;
	bh=hAGZF5BQH3ABRzZsz2eboYYhC1pkMtiUj4Zck30WQr8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EGoFzZhlAocuKKpOQLHrrRh3nvKiKzHMtyiRw8DcZtN2eVXUY2S5B9BjBE1KjNT7o
	 ABx/No38jCTD2jl6ojiwldnMQxih7ygnMTHSOoBe0KKmRyeDPPmEbUhn67AJBO6nCs
	 xsHnBJ+UhdsYmFdKPTkldmgF8LI4Vqs7AsHc2ENiiMormF621NIaz258/CIPyhFa5r
	 MBEk+169U8kPjARhsr9DYIMarpgsgK6kcCEhHwR1wOiakIDUn2z9kUYM/vfgMd9Zzv
	 dVxGrAnhG90MZBa+hnY1sf3t2ZCp1RXKSR2xP7tmhKwcQlofoMux22wZwVP5sVMsfS
	 t9yBHDm6xcJxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83BF060C0B;
	Thu,  1 Oct 2026 14:22:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C74D01FE9
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA25980F4F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NvN691GDNZr for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C954280EA1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=L7UM+kQ0pA2kfxDexmI7kyPgKnkqM3IzsmFslGto4NBLYzKA7w8pSnr0Dn/Wbh+QyL8y
 lkrkMgVHAOF9y4mfjHk1A3pkyfGBYfv8lrCiXRRyItEKRX410j2dFH6u48eSBZRqGx6su
 Duyz9MLSgYJSovqr9GMbwdDp0eickZHzqfS5s+bDeaIBhITb+RpIsq4vi4EXWBbvuBwbT
 SrF4bimANzqeI1KTT0InqUzzGcPSG5jUwmN66nfV0x85ICgbnVpIGhf3ur4s0hQCzl/kJ
 6ezuz/EbZbjsZl3p6JfZ85zbxgKxO45K2GnNMs5IlB5lW3iYeuxMXZW227eqPPrqhDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l8BQrElYAzCrnMkfeSnYzL6RPyWCR87HMNLV7cOtOmE=;
 b=aqhdys/r4yiLiLBvREdrEiBjWa6F7Wcub21NamjsWziCMjaPgMKu9Hpnv6PcInYXDrK9
 cvwwc/MQo/a365WQzEPIL6uY6CD/fl9bv6GaDB2X0hKakgEAynAF/8hAcWEYqrEcveO/k
 LIaRwjZN/DcZQ5KtBvVUz4JrhFasM2O3a6aNx0IgQo0v4FLc+8io4fnWchvs12E/YKPTB
 SAE7LiFf6JxF52+bMorXUAjahTfTJz4sCgf91XFvgjmxNLiicH2ltKJ9f5VLP95MEGgff
 QuX0va1W5DXM7gTM9MxwJbJqtXYrILxSNYlul9AyqmwBO5Pz2ClBskoMJIAXS20lugw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C954280EA1
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CE379843D; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:28:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5a1582ca0e7f25ad742d88fc7a0fc14211dbf996
X-Git-Newrev: aa6bb24b7214a630199babbae4c000736bc75651
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.1CE379843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark: bump
 to latest upstream stable v4.4.9
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
Content-Type: multipart/mixed; boundary="===============0575009638422864882=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0575009638422864882==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa6bb24b7214a630199babbae4c000736bc75651
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
- (and all patch versions inbetween)

Also update the README hash, as it has been updated in Wireshark commit
1832f2bc3948248bf21acab5dd16fca8d5477a1a

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 49fa20e6678ee32e4b26979f5cb4d149876fbedd)
[raphael: resolve conflicts]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 521fea662c..88eb7ef494 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,7 +1,7 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.14.txt
-sha1  e972062abc0d15db34c3a0186c39511efb29ea34  wireshark-4.2.14.tar.xz
-sha256  098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166  wireshark-4.2.14.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
+sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
+sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
-sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
+sha256  39887d884b6473f5897c915ae8e9497e5bc2c1f6decec2ce820d5fd716d763cc  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 3a92c4cfa4..9ccd8f9a9e 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.14
+WIRESHARK_VERSION = 4.4.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============0575009638422864882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0575009638422864882==--
