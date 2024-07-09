Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DA8C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10CDB40259;
	Tue,  9 Jul 2024 21:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JU1KHz7r-ngm; Tue,  9 Jul 2024 21:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE44F4025E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE44F4025E;
	Tue,  9 Jul 2024 21:34:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0781BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76EA54025E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsaLXwmNgDkG for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2088A40259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2088A40259
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2088A40259
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:34:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEA3A60007;
 Tue,  9 Jul 2024 21:34:23 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:34:22 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240709233423.0420dddb@windsurf>
In-Reply-To: <20240701195434.1793733-1-james.hilliard1@gmail.com>
References: <20240701195434.1793733-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720560864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7v0/FKcpwRx3m1dTOEAk8A5kCEAdsLW9CyjKPu3suQ=;
 b=VG8XFYz/mDE6X2RMvMoOytz0BCta//bpA5cixgrx8cBSgHAkB3oCTo7BOL58/uQ3VCprUh
 nJar1RoD0bhnNvi2XE6eAHgYkpzsftvifb5FF5QudU3Kq32p3MCPS0VtFV42CYCNsirZ/3
 B9evUgjSkqlpOaxmp3eb+ciVvQTXVodF1Eqd+aSWL8vtW9r3wCIch8hRBA3GBfL4Jw9YlG
 TTfskacO0lf1qSnAysMxBpdH0064uqUm/qWfn1KGtV+kC3YLTiM1fGSB2nL7u9exc6kLJ+
 ymEswdh/H1XsS0kmmTjUEilr7sZfJC8/NcQKBzVKE5+XcaL6d5wOXWJCJZW52g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VG8XFYz/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sniffio: bump to version
 1.3.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jul 2024 13:54:34 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sniffio/python-sniffio.hash | 4 ++--
>  package/python-sniffio/python-sniffio.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
