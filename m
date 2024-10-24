Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A3BD0E3F3
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2E9360B5E;
	Thu, 24 Oct 2024 20:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGYujZnuaQYB; Thu, 24 Oct 2024 20:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD9160C28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD9160C28;
	Thu, 24 Oct 2024 20:02:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEDA2497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA194109E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cy26scnUAt85 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 830D74109B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 830D74109B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 830D74109B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:02:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 511EC40003;
 Thu, 24 Oct 2024 20:02:07 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:02:06 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241024220206.4205eef8@windsurf>
In-Reply-To: <20241008201259.574500-1-ju.o@free.fr>
References: <20241008201259.574500-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729800127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5jkibbz++RyKUzdIJwIShjoJoDbm9BtvWdGxES4Jms=;
 b=a3FaWPVyEd+vtld0+BaXEH5Ous71e181FSDaA/+zWXbm1bdeLOGmlWHHwP+6ldZGEeEL0U
 rUpc6Tb9+GfLagBzpX9W5kbV3TX0l0b28zprkubYi/VtO53z1FSrsNnclTtpECsaJdx6zp
 yx5yRPDn9cPGjvop5o+MwDqj1bgVM3BZGQZLWlkN1ncmlCQxX0ZEfdSFT1EwohGIfEjgVG
 W5NCzPNvO54xVjzx9XPEfDDg8XfJaSqHTT1XqZUA7kbBwzWcsAPQtvdl3sT+FhWoI5HzrG
 mM744rmhfrY+0ZIdKCC4Fg3kL3sXQe3lGzMP1vI5vTKei/1zMP9EnBTjfppcjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a3FaWPVy
Subject: Re: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.36
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

On Tue,  8 Oct 2024 22:12:59 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release announces since 2.0.34, see:
> https://sourceforge.net/p/openipmi/news/2024/08/openipmi-2036-released/
> https://sourceforge.net/p/openipmi/news/2024/04/openipmi-2035-released/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/openipmi/openipmi.hash | 6 +++---
>  package/openipmi/openipmi.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
