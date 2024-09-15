Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97825C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 12:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9DF80F83;
	Sun, 15 Sep 2024 12:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ggno_z-efheq; Sun, 15 Sep 2024 12:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E4708112F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E4708112F;
	Sun, 15 Sep 2024 12:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CACFF1BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C656B400DD
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH3mV2zoTmrj for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 12:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7238D400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7238D400D3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7238D400D3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 12:57:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C9801BF204;
 Sun, 15 Sep 2024 12:57:41 +0000 (UTC)
Date: Sun, 15 Sep 2024 14:57:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240915145739.375bb2d2@windsurf>
In-Reply-To: <ZsO3weAXJMZfb8HQ@waldemar-brodkorb.de>
References: <ZsO3weAXJMZfb8HQ@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726405061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpnUykRgavgvHwknDACgyliXur0GVth0P+g+L9xPtpY=;
 b=Jk7nWN/1YBTEq8Ow/AzLlioLs2ZfVxxLhA1sr7cu2NTMmvGlHNbM9wabOWPCrrH2T7N9+S
 LOWRRJvg8Srr1QmdKfLmB77B/SXcrvx0NUaWe3NFJwKqLbXm2nCksc6JLqAr2WBYZHkVQQ
 FMyckuT7G/p/N/f8kFaq/YFwiJmcImi3JAvWC1cK5oDeOPlmP58X7hEKOk1jIidpapPJ60
 8/5bNQGHBM28JJQz3f/TIV8aEvLSh9p5Dl1cmUD/8TixqWZ2NEMgqbF4ypj4fj0wH5nHY9
 aDGNInScrIraCWemMXaALzdmp5MCawumH84AblJfJaEAzXSSGuP/4QjJdnTVAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jk7nWN/1
Subject: Re: [Buildroot] [PATCH next] package/memcached: update to 1.6.29
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

On Mon, 19 Aug 2024 23:23:13 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See the release notes for 1.6.29 here:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1629
> Older release notes are also available.
> 
> Patch 0001 is upstream since commit
> aceefca9bc7635eab4893f626aec78e9966db93c.
> 
> Patch 0002 is upstream since commit
> d9bf02f6331fc0098af8997d2a571fc4525696fc.
> 
> Autoreconf of package is no longer needed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-logger.c-initialize-rport.patch      | 55 ----------------
>  .../0002-fix-build-on-uclibc-ng.patch         | 64 -------------------
>  package/memcached/memcached.hash              |  6 +-
>  package/memcached/memcached.mk                |  4 +-
>  4 files changed, 4 insertions(+), 125 deletions(-)
>  delete mode 100644 package/memcached/0001-logger.c-initialize-rport.patch
>  delete mode 100644 package/memcached/0002-fix-build-on-uclibc-ng.patch

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
