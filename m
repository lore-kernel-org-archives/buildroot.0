Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C24AC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 10:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB7340C02;
	Sat,  5 Sep 2026 10:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHf9o1q2Zwoa; Sat,  5 Sep 2026 10:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE16840BD0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788604880;
	b=DUCGMznKpX5w4buVyesnIqOY8O9l8OtQH2WuxvrUA0ncu35LajGYnVLSyF5zwWHJg0ka
	 z3WbnMCbAhDEvuikFfdgOtinme2+CpHxTXwrkMnSG7F0YEGkJwxPXh9r0i170UqkN6nzy
	 V71D436q/KKX6JKzCeXKsWQpYK49HViPT7odPU2Lnjm7N7UpQf4onX8darf/guNOWaCOJ
	 0KFHT8Bdo2sb1ZFWo60FyH6ZFs8rVvICobIRpUfWRbnjTgThIi86A2lnF64xkSRBo2CX3
	 H1MEo56aM9cgQn4twcYm/5WUPXbPMnxj00Y2U9CoCb6eHwL1baa3j1qg9+d0Xbj/3+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788604880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K9L7D+tzl//08F9AvEN4tEqNu+0UNmaRJEw52z9lzpQ=;
	b=hLTEw9qRP9lxDRoHegrCsrugGgfLOviy51wtEYKTjC5n2ipEMGuI88men9LCNlEFnqkm
	 /kcV5/6eGvXAcDYDwFd1rLc2wdO0oN4JAd7XDU/z7xwdGyqVLvT0DseiPv8QbLhe4IOCt
	 ceeQBMHKZ1XNvt6glsa1H2iP1L1GyczupF9iotu2JPgnLqPrKFAdLso0lPR8IqyYSfFTE
	 2go93H8vPGqlYSOZ6W1+tIhjnCSJB8c68FcZ4Iypled8V2iT7yCMXnmmZ4HT56g5VYZff
	 J3EIv3/DmHHz9mJzjT+3x6Eo8NJKp5ezgjnwzFzVyi3zXN5QZkY1PIUT17lXqILlbdA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788604880;
	bh=K9L7D+tzl//08F9AvEN4tEqNu+0UNmaRJEw52z9lzpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OlfLoli5udEjW8TZL3foGRtewOu51xOGhmRhHcPlxoGtX7BIHEasL63nnNdzcN/SB
	 2zDyF8QnkxqnuGtRZq+SXlSQW2LGC1+VbHCEC/wKH8visk0tOlzOfqljl9nZJ85kH8
	 sVD9eZyD5EQfB9PKWsLh7GU88r8mrdTkxVpCbzpm7Rpwb/3MaQNEJojsqZzKBthBbC
	 okdzIBSDW92KU5H6UCIo9LhVe7CfSHuNBvmOBYRA4oaUbJX7Of+/cef5aGEhLI636+
	 vwhDtWhhqEZSBREP3nd2Ri91SCP3DOgbEl60V+A+iHo2pXOJ3THwSf6sTApxh7Gwhz
	 CNQ3sqAa+o+hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE16840BD0;
	Sat,  5 Sep 2026 10:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3ABD2FC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A04FF811AA
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qx7FIjF0Bs4l for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 10:41:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B817381180
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788604875;
 b=CTQtm/Hq3K/W3ksN32HrGuqchzykGmQdC0WLlkBC1HytHccdnYqiytix0ih2sP+izyjY
 +zbmS4daRxByQDAhejM9NWiG5UEM9pzSA7lVHL1xGbaz8YWkIZ1PND3BLPjOGy/d4WYEM
 6r/ZKTVaDSjITIDC+nvBdD56u3Ug6KkoamY3IytlXA3ZiuIEoL+IwztBOfKRbdnE8tEQh
 +ySn1UmBWnyr8yofK8uAQPlXFYtFYjnKKn65j7JrYtOsdJFpZV2d5kRQrqcgohZXS1Pz4
 b64h8gGq7v/FuhUt75emFpBVTjiCyJHtwNHh+QZXc7Q5no3fUoRH7V6PoDK6X0aXX1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788604875;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NGMdIMVAhDJzux4Gid5c3qpJSdDSIFGGTCH7n67zcG0=;
 b=KDn9KM0rcMxrkyUAfRyYclNsfnHCIDEzeAxLDsDY6SLkCzba31UyGZxad0m/5kaByhC+
 RGlFB0tTfnyq8oGSGnfuTKJVwpvOsgjZdwJ2UYkBkVCbDOKnlN8OIku/mxclqm854enEx
 CiCa9VXlZahX/MuBFdQImFFgXKasvNX0VFRyiQvu6OSwdgmBpKAFUaRHzjc70RbQizZND
 StGqWoR5OOJfvcUhxEHyQ8J4hYXdKyO5daIQZ7ugS+u9mlm36B9DWFBEzxXEkgh6TTnHY
 NOATpODIJo7kNOts3aInX1VNR9/8taAmZqXPYNxcVfPWRJ1SjtKBBWfZEIU5cQK5UYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B817381180
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7D05875BE; Sat,  5 Sep 2026 10:40:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 11:47:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47c45f7f62b60ac24b65c06022f66e0ee8be4b24
X-Git-Newrev: 270ef20df15489ba9e5a1657b3ef24b14b1adb58
X-Patchwork-Hint: ignore
Message-Id: <20260905104014.B7D05875BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: security bump version to
 2.15.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/270ef20df15489ba9e5a1657b3ef24b14b1adb58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.news

Fixes the following security issues:

- xmlregexp: Prevent out-of-bounds read in NXT macro
- fix: add missing overflow checks in dict.c, uri.c, and valid.c
- xmlregexp: Calc string length after null checking
- xpointer: Check overflow in xmlXPtrEvalXPtrPart
- xmlIO: Check for int overflow before calling writecallback
- fix(xinclude): propagate parseFlags in xmlXIncludeProcess and
  xmlXIncludeProcessTree

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 849d70cbb5..d21fa53c08 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
-sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.sha256sum
+sha256  98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821  libxml2-2.15.4.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index c1b5c4033c..3ca57f1d37 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
