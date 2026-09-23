Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5423CC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D30640AEB;
	Thu, 24 Sep 2026 18:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDd8_oNyNEQh; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E863040AD1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276215;
	b=ftK9nniyXR3qX6DABI6uesI+W+Xqeas4fesmXkJMyoQU7YqrKGAritTsTN8wCulpj07Z
	 upVSIEz6u/l1VOXj09bxgLTfBIz+WxiLCbMpheIuy1zj+71T/JauXYS73wBT4qfnxObb7
	 oRp622TGBwqXez2lh673A+gjkcXAiSktvg+6XzCmqGyPycNMiF9J9oNLMwyOo3NH/8XCK
	 VLht+UyEekdUm6oZYc2wmQZnelmJKQRT8SdWp9jSUyzera9WqDEiTkAWWmy0hs762La8h
	 FLZK1/siKq/JtGOAxPQ9DxLSe2L/byK12Rep4dxXEr8OkgB7zFNfLlNZVUA8/+bCYTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9xKXXy3qAv5McDSkRUhhxySbI5u8mmm1/xCir1hZOWE=;
	b=OOgda8T6w8j08I2FyOWIQadJJEw+cjd9QCZ1Eh0piWCBkmTs7GZtvmTBeXWknmBK73Qq
	 YA4pmbijnmLu8dhA24NXgZQOcyDOj5FoQjRk3KoI5+Znn7r37E1WJ5czRPw2OzGn+vzkn
	 AzMZLXhjxTqBoKyNR9AAZHehGRbqR+VaXJj2iLQ8/77+6UAdJPoYUnYKgsV57/k6ATfVb
	 Cy5dJzeto8CvP0gTgfetpyJMrG2A2FwQP36Bj0xQG9xC3LFZXhL2yu6bvfclLqdrQQZDM
	 xe9IO2zk//6w8TXJ7G25FP9f0AsyveXQSbZ1MBD1R2B0fTi/+HbtCX2AgMNXmZrhM8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276215;
	bh=9xKXXy3qAv5McDSkRUhhxySbI5u8mmm1/xCir1hZOWE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I9j9udhPNGeHQKid3GAqyrFU8jkauW/0W7OQrVqNmG2bl8SSRSaSk974knMTjcVkr
	 gpv7lGmBgumm1o0JMH1kjo5WRs8UIEelS4DrhIO27p1QTd4OKi+QsSLHjwW6C6aI7F
	 hjda55UDEl5llDPHnWxlfmoT32lM1kPc8sBFOobjxoviVIe6IavqR6uocgCyiDMnlG
	 Xt4fnXP/77m5XIZ8Uw6V4GLJriIl/q/jorgqlYhgHB+Nc/I3rRpR0s0ZgEyAZno78T
	 IfQa8SaLhORZFrwSPQgaj3XNNhGUv8hrfloUM/jgzK+XCTMC0EghyyhAVAVPlWpTN6
	 GwlGGjmR0hOOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E863040AD1;
	Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50B483B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 430E440AAA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjypmaGUUCjA for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1545E40AB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=qLfw0H5TMCO2P1OlQvFu27NWNuTIGIgWF4QnLu+vu+22I4kY0Le7FOtED8ufoFxpEJ+t
 V2f1eTGwNVz9lbakJXZ11yXYYjtvYQxcnrdRg1qDdtruR+lzQlFUBop1oRNJ/IgM/1yBU
 +NQpeqxPoRukCX9097yNWWX9EjOZisnGnVeUDouj+NYsevzIDLAcWOGr7UqhxXvarYSgB
 VuIPqsVqWcg9x5rWPqYbBZiti9tLv+ekaslStgl5Fpt+CmT5QblJE8FiTtX+llLMc9bI7
 WPFOXj8kCnvtmMjlPgjvNJLm+OT9F5Zqz9jTRuYPPIIsStQVGLA/479aPQMzcVAmeww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dk3H4Wfqfdy+CVfF5685s/4pmMlThJtqOKTsi9tyfLI=;
 b=g3kH5WvhOn0n3C9R9LQd/BtF77SG7RHNibCn+uxMmh1hwMrDzGwqQBWw/SmwLWV2klOA
 FSZ797cRlSOoJwg/3izbHsfohfEj3XwXDL01k36MxxfZb+uDhimq1QF1gnQR9rdOsNOXK
 i/G6nXLrzhhAMPdqMt5tqjkfzhGXGUYXDxbOvMomKdQV1BI+xVaNghpzKmbm2OpZnDazw
 cw1hGJMJgzL/+jvzozhHFUsz+VkqxvQRwhaUi/eWNcolDWGPvZGV7FnyX5piX2Mp7ENgQ
 L7wI4CzbGvfiDaes+O4Gp/IV6l49Fr0IVVdBOfNoXKnD7oO+8LxfrW7ZzNP9XhvMA2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1545E40AB1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADADD98383; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:45:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 94a3b0cba06a603cb8eabfea101bd2caef102ff2
X-Git-Newrev: fe4475f19ccaf34744bc0ec0521059f6851afbf5
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.ADADD98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zabbix: update
 SITE
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
Content-Type: multipart/mixed; boundary="===============5716775981125000815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5716775981125000815==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fe4475f19ccaf34744bc0ec0521059f6851afbf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Zabbix version 7.2 is no longer maintained. The version 7.0 is the LTS
and the stable moved to 7.4 [1]. The source location moved from "stable"
to "oldstable" directory.

This error is present in the autobuilder since the 22nd of May.

[1] https://endoflife.date/zabbix

Fixes: https://autobuild.buildroot.org/results/636/636c4514c67f1b0fcd20976d064f17b0e0a314fe//
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7878630479ae26bcbac37c73f64e043f773ed171)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index caa69fda38..50bdfed609 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -6,7 +6,7 @@
 
 ZABBIX_VERSION_MAJOR = 7.2
 ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).13
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
 ZABBIX_LICENSE_FILES = COPYING

--===============5716775981125000815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5716775981125000815==--
