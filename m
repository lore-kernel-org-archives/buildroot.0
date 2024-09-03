Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D6ECD37AE
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC1DE4027C;
	Tue,  3 Sep 2024 20:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAXtmIEaRZv4; Tue,  3 Sep 2024 20:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905C9402A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 905C9402A7;
	Tue,  3 Sep 2024 20:39:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A69C1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 882EF80561
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swlGZ8YZe0on for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 827668055C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 827668055C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 827668055C
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 20:39:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E234240002;
 Tue,  3 Sep 2024 20:39:37 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:39:36 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903223936.04440fe2@windsurf>
In-Reply-To: <20240902203611.2649952-1-francois.perrad@gadz.org>
References: <20240902203611.2649952-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THcKWA1AYAWHdH+915ugVi+oIwpq1J6B2OBp0gfN2Qk=;
 b=Xo9Q+77ZV91PCZ6Bal7v0N1EDYpGnKPSPEu3PnIpyGSOkSpDWdxW50sHlF69Narb8zJXKQ
 5Bu3h4+vvsSP3fZiCrdVf8DkjVZ10qU9N8XGForMv7rLTeeWefIrOf/MFLMkh69+7XOTBs
 1lCGBd8UmQzTDzkIMXi+g1gkS+/sNiT+jA919vPIBQuKL1H+X5x+0THaNpUNaCYY88Rdf2
 +lwnN9a0nYeUtFdhGbbJI6dRmVUFDpU+j5hMGCZ/rVxDKtAVSDz0e7++AdETPfo9e50Wea
 3TeLGY7hY0qS+lAAlk6tclGmx7cwaET/d6XxCGEYOwBxWC8JF7FE4DA69v41Yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xo9Q+77Z
Subject: Re: [Buildroot] [PATCH] package/libksba: bump to version 1.6.7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 22:36:11 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libksba/libksba.hash | 4 ++--
>  package/libksba/libksba.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
