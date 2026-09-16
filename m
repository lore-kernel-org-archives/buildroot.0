Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2D8C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 15:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F62880EBB;
	Wed, 16 Sep 2026 15:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Wx1pCJ_YhsR; Wed, 16 Sep 2026 15:35:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0145080EB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789572921;
	b=pSZiohbnHUZ1COh8K7OZ0IK/tZokqYFi3pVzSUZIbNvR/D4wMGIX86do2NR7fRiwO0Q2
	 B9gMDWiRGbEnNhG3/LIEMSp4FVUctjy/wm9m0P3dieG+pDEcFdr6yv/LgXhP2WOAJh+lR
	 ZIoQn9FIE/eZyifBFc9TC/OWIzsMQV24ILiPFcyQ5kKOxogBsSrUAsO9cCHGBm6t2RDkW
	 xvNLxu1H0E2XVMsegAU6PL67b+Q3zLnQwot5s0Bx7jdjGCGqsY3CESmOa72vYORCSnS0v
	 CddIFGCDmD35fBFJn0wAel7M65zWsNncNi17IV7vw5umM4hZ18B+dWUY5iaGrVQHoxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789572921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:x-ovh-tracer-id:X-VR-SPAMSTATE:X-VR-SPAMSCORE:
	 X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=gtoOFVDlnLPmdIZ7YtwFwPL+1XXdxDMBA8iXmekn3j0=;
	b=XrFd2G8Cm0jw4UonK23TaU9tuLdPec40C9P5GSKrE6ei4lhN7pKqnNxG4Ltew+JlX0Iw
	 E37PaukQWWeqEcmogsvnpvctM06p2BUq29LvCOt9ti2+NbqkDh9kDGCJDnedxJVQhZq6y
	 UzSdTkgbo3Mqw5t7Ym8OcZEHHLQKH1r3v+rXRjIzOxBGLzObQlSWU7ceGLDHo8i3C6+uP
	 TvWzKa32MPVBRQWaG1FI6W4wFIgKxMPahYtHvtxzy9AgPq8UMxZqc8RWJ6rdP6GRYEYzk
	 rcKi5rRfqSvYp8dkfC4jUh/+RQMhO3F/t0+g50WG6uD+F5ijKUp367I5+BqKvB5qT/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789572921;
	bh=gtoOFVDlnLPmdIZ7YtwFwPL+1XXdxDMBA8iXmekn3j0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eyCIAHR+1Md4cQ+PfKwB1MTKlOBAOOLBMt5Kth723y35RWD8T1nRfQdKNQKZpptZl
	 xL6fbKL26lhYMJoFRT7ZL7CXWJjoKD3BEhKkfZwA4TLh/9/fQEbQdbi1qe00alS1YL
	 CK/1GiWmcP/1qPoV6oNjGuewjYTxJrwSSr2+ABG6V4DuIIad+T3OGMXLEEtG1TDEFB
	 0hVvaruNQ8sIngKS5C/+gYxjHLu2zETfK4GVoYHzBp3DE4Rojo94qFELpG2pxzW5bJ
	 lmQDq97SzyaxAIp5+9BsxkzZfd8aNSp+QRCbE+8LkssXBvpIe6hS9gXCiAxfHQgVO1
	 KJ/asEeTgQjRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0145080EB2;
	Wed, 16 Sep 2026 15:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0AAF422
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 15:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE1DA40639
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 15:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvQUfIpXXXgG for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 15:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E2A84029D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=188.165.33.112
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789572918;
 b=qLEt/iUviVbLUVluqDOYgxZjOJV5IGdJD3rAnhOTxY7hKJ+mKad+CgjEoQpwonGZdcSZ
 emIEbk3i+sWiKoDrKwDqow5StU0/4BWmzsmBXQXF5jTkrjUHOBQHt9t6kwRERYSWKS6h3
 xf0TRsliM7q7qJ0G8ruN+ck8AYlJoQ486GAiYuCNNxndwvxlaTQITzDcr2MBZ/9gPHVYr
 rMtCHJRhFmnUX7gg4NeP2UDLzT0BHL3ttTnptVcHaNZh34SpNgl4DfaClW+0t9731io+t
 rl8wwdMNZu1eH+TNsDKul/6d/vBGVSF7ZA8/nrbQ9zGo/mt+sSEXQaVd9PNcl0Zppcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789572918;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=7Lw3EtR/Fb/VRFVw5/iIB8OHuAL4I5dcJd1tiv3XX1Y=;
 b=LC1miwV/WmrE50zRZcjP7rl5cYzd2xf25sPN/9vWI+gjoyZdLVtEJnJJGJGLTJrnYy/p
 gh/j46hhFgSL6OSWE3YCkwKBUidwFt6V+Gb9GjnsmuCLAn8bWkhNhMTXMGUoHjg67qIGD
 ZOvSNlIbpBs8LHCicFq1zRwnAwS09bj0VuM643VvD6ADPeV0Lbf/YCDMfCIamFSdgwEiZ
 6eEda4pLuS+swcLSbJ+UCiYjYQG9Yg0UguMZ+Peuz6wb5/dUtQXBTGnq4jYyX4++d+IEr
 /cBwqMgLNrC803PwCWx5jfhY3pD3+TkSZ5Frl5UwXCkNnZDAS33isC6zQB6Xz19nIDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=IsUFcQgM; 
 arc=none smtp.remote-ip=188.165.33.112
X-Greylist: delayed 8784 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 16 Sep 2026 15:35:15 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=IsUFcQgM
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.33.112;
 helo=8.mo584.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 8.mo584.mail-out.ovh.net (8.mo584.mail-out.ovh.net
 [188.165.33.112])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E2A84029D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 15:35:14 +0000 (UTC)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.231.120])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4hlFw24Djzz8TC3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 10:47:46 +0000 (UTC)
Received: from ghost-submission-c7b579475-lgtsl (unknown [10.111.182.240])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 63D19801F7;
 Wed, 16 Sep 2026 10:47:46 +0000 (UTC)
Received: from quimesis.be ([37.59.142.106])
 by ghost-submission-c7b579475-lgtsl with ESMTPSA
 id oUWmBdJzqmr2VzkAok4Mmg
 (envelope-from <antoine.gennart@quimesis.be>); Wed, 16 Sep 2026 10:47:46 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006ae8a0c2c-330b-4926-9575-9eefe877f348,
 5FEBD7DEB569A611C946051BA325CD8A23A91D25)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 77.72.238.202
From: agennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:47:37 +0200
Message-ID: <20260916104739.853249-1-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
x-ovh-tracer-id: 8345733062614978518
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlciSem+Hb0uuDHoScoNwWOmeC7oRyOGczghr1chTaT5Sv0zqxgTDc+mYXjVmsMBQGDBW8o94PEDGguiKQC5ePtlA/P5W7Ws4pOt5zSYR71PZu2djQtnI16Wm/T+FYRug+JeV6TNDCTVVNT1lnfQbXKQ2R+Vfpwl0gjhDvy/p3LOdmaXWsJsxnIOaRC0EiLrIMsuYXS1Vblzhyy9idhIsXL9A6G2fZijnOBdicPFByi9BPS2J8i4r3Rz98IVxtWLWrzLQFUpNzNmvgMYRW0a4WwyuqGxGl9KV8LDlaZ9aDkBsFkMV9F2TYWMr9xMtd8wLjQ/7/3YP1Qd4hfBWGTlZ0st4L6vjsN6uwm7hoTy35U15bLlqDQwiUphB3BWxiYBFPstXMonCbhBABF7st5TZkKaErclHSBXBv8qNNNF481UNQPFf3xN2W3CEnT9kW3/hDWhQSVhBsA464bIfa1J35wXB198qtLI3Unhy+F2mf5una2Zx89t3PZCc6KFUH0ckxT+mTF/R+HFi6sfT1b31pzKH4Q6Bot96wU7KxKTR7t11jQX3Vq349SRJL6wYz2X3qX1c8phOV5UdeB+ymr9+x2hOdAbVE0RKkwGSkxrJust0loFyck5QWDK85mLMwo0bExIr8Bs0Qf9lGv0BpYWMEjc7LbC/8He/OOYK1anVgOw
DKIM-Signature: a=rsa-sha256; bh=7Lw3EtR/Fb/VRFVw5/iIB8OHuAL4I5dcJd1tiv3XX1Y=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789555666; v=1;
 b=IsUFcQgMDecJAKMfu07iLsG9KvEwCAs3aZoLLkzCm0gEz0E47/Cc7anIZhBdyUssEa/6qaVQ
 +XLed2qg6IwmrQ+/vfYC/FcxJPMERy9foOwSE+ZsNsXkaenRqM3uvG88OWcA9ouzDxVVAt+Uuti
 reXfgvxnADjOmRb8h82m1P/J9VFhpIM34hSIAr/ewZuja7fBDv00BRp6tEskt9Z0bxzBp7ykiZz
 Kq6kCVbq9WThZOZy6XIJA6hj1wa45wO4dTaaeSgm1DovJhRnUkc+I/qkViCbIqTELCa+glD2eEh
 Igzn/BCajGY1FbGI2rOGGlt0GiUCUqKXEV7m2g+v14ufQ==
Subject: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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
Cc: agennart <antoine.gennart@quimesis.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version fails to build with Linux 6.13 and newer because
mlinux/moal_main.h includes the removed net/lib80211.h header.

The header was removed by Linux commit 02f220b52670 ("wifi:
ipw2x00/lib80211: move remaining lib80211 into libipw").

The new NXP release skips this obsolete header for kernels newer
than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
compatibility fixes.
---
 package/nxp-mwifiex/nxp-mwifiex.hash | 2 +-
 package/nxp-mwifiex/nxp-mwifiex.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.hash b/package/nxp-mwifiex/nxp-mwifiex.hash
index 559e89cb37..662f6c27bd 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.hash
+++ b/package/nxp-mwifiex/nxp-mwifiex.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  dcffe6c48babf7db82aac4704b056cffc06a1f80008cd9c23ab0479fc890ba99  nxp-mwifiex-lf-6.6.52_2.2.0.tar.gz
+sha256  cbbfcd497e85d6da8a29d28209baa924102b31dce8a299aadbcb8f530506b2dc  nxp-mwifiex-lf-6.18.20_2.0.0.tar.gz
 sha256  67d461bc478d220fcdf99c59d8ea17fffbd1881718281aa4947eb608fcd568bb  LICENSE
diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index 46678a2c91..7e29e2e5c1 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NXP_MWIFIEX_VERSION = lf-6.6.52_2.2.0
+NXP_MWIFIEX_VERSION = lf-6.18.20_2.0.0
 NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
 NXP_MWIFIEX_LICENSE = GPL-2.0
 NXP_MWIFIEX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
