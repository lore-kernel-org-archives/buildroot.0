Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB61CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B7E40697;
	Tue, 22 Oct 2024 21:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7Nj8E-A8_1g; Tue, 22 Oct 2024 21:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4DA740699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DA740699;
	Tue, 22 Oct 2024 21:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FC402072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE5C810CE
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdsGAv5TsKbL for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:14:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5066F810CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5066F810CB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5066F810CB
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:14:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2971660003;
 Tue, 22 Oct 2024 21:14:55 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:14:53 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241022231453.2007f7bf@windsurf>
In-Reply-To: <ZxgUPHsMJYIf8S-p@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-2-niklas.cassel@wdc.com>
 <20241022224631.3adcf661@windsurf> <ZxgUPHsMJYIf8S-p@ryzen>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729631695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2ZjOoll7hkEvWreH/2SmkarOsiTGkaHT0007q3qTzM=;
 b=R0/ZpxwBlFjkzEPM+BzwSJ5fh3cr70SYRHyL/kST+AK+FDQ+3TjScy3dTWbwQ7uH2fLYPo
 MHNOSnUW94Kvd51c/pSTa0BSD7A1NZgLe/wWl6kppbH9R3B4BdQrzlgXCnOXLnUTv8HqLW
 fjsJ2ssllYLv8IST0ao/wTzLgTUI00Mx8JjugJJIs7JISrlb7k7MErTLteNPJScqVpTqiu
 4k4dFGBFFn5az31D1qvvUc5Cdu1YJCYKMLgH15MHar1bLX889xbJxGZRVQQy2AOt5tTmUh
 nFnPZm5oiDnWV7cD24dkeDt5/qBRznVZQb06dBAb5YmELjg5+6pReCfETvioew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0/ZpxwB
Subject: Re: [Buildroot] [PATCH v3 1/4] configs/rock5b: update to linux
 6.11.3
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

Hello Niklas,

On Tue, 22 Oct 2024 21:08:14 +0000
Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> It appears that you missed the cover letter for this series, which stated:
> """
> This series depends on:
> https://lore.kernel.org/buildroot/20241013103341.78501-1-bernd@kuhls.net/
> which adds support for linux 6.11.x.
> """

Gah, indeed, I had missed that. In fact, I very often miss the cover
letters, as they are not well visible in patchwork. I see the commit
logs of the patches themselves of course, but not really the cover
letter. I should pay more attention to this.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
