Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A57C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 12:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0387C80B99;
	Sun, 14 Jul 2024 12:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mt3bJUxwnFeR; Sun, 14 Jul 2024 12:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A03D811E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A03D811E4;
	Sun, 14 Jul 2024 12:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B53E1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 12:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED52C811E4
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 12:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o_2HUe628Q2 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 12:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C6AD80B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6AD80B99
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C6AD80B99
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 12:47:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41071C0004;
 Sun, 14 Jul 2024 12:47:00 +0000 (UTC)
Date: Sun, 14 Jul 2024 14:46:59 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240714144659.2025f76e@windsurf>
In-Reply-To: <CA+R_deoOzYh6k_+VmbL2-E-A2H+iuLpk7oyqEbNs_qku3z_vEw@mail.gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240712112038.17a13aa4@windsurf>
 <CA+R_deoOzYh6k_+VmbL2-E-A2H+iuLpk7oyqEbNs_qku3z_vEw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720961220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNmBCNaBn+2NexGsmXFMMhoFeWggPjn6mOZ0zmxnHO4=;
 b=kGVXfk3QGmddlASOYIbjC2EdwQjzCG8TDen0VxEuUAJEW2KwYMBSaM5JaLTrYTzWMrjOon
 Yx/rBfYzAyIY2U9Bw0+YUwmy1y085HwFqVHSA2RTbIacK/6rEksexyNsycK+BCZt8g4XmL
 SgwAn1+WnASExJhRU6lHvY5EALisBAM3w/8RC/xnnQSPun1CBDHuJdtILYzHO+Hg9oRkm1
 w8WGewf8WU8DvmLQsmLY+y+KajROJvrMTl0lQcL80UvoJvgPWR/2w1waY1arzKpRuKOZCc
 qPdF99imN0Sw4YimMZhx4k8RZx0sk0a68iaI1ETgwlQXs0fMe9R6fOreBJxQfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kGVXfk3Q
Subject: Re: [Buildroot] [PATCH v9 01/14] package/qt6: bump version to 6.7.2
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Sun, 14 Jul 2024 11:08:57 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Added myself to DEVELOPERS for package/qt6:
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20240714090141.407553-1-roykollensvendsen@gmail.com/

Thanks for it, we will definitely merge it!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
