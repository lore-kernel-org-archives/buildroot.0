Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ECACE7A81
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B4681E0C;
	Thu,  5 Sep 2024 19:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LNdxqp8hNLu; Thu,  5 Sep 2024 19:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F8D81E11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F8D81E11;
	Thu,  5 Sep 2024 19:18:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 264471BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 216F160737
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmdEiv6xGFPZ for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBBA3605A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBA3605A7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBBA3605A7
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:18:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED29C40003;
 Thu,  5 Sep 2024 19:18:15 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:18:15 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240905211815.530e91c9@windsurf>
In-Reply-To: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
References: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725563896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUAzsG7osFiqEF6IS/Oo4Xgy9/RHpBkIAws+nkFEd78=;
 b=ZQgm0ijzRjYf8+ia6wcRLxcY3+2jE70XU2BMblSyJZUDMQF6R4V+iBccECjUa9nuzLORKG
 X8Lt0BAjd4nekNA7+P0K7gmNI3nNF1MgXyjNDiOMIWdR7kYVs0ZYI3+tKeq7QTToKVTK0j
 5BUs5qCssVZn8qxGkgRWIRHr9AEbOwQSXMmUi/WrgfyLnUhHfUaqhaFWR6AUJDAupzo6m1
 tneOyLXaPUSnajqXUQTtH3gVHqUBYuwfTUaxXsWEQD7kzBdPFC8qe38G09Pz9FwW7AtXbW
 c0W2zIQiVWKE7enaxiy3xCEzic8WsfG6xecZkcNUKfrC2sPf9/xoTFeCLS9VaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZQgm0ijz
Subject: Re: [Buildroot] [PATCHv2 1/2] package/perl-file-slurp: add host
 package
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
Cc: Christopher McCrory <chrismcc@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

Thanks for this v2. Some minor comments below.

On Thu,  5 Sep 2024 19:26:06 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Some project like efitools requires host version of this package to build properly.

As requested by Yann on your v1, please wrap your commit message to ~72
characters.

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/perl-file-slurp/perl-file-slurp.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
> index 0d4ab94034..910d50d3c4 100644
> --- a/package/perl-file-slurp/perl-file-slurp.mk
> +++ b/package/perl-file-slurp/perl-file-slurp.mk
> @@ -12,3 +12,4 @@ PERL_FILE_SLURP_LICENSE_FILES = README.md
>  PERL_FILE_SLURP_DISTNAME = File-Slurp
>  
>  $(eval $(perl-package))
> +$(eval $(host-perl-package))
> \ No newline at end of file

Please add a newline at the end of the file, as suggested here by Git :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
