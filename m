Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E6C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D22860BB4;
	Fri,  4 Sep 2026 11:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uB92uCWN3v5O; Fri,  4 Sep 2026 11:16:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5109F60BE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788520608;
	b=XZjRqx5+WjuF2BefZhoDyJiwJqn2lTsLsWFnfnZrD4u+gdTUhAnpJMHESiUmy/+NplV8
	 4kxmXOACMjlU2YST+R8AU6SRvUTfLRrAn7I5neQkF6QChVqueRc7TYzvuCsde5lq6yCls
	 Jmp7aXB6iNB+yOBjMMx1Lg0nZuD2nKUeEGijQ2Z3tgwYIpp7RbENfkezdVfwkPVEPdtba
	 h5ZOSuMW+hLoG9FIPzEvTZwfW1WfvRWfhbmTG5wIsQL7Ze2mCi+RB8+MtS0GIpaQwMkvX
	 tbWzVtAqvS6ChWtSabbJi1Y2SOjnIoC+nPpgFnJiaKLIMPKkmq+48w6JvsZRIqxz2jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788520608;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3NkyNTBi14h3FuPNTQk3zXSHPynQSqh4JUo891If2YY=;
	b=V6F2LgAGfTg0kxnuCwZ8HBXHjkqS0tgTW7fwlPfsI//9FavU/fO6+0j+FDYrbQEHRKMP
	 m2YU2xD76lJxxxZZ9pLZG2c7HYbhl8OKqs3MelDYHufZKIV15nyRTd6nZQCAeUrNcQCFW
	 R1p/MbiavUPtG3MXJwDMofBCXakvVeH4/+rXCsxSJcUvJUMjPOlVoTEASMdIsgoNoUmnq
	 q4fPoDexzmWajk7RcgCGDelsW9U2Rr/xSxUGU4URDJw4Cou+ATlA7pVYCVvRYBbfrvmJC
	 MH1gwvtzmo8R/wJWPb5Q7rsIw/I++XKn7MKNNBUYce32mCA3PVbqVkCBXrZspN/N1Hw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788520608;
	bh=3NkyNTBi14h3FuPNTQk3zXSHPynQSqh4JUo891If2YY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S6IQq+yblCiSpPsYM2BestUNMYti+xPWnLuJ+kcdoxr1rx4RhQSzgeY2wkwatPVfU
	 WNA57SaxhRGyznLcUKgFX4E7Rb/M8CvUu/RTBE7Fq3racTJce5koBOYqh0OPvddKsh
	 yUsWjM/zMkDWES0DYZwXTKNrR1Fg5IGW6hgDJCx7LZ/P30cHJq0MEmXEuoE+KPh0Ii
	 NJ6VwWm57mFSisTPNvqWXk3+fC8i/9INmS5ivspTklWknJgrTH9ROObxd4ErUUZGv/
	 LwVUSN8LJGXKbfaAbrgQsG0JEJBLt0JUouQE9OKvPfjDhKUrtsXqsqTMJNClfHdrqW
	 css5HsxxpvxNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5109F60BE1;
	Fri,  4 Sep 2026 11:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D334E200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94E240B66
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_XCiEOFqXfp for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E531740B25
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788520602;
 b=MXOu7se0AlkMbcn8X4AGxIzzhPJaeTnuHQC41RT2nCnC7Yt9yqm0vzHahqdk5YB1azKE
 3c1ocRFpbnI3LAUZJ1f3xDb4Ax5VO77puZbDKdR/pvFz77IYErRzVnoU1bmBEfe+Q2JLb
 PJMkYX247WZbcYlPMVwxod8feb7vFK9IFbBAZfAwPpr/VsiTBzF9bP5AVUErtfSP27Co9
 CoGFl//qmtH69+ILyNXCSFfPa9oE074t2szYxlwAE3FrbSGQv9K0TaLI/7uFI7UlcZPJ1
 NxO/VvtFn7hIWYO+KFqfxPZ81q5hnr0OKLhPaRkjQOmzVXb3+bUCp/SlNhL9/YItGeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788520602;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i2otJJKlV4tMJ1qnBFPlU4TfVVewBfANc5y1E9r2Tmc=;
 b=gGXdtVZAYd8UyxHMIU4V4HsobCUHUIK4L0ErLWBjWlpuNhXSmTUb6DH1RYFLUdi9v8tp
 O9QWcvcS1U8LAusNLITkoFcF2d7uoIfsi/Qj6D9/o1modV9IaZJMeR4YAgXvehmt4MDWw
 G/GP44wwJJkLPANCWTw1zfKsQJ0N2B1XHoQk69qjn/hs+0PIXMJDsx35kv08O9qey5khu
 ZRmpMJ8t8VX4RM3R/VPYHcMDd93RF/wkEsWgOiQYUpDHvQwfuRCDrVU3Yi0ix7zyxXqmK
 Vpz8QfMtYMpL8eeWapwkUPfVJYtLgVNnOM87rYckGtY9gnXGDWdjUo8PqeBFP5rrbhQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E531740B25
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79151946FA; Fri,  4 Sep 2026 11:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 11:57:47 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3cb30131935c04ce6a8238dc5a9e95d977f8546f
X-Git-Newrev: 28d08f28a0edb410c041f0e26c19700defed7914
X-Patchwork-Hint: ignore
Message-Id: <20260904111542.79151946FA@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28d08f28a0edb410c041f0e26c19700defed7914
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.267 -> 5.10.268
    - 5.15.218 -> 5.15.219
    - 6.1.185 -> 6.1.186
    - 6.6.154 -> 6.6.155
    - 6.12.106 -> 6.12.107
    - 6.18.47 -> 6.18.48

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.267 => 5.10.268} |  0
 package/linux-headers/{5.15.218 => 5.15.219} |  0
 package/linux-headers/{6.1.185 => 6.1.186}   |  0
 package/linux-headers/{6.12.106 => 6.12.107} |  0
 package/linux-headers/{6.18.47 => 6.18.48}   |  0
 package/linux-headers/{6.6.154 => 6.6.155}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 73dac876e8..cba5ae653d 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0392555761d99c7604503f6178951e2df77e978b92cc96d11e248423e48ed785  linux-6.12.106.tar.xz
-sha256  edee00f83db050239fc1186535e1037782a5025001381f1353d0d3d741ed0234  linux-6.6.154.tar.xz
-sha256  3864d9a1137dc626497757c7406a6d865456fd8956c80795ff3aa46c7f1a2674  linux-6.1.185.tar.xz
+sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
+sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
+sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3801bd134f3e9eeb77e370983d42126ac1a1d75039e985f928818dd6b8df236  linux-5.15.218.tar.xz
-sha256  5b440750ac42c88abc06c26f5d47d2c839164ead382387df07654517c67cb106  linux-5.10.267.tar.xz
+sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
+sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 5ca64bcdb6..3ad8d9074c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1b3fbafd43601a5473107cf8172a2b66f42994119089d7aee078e4bca3dee818  linux-6.18.47.tar.xz
+sha256  5ebdadb10a4b5708fc6b1c457764a110bc49f8150cc3502c59b921ead8c6fc8c  linux-6.18.48.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.267 b/package/linux-headers/5.10.268
similarity index 100%
rename from package/linux-headers/5.10.267
rename to package/linux-headers/5.10.268
diff --git a/package/linux-headers/5.15.218 b/package/linux-headers/5.15.219
similarity index 100%
rename from package/linux-headers/5.15.218
rename to package/linux-headers/5.15.219
diff --git a/package/linux-headers/6.1.185 b/package/linux-headers/6.1.186
similarity index 100%
rename from package/linux-headers/6.1.185
rename to package/linux-headers/6.1.186
diff --git a/package/linux-headers/6.12.106 b/package/linux-headers/6.12.107
similarity index 100%
rename from package/linux-headers/6.12.106
rename to package/linux-headers/6.12.107
diff --git a/package/linux-headers/6.18.47 b/package/linux-headers/6.18.48
similarity index 100%
rename from package/linux-headers/6.18.47
rename to package/linux-headers/6.18.48
diff --git a/package/linux-headers/6.6.154 b/package/linux-headers/6.6.155
similarity index 100%
rename from package/linux-headers/6.6.154
rename to package/linux-headers/6.6.155
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c278d59061..3193f2e855 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,12 +468,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.267"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.218"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.185"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.154"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.106"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.47"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.48"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
