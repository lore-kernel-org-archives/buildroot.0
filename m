Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8E4C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B808A81464;
	Thu, 24 Sep 2026 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5omjEEtxIYn; Thu, 24 Sep 2026 18:59:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B8BFF81466
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276375;
	b=V16K+3KNZQ6CKICnoqWO5yy4yClJJUE/DvGX++2vD0UzyvP3kMy78C/wfp1MbkzUHCOo
	 N3R5FVAh74e3GfOji1eXLoIanYEzHREEpkrb7TwW0XxvBltlzWNw2KwW1dosPVZOu2+3d
	 yTnASGG3hGuZUSGFy9Ff1ZsunDHG9SmDyU2xPw2TGEBc2Zqa5N8OiYUit1GS25rt0ltGF
	 7qcWN4uXn7Rt4sdS7NVnkpeXgATYEeyznYpFjVZBRgbmMwmebpNVCnGU/ln/CQ0DgmzBy
	 PfZPqRCmhqqONKlzwid/360ew1lFOOFDGviQsLptmzGPccv7r7Q9y8K+fV9FRLFND8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276375;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/LS1hsVh/iu+JZYchaGQ0nimkLsXHfy4V39CtnbYaFg=;
	b=cWOClPaDn2eEPPuzcaPI5Yr/GM1b143prTRcICfOBKBw9CRmNrcNqVZJgTWDxKxqQOiy
	 C7SseAjGEZBaeiyMe4Ds3apu9LJP3/Ha2f4R+sJIcLO4QQ/bzmEPv/EkN7OuqrPYyTT6a
	 bpv150wzzM/58Vd8Hs3m2owLulMJuXb88bHqhmUgPH5EE/wHKd4fdF/pYZC4zyFW17Oim
	 ZDAnCxzky595JXuwnTiDwFKEiHy6uzY9lO5LCqJzi8GI+xYAIRNK+nQTfoHKbnWj7HmtJ
	 grC5crpaIok259M53SmYg7CsLdOZ7KUG+kzljAN5a13rkeYLDD916dnObp0TEFK/UkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276375;
	bh=/LS1hsVh/iu+JZYchaGQ0nimkLsXHfy4V39CtnbYaFg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O7asPXy+nH1szHnP1LvvPj0Hfliui3RHuAfq4LkKOwbaemI/nELLzKmzn73PdmZ28
	 WEK/SW2szybVMHzL8vHkbOSAHbFaFN4GWJf6KYN1afE6x08HInmWarLtKbZFLDbz+g
	 1RkA4ajodw4rSuwCsOP2VCiKYVhKZbD9cQiuYQDdAH0+WP06TOVQHSrYb3rTfzRU6Q
	 BIr97oUwX9FMrQuWqtO5EQuMzirhmKmFyf7zZ7rUu8GSRakWJ1BgTSZIWsA8ryPQZk
	 +lZ9OiHfEb1Bygz26LX9mYny+5Gc8mFZ82GWxSl7+42px3X1Yg+W22PMOV8Hc0qNe6
	 9sb24nj1TZFlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BFF81466;
	Thu, 24 Sep 2026 18:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE58392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D88C404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id UznEXa8zpZUd for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7220A404B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=F2+h209NUm683mCpUas08nR41WglstS0XnRNJM5xpSRsxVJDxsEj3AcCfTCGjYiv8DuO
 kHjLv21Or9cxtKVzxvCATM5jUK1mfAu/JrgBiCzAag3iIKqlLQlIcu89QWtJz5Q9TFprx
 DrZnicG+GNUhdYqieBDG4IP+4sQKWoTTihlypvhyDn2TQsbfEtswLxMqsjA4Wso7nlinV
 MT7/fkWvfJtf5CkU0yKh3FvAv+Wo1KAFKMjc2xxjbLXUonBA8ay4REhQ0qXUYlhncHvCr
 mkY2YOzgK4Gvcg79nBVLyvG74/LAT+dybvCraP92STQfcDOsfqD6ikotKAxqnKWeyNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uJspLoy5MxQ0QQ44fsH5ZL0hRtcCXoIxaohzo0eTtjM=;
 b=T7FfVvgV9tZ/GrewwECaO3pP4Y1+DR6kdNMhJMncPjfoQNEuqgLiiHYqj88XctVlaKqq
 vEz4WJeNQXcnuqn3YM0SvMiDLRwhwZDZ8tLIhoQHpNR4vDuF/9/hYyfQe5Wu5gnCB0NyA
 m6GlwDFHEBF1VN4UH9VVbPUH6/MrR1ie6koiNwxYao4KYMnLHi+jNgGmHb9CBLxYzWCPA
 Q8qx3KqLH2u9+mUmwdZ3qRX2ubCc813AmUE+/bv4c1JGGTnWHvcC2bTE+rvmR8oM9krGn
 3lKZHL/SuSVO2ocAY2n/rUgCiXU9qlnNTwqRkU9QzYph8k70BdM64LIZUFUxn7LcCNw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7220A404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E5D982D9; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:01 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 900a64b2fc5724456b2c7b2b72b80ef746357177
X-Git-Newrev: 3ca262369030b176ae652ebcd901fbcd6e2d81d0
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.15E5D982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ghostscript:
 security bump to version 10.08.0
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
Content-Type: multipart/mixed; boundary="===============7053699224643000067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7053699224643000067==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ca262369030b176ae652ebcd901fbcd6e2d81d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://ghostscript.readthedocs.io/en/gs10.08.0/News.html
"This release addresses a number of potential security issues."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 458441ad76c0a1624b113dfaadbda2c16eccd5bf)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 94017262df..00cb1378d5 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
-sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10080/SHA512SUMS
+sha512  8006e2a32d03759a905b9548bdd83d4563173041006750e17e428b9eea24ad519aa4452ceecd7c073d3c420a68bf1b07ccc9e0533b1a05935f6b39ea8d9ce875  ghostscript-10.08.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 08e2667981..288efe2674 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.1
+GHOSTSCRIPT_VERSION = 10.08.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0

--===============7053699224643000067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7053699224643000067==--
