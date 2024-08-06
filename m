Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C31C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CFB40206;
	Tue,  6 Aug 2024 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOZdcuqdHor6; Tue,  6 Aug 2024 20:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C7D740225
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7D740225;
	Tue,  6 Aug 2024 20:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 870601BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7465480EB4
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mdvg8Q-Ku3XX for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3A0780DC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A0780DC3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A0780DC3
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:46:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC4AFFF805;
 Tue,  6 Aug 2024 20:46:06 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:46:06 +0200
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20240806224606.3d9bf851@windsurf>
In-Reply-To: <20231001043505.19301-1-takumiiinn@gmail.com>
References: <1841628>
	<20231001043505.19301-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722977167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0VFXiFf8zFjHbJ5wQZCoKfsHEa2oE/OlVBKITkOGV0=;
 b=l8CStQE1wDwnJfcdGejbyey/0p3Ju4XlJFIjHybzND+je1HBA2oRFR0z4wQUmRx3bzqjAX
 jeodq08ojLCoKMt6nRf7cE2zxKubF5JIFiStiaYrLcx2Vl0Y+uP3R+e1q1XZSLrm72C016
 UbvWBEpLOzY3kdCqRfaaVRLNPp2I7zNac0AZdIOi+YT7YCg4dbprHkD+2eKjWT0WA/2vrH
 B+JE05fOMlLOFVkPlLxocx6ck5xXdJ0Z2DSmV3A/lFrzL/cq2/dCx/J+TdTrPODz0dFmC2
 syNbwlnPPKMaTx1mdvWOXvmVij6ehhP2hknVas3PQXne+nbsYVi64ZHUsmeQYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l8CStQE1
Subject: Re: [Buildroot] [PATCH v2] package/itstool: new host package
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

Hello Takumi,

On Sun,  1 Oct 2023 13:35:05 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> ITS Tool allows you to translate your XML documents with PO files,
> using rules from the W3C Internationalization Tag Set (ITS) to
> determine what to translate and how to separate it into
> PO file messages.
> 
> - This package is primarily used by documentation tools such as gtk-doc
>   - After this patch is merged, a patch to add gtk-doc will be submitted
> - This package requires python bindings for libxml2
>   - This change has already been merged
> 
> See below for libxml2 Python bindings:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230930155548.1609970-1-takumiiinn@gmail.com/
> 
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>

I have a somewhat similar comment as for the patch adding
host-python-pygments: please make this host-itstool patch part of a
larger series that also adds lightdm.

Also, please note that Adam Duskett had also pushed for integrating
host-itstool, but he unfortunately gave up:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=387214&state=* (version 3)
  https://patchwork.ozlabs.org/project/buildroot/list/?series=387411&state=%2A&archive=both (version 4)

This was not meant to be used for lightdm, but for other packages.

Could you therefore prepare a complete series that includes all
necessary patches for lightdm, and lightdm itself?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
