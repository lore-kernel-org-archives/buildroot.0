Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794EFC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366AC403B0;
	Mon, 15 Jul 2024 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evv04BQwd3-u; Mon, 15 Jul 2024 12:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49B84043D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49B84043D;
	Mon, 15 Jul 2024 12:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC3A1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94D1D4047C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpSXdlJXk95U for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 514E840042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 514E840042
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 514E840042
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:30:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D57CC0003;
 Mon, 15 Jul 2024 12:30:40 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:30:38 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715143038.50122d9e@windsurf>
In-Reply-To: <cbb92cca08b1e2cee69a63569b3c37cbe884a19c.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <cbb92cca08b1e2cee69a63569b3c37cbe884a19c.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721046640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5mlyrGWi8bIzWkKPJLISFT3kN3foncXzDsGBGVtg4Q=;
 b=fxDZ23p/RjXCO/fFwR85nCYheLGHTF8EJkasizY+f5rGKUYUVxQ8UvZ5y48Nh9Wd6F55mm
 YvBQPUmN4DPpTLgjckQ71p69N42FEVILmuRKTHpGQDXzIWx2B5ESp+eUjIImcGYqizsiNw
 TMv04I2SnNZzdff1sc9TatxJLXJHfGd0yyuU5fVoWXuptm2YvGgIc97YF8nYlQHzs4g7f2
 j/gSSHtyxnI+WD0hMoRDQ2iWdx1XiO9KU6ngiUQn6+l7rZN1AEODwBIFRFQnzzv8vMVBJE
 XnBlCR4KEx4WpYfPxVN5qQS4XStzcmIie/tH0WWy5m+xzp0XZBB07bV2d6Epow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxDZ23p/
Subject: Re: [Buildroot] [PATCH 3/6] package/libassuan: Add host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 23:43:07 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> This is needed to support a host build of gnupg2.  It is not directly
> selectable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/libassuan/libassuan.mk | 5 +++++
>  1 file changed, 5 insertions(+)

I merged another similar patch from Yann. But your patch made me
realize Yann patches had mistakenly added some HOST_*_CONFIG_SCRIPTS
variables, which were not relevant, so I cooked some commits to drop
them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
