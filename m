Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1537BC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D586280B1F;
	Sat,  3 Aug 2024 20:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbcRisRRWYiE; Sat,  3 Aug 2024 20:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54FE680BE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54FE680BE4;
	Sat,  3 Aug 2024 20:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5003D1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A2E140360
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEavGOmJTCpR for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1A774035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A774035D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1A774035D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:14:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E01060002;
 Sat,  3 Aug 2024 20:14:18 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:14:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240803221418.2a1aaf38@windsurf>
In-Reply-To: <20240803104656.2574228-1-bernd@kuhls.net>
References: <20240803104656.2574228-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722716059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rj9AjjmcVekEQeVjiyBLXAhL0aFi9VECz3VdH6eBIg=;
 b=GR4qZsJ87NJN36RrWA7OQJ8dC4t7YF+D1RP8tG5wxw4f8tdYn/yR3PcBIpyk04OADboueA
 nay2RA40PopZ98nNyBHeAiElfH0f8wRe6KZC6/IkUW9ctPb9aptgPd3Gi+B3fZbUAfBEuc
 vQA8bmIfaSuOgia3MRtLFS1IeGMydP/Vcx3D21ZMIasOvGJGwUmrCJ57saKFmbS5UwI6Qs
 vzIACJdfQMw8ubn+BxMr7+xrRxEr0uceXtbJuL4Em3SXtDSLxDbIeQeL9QiZjUo5OxbDLI
 B/vLcePsLbbza+hsAeVKQTTJL86yZWAg06ODgTLykYQX0EKZ7+rAb3JEFykipQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GR4qZsJ8
Subject: Re: [Buildroot] [PATCH 01/15] package/kodi-pvr-argustv: bump
 version to 21.0.2-Omega
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

On Sat,  3 Aug 2024 12:46:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-argustv/kodi-pvr-argustv.hash | 2 +-
>  package/kodi-pvr-argustv/kodi-pvr-argustv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
