Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFA6C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56A6A4110C;
	Thu, 24 Sep 2026 18:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cywGA1WiWbzE; Thu, 24 Sep 2026 18:59:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B32BC410FF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276349;
	b=SlZ2rAi7QiQOaxmf+gSAeJOchg+DWdkx0zLSvVTKgn3UnW4xlJ8E1QGih1RxFxa0azqW
	 BMaySRyzA/CILVGsL4OSQUU/XKVJ8/+todQnQ0uNEsrDSBsGpM1SpaZZoKsUYPj+ycL7H
	 ooWYah0MKCxOE1L6vY1ciH+VDVrve0TbJEMRy4f2v3ZtEoayGY0EeKA+y2J1BqimM+rQe
	 MEtQy7bFHJu14qA1qbHSV2odWvY2RC2WdPx/DG4noRYhxMEoaPzBYSmZdxhRCY4Y8bSH8
	 HZbZ1xlnJmaRGgr+iL4CenH5lmlX6FUo/ObOqf/OGhdH1XbIu2ziC8vfEVEvLAQTG1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=uUO43P0JFNUVOX+A2TkB1KVNe5w3xxhCXB9JZqX+za0=;
	b=EExmoTjNgCkvb/zuoHOaIggbNtcLB3gMAMVA8hUb1DVpUlPG7dw5GR69rUXGDese/grr
	 c+ojam8OKEnh8rTXECXok43IfrvVyI6uMlptn+J6asc/K7qpfWEB6nWPXu1Pzgh/YAoeR
	 XVSFyk/2EV9MjgHD+YFybZky1L9p9NyreqDUYXpA8O/r9HJjvEfPVE7fb4bBZvPIdKIon
	 Q+K25e8g8Y05spXkueJsz1Sg7SZ5m7ad4XhzfQUUoXJE4GxjwpYTC3rPnXLGPBGir2P9r
	 cNFTnZTcqgtbsu6OpAPznzgq8KFEmJSfR+jCahIhL5jZ5Klu32E01jMLcCKfZYThhWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276349;
	bh=uUO43P0JFNUVOX+A2TkB1KVNe5w3xxhCXB9JZqX+za0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aFGc5v+HARl4DWuQdCGiWR4guJkfdUzj9ApHzv74xpwAX38s6KwLe/hHLNAiehNr5
	 0lAVNW0OXlw5Bwmi2ptlGxjmbR1S81rPqRe21ib4TwOE91C//0wuqy4QB30m/szShy
	 bTiRglV7GmBwmuIND8CtyjXgchIuZh0SzNyVesECzOJlEWRbe8931yWNNiPnCV0C1E
	 fxy5nm5FiE2d+yFI5wXGXSCZ3In1R7EBvEZI5YMJTRrdYwSXDzKMZub/s3zDi5u+kQ
	 Ihp6c+Y+i5FjoVOOLUYXb7/JFRZfz3SeTtQ38CFUiOiAFYhmYIjVUv+FGxV2OfJegD
	 +NkOCw2tYExow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32BC410FF;
	Thu, 24 Sep 2026 18:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D031328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321EC404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-rqkDEkLzrP for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6C1B3404CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=QTLiyoXezS40xmfMFBfjBeYCUD20xXlvzVWk0jsrMSKU8/Tg1npraa/3SYLdqy0f/WAo
 lnCcbNxclAUS0GqJ97Gje615MT5HAX34y7T8NFNtUIvTeEtE66cfcUK3xo6PVkXLAgLKe
 Z6rLChrNWT2PKhCLuCBTJTcBa1KGkA2qVdbnNuRSJBgVkq2JaphPFprVaRAiW1KHmXADR
 d4SqTI9DaUi41j/oD+WLvt4k40ocaD+JI8X4LAcnHG6Hgz+INvhruXSjSyrSrF5OHb2ha
 aqNs8mV7W5I7uNyYaykeh7x1o7jM1y2z/uGzbOWJxkIqGBQFtL+Ar8lFd/ulQM1JDtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WKB00cqYht1vwVz9/uH4RJLVHZtS++4Bd/tNcxQs5nk=;
 b=FMhk/anJb/bHAeTNxPuYHn4icOIMoUV3tD7KGEFPRLWN9Wm7/0pVS2t1imSUVueCKv0b
 z0PSkMumA2lTDVu3Esehrx90OeHF2+G3fAaOBi4ofPdH04XRPAnH9HJ2x1L9VqGQFWUiz
 GwzmGR3pFGKZ0EBqhfRm6rY2DA96dKkP+A8n5DWjrq5qYku1jLWwkmpQh8cvVil5gNTfg
 ybWZV7/CvfWUnsSlKIAcrNMbnFZrMZ38nwg/rnW5NIXo7b4Ja389atCfGcGY8ed4L6h0h
 yMS61ZuO3pxnPfrzSIcrW4uodiBjXTDgkMmS5Q1n8PFD2xeVaND+TVDfqJ1jLca1NjA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C1B3404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EF8998323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:58 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 269dc6ea315f5213cf3437cb29924ef5e7ce3ba0
X-Git-Newrev: e128c5657cb210bfe4773ca26a31b2a780940f35
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.0EF8998323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/rtl8812au-aircrack-ng: enable additional kernel config option
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
Content-Type: multipart/mixed; boundary="===============2253092007471609257=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2253092007471609257==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e128c5657cb210bfe4773ca26a31b2a780940f35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Not all Linux defconfigs have CONFIG_INET enabled and this results in:
  LD [M]  88XXau.o
  MODPOST Module.symvers
ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!

So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.

Fixes:
https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/

Fixes: 003ed345b1c4f1c11feecca68bca37bf871001af ("package/rtl8812au-aircrack-ng: fix build failure due to double defined endianness")
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ab8471868eaeb7c55b74eb00756c8d5942319daa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 1308508e00..7981a382b1 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -25,6 +25,7 @@ RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 
 define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)

--===============2253092007471609257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2253092007471609257==--
