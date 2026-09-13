Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF655C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 17:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B61F405B0;
	Sun, 13 Sep 2026 17:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbbS1PMEobUl; Sun, 13 Sep 2026 17:36:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC06040550
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789320972;
	b=cRBG6g8Es1Ig+cMjY+W3NdI1L+keOwsw8+sTKcgp0m82UxfpB3EuIBVp3iMgeXyR/fQD
	 NVtt/FpNvaJNeEQqSP1Ivd3vG5E7gKZdtCw2HrlwjpuaBb1aDCDU2s5sRZKcEoFjpEMnE
	 EvzkxmYcF80m2oXNQw1hOUFAumMmc1UeiCCrj0aQ7kKyq36OBkxA6Bglj4puA+v/Ne75d
	 8ayqRlT9nf8X2L3qCzT4YCMf7WZ+fw1E+ZWSoXE550j/Pvk37GED6ocagC5fhaKHsAqUS
	 HqH9zEh+nbQaUZBBeeBsevxRYYvRozYIXgPEnpZdP9bc5IRc3S1zT1wigGMNIqLXk6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789320972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0dqP1lUDgzayjmrgGKU2ZCs/Nq60IDE7Yys3mix6fmM=;
	b=V58LSTpcKHFvn7Z3oU4B7tQIOFC+wwWgmkdGZcpDDVRRmZmw0cHfJwAEA/Oard9sBDUC
	 PIfB1aLG7LJvT6DrdzqaGkIygxocUj9kCIJfnsAmIcJrXeePxlftlkfNhRHtoSW2zMLv6
	 ou+WKJP+UvZatpR7kp1S19uzRdpztck2jSEgpBPURoIQIItH2KglfE0fTvhFrztYgMl78
	 qt/Q/zJCceEvVf2/G1xM+EVWPadsYgpWK+3K11hYjvGZY3EWTTHjlzbYuLsTfWYxq9fNB
	 yysvf8gSugKj4dCGd5enBJ+N6/ARm+ASBUtrRLOH/G2UACNQ6hR1F02qwe2MRDzn7Dg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789320972;
	bh=0dqP1lUDgzayjmrgGKU2ZCs/Nq60IDE7Yys3mix6fmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SowbyuILszabZ9YnvHDu8NC45lTWpHnQOSXKL+OoVkKdOYvxQiVhM52xhbad25Euj
	 3fXUVo6gJGvq+Dj9NRC14zTJljK5Cze808LdGtMf/ENOMFzIBUeS79ULKXy1p0YaqZ
	 bN15IJz7grLekaeVu7IWxP3rZTXezbDZ04P8ROJz6Y/iyglvoNAw+zu7pWyv7QMCzE
	 Bave9jFbWoUYkJLztpDP8JAdvm+QrEiZDcAH5psPwE64aWSCBeDbLBw2RyNu65U/yn
	 LTk6Sbvlcp9lahdN59mh26hIY6IJRNx1gc09L3z/SbmBcGy37z8rWi+tDgLHZ4V/by
	 hHo8AgZSloTTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC06040550;
	Sun, 13 Sep 2026 17:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA5729B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BE3840550
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YkUV3842Yum for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 17:36:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2E0D040540
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789320970;
 b=hCIZMf/hwv4SjwwdkyGGqqO+jlSN4LcR+Q4/Rbd6obsKK+yyouw9+85RRUNgCUBMy3tY
 VmAQfpUMOAHcoujEx6K4/xLNRjHE3CZa5YtD2rBfltDpnJ8zw9jpiSwyTOESMN/8lxc3t
 aDjfa0GEZYKsAkALAzc4LfdRwjufkbOzwQsYhqfLqS+asc7YU8ZB51G+A7Nzf7wHuZC7F
 MAGDLqa5NHq6QTwYRCcqlzFEZ+N20V54tC1ADEvRG9O9+mwnY01nocPI4+2xo4uX3bETq
 S0EFm94dt9wuHwDCLHQfs8GT25CoKyTC2rGrgW1PP+f2uOfxQoKzwvZ0TKp2ubKhs7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789320970;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FtAYg/SQiiLHerxkeey8CD6TJEE4ihEPFTmyytsgg8I=;
 b=gIUthnxXqeooTlpZ8fXYDMgZLNKTbFQSp+RlUoRG8MsdWvR7sfKW9OhXr7yGTmxaVKqG
 dO+GqCZA5p/xMfq95pBDsmrs0HVvl7Lw+xmtfKyKOguLuUZrDitMrlUh/ZntI3SWejiqr
 X8wBYCYC1MUsCPw5GcUXnHAOJ8rHzGm2WUcIx6/Zj5IbGVRQclHWipgxM+Bo7gb3Gz0pX
 4jAuiGknQhwuRIWbuZN7ai2zm+7zjLN21AIjBrEy+wTo9SipWUc4owiZymB94GqF0PtK3
 s4j/UwfVbXpKIfVzlUlhh+B2IUhyyX/ISJPsUu6uGeVgEwsucGslUaVDAIxwd/niuEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E0D040540
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CE6C95C42; Sun, 13 Sep 2026 17:35:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 19:33:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8ee9feba137fba7cabfbac56e4f8bab89762c99
X-Git-Newrev: 43558e103b50bfaad42f8d265ad971479de42af8
X-Patchwork-Hint: ignore
Message-Id: <20260913173505.1CE6C95C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/znc: security bump version to
 1.10.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43558e103b50bfaad42f8d265ad971479de42af8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md
https://wiki.znc.in/ChangeLog/1.10.3

Fixes CVE-2020-11022, CVE-2020-11023, CVE-2026-82373 & CVE-2026-82374.

Updated _SITE according to
https://wiki.znc.in/index.php?title=ZNC&diff=3493&oldid=3460

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 128c84850c..08cefa6a47 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5b7561f3b100234d58ae4946eac0262ab305d275c094e64ae723e45d07be08ab  znc-1.10.2.tar.gz
+sha256  68f3f6641b480c041010c5596e1234043e05c9137eda06233845017603095f5b  znc-1.10.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 7ddfd64715..1144762469 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.2
-ZNC_SITE = http://znc.in/releases/archive
+ZNC_VERSION = 1.10.3
+ZNC_SITE = https://files.asokolov.org
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_CPE_ID_VENDOR = znc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
