Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1C3D1266D
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 07:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB7083EE3;
	Wed,  3 Dec 2025 07:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCZYIHvcLbFN; Wed,  3 Dec 2025 07:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F3DE83EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764747984;
	bh=srHkB7v6HnfHHCx2dWfRyOYU0mTlJirGGzNEB7HBRhE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gm9BdiaWghDOnc6PCnXXgrivHmsTT33PqalWJ5CtHJw8wGgh7yDqD7BzkUVFZL82J
	 jMyNJEt2bXbfWsmB8Zx5Mfw520j3S5nXQAoikrtylfjSV3QqiibaH5VcUCRS1FGpXM
	 s1J56yrwQEl6aUmCexiax867zMNcuPIvY8BFT/Fq9oDI9BUA4Kf7DkazlLFpREejRw
	 sdkM3BBJoidMYe3BCizjoSCQHELpO2Xe50ThMc03T1Y6aJdM6pLsSnGXWiFmcm0Ozg
	 xs+zbr3X8h4yCviG2hv6rpSsrdpSLPqXOQGm0KgS4a0uYlYFI0zCiLBL1sIzZn4pJp
	 TEgg/Mfd1CseA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F3DE83EDA;
	Wed,  3 Dec 2025 07:46:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD35E4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 07:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFF68400FC
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 07:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZb6lF7_DYCV for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 07:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9231D400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9231D400C7
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9231D400C7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 07:46:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 835244E419F7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 07:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5967560706;
 Wed,  3 Dec 2025 07:46:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 024481192003F; Wed,  3 Dec 2025 08:46:15 +0100 (CET)
Date: Wed, 3 Dec 2025 08:46:14 +0100
To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Nevo Hed via buildroot <buildroot@buildroot.org>, Thomas Perale
 <thomas.perale@mind.be>
Message-ID: <20251203084614.3b7525c5@windsurf>
In-Reply-To: <CABGDZC=R0ndhtoyhdFrzmDs6HgVXGoVhrUAODOqfOLgnBX8NQA@mail.gmail.com>
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
 <20251120233241.54d9b14b@windsurf>
 <CABGDZC=R0ndhtoyhdFrzmDs6HgVXGoVhrUAODOqfOLgnBX8NQA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764747977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OvIMrbXGvLuZZEF4qOzaobPxXW3QwVhKiUYp3HrqsXk=;
 b=Pfk3YzE8vFoyODHm8NcAPIosqN9DtlRY552ASb5wekthmxUqd4MerzGK3BmS3BYE2mZi6p
 BV6O2qdhYZnNXSTdPuktKK7Pn4859eY4u7/Nqtx4SY1avLvY1bwbihXJ1a3OZanxQnREOn
 pBTt+9kpM4nZ6DvQXfoDXhCLd2Uzl5W0mdzTGkqysLf7Dko6QJU9IKxl4FNHNfq8Zdt75n
 63yfzfl7xhDDnXLJJcyM0ZXkLmVVp7kR038H2zqLocU1ExeK6CYHXSvvTv/IH2FFOGZyvX
 S9Mmq9sCPOTn1PL9lHh2mr+Y3TbMVIOh0gATwn/1JlodPMyn1VjXL2WYQDBEtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Pfk3YzE8
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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

On Tue, 2 Dec 2025 16:34:55 -0500
Nevo Hed <nhed+buildroot@starry.com> wrote:

> Yeah sorry about that - I rarely contribute here and am very much in the
> github pull-request mode

No worries!

> 
> I will add that and try to reformat the v2
> 
> Just one question - do I include or drop the `Reviewed-by: Thomas Perale <
> thomas.perale@mind.be>` line?  (In my local repo I had updated from the  
> patchworks)?

If you got a reviewed-by, and didn't make any substantial change, yes,
please carry the reviewed-by in your next iteration.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
