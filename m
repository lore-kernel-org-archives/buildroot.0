Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB887CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6066A6064C;
	Sat,  3 Oct 2026 17:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37tF2OD5UEvO; Sat,  3 Oct 2026 17:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4A94D60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048122;
	b=IizL44WspQUdBCwIRagK9HipbbV6CTpqbo73Tdtd+n8x7NjjH6arxvzPD1Hy2nF3ORhI
	 wqJHjASe577QqxbAVCO1IJ9u1TOedYnfI0uBtpKh2uFmmId3qWYR0uyW63mJEmzNmXscM
	 izNpRCPM+Jlaj39N1foDcqbQhFyUgMlxsYWfyBYrJLcyB2YZCgxwvQozFSMnSp9YIYX/Z
	 hyPNr0sTDeUa6NY2Kf/745VqvBofUp34s+BGSw8x42/JAt7pwkFSGGWy+/zOugFSMUwTa
	 bUWpoHjUNPlLXKNQ7WmAmClYqIF7KC4cFOkdsydLl17b47mpE5uyDKs/z/Uky7adqPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=48A/pmhUfq87xEbekls+yTOWtfd4BGTr9583N3QrcM0=;
	b=gUUqmLVXsnIzDLmBWrzWDZ/rhmAsaikaq1fGTu45RWYLeththsOjRHEZrBZarPe/oKfP
	 5bwhheRa7eQ6lIKwl11O8k+GDSeCKjXF5AHNJe9vxDn0WGpygYDJ9fpugWrSgaNRLTQWb
	 h06g3bbCGkDEZTQHjU3mlVW+rWu5/7qJgdP1Pb0fXuAPHPwmlrFBkS9+wlm1DfZuuAh6F
	 UKI3SPukClSIOEVqm52aH3JszlFkcNFPuPGrgcTyD+PJAjdIdy/8Sp/i2hMMHeHWjSXga
	 hJtWlGjng/3wMqWUw0v8z/z86x6DfRasK/p9cb/VfvFzEW00vdU0fKr4kcd0KTUP7/A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048122;
	bh=48A/pmhUfq87xEbekls+yTOWtfd4BGTr9583N3QrcM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BdKXaTgNu33TuUIRjNs5Ux/BNjX7r9XTNAs1J/bjNrOjSZDYnOWPszNP98r7qvq0M
	 0icpMCMGY03fXDMX435mV9XScSE8KmKDRqQzrvv3uruF7kg/897WYME056M+g2ZM6y
	 mzpd7L5v0ZROHcu0BzR4Q68g+vPAH3wiKkYOldbURL687D8NeQNMOFN9gfLDjgkvNg
	 S1YtG++mY9TuT/r68QEcwABtKxERpiT1QoRnQCoJUrdiYX+sqLt9Neoxw381vWypTb
	 +/Ev8Fh6cpR8AhSL3o5UUya+U2+JsjyosNCPGGjc2JTrRu30puGR+VPul0C+zPKem8
	 oXj5lhym/snvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A94D60652;
	Sat,  3 Oct 2026 17:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63805263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BD440064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4B9QODykmuE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:21:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6461D40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048119;
 b=QnM8b0C3f/p4B/uhmlV/Nzb3BLHg66iadS1OIiM6hyY1DMx587J/Dv4Bin1JFEnLGsPR
 miEnu1hub/kBhCnql6lw0LLvITQuni4t8rtOFLtjkHQuovQ3dXmcUAdCPQYD+zyhRf32u
 DEncrigucPUy7FMN5Ux8JeMKQE7u3FDkxFU2IfCiOHzqv7FKRLrHqZ9hhA9vy1TOUvzck
 xN3Tfsd2+WMGviuJonW3lDTxJ/4Pg9NFJSfm6xp8Rh3auJEO63HrnK3KtVmngOBswxymV
 8TND1HDT2ZSSchYVft/0ip84t03/5LyDJZjp+G4DnbQxAo+6FkT2hJRDlkKgGMlaA3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048119;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+ws6b8sSkPZBA78fXmKpaOE6UilyY/a/sp6g7jd0vaU=;
 b=koDf2b19/8V6RG7lxWhRGErJ/dh0pH75N6DIpyxOUFKVFaENPwDXE7hxIH5mfWRhgrBs
 t47b/zZWCbBI9whqk/njOPbdYGK7kujvoh5oZbrI8ilQm1iswZ5T52znHRrAOA6Ly25QQ
 MLhqrB5jbSXHxb5bbSbY2CfFd2zybcr8ghMSyQ9kqaCLkwTASVbPjRsnmL0IYdNsfQDEI
 afzVfokOr8CNx3+D++zjH6GDfGDuU+g6FGNWzJvClA79FQ+vJY9ST2f7gJBY+n33lQZI6
 iXU1y2KFRrc/Kfo+DB0Wi84TZjzR9VcASUkzBra+v6B9NRehI5PzHZk0hPz79Cxgkqw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6461D40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:21:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A59F8B511; Sat,  3 Oct 2026 17:20:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:11:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18f6446b4f29571c3cdd0c241baa975de011edce
X-Git-Newrev: b524480bde6d461f333e6070a7c79030ba59380e
X-Patchwork-Hint: ignore
Message-Id: <20261003172044.8A59F8B511@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b524480bde6d461f333e6070a7c79030ba59380e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.8 -> 7.2.9
 - 6.18.54 -> 6.18.55
 - 6.12.111 -> 6.12.112
 - 6.6.157 -> 6.6.158
 - 6.1.188 -> 6.1.189
 - 5.15.221 -> 5.15.222
 - 5.10.270 -> 5.10.271

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.2.8 => 7.2.9}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.270 => 5.10.271} |  0
 package/linux-headers/{5.15.221 => 5.15.222} |  0
 package/linux-headers/{6.1.188 => 6.1.189}   |  0
 package/linux-headers/{6.12.111 => 6.12.112} |  0
 package/linux-headers/{6.18.54 => 6.18.55}   |  0
 package/linux-headers/{6.6.157 => 6.6.158}   |  0
 package/linux-headers/{7.2.8 => 7.2.9}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.2.8 b/linux/7.2.9
similarity index 100%
rename from linux/7.2.8
rename to linux/7.2.9
diff --git a/linux/Config.in b/linux/Config.in
index b9e69e6d7f..99efb56b49 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
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
index d5e874c113..d2556506e2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  12e8d5a973d1ad7c5a5c69882e4022b131ed715db7003fdcd760ddf8c3e51941  linux-7.2.8.tar.xz
+sha256  b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba  linux-7.2.9.tar.xz
 
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
diff --git a/package/linux-headers/7.2.8 b/package/linux-headers/7.2.9
similarity index 100%
rename from package/linux-headers/7.2.8
rename to package/linux-headers/7.2.9
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 88ee7ab17a..b11db18379 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,13 +476,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.54"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.8"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.9"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
