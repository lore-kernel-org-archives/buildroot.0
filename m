Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE56CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E1E607F0;
	Thu,  1 Oct 2026 14:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H--a8HD8VxuZ; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5BCE66081D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864563;
	b=h4VMyFEt4+eNfPi5npBY24mZhQVdtz9K4+rEw/IblylvnCAJScVeA/rFFf3xcPzrdkGF
	 ZcSzwnXg1llZf7MifR8RAAbyDpM8LVisgG+UUBOj6H/Hsjs7m3lmhwxWxJ51N8CVwKja0
	 Y/iUsbe50rpqvpZu/AI/yGE2hiKqWuhUyLJ/GmYjLrLsoh4coME6CoseOnaUZkS58hq6X
	 ATyM5wpGKUn+v5PhRvFAm0MkYcyl38O4c4cQ0olBvZeYX1BKVaTpSzyscnIZAQqhO3iYx
	 l2tQgVcdMB4X2B5QaKUhokSf3lUWsqIA1Jr8uiZUExVx8s3mXu003SVgVYMhO/HwBsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=urFp2YZng2WNCtiCNwh7anXqV11FXwhlpZP/nsA9ZW8=;
	b=WXBRhoZXg+u5KwyTG9KK6iYkk6b6uRdN1dnoqBREXOCVB5oj9PqT7ln8mrI8+RI24mJ7
	 CXWV8+iUK9yICpd32PY9oMSs1MiAngwXHxZpl/0I8gik2ECTGHet/P2lGV9rKGNj0s0ke
	 cRuKSZcoKxKVywdeEbE5XsY7Wr10tQs/j/5S/7IrJHeXBHFx0pvRtcRpWXby9ALO/ZHDV
	 DoZPaqfjrDpXeU3TPrm41YF0U4ocS34i3EqMBQixIZlGHG0qufGTphuAMCSEVLdmYdgF/
	 fnGU5hF6sVmpovhw7J2liJWu0HIfBF6ze4ybO4FlAquXxhWPimtohvhjm1HjRE9bmkQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864563;
	bh=urFp2YZng2WNCtiCNwh7anXqV11FXwhlpZP/nsA9ZW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MrlHVq2fDoTkyoMv8wWZ1UnEdGEQQPHjI/0t/yccoHSsySFmPf/ACuD3ruGYzwEL8
	 mFJOGhqK7JGhKB9n5d7vW5Qb/eMZdA8JcEtnDrA1iLqBod0xwoADQZodn3OGqG7R1Q
	 kO/B38uo9PX4qZd/+/FN6912ByVb/vsdVfruv2+j0eaQkE9/9EsSy3jRMLNHpw5nbO
	 d5SvSVsWvp/SxdiCu12ucd7szbHwCmZD/5L3yeDFgbrDwjw8SgGTEZ+EncinysmQuO
	 JxNkG5uN/tw5F5fYFjaMiLcxqZcvjyJwsmlNnGbJeRdtGR2Dy8yWncXi1nGfK4t7CU
	 6XtBWznuJ3URg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCE66081D;
	Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EE93263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859D64052E
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdI2EIUjxLTM for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADBB940528
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864560;
 b=bg+BMKYoG0mE4dhnmEOqD4LADoVfcOd4mNmoU03Hdap2F+oULRCj4UpxQhJ5NSB/5U7g
 nH1b9Npaqs44kezFpF7CbSg9ML4qzwXWrlg/iSvzkekZEmpTlh0z5UG64JLwaTm1mx1sO
 LD9dKH7S4TKl8pozVcWZ7yUOVmtrPI+i7QV9/m5XFIzsn05dysJIpjOYzIr8l9+awc8V3
 ckI2dWrOHKKvLmmr36pu9HYbABrdiLFujPr/R6Gben98aNMdIMoVPmigKUXEAL5rZiiFn
 UIWOEGy1zXRtOxivrZonBzthNxhavpxrgsMnLf+vRO2f3axardhr75eNk9bJ8f/hOow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864560;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=urOEkUlKhEJUBFiZbCl5Ks9tE6bEyps4geQvXNyPBPk=;
 b=bCHbzsyw429WcnXR36LNmTUJJIB/W3WlqlQWVNmxWg8ETXat5aRweliS8aIaZ4EMhS5Z
 nBbxmHPE4aBGTVnyLQN7w5uz5WpvTAYF79KUN4p4kF+mwHtHW4kPPaVl0iUNCwLrQ++40
 VXmHXrYhSji5LTvphPgEImxcjasJoTNpmoNSVR6rYOxYXU1HwQfM/IPUL+QA1OpUOivLA
 qIpaihc0IFdVKmyV72vvExDjNs/q0eEGQWX9ey9jAht8lnlhw4iPHjo0K3S2y5ZC0DqWC
 Go7Ns8/wLW5ZMgXdpi5bbeAe0LDyuX5hOdnspMn3wMhea+KFKk9fzk4fvtfRyNtik4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADBB940528
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00F729843E; Thu,  1 Oct 2026 14:21:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:09:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7d178d679d2e6af3a9878a45d796a801f6d33733
X-Git-Newrev: 29fe2566b3b280cfbbbf293f80b78b4b140ad218
X-Patchwork-Hint: ignore
Message-Id: <20261001142127.00F729843E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.35
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
Content-Type: multipart/mixed; boundary="===============4397721153075339757=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4397721153075339757==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29fe2566b3b280cfbbbf293f80b78b4b140ad218
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes many vulnerabilities, see the changelog at
https://www.php.net/ChangeLog-8.php#8.3.35

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index dd336f0e65..99ce84673e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  e293ed620cec74651bb4a071317892a478aa6840fab22db45c72d77cd42f9676  php-8.3.33.tar.xz
+sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 3389b9c530..497ccc49e4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.33
+PHP_VERSION = 8.3.35
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES

--===============4397721153075339757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4397721153075339757==--
