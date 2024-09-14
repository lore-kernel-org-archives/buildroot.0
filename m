Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EDFC021A7
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 17:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8769F40748;
	Sat, 14 Sep 2024 17:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qlK6g6XqpXi; Sat, 14 Sep 2024 17:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6734441970
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6734441970;
	Sat, 14 Sep 2024 17:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 255111BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C09AC41988
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wrze-Ms84FYO for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 17:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83B4840748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83B4840748
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83B4840748
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 17:16:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90CE4E0003;
 Sat, 14 Sep 2024 17:16:12 +0000 (UTC)
Date: Sat, 14 Sep 2024 19:16:11 +0200
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20240914191611.6063115f@windsurf>
In-Reply-To: <20240914165101.258406-1-paguilar@paguilar.org>
References: <20240914165101.258406-1-paguilar@paguilar.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726334172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxpJd9R2RKEwjqFHCHQzXdqogSu+oqS/IhFS7eZA42U=;
 b=gOXpoTud0oi5ApOP+67LbUExwXEVdsEkuzC5TDUinHQhR3TRl9ZR2fUvPUN9fwLI7nuMmv
 KQMr1T+A21yBON5Ki/OinRx7FifOe581GhpiDOY0XcEi++fSdn/AMvKlY+isVz1ZlDQXLw
 u3XDyFwpjgJiHcQEtZXgfvaEa+biAPEUurVWeF/09sssZK8NTADG2y1l7dnGHGsEW1CWny
 mqqOcODl17fdEMvkGskNhxSt4nDAMHSIXuHQ0Pq/To1iHkzpFxN2PwGO0qWeCDu53cuCic
 Kr+wWQgqCVzdh+aNHQj+5bcKfg9ltx+rAgs6o4LwFFi1S/lfvpWavZaUL381xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gOXpoTud
Subject: Re: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 18:51:01 +0200
Pedro Aguilar <paguilar@paguilar.org> wrote:

> Release notes: https://github.com/ivmai/bdwgc/releases/tag/v8.2.8
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/bdwgc/bdwgc.hash | 2 +-
>  package/bdwgc/bdwgc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
