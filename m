Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D6CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 19:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E2E60606;
	Sun, 18 Oct 2026 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heIfXkXh38F8; Sun, 18 Oct 2026 19:41:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFC1B6060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792352497;
	b=m2c1HYM4ZRTKpvL+yVfh5xSuppOWjFeEn2iS0xRFL4WI+Mi0Sa9WSRi7S7PkVerFBf8Z
	 aRcPIGBhashZX8dsOm08EpNvBWcU2JhaDyCkQ59wAeL2iLsB00knMmaEYP4+tgd8hCdmp
	 yHSikqciIRdmhm9nhTS8mTg+V9trTF91TQlEpCEZdY05qqLIOef/umGL0l7FbybbLPm0q
	 Jdi+eScQIe2kmciKBSHftkj2gBHdxjIwU8FC5Wec4n3qZcTn1E4wC4M8g8pVWs4dz44Fu
	 vhbkKPfJlSpWsKsFsrfOV6b60afrqh35DKIZkITFQCkKg2GuTsFe2Bo5m24r1fXDauA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792352497;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RSg8CsAuGznFoLwdaRmAXh79YVE6xLrcuaqL0L9ONQk=;
	b=djRNOYU/YYtVdAYIgb8R3TqgIbNFQ4cTQp6C4ylRKItVvO0qAx8rAlD1VDsVnTNnfgT5
	 qLUbcYo/L5Dl+yu+PKrP+xio2PdyEJSBKiiGveiNQdx6Mt6LNZRIYUHcwJgpx2fHNJ3el
	 sMT7sdLTHp9x3UwlasnIWokBET8MG31uL62NKSceBzcd7gGFUQpTmQFVzHJm+JxbqLjFG
	 udX8rO4jD7srfOPDvHPEqNOzJkhOy34Wv+5HsSLoEKPAmITs97gBA2bQQKnmLryZQi4CC
	 oOmoKlJ7KqaN8g/YyDZro4MCxcvnT04h9O9miPc/U8s/gTmqMPh5tHCvCBAjjSc7SvQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792352497;
	bh=RSg8CsAuGznFoLwdaRmAXh79YVE6xLrcuaqL0L9ONQk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8RJtT8J9iF7NQYzsjdt9lB1kGUGqSvfGlPAlvWC3yhkVMnoHlp8aUQLBUkwfuf91
	 n4wAIErbZNMeWFAzlmCTGrGVLFLFbToHt/t5/nBGrQ6sWhh6gJRi1XW1H/gGtCkDeO
	 xH39YhQmX4wWFDSt2vOVXISWRTPPYcIVc3quRH2Rht9fzYbF4yjAFFS+eNiQEsV//C
	 iXl2aOUDRPiZFOLJ6oQScGaayGyqPUD/7KTdDsxiwzlCWlP/60sjb7cOfgmTnm0pLS
	 0fEz+D5Q/vgvF3fMLBtR+6WR1A+Vo1FbxLrN5UOGtwR07EjEUZU8QragrUHiTlGsJq
	 5a/SvU3KTwIyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC1B6060B;
	Sun, 18 Oct 2026 19:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C16A32A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A792E6060B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f9OUkD2xueL for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 19:41:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B105D60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792352494;
 b=jxECASoso5zCdp0ROoZhypytNmj2sYmWPOO/mp0UOjlsK4O6JJnz4GskadfgCPuMXJVQ
 FK1oNgXmOAZbjqXEkoh1cXzjW6y5bFLo/Ja0GnTu/5/5m6yEUqK9iLwWtDxcA5oe5H1SR
 LHt6xy2MYfjI6WobYVk8YHoq3cvPkcsDj7S1oDUufaUXRjcHupForxfsHqaxiQ1l1YlDu
 VqwDiqFORJ+L/q3KNE/pRpMn3mKwgDLQT0rzx4iXd7lggwfBHvJrPFjv3mf1fcy0YT5Dx
 ydF+iSDbYsfJ6O3e/nsYEAOe2owiT1H2ePVyQmk4IeFV2Di4v4o3hScuocrtFPpSdXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792352494;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fxEgpiQw0+Yx4t9D1cGZJWtgW3t48jLeKfe738Irg1g=;
 b=lWOg5chefoXnT2ovrSkMpIxE1IZYpO6npQx0QAUWUjg2vFP5OHSamlMHUR3P1tBc0l1p
 AYLGNQZkn6pG6uVhanxKOt9qk0TXWbv5OJ1ZTmvx7r4btlVQ/k5A6JGHWKhjdcZej+VFD
 10e0bwIuomcq6jTC+7ST3dqYqMSgIk9qqmIZWyO/dLqsA9EIYcL4Wie6REVcr5g+YNMKN
 x/F9t70+Olx6kRZpVJlZ9CqwP95ulKIcPpgP9vz7GALM63cf6AJaThz+Oa7OEbfrSd5Sb
 3DWY/ogccQEh3kDltXdRe4qn55mU4iFh3MW7lQj4tSeqr7wYSiyvrp4Zk6yu/fnZJFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B105D60606
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:41:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83BAB983C7; Sun, 18 Oct 2026 19:40:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 21:40:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b0a04bdca525e91e694b74fcbb72b662f085ad1
X-Git-Newrev: de2b983811ed5ed8f9ec40ebf1f6c286e701f15a
X-Patchwork-Hint: ignore
Message-Id: <20261018194012.83BAB983C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 HTTPS for custom toolchain downloads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de2b983811ed5ed8f9ec40ebf1f6c286e701f15a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Both autobuild.buildroot.org and toolchains.bootlin.com support HTTPS,
and even redirect from HTTP to HTTPS. Use HTTPS directly to prevent
manipulation along the way.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config | 2 +-
 support/config-fragments/autobuild/br-arm-basic.config              | 2 +-
 support/config-fragments/autobuild/br-arm-full-nothread.config      | 2 +-
 support/config-fragments/autobuild/br-arm-full-static.config        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
index 1b811f267a..7637a99cc8 100644
--- a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index fbbeaaa773..3212cd5a66 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 71592d688a..855a24f969 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,7 +3,7 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index f3a4d91fd1..33c7cffc72 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
