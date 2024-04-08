Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DBEC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FBA74148B;
	Mon,  8 Apr 2024 21:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZW0hOU-4kkQe; Mon,  8 Apr 2024 21:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 470214148C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470214148C;
	Mon,  8 Apr 2024 21:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 386631BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 230E881EDC
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUhY_pI9yuFN for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9FB281ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FB281ECF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9FB281ECF
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:10:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0969FF804;
 Mon,  8 Apr 2024 21:10:56 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:10:56 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240408231056.3a9fc7da@windsurf>
In-Reply-To: <20240405075230.809460-1-dario.binacchi@amarulasolutions.com>
References: <20240405075230.809460-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712610657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWYGQTUzkdIKU1svQdwXK0dK5JjzQ5hImZKaievwdu0=;
 b=PcOHVLWwjCbBqrd5J98++cTkKWjt3+rihxAHFemIDspWt7EMynhrnyp8NtONGSGQOklZCZ
 B2Q8FGpfRdRkBUy4h0kQTE//5nA1yu56fUdYeCi7eGivMJoeKx3i3rN/Q/2thhl057F676
 H0BYGDtOhLHNV0FmcbxZw4s8v1eQD35Qe3sh0YVe9L+c9jI57hs/ZvISJ6j6jUkh4NvNj4
 XtJKM5G/ESaW0HEmOcnB2uFbtEr5P9QJNpBEoyvNLqHcIAhJek02pEJ3p2FjjJS5AKJos8
 sIWS2yN5abgUn6TROfc3fZ44QAFLuvAitylMtMw4qoue7l05v3c0bJdIhb/qRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PcOHVLWw
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.177
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Apr 2024 09:52:30 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - Support i.MX91
> - Fix a crash with -d option when change back file.
> 
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.177
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
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
