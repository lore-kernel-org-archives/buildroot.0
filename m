Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77626C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F296412D1;
	Fri, 12 Jul 2024 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6duISGoL2FC; Fri, 12 Jul 2024 08:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8051E412CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8051E412CE;
	Fri, 12 Jul 2024 08:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757871BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C4E240C87
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_IE2XMCXIrO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7456F417C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7456F417C7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7456F417C7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:47:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 706C8FF802;
 Fri, 12 Jul 2024 08:47:25 +0000 (UTC)
Date: Fri, 12 Jul 2024 10:47:24 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712104724.1378ab65@windsurf>
In-Reply-To: <20240625211847.1419944-5-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-5-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720774045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQFsz1uLjNMkEnQE1jY3qwhMMeIJAqZT/+Dzh/cXr3A=;
 b=hFUudih/z9RTWUY4Lvbr9cR1j4MQc4EfQwcTkESKTg1DMuI1YcnJUrf6uhSIwMC35j2E45
 q8GmEQjHW6gtrXfsAJ00KHQJS57cx3b3bVseWi985/eXTpSGb4U2R3LTkLA2Ia4jz0GQcC
 49bFEdW5WJoGC8dMdmb7XWxmrny9i9I2FGih88O3ppva7D8Q6c5g/HiDjxfhGhHjysv038
 O46+oqV3stApx/gEgnYOlwQzJHax6drIIRsBUfNM74GuMrN5HEVLbn1t4X4nKagZ43Ne2U
 XWhBK2udskRZkHsFvHj6uwZk3RLSnB6AlQz5Se2csrq9W0udLefVzH9gc+Jfpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hFUudih/
Subject: Re: [Buildroot] [PATCH v9 05/14] package/qt6/qt6base: add blind
 option to enable Sql support on host
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

On Tue, 25 Jun 2024 23:18:29 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> We need host qt6base with Sql support for host-qt6tools to generate the
> qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
> available.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6base/Config.in.host |  5 +++++
>  package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

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
