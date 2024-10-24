Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3045CD10374
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76E241D92;
	Thu, 24 Oct 2024 20:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhv6vrMqC9AE; Thu, 24 Oct 2024 20:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD5141D84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD5141D84;
	Thu, 24 Oct 2024 20:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2162D4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAF341D92
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPpCTHBxn8jq for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9D2241DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D2241DD8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9D2241DD8
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7115040004;
 Thu, 24 Oct 2024 20:48:45 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:44 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20241024224844.5c829a1c@windsurf>
In-Reply-To: <20241007213325.1387556-1-ju.o@free.fr>
References: <20241007213325.1387556-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUpj9F3h1eTJnv7GHfDqMzdeG5u79w6OZRYWb4VMZ70=;
 b=cw5r4kaZWHdLexigoAf5JFR23sW7oqvhF8ubtduJL40fML3Xf1krdUPMeDinhU2e/SDBhb
 isdrLl15ayCFFKnEZKKjdGKQur9IVyGIIY51hYSdu0fzoEsCWDhfWF475Ec2gRsQp0yc/G
 EBcJduazU5qr8S9udcWIg0ybKDTmkgAiRC09OSkPBhrk6vRYGRvHflsHQXve/8m56P1cYG
 UPT0z7mVgbLgPpNwVkeEFtkvVzamln7CD6pEeLXmsMsLlOY5v1XdVeUh+76qsJ8ysDKVTB
 PwRm5Mvqb1tKvpspxd8ktsLG345PF4FV5UuwoAaLoMXvTRxWRepWXBYM/UuR2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cw5r4kaZ
Subject: Re: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.9.0
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

On Mon,  7 Oct 2024 23:33:25 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release note, see:
> https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.9.0
> 
> The commit also removes the package patches which are included in this
> version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...ix-BUILD_DATE-in-rrdtool-help-output.patch |   57 -
>  .../0002-Constify-argv-fix-warnings.patch     | 1586 -----------------
>  package/rrdtool/rrdtool.hash                  |    2 +-
>  package/rrdtool/rrdtool.mk                    |    2 +-
>  4 files changed, 2 insertions(+), 1645 deletions(-)
>  delete mode 100644 package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
>  delete mode 100644 package/rrdtool/0002-Constify-argv-fix-warnings.patch

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
