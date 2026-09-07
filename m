Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9135C79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 13:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F798100D;
	Thu, 10 Sep 2026 13:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSgOmHdW362d; Thu, 10 Sep 2026 13:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F1D981010
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789048752;
	b=r4yot/ewIG+nZ6pk1uxz/IcObXDXdoNgYVYaXOSX7avk5RmHDVTTGqO7emFMgb1NWcgC
	 oTfR5PpmR7cbKMolQTNtD9ZY371HI0gvyOkq4gb4P3Jtf8X1wcjWtWvslENfCKmjSCwDX
	 YUL3XzJmf4Ks8mHY6xVhM88GQZxURONBBHe7blgfCGolWWvfSSFXjSvTE/wvX1YMpouaY
	 0AuFYTdexIhUXdS6e3xbal+DfozbQrWXycdasGdeYNDuBeE0G2zvT7RPb2l45XQ3i56/a
	 2K1HZXMiZSBebaCZ9+6w+gR5GSp8My4XNjOXQwBca/DgknqRdj77koiKp0GPrjvjXwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789048752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UyliNTWdyIZBcJp2+VIOjjMubx1oo/DwxEmftmVn+nA=;
	b=eWNr34iO5BrazcXVWmqEFrZQLvZw/ey5Vf32ErUTajGdEMXio6pZp5E5XtCcP9HYT4Ih
	 KAkpB6xSsvLgLp0hK9G857+rMI5vwmHcQTV1tY0X8m44GWnu+Z0TriXyG9dVuOY0fm0hU
	 GkY3G8vc+AjUiLC6hw7Y72dVTWEUuECaBVnORUSTMJ/Vicnr6R9QLWPnh48oJPyhdyjDS
	 0QiMveuG1LRPK+bOwRpwxIavalqV0wBef1pbP3V3JwcJdqWsyDkur0EDN+5hbZS4VQJ8J
	 VXIS0nlL4cSeJFLgOYyaycCyPfRDgODWkqcmGSPUJao8XwnEyW2JLR1v2PSqJD3QVyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789048752;
	bh=UyliNTWdyIZBcJp2+VIOjjMubx1oo/DwxEmftmVn+nA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=btso+P+bWFYh4fVTgMz+M1gkYPSsollkYDqRIcsBwsVFN2hQ6U3Bc1GNskA5M3zbv
	 ci5twc48Loh6KOZgoglcDK2OUJzBFYsfZD6adzAgcAWDar4MK8TxVMXnWi9SpcUu8G
	 TnytHUOXsVtenLDrhLu9SulL3qxJyJe4IfSvnKA6/nYgXSYVdPO+vpOMOijyIYhgbL
	 txf+4fhI5E2xiwGXMB0UNn+DM9kegzdG2OGgLJFuhtwBn84ozn8hkBmRyBsuN5NBpK
	 Sj0TDeHk3rgFgpngBoMqPllFvddfccxelWJUM3LP0LQxPAuqMF8aW4raEOddbTrtC1
	 9g05BI7oxvmvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1D981010;
	Thu, 10 Sep 2026 13:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37E811EA5
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF6160874
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5psor6LiX3xs for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 13:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2558E607FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789048748;
 b=kT+iIkQ3M9EZ9wWBX9V79rzSOwI5ffWkFFu9zKMpY9OoWo4LKRnPIrzAIUKFjT7Kgtdv
 hPxMCkkMYAwG/8kMlYXqj5kj6k+U4MIilFsPHWoNNW/GDLytZoambg+t06SA25q9DGSCw
 Xt1frU3vxpLgjnPiv63WqF+Z6KVa0T30CfFYblwPF0ETCtYNAiO+oyEWEHdwPo8I52Eei
 KRnICaQoADQjRXpW9ALuhL0Gki0BTyap2XKJFYG5Tcp2w11fYQ0kops4Bq9fVnN9qj0/S
 160CjqTJfqb/T8gPSQkloIvwWuGe7j+eRkrm+nwh84Qf7wuDyjDf+3so6AWINiEQQSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789048748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nJUGZy9pGDAOvlMwatTgnojFaArk6NEee/vkhOHtKVQ=;
 b=c9LhlEzCtGLOdl8S4B0VqQebWxGIqJ4injeMFVqCtsu9iFaxdGZATYHTz4Id01PmYWW6
 FSa1Y5Hbc6hF1OnVX/X9jYCxeKSXTxX/u+kT21gCiLXLxFoLy8r3Toh7SlaSz2YuRhbhV
 hMpH2nDNFYqwfl+SXt5toKgYxfDlUniwg5ncffNG+fpsBeky6vlplHv/OHbFYBKJ45bRJ
 mrwbH933ZbR8stMhCXszNzbd9XIRWcbrQaaxMYT6J56AKz4/BlQW8bm5rAFT8Z96Vs2Zo
 JaVL6u0bZeOshbIepsgZDhnefQ9xPijgiecsWkQrfVswVBLb50NXcnaO89Rn6W7bOIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2558E607FC
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B179B9554E; Thu, 10 Sep 2026 13:58:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 19:18:13 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4a7136948f7b6392243d6110be1c7b7270751cb6
X-Git-Newrev: 5594aeb3c7f403612d027e0cfb2bbe3a1665d109
X-Patchwork-Hint: ignore
Message-Id: <20260910135804.B179B9554E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12, 18} series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5594aeb3c7f403612d027e0cfb2bbe3a1665d109
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.268 -> 5.10.269
    - 5.15.219 -> 5.15.220
    - 6.1.186 -> 6.1.187
    - 6.6.155 -> 6.6.156
    - 6.12.107 -> 6.12.109
    - 6.18.48 -> 6.18.50

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.268 => 5.10.269} |  0
 package/linux-headers/{5.15.219 => 5.15.220} |  0
 package/linux-headers/{6.1.186 => 6.1.187}   |  0
 package/linux-headers/{6.12.107 => 6.12.109} |  0
 package/linux-headers/{6.18.48 => 6.18.50}   |  0
 package/linux-headers/{6.6.155 => 6.6.156}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index cba5ae653d..a2e1a81725 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
-sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
-sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
+sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
+sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
+sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
-sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
+sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
+sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3ad8d9074c..11a4ace0af 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c  linux-6.18.48.tar.xz
+sha256  d2fc041dab4e11d9645e3ba53be058faa52b8ce28a8a97c889bb2cacee170461  linux-6.18.50.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.268 b/package/linux-headers/5.10.269
similarity index 100%
rename from package/linux-headers/5.10.268
rename to package/linux-headers/5.10.269
diff --git a/package/linux-headers/5.15.219 b/package/linux-headers/5.15.220
similarity index 100%
rename from package/linux-headers/5.15.219
rename to package/linux-headers/5.15.220
diff --git a/package/linux-headers/6.1.186 b/package/linux-headers/6.1.187
similarity index 100%
rename from package/linux-headers/6.1.186
rename to package/linux-headers/6.1.187
diff --git a/package/linux-headers/6.12.107 b/package/linux-headers/6.12.109
similarity index 100%
rename from package/linux-headers/6.12.107
rename to package/linux-headers/6.12.109
diff --git a/package/linux-headers/6.18.48 b/package/linux-headers/6.18.50
similarity index 100%
rename from package/linux-headers/6.18.48
rename to package/linux-headers/6.18.50
diff --git a/package/linux-headers/6.6.155 b/package/linux-headers/6.6.156
similarity index 100%
rename from package/linux-headers/6.6.155
rename to package/linux-headers/6.6.156
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3193f2e855..33b22c9d94 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,12 +468,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.48"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
