Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360AAC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F101A4174A;
	Fri, 12 Jul 2024 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb-zJYAiK0nt; Fri, 12 Jul 2024 20:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD59C4176C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD59C4176C;
	Fri, 12 Jul 2024 20:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D771BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF0C4174A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZRONdiTDcAk for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA4AD41704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4AD41704
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA4AD41704
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:26:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FCC6240003;
 Fri, 12 Jul 2024 20:26:50 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:26:49 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712222649.5fe0e311@windsurf>
In-Reply-To: <20240520090739.67311-1-ju.o@free.fr>
References: <20240520090739.67311-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720816010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFDXH0BRzBiA3zRv/jo9yiTiu9RRqU25/qMbk7bVjOo=;
 b=G+NZvLspPaWqIMKqIKtJrGJaib1PRsW4ZLpOgGIH3MgFV6NIcgncJLOVfl5ZGT5BmsEpU5
 e8549KKcbXM46e/oxBN//H2prFcBbQZunE5AOhWKIMp0CqFRO9bLYxG30+WWFWIuiyNF99
 AyzOF0J7TACWXKZuD/RuQSAi6kUR3XmIXgzfhxnquKiLfYFri/e1d6z31Dl3XRbp4snFy5
 rW5N2LzjFFg7BDkRbHu5PuDqjEoMT5tQH79eE0A9J4Sfg/Fo4fa0RkOJSLRNhDAa1GgedY
 0eIqk2QJrEx1mK3BsX/KUopFc/VaLSPrU1FxdeMJ2gzOBY8AsikzH8Fku7844g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G+NZvLsp
Subject: Re: [Buildroot] [PATCH 1/1] package/mokutil: bump to version 0.7.2
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

On Mon, 20 May 2024 11:07:39 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://github.com/lcp/mokutil/releases/tag/0.7.2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note:
> mokutil is currently failing to build (with and without this patch).
> The build failure is unrelated to this version bump.
> The following patch is also needed to fix the issue:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240517205315.850877-1-fontaine.fabrice@gmail.com/
> ---
>  package/mokutil/mokutil.hash | 2 +-
>  package/mokutil/mokutil.mk   | 2 +-
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
