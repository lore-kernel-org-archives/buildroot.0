Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1AEC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07FB44159C;
	Thu,  2 May 2024 07:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S53Cic_Q2a_M; Thu,  2 May 2024 07:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1330C41561
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1330C41561;
	Thu,  2 May 2024 07:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCDA81BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7598641773
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UIJkdEmTSVE for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59428419E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59428419E9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59428419E9
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F61FFF809;
 Thu,  2 May 2024 07:49:27 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094926.12787759@windsurf>
In-Reply-To: <20240411210134.2127917-1-bernd@kuhls.net>
References: <20240411210134.2127917-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkH5b/9h94c6cdmOwXYKxkskxLTV0nT4+lkVBgA+n8Q=;
 b=pa5pd1AeGWUAcEmLMGoexqHqCKiH35xTio2BR6wVmTqORvIl3ceQxUh/F28v0eVNrfKvfe
 CwgZnpB/NwTBjWa+dDaaYLEV0EX6eAYpXlfCadPcOA8zhaVrceBDMZAQDnCaGzA/4NCNBy
 bMiRGgwu4n/RoYnRAKsVvllD9v9TICNYGBzRhKspLsChYAlph3mGGt9ZlTmM9HeZp60W/s
 fPf5npUx4IkGhAGnncjkB6dSKSkvKhb9WTHYIJX3p4owXdbZ/ga93GdqFXd1VZGfPUdWFG
 xDr2uhPj3yAsbHCQlmZNElNDbwAqA9ikeZsjPIejTyyY/J0qyhk1M4ABs+bxVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pa5pd1Ae
Subject: Re: [Buildroot] [PATCH] package/libmicrohttpd: bump version to 1.0.1
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
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 23:01:34 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2024-02/msg00000.html
> https://lists.gnu.org/archive/html/info-gnu/2024-02/msg00003.html
> 
> Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
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
