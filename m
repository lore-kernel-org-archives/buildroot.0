Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB717EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886A640660;
	Thu,  1 Jan 2026 22:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EhISAdQA8NN; Thu,  1 Jan 2026 22:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8143A40613
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306752;
	bh=pgUWaufV3zGAuDNHHSN01xDXg7yxX8gIHxmP0WvIHWo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IPUzCu4NjOslh/ysvPIc5A2hkdguY/F17CIbV5hNKdfT1rlOI0EZEU8vtw7uE+Cu2
	 RsPd+gq2sGXemJdIkmfZTGl3DXJc/sdZD34q1eFd+7OdNw3DMPayc3cMjy9eIMiicv
	 O4QjFOgu7/bdn5R6BcbYRP9lGsfrVoVIVpaiS/uYsbNsQ1Ddy6w+/tyNWVGQZvwuzk
	 VUAcXF/lWzllqMvQWsg0pfM/wPK/u7Xsj9RAsb4AzqN0DX9FFhl5OVS71L+NJrWOzY
	 bnaa394esN1e2wAlEXztGmHLwvbqAJTkVvd+YR+Uie0D9R2fBOVJLH61HZzCgF6CEE
	 ay+8YwOWFrEnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8143A40613;
	Thu,  1 Jan 2026 22:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCAF206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D03D40387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ot_ZUaRXcp6G for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:32:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BF394036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BF394036A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF394036A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:32:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 71CCC4E41EE5;
 Thu,  1 Jan 2026 22:32:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4860B60749;
 Thu,  1 Jan 2026 22:32:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 90576113B0713; Thu,  1 Jan 2026 23:32:26 +0100 (CET)
Date: Thu, 1 Jan 2026 23:32:25 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20260101233225.09261fa5@windsurf>
In-Reply-To: <20260101180045.247057-2-bernd@kuhls.net>
References: <20260101180045.247057-1-bernd@kuhls.net>
 <20260101180045.247057-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767306746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=61WUcYEKRfJI5xpT058IEOHT2I3fo9dNTE527FUmFnI=;
 b=dbI9wvwUeJ1V8BwsYuHWbbEwjhczJTzQI8cMGBmEwudXQ05l3HMDj56qxmrjnJfi2hkov+
 l8sdXFq6Y7gjEQqVYp+w9rRCPH+dSucgg/mpp8yVLqhQ/hcHl7SI22jMgzFnbuq7kZ72LM
 K0scT26lyubaJidjMQpM6jeTX7JhzTfmaruC/tKQjsHxR87aaJvl8hEANrHiYF7qGRKzUE
 YBxmTj3bVq/DFfXUIJQ7okjMpIVxcTmO0cB0oQ2pBG9RDL+Iaib09u7itnWbUE9cZJP0kJ
 tQ7bl1Ucos5kcuEtRRuot0Sd67d/Bsp6Xxt1FbeBR6kPXmPQ0QqKRWoIzdLRZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dbI9wvwU
Subject: Re: [Buildroot] [PATCH 2/3] package/libdill: update project URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Jan 2026 19:00:44 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/sustrik/libdill/pull/228
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdill/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
