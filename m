Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E210BCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9694405BD;
	Sun, 11 Oct 2026 13:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFDU0lMp4Xh0; Sun, 11 Oct 2026 13:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AEEC740676
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724391;
	b=iGZqvcqFVvp7EFuHSaa6lFUj9fRJMA0uJjJgj2olNNPmF2DlbCakMUpvfZjhhe1rZB+F
	 x9HGchmzOWYR89VZmsDil4I/JB9gXVTOZiFmhipfoFf78eZiLDCxnCZBZrt6o9TKVPL28
	 iWgy5IPOVQAALPma9SbLQlE1dwwd2FKD8joAgvK8HeQnax2M7o9Ydbmb0jZokW+cQDXy8
	 CvhXs0BkNp7D5Q2rDiHr9EJBubY6tD5ijJRCNjsiJ+ODiaWERC0mqzh+VMhoNpjScxb9s
	 //XA/h8SwPq7NNI5mMBrrKWdRk3s3a23HX4zuGrnDWURYF5eVAXoAvsylAPFGdOGiVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=c2MV5jW/mBHOayYx1VekMVf4Vb7AglXqLIYYRk5zfGg=;
	b=jsTr2PEic1Tgv3woqYYtYKISG5g2PKE3o0BbR5DuYnPNBR9ZY0qRXIxQcpQaqtwp73L0
	 DyhFjGyi4/QxbEC+78p9+4MqaZRqiOzFuqzS+RkWtMkZFpzc4kjgQYSot1dDT7e0+cOcX
	 K/aDA0/SlOSaoDM9ODHx5mzZJSA78KRou/QmRzjouFDpHblqs3jKnSTqNjCSOObDHWFa4
	 vL4Me7tzJB51k+tRKqTT7x2QbXnJYJ7E+wMWvRqyCj5m2IsDNXT7E9RlWpdy+nA83IS70
	 TjVbd+uJx4OV1KJhk7bHoBR4o3fr8lUyYwhkeXeH1RAG0akLPmHtiCjAPLAF0M3c/zw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724391;
	bh=c2MV5jW/mBHOayYx1VekMVf4Vb7AglXqLIYYRk5zfGg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nd+S4J+BN1esMBOyk+BSZQ1cp2DNobA/Z/jOKCFCDslIB6fInIIFB3r8SuVgeOwvX
	 8Szp+rB0M2nb6zhat+/aw/7SfIV6w+ysHe0qv4g9tra1b1ABgGE6ZojGyVxAmDyj1h
	 cjTydgevulB4pLqVhgbonjY86N+mlp82tpPgSi9RogfjKIJWOzO8PzYdvdXWmQNqFA
	 lEHCbRc6T9Nj93T9WXzi/gMWK+P1MfCsqfVJaloyewTgK8w7fWI9wRil3+XrDteuLO
	 9Rbe52VisdQ4j4N7KnIMNw6Mk0BblpLRxlB0B+BghrQTBDb1U67kIT3Ii8kgC6Y3tT
	 KTWfa9iD+bA6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEEC740676;
	Sun, 11 Oct 2026 13:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D39F0194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C595760612
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu2uXRoYwFzS for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25E506060E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724389;
 b=oPgxN06fPDmauEFRUsXdNiz+lWiSKlOl5klzqQU6bPRTSpNBaMCrHGFdRACv0D+H8lJO
 fSFOQm9lMTGK0lWTbknV1oTExFpZIwDWqFTZzvzA+MC6ySZZoriguUPQuXZHcMD0WwkQ+
 GjBpCnpjKPU5OKcuhRa+f62Dp1VLZWpLYWxFP6MKUqCyNqZ9iwWzeCEbUZhIWVCnlg7Br
 o24Lnl8g9CBjwnYcvoA2J27SJirvRBdx1kASTCZsFkn8se1lApvSL9rHCU2Bc09hgVFY2
 8aun/wLITLwru6uEJggqggpCS4LYJ5o3CXWyr47KjgF0Ip1geV0NOrqc7JdV04l/wdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724389;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NEc5UEnyz0J5Wx+xjnPuIeKuLxKo0GxIzqHFNX4OfO0=;
 b=aJPWPwLQOqpjpvnZmVmE9t7+o3FIuMBif3QQ77gwBWFMtYsngC5hH6EQKTrgCUfkM7mp
 Jc2/FOWtP3MXWa/B1sCrzxnJBozDNtahzPFb/YGe2S/x+5ap3BQ+pKXBDcZCdRCiJhsLd
 hxJL59USzmPPsrmN9+HfzMv6BbdfGvseNbpFzEWhyeG1Ar7zuf4vl/sgxowUP8YRQJT+i
 LV9nnwKywCpMpGOrmMLqZHRt/tfs2TVal93JU9434dbfkH1gbt+1AmeShTqdKFzWGmzoU
 e79jxjTQc3D/VcAcths/W0WnE00uRhfzGcAeJM21UL+i0r+GvMXjGGYxEvRd1zWc1cA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E506060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:13:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64B8F947D3; Sun, 11 Oct 2026 13:11:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:12:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f350991abf13bce2a0d21a69b08f0e7a6a579b1d
X-Git-Newrev: 0f7c08d8fb36e6e12522ce6f8012c91ace520204
X-Patchwork-Hint: ignore
Message-Id: <20261011131150.64B8F947D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: always select host-uboot-tools for
 mips
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f7c08d8fb36e6e12522ce6f8012c91ace520204
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
for the latest Linux kernel. This change is intended for autobuilders, and
was introduced in Buildroot while the latest kernel was 6.12.

However, further investigation seem to indicate that itb images were
generated for mips for a much longer time. Linux commit eed0eabd12 [2]
seem to enable that image format, and was released in Linux 4.9.

This version being EOL for quite some time, we can therefore assume
any "not so old" Linux for mips will need host-uboot-tools to finalize
this image, and therefore we should select it when building Linux.

[1] linux: select host-uboot-tools with FIT on mips
    https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
[2] MIPS: generic: Introduce generic DT-based board support
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 99efb56b49..3521fe5cd5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -4,6 +4,9 @@ config BR2_LINUX_KERNEL
 	bool "Linux Kernel"
 	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
 	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
@@ -32,9 +35,6 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (7.2)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
-	# mips always generates an ITB image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.254-cip72)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
