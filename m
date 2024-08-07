Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599EBC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29569608CA;
	Wed,  7 Aug 2024 20:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBWEH6YMz6ws; Wed,  7 Aug 2024 20:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EA0A608D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA0A608D0;
	Wed,  7 Aug 2024 20:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B21881BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F3AB406F3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_O88H_je5JI for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 486F5406EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486F5406EF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 486F5406EF
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:57:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EE56C0005;
 Wed,  7 Aug 2024 20:57:40 +0000 (UTC)
Date: Wed, 7 Aug 2024 22:57:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240807225739.22123f8c@windsurf>
In-Reply-To: <20240807173823.4146352-1-james.hilliard1@gmail.com>
References: <20240807173823.4146352-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723064260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GBm0Sn9ebc1dniEBraPO9dw8I0a3KR4evrB7ahWBlw=;
 b=To90rSetH4Ypr96b2SVFwwn60uB22MSIdF/D14lFvNegYv8cxgupBek2mlakhWvQMctzVK
 X5qGg54rqSgZHHbuy6pjIZoVLBCfYJ9CNSCCHhpf/FVVbZkgcdD2beW6aS1raSfeDcIPR/
 CqRbTJ5q4yWls5SaKBmFWA1JXMA08xJ0a4JXBevnu785Xe88RohHXccP4u5a1fHJ+sIsyp
 Y8MG31OV6pIJrPniCJY9Yl+QiR1/Xj2DV52TmdeHowTLff9R2kJyXMnYDDseaL2SPFgkj5
 c2s/2aq9pIel82KxbeYbKYaC2XY7tpjr+b9ILTTUU2qlwsr2px4sak9oia/Fgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=To90rSet
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tomli-w: new package
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

On Wed,  7 Aug 2024 11:38:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-tomli-w/Config.in           |  6 ++++++
>  package/python-tomli-w/python-tomli-w.hash |  5 +++++
>  package/python-tomli-w/python-tomli-w.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-tomli-w/Config.in
>  create mode 100644 package/python-tomli-w/python-tomli-w.hash
>  create mode 100644 package/python-tomli-w/python-tomli-w.mk

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
