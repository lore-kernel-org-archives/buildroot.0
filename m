Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC44DC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A71F642082;
	Wed,  7 Feb 2024 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKr6-IGF2_LD; Wed,  7 Feb 2024 19:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEE142089
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAEE142089;
	Wed,  7 Feb 2024 19:49:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7777F1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6547280BD4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYgysq-Lg182 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 417F280BD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417F280BD1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 417F280BD1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:49:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68CBD240003;
 Wed,  7 Feb 2024 19:49:35 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:49:34 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240207204934.7b726238@windsurf>
In-Reply-To: <20240207194233.590328-1-ju.o@free.fr>
References: <20240207194233.590328-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707335375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2+HrhFe0k7eiQS9uWIQMLypj9Yy6b27ICtr4xp7EB8=;
 b=M74Hg4Tmm5+Vfw7j/gM4VI2VBpf0HtwrsbQd9aeDdqI1/0/p1k1CljgqDKnivybajKVrSL
 2/p5xr9rCoOvsQCHUQjOHwvIkt+TPEHGVYOY7WznpckdecD2CYVZ/Lv+pEe+413BcoRfe+
 RUpNz4hefncbV72Gh5TegAkQg3Zft3uEx0dpsoh72G30wl0q5aLTqtHnCvbgow9acGu3Na
 o8CRUOYPs4wLxdaHLWmF5fPz2oDBA2As8moJ5sjHAWmE1JRsnHZvcubm6px20ThKOHF3e/
 Hi78FqSFGaV/LBkfCA9+PhBIsrWHOXc+Vij/s4QtbvW2L+5ccCLBpEfyE/VzZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M74Hg4Tm
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump to
 version 2.4.4
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

On Wed,  7 Feb 2024 20:42:33 +0100
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnupg.org/pipermail/gnupg-announce/2024q1/000481.html
> 
> For the details about the security advisory for GnuPG created
> smartcard keys, see:
> https://gnupg.org/blog/20240125-smartcard-backup-key.html
> 
> This commit also drops the package patch, which is now included in
> this new version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...he-call-of-ks_ldap_help_variables-wh.patch | 36 -------------------
>  package/gnupg2/gnupg2.hash                    |  4 +--
>  package/gnupg2/gnupg2.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 39 deletions(-)
>  delete mode 100644 package/gnupg2/0001-dirmngr-Enable-the-call-of-ks_ldap_help_variables-wh.patch

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
