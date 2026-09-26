Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2BEC98328
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 09:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6549D60660;
	Sat, 26 Sep 2026 09:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsrd4DJ5Mz3R; Sat, 26 Sep 2026 09:47:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6F53A606D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790416045;
	b=D5BgRv8ZV9kHqUJQwoFAhfvKpwkrqd9W7kP+mo14fdpFgYHOD6Ttt6EsWzTGQDg8txvF
	 8ApzMDjQlzaikP+V/iAgZQM3LRsDKIGoAQvOMRm2/fHZXqS26U4K0n5gXdy8b2QQrkuqG
	 icvkNbky7Bp9pbBIEB8j4GFWSv/AS1UubKR/wzLvDaln51tr6ROWSlSEYg/3zIumbHnFP
	 youj9/pUrRHviud1e3VClZIk8ccJ9XlrU5W+3vNDemCWCeRJxdjAqW2bNY1Rq+X/0YkIH
	 iFOlMlT37os6cPWIUR9PPGkdAN1E1jrqRTCDsCWAYEhtrMy4Z589PHZOn7JNNkVd0Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790416045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VEJAzxDJCWCXqRxel9PDyMYy+EyW4FCdu1IK4465BdQ=;
	b=lcv0oIWxeD7jJPjjgFIrvmeaq4HCV5pcIqqK7PTrUNW8QW9PyXGc7bwQdiS+1LA5ONLb
	 SKlo09UUrzcZS+mI+WQB+Y9GjQCi1ZfYek52stRlYws5vghuI0q25BZz/o6k5RoV9CWr+
	 tgqbgoSdAnfwUHuq76HNtnlQIq5sIUMlV4JXe/fN+Y7U9gSO4UaHKnrKF0/sEjnvhuDiK
	 pRGXsuDRc2FRIGvjRT8Eb0i10xROMpfncgBQ6YyDWM58cvrkUPRK2DN11kILR2xZas08X
	 7blTCI6tmr/PyHCxp2yu4pZZhUTb7J3h2PDtgOdkRrn9x8sX91ljv/1PBN5ybBh/yqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790416045;
	bh=VEJAzxDJCWCXqRxel9PDyMYy+EyW4FCdu1IK4465BdQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fn/dOjxBTDWYipxRpdFoy4BELTY/84xOyraVc6dXD4/DTkzY6/mRhgQ70Hv1IcT4c
	 rpffgcVdYJR8Fgsc3B8X1Irzsh3vImopR9SLr/8hgaSFJSVEnSAGymcB1EL9QlyNv5
	 oTOO8WZuuMp6QfK6PbXc+GYuIDpjy9pgv3l8I7EZ7Avj052f9WaiJk8m4oaQL7ExSb
	 MqV0tGeB9eoZuyqcusQbs6bwOFYl2kmEpw3N3Di8clyCZuKPQT3WgMYrruK8QdZtv7
	 Yc/6HS8Sk/OdHNzGngiCpa1PqInCTFAxkGlSBa2N+6r/EGQkhlDuvcGHJ0EE2c+0nX
	 Um3HIXM05CIzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F53A606D7;
	Sat, 26 Sep 2026 09:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A93194
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C712F606D7
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfuHJV3EDqQn for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 09:47:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CCC2960660
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790416042;
 b=b/7PWEGp92+O1EJ19SUZZEULrFB4RllDnCfWY4xrNBaiR5agv4c+8PksHil4cpOX5KTb
 +mNqGdZZeZjz1r2QJFewEd7k8a3rXakCWFuoAKF5sgK4jCrvK0RYx7/7TyPvDhqQOKj3K
 Pb9f/8awpNOFpT6M/9EYvUdsDy/SWUny3fCjeRviJ+etFfKzuNLOGJqQYE8vDmXQWl1Ab
 mHUA/XMRjSjfogkrPDrtBaKy/a60sqScI+h6v9KNpc4sUEmvkoTzmPxBrofSerGDKiEvQ
 EL8Ieb/dotuhyeRfQ1jLmeJVUIPIG19YkdtHxdFb+PS2Jqnaf6iEtTqkj9+ql5ccKRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790416042;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8rBORUOYy9+OMA5zF9c8uiXUxc589pn1WjBnFnyLfe4=;
 b=bYiYVDSusIceHeSJSQF2BfcxmXQPCFhOjqce17RIiRFu5bx2t/pWeUt7ojoHkVjWXxmF
 8WgQSJDHNX5/4YvNbm2mHVah2feCb2CU8NaCNmHf6jI4d5TbVN0bIgCM/z2WxgiNt34LS
 TrMAheTmB2I7qckwti7sQZDMz9OOI8S8l61y5BKqosugygKTPJQG+bxcKrvfQnEBSTfBE
 seufeLJqZ/YNShO2Fi8wla1x8T5zlaNGX3YAoP4urk/zJ2NarPNghg5JARGk0RD3Bsf7g
 9/Bs7LeD1g3NkXfvkaTD7ohMxqrhR5Ds6JogkZ9vfbZ9VhamLCLqeffwuohjpEo9VIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC2960660
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 09:47:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FCBF8E11D; Sat, 26 Sep 2026 09:46:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Sep 2026 11:32:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80114e20e409526fa19523569dbe12815f42d43c
X-Git-Newrev: f07eeff6dfd4b2ca9065e18b6c84e6ed9bc236c8
X-Patchwork-Hint: ignore
Message-Id: <20260926094611.7FCBF8E11D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump version to
 8.5.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f07eeff6dfd4b2ca9065e18b6c84e6ed9bc236c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://news-web.php.net/php.announce/506
https://www.php.net/ChangeLog-8.php#8.5.11
https://github.com/php/php-src/blob/php-8.5.11/NEWS

Fixes CVE-2025-1218, CVE-2025-14181, CVE-2026-6103, CVE-2026-17545,
CVE-2026-91765, CVE-2026-91766, CVE-2026-91767, CVE-2026-91768,
CVE-2026-91769, CVE-2026-92842 & CVE-2026-93682.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0b3d87fd97..0f2b6785bf 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
+sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ac5730a22c..48525b7e29 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.10
+PHP_VERSION = 8.5.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
