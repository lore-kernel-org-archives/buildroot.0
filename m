Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE30C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 17:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A2980D1E;
	Mon, 14 Sep 2026 17:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VML65hy3NIQ; Mon, 14 Sep 2026 17:52:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 17F0D80D1F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789408320;
	b=SCPfv+EiRAeeA+1PfJQSUU2jlGNCj9kupV7NKfrRaTjgxSZ/NDIk63/ncWBmbsXfuTDH
	 NTeQSDRYq1b2SX/OD3URCri5hLeH+qqcnQcS4cFx1w4zs+zvnsqtzkU90aquU2B1D6yx6
	 CWBOoeRjFGYWM8Ug+MfJ9Lb/E93GT6xyWvxEgVsOF4lKv8TmkR7j5DZjmebVOEajWhpPD
	 CzxCG7EGmah7f8dO+sDqSsmf8LLYR/nqIx80mZCop1DBjRi1gpCXFgKbxP2uG34eSilUj
	 44ylWYY83EnGm/ExS0xPcBitpHYj0EkWIqxAblsZIuNrxGh2gS0L6FSTq9955z5cioQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789408320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H1Dh9rqls8z17X0qROGdm9BG+Z/WCuIB1MvYz25C29k=;
	b=Bat6IFBAgxZu9be0stA264qSpZfESuCElkgz0C2IewgI6SOOQlE7PSZ1Fjb7KdChwA77
	 4bUGMwMB7WbGcfGzHZHVG43hZqP1BjMTmc/6125S9rq+E1PAp78Ay7BacsoVCYE0dqUZs
	 nV7u3JxvQQ09j/etjW0KkgDrHDDX2DtdsfpnVRTHCZHkrbddcNmdr0cTtNAoPsE1bVDBl
	 Tppc0I4l+neox9T2q6cDZyMCo5iaIGOBRAJnxSy2vlT1I3QfvueEHh9P71daokDld+sbk
	 u2M6Yw5mSDFnpNhtYejDVDhVe/ZqlSi5558BIk7IhaOLWJNLtnGB41pq3xyICMcKZXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789408320;
	bh=H1Dh9rqls8z17X0qROGdm9BG+Z/WCuIB1MvYz25C29k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MIDnmaBL6Xcc+cBd3y33grS6KENYAs8cgstEscnTkB7qG/JcogsND25OFEpyz6LjZ
	 LuAjupZSngSDa7J+nKoSApZu/Cxkx3Lzv1SHxbEtVMFJSnSfjmn80onpka4mk46EBj
	 70QNPqITJbKv2kDgX+5nV+wc1hKJm1ILy3y8OUiOQQAYxYJsNMgPzn5owvzAYiEGUz
	 R3sN2ysvX9Cv7fnIk2He9d7UoF5XOReeEmos2Lq1yDl+OKeaBZFEsFDZG7QVyOyvUa
	 B8bJyf1E2cNe+fj4J2Wt4YUPvOZrfLErteT53eSlhx6ppthn89pqhdeI7f8NgfRzxW
	 osujz+8KdrdcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F0D80D1F;
	Mon, 14 Sep 2026 17:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1207CEB
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03FDA400EF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNT7sD0Y6a3H for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 17:51:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CA82040055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789408317;
 b=fv33UYdiZHxC5lhW/AUFtV5Zp9BoTRvSdIbhwdRqDPAc64SnrBsc5+XND3iqN5gHKrZz
 8+H8c6xeHbgCusstXy7KDhp1WzZxogvzIyubbLKNZqF+kICjc4RjseGiyE0nC1ZkIHlJ0
 trVPLnVN25cDZqJgIQBavYt72ZW2xu2Qub482xEFh/90pAMFvrDRDSbj9twBrKdL1hg3R
 PGWAMWjZqMA11IA5Kb6IiNUrO9wzYlRfDvFvRtTVe2V4yb5NtpZnIKiUpf/y/46mEj5Jo
 lfNQl/Cw0jgG4hLHQTa+MmmmbtmrSKLzsvDbwAifrE8iQingLerlpmFDQ82oelJc82g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789408317;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MS7lPagpAjxcjAc9zSgfji5+QMi6/sUnUUNCR1ZNo1A=;
 b=ZfXbfr+Zy7U1rRy6JYq6MPnEV6m4CVdpYPYa8/pZ/ID5uXToP7NBaD4BCuer4N3kd4r2
 vhz8CW1MeMvrVp9HPYRytPLHWCsVQfDIn7kfUWC660QOrqbneEF0j9EGBcGIlOfEp0T+e
 p67tSykFAOOFq73sLlnlwNChfOEbu7scHRQePsXxb0bL3C7vLsabatkJ4kckyIPlyl9HI
 VxiTmY6Q+hzsxtUBgiYtN17EtpM0fIXnNFlz1LvN4CssCfsDT1QSssF/WW4mNYW3Yp3bb
 AA3KfrDRN9oGq4pihKEE86XncBTxfiND03V6o1Uu/nN8i9jx0Pl3O2XaZ8tSRXOCpwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA82040055
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:51:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B75F95C9B; Mon, 14 Sep 2026 17:50:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 19:41:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04d7d7bdeb907483e7db0005b403484f379cf84b
X-Git-Newrev: 38918ea48e55290e8115ad5a336ed3f6d3671757
X-Patchwork-Hint: ignore
Message-Id: <20260914175052.5B75F95C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38918ea48e55290e8115ad5a336ed3f6d3671757
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.5 -> 7.2.6
 - 6.18.51 -> 6.18.52
 - 6.12.109 -> 6.12.110
 - 6.6.156 -> 6.6.157
 - 6.1.187 -> 6.1.188
 - 5.15.220 -> 5.15.221
 - 5.10.269 -> 5.10.270

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.2.5 => 7.2.6}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.269 => 5.10.270} |  0
 package/linux-headers/{5.15.220 => 5.15.221} |  0
 package/linux-headers/{6.1.187 => 6.1.188}   |  0
 package/linux-headers/{6.12.109 => 6.12.110} |  0
 package/linux-headers/{6.18.51 => 6.18.52}   |  0
 package/linux-headers/{6.6.156 => 6.6.157}   |  0
 package/linux-headers/{7.2.5 => 7.2.6}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.2.5 b/linux/7.2.6
similarity index 100%
rename from linux/7.2.5
rename to linux/7.2.6
diff --git a/linux/Config.in b/linux/Config.in
index c4a580d1b9..86b42c93b2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index a2e1a81725..dea492b9b5 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
-sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
-sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
+sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
+sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
-sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
+sha256  c07882e1e528efe206567a26de30b192db8dc4369974d4ef4ce708691fa1148c  linux-5.15.221.tar.xz
+sha256  de73d528b04be91f6eb86660aa67a4d53b96bbf20bb5a326e78f802d744debe7  linux-5.10.270.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 6f0de8b94a..9b4e1eafed 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  55ddf0df8325d9dad96fcff7bd93977d22e3f50af06527572af59b77c7632b78  linux-7.2.5.tar.xz
+sha256  039aef84f2b0994aeda3f4fcfc3d02ec9d7a9bbb9020ea264c43f446c860f606  linux-7.2.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
+sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.269 b/package/linux-headers/5.10.270
similarity index 100%
rename from package/linux-headers/5.10.269
rename to package/linux-headers/5.10.270
diff --git a/package/linux-headers/5.15.220 b/package/linux-headers/5.15.221
similarity index 100%
rename from package/linux-headers/5.15.220
rename to package/linux-headers/5.15.221
diff --git a/package/linux-headers/6.1.187 b/package/linux-headers/6.1.188
similarity index 100%
rename from package/linux-headers/6.1.187
rename to package/linux-headers/6.1.188
diff --git a/package/linux-headers/6.12.109 b/package/linux-headers/6.12.110
similarity index 100%
rename from package/linux-headers/6.12.109
rename to package/linux-headers/6.12.110
diff --git a/package/linux-headers/6.18.51 b/package/linux-headers/6.18.52
similarity index 100%
rename from package/linux-headers/6.18.51
rename to package/linux-headers/6.18.52
diff --git a/package/linux-headers/6.6.156 b/package/linux-headers/6.6.157
similarity index 100%
rename from package/linux-headers/6.6.156
rename to package/linux-headers/6.6.157
diff --git a/package/linux-headers/7.2.5 b/package/linux-headers/7.2.6
similarity index 100%
rename from package/linux-headers/7.2.5
rename to package/linux-headers/7.2.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 613ada58f3..f855af4a79 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,13 +476,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.51"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.5"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.6"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
