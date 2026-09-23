Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1296DC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF13540E01;
	Thu, 24 Sep 2026 18:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryOCLKdww6Is; Thu, 24 Sep 2026 18:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2044D40CB5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276263;
	b=K/IfsP/0+42PC8FHhyQDUwZS8Q1lDJtp5W4rLJ10ZJG/ZQz0fHSaykNT++wZZYz3lF0T
	 miVszXO2E7cTttlLKluMOod8YsEp7mibYOoib/TcLyqrlBb9dMvwYrntWvtXxQQWaqA52
	 A630xb9tG8UeSCRQHbG+WKyRlcZTLp2dmvyynE1SgUISD0H6v7YoVNxySaeaKRkRljKHp
	 Bu9TXjOduuf/wIEy4D/8vHpYmVm9Yzo0BW4BF8Hnr/T3xpjJAxZ2Uv3WEmzKP9Hib0Vwb
	 KrMAPVtynJxaO4ceoUvlENNo2FWumzOSx47v8jT3ILhivSJcL7c8SB3P2F2AU0XwjiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276263;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VRybCEYXMlsbDSD0WAE1ulKAPi4tBie+Hj+fRlD0Yls=;
	b=Se6QuraRdcxHOVy+38+h1KiXKmU0ZwJvQsrw8Gzq4HleFHL2ZhPWPOiak8FcQTmT/meg
	 Gb76B5AHpcFMnYIGtZRn9GGXjXtLD7KHgYr+Wyullx6zBVh6MxDsUn8Egelhpb8iTk/o5
	 jN2jWyqi2+ZGj7PkhE/bWS4bWDzMau+abmueX7RyIPBIiVLuwwh/JRCoHEZbXfK0ndIbV
	 p/TnmXGJSPQWtKQdXO7KEqIVMCo2CsZIfpWKTA5j67OdD5OAYrkfJuvObQI5hzWqfM2ml
	 TZQ+1XWV8L00EXoUrO9rDVuvRSNCxb1qtUqyBIzVlqbdfGVfkLZ598UrL1nUEKkrLAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276263;
	bh=VRybCEYXMlsbDSD0WAE1ulKAPi4tBie+Hj+fRlD0Yls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oO/fhZcXO/BZrx8yF8Fj206qVKL7kKNu4TsHMCnIuoxt+yGFKhXb+KMsx0INL4DyP
	 D9lvNT0LjpSnL1EJUuBgxBiJd24/McViD8xg4tWALK9iHPZgKVxHOSnykmz2p8nXCw
	 H2zdCyaF5ED6NfGqJc+ME9bKbXSgABkCu2ZnbFC8PsbOVY+a578UzLhj1tPFRhl2uj
	 2Wi0iTfAOqtXtW8yRPl6SNb16/f7osehdL8jSxluqQMJnWAjRp3MCCdQ4PLDf+vgUd
	 8tSUfDAGwQ+0wl3mZrr6p4DS/OdSWiwPrJEA12F4unBQMB7L8OePQbGUuRbMT9x0Ap
	 sZl0b1z18jnyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2044D40CB5;
	Thu, 24 Sep 2026 18:57:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C52392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBA5840ACB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L43ZndDPAZb for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1F45F40ABB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=XKI9Rsal6QeFygTFtNKCSx5xpPDzy2gFnPB2AKfIWYGwlnmB36FhkcPGKDc7KOlsjhjR
 ZOJs/QXpT+pWbNNiA4UjmxR5p19IeSgNysbzR2AK3Wm6Lv8mdmM0oyVwk9CoA9WgE9DT3
 6UmOFL/jzJF9KAUY3vTSWo5lSM760vKghxFfWEPZAZTcZKmh2sf2AZuEV2o7ilvmEi8r6
 stTokCWCS6CFl5ZrX+VYh/sk5/0TcaDYayAjPx6rIl+U5nyhJMJS/HzH6bBspajXIJPSy
 rxQg22csnRBn+0P+X+5Pc8vQ3uqzPD8ZsikQso+rwhkrZcMMc5Gb5QTpe4UKB/OTzEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=y8drdBX/I2hrAyg/Of3nNFYEJm/c/4j3F7GWsiyei9A=;
 b=Wdkh7vzLKCwqPT/MsVWNuuk9ighkp5x5omtJEJIqC/rcrOxe7PKWi8D0hvXXjrEWPMdq
 LuvQrXpJYKT7MKoP6MMcxZ8aAjheZjVbrZBCuI6HiHb3cbx0+LYsJN0mvtd86X2kXxmqN
 pL66f6pT5c7YO6IC179E4xUP1Fibj8TnsXP9bEsgbgqWzm/ygq6uuPXzlKZZeW83QDQNa
 pXvR/ti5u/LUfHmgDCxix/HKbBgrjKk7pGdOZ/eVkysvrwAv5oDVQhufNu00RufLlUipD
 5DduRXrbiioTIaamYtazSNPgE4cgjslP2ybHj0Kf2ALc1rY+5Rv9vTv53WuCYksrljA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F45F40ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5EFF98385; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:21:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 64db8679294b2d118c1a1c6e4ebee218922d1863
X-Git-Newrev: bae413fe79c2123cf0569aef08b82e5fe62e2f62
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.B5EFF98385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cannelloni: bump
 to version 2.0.0
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
Content-Type: multipart/mixed; boundary="===============3349981492911239126=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3349981492911239126==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bae413fe79c2123cf0569aef08b82e5fe62e2f62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.0

Bump GCC to at least GCC 8 due to the C++20 requirement.

Add TCP protocol to the package's description.

This release also raise cmake version requirement to 3.15, which fixes
build failures with host-cmake >= 4.x.

Fixes:
https://autobuild.buildroot.org/results/87d5ab39a84c51f340875ae365d4f39439e81645/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add a commit log comment about fixes with host-cmake 4]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 68c8ff2c9521be62681e2a9ead9dccc8d7106d04)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cannelloni/Config.in       | 8 ++++----
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
index e137e60c60..a2a15c0274 100644
--- a/package/cannelloni/Config.in
+++ b/package/cannelloni/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_CANNELLONI
 	bool "cannelloni"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # lksctp-tools
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
 	depends on !BR2_STATIC_LIBS # lksctp-tools
 	help
-	  A SocketCAN over Ethernet tunnel. The tunnel supports both
+	  A SocketCAN over Ethernet tunnel. The tunnel supports TCP,
 	  UDP and SCTP protocols.
 
 	  https://github.com/mguentner/cannelloni
 
-comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "cannelloni needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 107415b0ac..625e43d157 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de44b7e327fbf38883f46e51a5afd07de5144f2e44c5f42b7f2f0741165f0b13  cannelloni-1.0.0.tar.gz
+sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index f97a091760..7978cfccf5 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 1.0.0
+CANNELLONI_VERSION = 2.0.0
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt

--===============3349981492911239126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3349981492911239126==--
