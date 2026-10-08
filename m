Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CE1CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C8D60A8F;
	Sat, 10 Oct 2026 09:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id TlOQEooECLyX; Sat, 10 Oct 2026 09:22:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 77E6160A8D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624154;
	b=jzvicLUw4uE4EcpjPvENdsD2r79B+OhV0AgQdSCazvZQfYAY0952WNs15MDKZnGnpQg4
	 tANmhQYnvkiww6r84N5Je3RDqsrnpNbvsD7URVMGe5uRrrVRB5LwHNYd5tD97/edAVQDV
	 mbBeCtXfqYAiffDAiVFZyOKa7sb8hpOXIOKQ0AEviuFwcPCMLCbYwuj5VQ5L/Edi3mtdL
	 VBgBnsBMfKwCfkp95bufnRsB1ZJl8yVEn3P8yjbQ/ri97WmuR1cE6ZGFqLnW1cijvRagI
	 CGavzrlU6ds8xUBey5AhNoOvEBCIAbE3/bOpQmfA9JeimoDvj5UVTriTjm/3Y5Grl4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=GbP5+BW35F4bBiFIxoxBjLzytzdHwxPYwPuKYUMEnwc=;
	b=VxGzJPXnRnaha9hTJTikU8lXSuq9q/k5Iw58jHP4LVlmXy6syq5eQE5wGQAszxP76l9m
	 g443egPMIQxg7ImVW/B+tVpqZuBKwj00joh6KFmOXekpfLC7MugtEEq3mSFWf3u45Q5Jj
	 75ydz51GxZGstLL2QGPePTGpgZL/PC6i/Rp52SSxdHa5JLSPBorB6sb5QxiW9WcjxInhq
	 28qK5PRVcCOBZFw94GRSVu6nVeegEpKNYU1R0//EYSR940AG0rgktyIDQRci1pFiLWUB4
	 YxMiytERmYJ7mVY4JwdgRa+92w8yJfHhboGWuM5vqoYgCnvwIoQiOJO6aR0+aaEbDAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624154;
	bh=GbP5+BW35F4bBiFIxoxBjLzytzdHwxPYwPuKYUMEnwc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ABVfFas9NxMpGU+Lxjc2N6pc3lsmJpqaNwXmPfDqrJRq06uKc4py1OllUHGJyd/OI
	 L9fkj09WAS3/baWw04rGtuPZURASe9gsJ9eXq4JQGsfgNVAekofu7uPitKNq+8pFmX
	 vDv8/qK8eHjBz59QdyfCpVrkOnHfJRGxnrkS0NKMU079plpV2VTtPIIlfFXIDAwg2t
	 3eudxIQa2Sa1OkMQR9m7yKZ85Wq/F9elM/n1Bl8nQTktka5Pc44T9LAkXMQq5+N/iL
	 CWBG2p+6yCZ8ALpKPGc5BOaMD3WJsqQi3KpppwJ00HDNkSzE2M3NaNmEhFoAxrUAv2
	 UDyRImMOlc9CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E6160A8D;
	Sat, 10 Oct 2026 09:22:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD07DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE1560670
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnI8LYAGMhB9 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D3686066F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624088;
 b=La5W4kghbPSnEp94KGomrTwzAfPKERXqAZqfF0uwZKH+r2DlM9mHk6U1uGpd/HbEhWrA
 xDCfCvcKwnnNdtrughmV3v5D72hnCcI6OK5paNqy+Hi8CtmxRfVkE7VEsU7P/JqLu+xfT
 2MhJYx5TYiT+5s1PrF1UBgh2dtCgoyJ+48xMtL01ffjK13oT5u1stcDM3v/2ElWr+/0zP
 axuWF092vxu06ZVHUQLfzQuYjgOeWA4MopBQmZENvzQ5H7jZEll5rV6hBplaqmzdF10Qu
 B1wFyCBlSXBJI1yuH7sxgAQknrtjQW2j3oztLIIT5WOCHVYCHG+WrJnxHhJH6dhOJbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624088;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mUR69+CzlOsjYoNdgJ1BlgaZjWfulEfC0xS4AtBUiUw=;
 b=PkaWKuBZgdNgvZ4TqJc+J869JAUujJwS//aXMUJ/ZEZuYbfUqF93cQE1CDBQIUCGAQum
 /GpvGPn8u/6Tl/u3/BxOS1ZixMLcxO5Z5wh/XLd3FoGszxADoAY1mtme4JpDrqUZVHw/b
 FOgxJaajOnORQQ1Ykkxvd3oJtHoVMe8ZVTGLMVQ6Yn2G92Q71gqdGIq8WrQzAtapjL7e7
 CM/zZaS4n91Kf2JfPIISYXjxDGtQ6OIkZr3XGcI80ZrHUwvgM31ECABCTb6DrFheg27DN
 twXtOsp5bu9F6gFuaGri63aYNKWtvqdnequDS8yoyBgRs6Yr2V9j1L88IWFj8mEWg3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3686066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2753D8F0B8; Sat, 10 Oct 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 22:09:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a345a04442abeff4f9cc3a4608ca919e6f328a64
X-Git-Newrev: 3a55c7aba610a4f4df1199b436f1570505946655
X-Patchwork-Hint: ignore
Message-Id: <20261010092010.2753D8F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
Content-Type: multipart/mixed; boundary="===============7931647681689369935=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7931647681689369935==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a55c7aba610a4f4df1199b436f1570505946655
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases to:
 - 6.18.54 -> 6.18.55
 - 6.12.111 -> 6.12.112
 - 6.6.157 -> 6.6.158
 - 6.1.188 -> 6.1.189
 - 5.15.221 -> 5.15.222
 - 5.10.270 -> 5.10.271

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.270 => 5.10.271} |  0
 package/linux-headers/{5.15.221 => 5.15.222} |  0
 package/linux-headers/{6.1.188 => 6.1.189}   |  0
 package/linux-headers/{6.12.111 => 6.12.112} |  0
 package/linux-headers/{6.18.54 => 6.18.55}   |  0
 package/linux-headers/{6.6.157 => 6.6.158}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index fc203c9097..bd821b0800 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
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
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index d6f44591c2..89bd681573 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9df30b02dd8102bbd0be52556288ef6889ddbe7f1ddb96fbf847d0becf3eacac  linux-6.18.54.tar.xz
+sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.270 b/package/linux-headers/5.10.271
similarity index 100%
rename from package/linux-headers/5.10.270
rename to package/linux-headers/5.10.271
diff --git a/package/linux-headers/5.15.221 b/package/linux-headers/5.15.222
similarity index 100%
rename from package/linux-headers/5.15.221
rename to package/linux-headers/5.15.222
diff --git a/package/linux-headers/6.1.188 b/package/linux-headers/6.1.189
similarity index 100%
rename from package/linux-headers/6.1.188
rename to package/linux-headers/6.1.189
diff --git a/package/linux-headers/6.12.111 b/package/linux-headers/6.12.112
similarity index 100%
rename from package/linux-headers/6.12.111
rename to package/linux-headers/6.12.112
diff --git a/package/linux-headers/6.18.54 b/package/linux-headers/6.18.55
similarity index 100%
rename from package/linux-headers/6.18.54
rename to package/linux-headers/6.18.55
diff --git a/package/linux-headers/6.6.157 b/package/linux-headers/6.6.158
similarity index 100%
rename from package/linux-headers/6.6.157
rename to package/linux-headers/6.6.158
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 37dfa31f2f..8c39ef70be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,12 +472,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL

--===============7931647681689369935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7931647681689369935==--
