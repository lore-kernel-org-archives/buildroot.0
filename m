Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AC1CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AA3440526;
	Sat, 10 Oct 2026 09:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD6WqYRBggrm; Sat, 10 Oct 2026 09:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E6D4403F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624447;
	b=tf5crLqeIibR5v3vcCvTmu4mZvmB83sYhk/Q4GOWd2126DIhsgW/3OrmzoCtlNk+gtrR
	 6P6gIkcXCLSu9fzONod6Jm9NVMXJ8REznLvZkOTJRSzqubq0hCc6wH1fhcwkonbPnrcAs
	 JpCB7mdP9LQpy7EgcXL1seoehixy66E9dJPD2TdP7LfL6sXal7MAugcnCz/Tpgn63eafC
	 XUl7Vq7OHgRC4UCbgeZhjET4X5Xi+3l6Xf2gn8G95m7ZexDQuksLFA+/p0/FvaoRlwJWp
	 HX8L21382WMftgGVC0JSD0as7EWL36/WgGEv9SilD+i/mkcItZzLV1qqqBuIj+d/cVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IXSI5gFc9LuF0rZ6U1ea9njHZVOHYn1761Jhci/71B4=;
	b=WPqa6FCF0F/T89HU/vr+nHz5afBPPwIdt1hZGtwUt+zHJYMyD+UUtOLHMuvYlUcYFnEP
	 nf4uOQN8THaYLmweH+wBVrG7kKstElvlfbPl2Vp7F4RWvs5yxO67eXPWdBCqrZbMR934Y
	 AjpSY9wrn9ciBEjXoxf975WT0SCvd0J/Z4bSbVYR9aCAYDzq0cX4mNM01J7ezDcMr/1SR
	 1gBZapJvREGfQDt3TbfQN60EatmdR+laa/mJO5+9od1lCu/bCl/U45LR7NacJAB5ouUnk
	 U/8v5gRZ/+NCMfQJywLVxt6llGquPbD4ODOBe8p68XYqUh3ZGz8sDCCFtzdezgDoU5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624447;
	bh=IXSI5gFc9LuF0rZ6U1ea9njHZVOHYn1761Jhci/71B4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mdzkqylk96qkW1kmtymhi8N+7OnuTSKmxW6YEqyr0dhEM98CqyK8z2BUHAiROiUTC
	 ARvwJJVMMLOwesoYrJrdBJa8iJERVNhNmCERWAJ5HDCgKAHTMd7xGJaatYXiOFhHNL
	 J0FPMqX59nHeVQxRLQKMQvvdIApJq9rzAYrD3mW71GoO0h3se1HEVF1EdIf+3Ny3X0
	 zkSeIQ6JDoAxPTQPc2iGdcOpVvaX1QMoFl8ll7E94ssDabYJEPc2ZNvQk/88pqNudv
	 20dvyk627K6X9LR5VA7ZiTceb/s5THgHsmfgVxTXbDXJhdR9/Qg6fDf8jZnDR7kw0W
	 IVwDJUrLRvJ0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6D4403F0;
	Sat, 10 Oct 2026 09:27:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3FE9A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA7F860633
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYX3MVzLbPX2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 200996060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=Tmcwbxj/0liZU63j6qoMgRPl5Wn0Tw3ITrY6lCuO1k5NyrShBWNDze8he/XpP7iyB9eh
 QE170t32uux9r8WpBbKCy73Pe2og5eUED/Yttfhmkje9pdbdHdfr8A3Qkg8l9m5rUHlO7
 JT61os+hcipL9/p8e478Hq1HK6Wd48FuR9XnN+9j/e6SuZpPtmYOkQGoVuj1UAf3p1RRn
 ZjtNnOCZ/nX0nu334l2V9S+0lZG6r/VPWQ+3k2nLjiyiXxZ3Whxy5NTMuFQ6offYoByG6
 /c/gui95fQ3Lc9+PhuXfDCXAkQjWkYdOF8ccW9EPpyZCZsgPBJbINWyWoiVVoqE/02Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qaNZFsUREkkPkCrISNsPt60+awDZVT+hj8OdrUZpAd8=;
 b=jrxM/FiZ4ajNdAAr65hBf9gAQvvVJlItFr6l+Z5vawECwbd49EY/234qBl1Pnbfa5bQB
 BvTC/uz+G/dM9cZJ8pYa0/KJuZjFTP+Mzp2FVYLZbGaU3d/GPzhsdEDbQNHBSmyaQwUKc
 4reQzUDaee6gNGCqKbTfOM4zv8KDQvIA3J7hfAI5q4e0769QrLtAFV9JE2EWaAvATXe3C
 DyUrnPQUZ8KXUw/Q5pETYFWnlKBwRX1kz1K2awvGYd6ZJmoLzzLM1t3att3BuQxbdVuuI
 /l9sqpzlQzN5OXhbYdGqpALWUXGjT2HeFPSxTFjIlUfB+LkXLrNPKP7NJMmnMrXdC1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 200996060A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBCAE8F1BD; Sat, 10 Oct 2026 09:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 09:05:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d1362323bdd6bddf871be5f3b7943983127fbd1d
X-Git-Newrev: c93df95e26e24731b3ae5ae917626d9619361462
X-Patchwork-Hint: ignore
Message-Id: <20261010092602.DBCAE8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c93df95e26e24731b3ae5ae917626d9619361462
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 5.10.270 -> 5.10.271
    - 5.15.221 -> 5.15.222
    - 6.1.188 -> 6.1.189
    - 6.6.157 -> 6.6.158
    - 6.12.111 -> 6.12.112

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 022c150892..37c8a4e953 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.111" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 1e3fe33b08..07d83b026b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
-sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
-sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
+sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
+sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c07882e1e528efe206567a26de30b192db8dc4369974d4ef4ce708691fa1148c  linux-5.15.221.tar.xz
-sha256  de73d528b04be91f6eb86660aa67a4d53b96bbf20bb5a326e78f802d744debe7  linux-5.10.270.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
+sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ba7aba530..54ddd5d62f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
