Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29394CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E9C607B2;
	Sat, 10 Oct 2026 07:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMLev8mIAtEE; Sat, 10 Oct 2026 07:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18DB960663
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616128;
	b=np4+tGnNYOBZD9iGWIx8RVhNj0Q2idXSIfm8IlmTpOThH3PmdPTzCKrF/HGbseLBx22e
	 I1AylEVjf2GkdF7BR3Sghf/EsIvRqWaGEAdDRgU0f3xPUqocrz3UeiRub2ilW7fOKI8Pi
	 /WPRZFzQvbbrUR83N7z5iUtMkTG5PVAI5yp4pegnO/nDVnMPdFMbm2YOaUPGBTd0YEKpX
	 aGqJ/u7rrK2N41nv5wBSIEaP25JGWpwEB/UDIcVH45xwUYhTRQHfuXpDO3CnGjeSmlTSg
	 anSbrJQ7sn5y1ClG1T+UEdg2RnKfv7mHDNcourewJYnQVNW/lzKJbJFItjVruNqVcYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6El1wSr4O1aYLnvpQcgKDw20v87b12HSOZq1LmzfMIQ=;
	b=JxGmQX7Yh1MOFtdQS4qYa6i9PnFG34DHlmmmgO7mKLCE3/zKE8RgVSCIRyayLXNEY0HN
	 PWxZ1wgv9YorBAC8k3hDcNuGC/sCSotloamgun8g70s5m4PfdifB303YHHswouOK/WorJ
	 sb8qSRE+pLqBkQ5MZPaYZghI7r2zqfdNbTbPyxAo4MZGq4UEbI0J1kihYEALi9bUYQfKR
	 SsUuXXF8uWzrkIddHy33RxlF4fFJRDbwMJT45wOKvpzqbBlMnZZHITXGG3QqScuxAHrHa
	 VXa+YbaHkn4iFB/eMqN2mQ8i4aQi3AOv8t/XDmDji5kx0Ojsq9vSlIHSwTgYyd4YaXg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616128;
	bh=6El1wSr4O1aYLnvpQcgKDw20v87b12HSOZq1LmzfMIQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M1VNjZOiVqhcxucLg6FdUlaDPADkvTYI14N9h1EU3J8mHuevonTNM35E2N9YlWCVL
	 dhDUuZ4eOnSKWuH/qd1CGTMMezCrICHP0bwuWTTm6CCilMiOAqaJQMSWf/xS0asCGC
	 dAIH2Yr4tCSNEH570mBU38TitqPxrO1r8dzXonxf7sZAn7DOJuGRUev6yhQet8j+jb
	 Hn/mepECFIIkZdep/kNaiG4+faBhQm8QYLBjh7l4tjfBLctW4YMD89SjYuTs3qa0Jn
	 DyPNx6OE31n/vAHIB8W8aOkpn0pO+Cc998YclxKULDJjChj4ptEMYCq5H6sB4Xiu6N
	 afh3J8BeB3bGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DB960663;
	Sat, 10 Oct 2026 07:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3BA0111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EE76064A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKxfqMtPmsoe for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECEC56064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616126;
 b=KUq2KSgmlxvmwX4THola0vIOJae+WLJpO+bVmt9qO4puPtMiTweYEnNSj5eykH/+2PxM
 PC4xRezU8Gl6Eb3Yz4CrWtcU4MtMZ2PnAyUDXe0//FD1Ql0rkeR3RPp4zplDcKo0CWI07
 IUL56mZ84nDzeuZ+gVX/yAzp4i1IuCxqfbBCyBMdNxFI+3ZRWpbU9t6v/WHPfbslFH9V3
 oKobnUuoWjK9rwATfl6689+QbqLg8tc+BI4sLpAH90vgNFa4+fLcnlNvYqF1etWeXd0Ig
 7TT6wYXURvjs5G9qavE5offOHQEbrA8gbhstfcUZmdh+BLd17UrWR6X6SGgKOgUqusQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616126;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f5DtbRPHVwInobdtFHmSJ/YN1kE5sC9jL1HLyvJbTEg=;
 b=JDlCV6o6dlfMJP7vQheX4+4O4uHtAZO3cKQGKSIIFdEAm0pNl0FHFQ3oQ+gALzOOLkaz
 DsgKEkB5rK5ceKpWRqEgQq1KbgCKnpQpfd7DSQOJq6KLDqx+jPVeC09ylHCOfh7I61g0r
 xXe1flc5VzpwW3qq52r9vEy2JkA+xaeB74hPIHFiLEGqQ3Lkp3NfeN2vE/1DW6t3XvO3e
 psyleNc5Y7Tv045tcvgcL99WI+ZehU+gxEkcXF1eUs2rBKL0a5OwVnucCcwhrM04bmhLu
 8N5VHQjBhat+axQMa5CUrouxoYZfU1/GesBAka27katCaKV6yhjl7HlKSMSF0QgjQhg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECEC56064C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0C778E67D; Sat, 10 Oct 2026 07:07:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:06:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1b5bfef44b78435a9110b2db9fb8751701dfda0
X-Git-Newrev: 8198b6b3c9c824755ca3b7aba9be0b18e7526575
X-Patchwork-Hint: ignore
Message-Id: <20261010070727.D0C778E67D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: bump to 1.7.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8198b6b3c9c824755ca3b7aba9be0b18e7526575
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 46346d0124..84aa243da3 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  405b72b6e76c8987ff41a762523b8f64876ba406d8a831d268ee0b63f1369582  quazip-1.5.tar.gz
+sha256  5240f4a3475648773ba10af8b0ebe549cbfc5d6de00470a517330a80068a4f78  quazip-1.7.2.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 0ab6e2db04..be370f4ccc 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.5
+QUAZIP_VERSION = 1.7.2
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
