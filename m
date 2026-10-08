Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D7CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A6260A57;
	Sat, 10 Oct 2026 09:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHZCw5o5rHqL; Sat, 10 Oct 2026 09:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE98F607B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624445;
	b=XNUazSh18ygVEDwqP8m8sVNWw0OrpxosoAyHBkCQHz2bcLTd5hiOcDuD7RG0A7ZZHKkg
	 FfT1YLH19+gWDCxXJ1Lf3xCRwjrqAwrohNWw8V6ZVwf2aUIJ2M0zGon2Y+CyF4Hdc9sKk
	 XYAoRvjbDvF7HlfzcDr0LE+V536CiJcodXDYQawo/nEcSEBxPkFN37ACbUGe2JWL+6IUP
	 TJ8viJrKrvnjP+UXQsPjmNaNVUBRYrsmsSbTUUxOkv2/r4I81kQNhQ/+bAmqY9TaCQAiN
	 F1B99KGcVTZ9NF/v1K6pPcYIS11vvw0GupsZ8qmS3ZT7vlGKvIuJPFLsqYy/YGIG1IA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dHMCy/npfSRj2ZM9u/OyBDMEU7oAEqIvSKK275kkk2M=;
	b=OSc8xl+uUkxiTReHQ0IDUh9MVvBg16LfsLvjrUduqIu90wSroDeOHlIuQPbmPCHuWvcU
	 22x4LaMdQxB1c9ECNJovF4T0G/YigLkepI998XNVsj6vBpXEzKLc9I/NVeizHA8Q9UFJk
	 nU0NRCvjhy22ChP8ogsOD6WxJvT5WAD5fE5UOZnlSDy171KNtpLxtGJ71bU8ScH06PYHt
	 BwEYIwHD3nvSwGGfF45W6+z2k2YCLDAbKxxdWv4geW7lGvljPYgG2b2MlkGmLrXkowAbv
	 jnBSPVhQwD2gXtlQ8VhrwOFs8QbYj6zY8AN9QLQN/eOocTDOIsyfyzNjVk5MB5OpjCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624445;
	bh=dHMCy/npfSRj2ZM9u/OyBDMEU7oAEqIvSKK275kkk2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QZmO8f/7Rv2AQN20Uu/ItKqiFPer0yf22JTSufa6LpiYV/FFyzWwzwri4c2nTM91g
	 1OMv/IF3GTimcspfrND4MT4GTcS9lhO3lfw8yhfRoJr3tPEn0WtgyjRbCDPAsa+Kym
	 YrfTIwg3xcM/aAz2nJO8uDenPAk+6s2rmtjd4AW7EJKJSX/0poQAlu8oRoZqBfvd+6
	 vzi+quxM2VUvahWNOnkdfgWYz33tzSQ8Hwo6enf4PaIYGkDWU87u4Pinb/oOCtcLE1
	 V2s5gxJq8TM4G3UwV32Kalhecg9uG1vwRSQu4NroX5fQDYDRrP3LVPNk/UEJo+6sQJ
	 9vc0hmGzQesMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE98F607B2;
	Sat, 10 Oct 2026 09:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF8D49D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B4481186
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoaTJSS2pw1Y for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A6D481123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=jrXX3HjP6vr/5oKn/2WZT8gJjGIrsJugt2EROZOQm3K8l3JFblBGTXZwL0IGqGGe1N/D
 hjqKxvEJVn/tRuP6apOah9D6HwKgm+QvYeMUU91g+1SyQ9KsHZrh/pDWcGQ54UhxnlsGo
 wAVxzI/4CMZVtS9tAd1idjbcw0Tzmz7oksGCzAlb/heH31CWg0V6yxTSzFvJI5ukqCS7b
 VdzPVQev0HAqmTQTvwrcswuGJP19n5z2aLrnmBPVL6A/8agJgKxBDU8MGO+34WDsnqcQU
 zHYkpXXQ/GWJwIVqnA8kpCZGRKJC/SHM65E2cPQ+avC312JJY1FE/YV9IwbSLFeMp7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KV90JXVoP6eLmDfdn9pMntptFNQkmmGib7BF/+Gb6ec=;
 b=mjfg7KohpVeD+VA2t1y2QGontPYWaYinl276rzmG+C140t7KcHDMGw+rlfe/s/NMLUxE
 yQs+6UDBxtFjsiDvhWeMQ0kGKa7ooXk/rvCrfAfXZhOcOIhWMCCdVWb2GLPPCbNXvyPuZ
 cBuZCCDlykFHiYVteXD2tRPhN1+Me3ggHcEYLByincLoopNyEJdc7Z+vef9LeicRWrjjU
 ySTOtcVgw4SB6dVeaEO2Liqnvx4bk2Ufv/YmhlfhQc0ln+Iy+Q7uWmaxt/PoQRIs14AST
 +mP8gp9LMavWT36QVLets+DdSf48sVAhyJApfVkbyUfnxVFQoA72uNYVjKH1lHab2og==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A6D481123
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 053BD8F0B1; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:28:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b658ef139f96368f678ad4f3f85fcdfc1ea33051
X-Git-Newrev: 1f979294809978baa39af14050adf19213fa97b2
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.053BD8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireshark: fix
 support for lua
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
Content-Type: multipart/mixed; boundary="===============4745081570210521168=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4745081570210521168==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f979294809978baa39af14050adf19213fa97b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since version 4.4.0 of wireshark, support for Lua 5.3 and 5.4 has been
added, and support for Lua 5.1 and 5.2 has been removed. See
https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html

This fixes an infinite loop during the build, as for some reason when
Lua 5.1 is available, the CMake check for Lua 5.3 or 5.4 loops
indefinitely, with cmake taking up 100% of one CPU core.

Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c4c6ad81bfa4dd5b12c230c450dbf798c5a1542d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wireshark/wireshark.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a67b915b5b..c394f85beb 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -109,8 +109,7 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
 endif
 
-# no support for lua53 yet
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
 WIRESHARK_DEPENDENCIES += lua
 else

--===============4745081570210521168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4745081570210521168==--
