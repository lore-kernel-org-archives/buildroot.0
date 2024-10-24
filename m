Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11412D10376
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F2960D55;
	Thu, 24 Oct 2024 21:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO0fOSQpExEt; Thu, 24 Oct 2024 21:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A41760D5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A41760D5A;
	Thu, 24 Oct 2024 21:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C383E497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A51B8412EC
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzjpVLidoOWx for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6974B412C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6974B412C4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6974B412C4
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:04:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85C0660003;
 Thu, 24 Oct 2024 21:04:27 +0000 (UTC)
Date: Thu, 24 Oct 2024 23:04:26 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20241024230426.70e5c503@windsurf>
In-Reply-To: <20241002191900.2906349-1-thomas.petazzoni@bootlin.com>
References: <20241002191900.2906349-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729803867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3dKcl/kCz284aUb9vZWNSose9bYGcxxZuUcsMA7d7A=;
 b=VPWthhxEdBlUstAxVFFkWRgsxWajKYi+qEvd7/K/b5qYRBd+ruNFqzLUgR/X7A2fgsQKRg
 36thfwxVcAJwGKRHuYfZ/E2xQ3RA6lETXBi5Aiehkq1eaIt3o2ViaVN7H6t7UlVKKi4Ogq
 782ChvTe9RxjfH0Qcc94Aigpn3fREAiEjcsKxeZouHh0RJ1FOXYtmgfGv+OtPMO/gQeCAC
 2QTUrXSAyLBVg8N8e6XaoUtKqZXpHYb2vm1g/xRTU8C8YICqxif3BNk0vjFR6/GeSpXGb7
 DyzX2g/DT5agcRslluT4UfbKe6lqTfNIWs78hiyrz2CFpwnMN6qWw6zALXZndw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VPWthhxE
Subject: Re: [Buildroot] [PATCH] docs/website/news.html: announce Buildroot
 Developers Meeting 2025
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

On Wed,  2 Oct 2024 21:18:59 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/website/news.html | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

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
