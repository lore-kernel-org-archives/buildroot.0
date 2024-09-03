Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA2CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21A0402E4;
	Tue,  3 Sep 2024 20:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWuWuyebSHys; Tue,  3 Sep 2024 20:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA93B402E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA93B402E8;
	Tue,  3 Sep 2024 20:38:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 078891BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B5E9402C5
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daVRMIn4ALKM for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75DCE402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75DCE402E8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75DCE402E8
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:38:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5F45E0004;
 Tue,  3 Sep 2024 20:38:38 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:38:37 +0200
To: Daniel Palmer <daniel@0x0f.com>
Message-ID: <20240903223837.3acfc384@windsurf>
In-Reply-To: <20240903141611.458298-1-daniel@0x0f.com>
References: <20240903141611.458298-1-daniel@0x0f.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPI201On0VecjatdbmaHvzTpBedCBv7diQyCQd+fWfA=;
 b=HZc/mblg/SsFOO5P+aCyOnPg3wQTtk2pUac/aXimUmEiFUUW3f7uhHtbY3mctwvTIdj8/f
 9yghwFQdumeGIznOC2K5Tqk8JNmlwp0299hTMa+/NSS44zV04Fmp7+KaRUvdmLvnrpjuQw
 QAGPICVJ1f9dsQg2uCeX9yhMGa3HOMONfb09mCQf1ZqwcQ/CzmSPJ7txa0A4tcbPGWudQL
 xAJ6eEbHb6QHPPqBphmni3In8LmSUMYuDqXxH+yxOb2GlSp+yXxmUMKGc5Y9jueJvb8z7N
 rDLDRsVm4RfUzUMBrZ8/XkGFwg87OvFJEru6yF9JaURYmXq4WEEInl9nO4AM5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HZc/mblg
Subject: Re: [Buildroot] [PATCH] m68k: Add an option for 68030
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

On Tue,  3 Sep 2024 23:16:11 +0900
Daniel Palmer <daniel@0x0f.com> wrote:

> Buildroot is probably the only thing lightweight enough to
> run on 68030 machines in the current day.
> 
> Add a CPU option for the 68030.
> 
> Tested on a Motorola MVME147.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  arch/Config.in.m68k | 6 ++++++
>  1 file changed, 6 insertions(+)

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
