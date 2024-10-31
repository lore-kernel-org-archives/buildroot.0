Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEC8D767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E9696067A;
	Thu, 31 Oct 2024 18:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO_6LP3MY2mg; Thu, 31 Oct 2024 18:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FB460B1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FB460B1D;
	Thu, 31 Oct 2024 18:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CC1494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5D354067A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyAG_hU0A7HJ for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8A6B4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A6B4024E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8A6B4024E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:27:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A20D1FF802;
 Thu, 31 Oct 2024 18:27:22 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:27:21 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com,
 ibai.erkiaga-elorza@amd.com
Message-ID: <20241031192721.042ae183@windsurf>
In-Reply-To: <20241030084431.633064-1-neal.frager@amd.com>
References: <20241030084431.633064-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730399243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gh9qK/1rpQKyWGqUQPHCkWxCmYhtWotPo4DnoSj71gA=;
 b=CJYzs9bI03BVS7+kB087v+/yv9C2qWmYPA62PAm+owN2s+6qdpWy7cqGI3NGmfWIFmsmMy
 QVBEsCw0qQv838jFvhCynOTTFgpIuJNP299X708sqiCFREKAjVDs6qBTde4XTs8hErMyw9
 oWnXfIS1fho5OX0D7Ebfsh7qv9haLbv2Wo0g5wwiKuIe8B4geK+WPelPgaP+z5HkxyU+eJ
 UzXdYi6Awj6RlY23QNLRaXjoHZ8dy3RYGmLdhvM7Mdea1LJFXrU7H3lfJ7uH5xwB4ru9Bf
 0f/LrHVBqBeHiP6UeHF7MKHdHS/e1Zk/+rwPZPKWBJb6ui9FBkhdP6FJ2HoquQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CJYzs9bI
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: align site
 to gcc package
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

On Wed, 30 Oct 2024 08:44:31 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Align gcc-bare-metal site location to be the same as gcc site location.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
