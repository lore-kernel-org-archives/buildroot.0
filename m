Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF654C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605FD409C9;
	Sat, 13 Jul 2024 14:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYleXPCPqwhj; Sat, 13 Jul 2024 14:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4F440B43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF4F440B43;
	Sat, 13 Jul 2024 14:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E37E41BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFF4D80F7C
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eVp8rlzBf-s for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F16D280FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F16D280FA0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F16D280FA0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:19:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F115AFF802;
 Sat, 13 Jul 2024 14:19:25 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:19:25 +0200
To: <yann.morin@orange.com>
Message-ID: <20240713161925.2f84170e@windsurf>
In-Reply-To: <4db136849481236cd6c1475f74e51822e0df640d.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
 <4db136849481236cd6c1475f74e51822e0df640d.1698941362.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1syMu8f02NJFO1wBy3pXJl0wDHHgZELCDczHLuNLw8=;
 b=iBsBHnN++bekPg1U+Cp3pvJ2KaRQDSCLO6U/Bf8E4VyqisNiyRKtby3tNaAS82PyMQGPid
 iGIMqP+U6d4CkWQmlNJxAgCtoFrVBVD5IxD/4ovshNoaL+5in115QjfgWOG3xnIHtC33JD
 p98x+2h8qvJnj8B1/p38WUh/oDMLy9zCIWv9gW04QdONUmpnj8FD/SXAkinfyqr0VxGJcM
 xSDrSuD0B/56NtMBrDMwPYPEYIWkQri2U+nUYvtt55L+4e4Vtg0DxCxxdsKmjhVMjsTXfq
 coeIn13gTr7IKyMqNAoDRj6BY9KPsfCR/iRN2H/ZmeHpYlX1TgZOqSgjU7/lmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iBsBHnN+
Subject: Re: [Buildroot] [PATCH 6/8] package/libassuan: add host variant
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

On Thu, 2 Nov 2023 17:09:25 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> libassuan is needed by libgpgme, which is needed for skopeo
> (to come in a followup patch);
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/libassuan/libassuan.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
