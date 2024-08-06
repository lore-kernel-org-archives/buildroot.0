Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C33C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D1840253;
	Tue,  6 Aug 2024 20:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2cSO2huL23x; Tue,  6 Aug 2024 20:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF653401BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF653401BA;
	Tue,  6 Aug 2024 20:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC4DD1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A9C80E8C
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwOfT0DMeRHP for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:41:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00E5080E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E5080E76
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00E5080E76
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:41:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C6081BF205;
 Tue,  6 Aug 2024 20:41:43 +0000 (UTC)
Date: Tue, 6 Aug 2024 22:41:42 +0200
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20240806224142.24555952@windsurf>
In-Reply-To: <20231001034247.14022-1-takumiiinn@gmail.com>
References: <20230930190610.752987-1-takumiiinn@gmail.com>
 <20231001034247.14022-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722976903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxRe+TDt62qy5yybcbQt0lOQAvloCGBNYoxhEvEx6Xw=;
 b=mCrJ/WhwViSyNC5eW+KRF0H8oHlcQlYRx757GMh4An/7aSVGgSWRT54ot8mlw1g8h056qc
 4P9RcpujQSc20MgnZzZM/CRhEPSRpbkJ89RU5iUbIU+dzAdG6pSSy2XRXkVC1OV1N52vNN
 CnZDlzN2ujtUpO87aDVJVtkpvj36hYOvOU9R7jNP4bHz/A9MwSK8quWSzqDala0xhduN2p
 qM3MMfO/QADa5DDVLs3ELkocPbwvFEGV4U74DyIlRXAq7a0j/98txvhvkhl7zVl2vrv/Yq
 VugRpCBhEQXR6iG+dJvAYrJnfv94AYx811MCLzUtm7Ov7p5vfp+WMIKjAsnLZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mCrJ/Whw
Subject: Re: [Buildroot] [PATCH v2] package/python-pygments: support host
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Takumi,

On Sun,  1 Oct 2023 12:42:46 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> The reason this patch is needed is because gtk-doc requires pygments.
> The final goal is to submit a patch for lightdm, but since gtk-doc is
> required to build lightdm, pygments will also be required.
> 
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
> ---
>  package/python-pygments/python-pygments.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks for your patch, and sorry for the long delay with which we are
getting back to you. However, this patch, as well as the patching
adding itstool need to go together, in a patch series that also adds
the lightdm package. Indeed we want to see the big picture, and not
have those two "orphan" host packages without the actual package using
them.

That being said, I think the approach should rather to make sure that
lightdm doesn't require gtk-doc. In the context of Buildroot, we are
not interested in building the documentation. Are you sure that lightdm
absolutely requires gtk-doc? I see it's using the GTK_DOC_CHECK m4
macro, so it supports --disable-gtk-doc, and that should do the trick.
If not, it should be fixed to do the trick :)

If you're still interested into this, could you send the full series of
patches including lightdm?

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
