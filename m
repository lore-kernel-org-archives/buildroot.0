Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F3D767FB
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5948A606EE;
	Thu, 31 Oct 2024 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSWiuLIKYzeI; Thu, 31 Oct 2024 19:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7344560902
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7344560902;
	Thu, 31 Oct 2024 19:52:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C2C5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14EAD4066A
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukoAZVQ1a5Jt for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0E7D40664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E7D40664
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0E7D40664
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:52:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA8C940004;
 Thu, 31 Oct 2024 19:52:49 +0000 (UTC)
Date: Thu, 31 Oct 2024 20:52:48 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241031205248.27605fa4@windsurf>
In-Reply-To: <20241012221529.91515-1-ju.o@free.fr>
References: <20241012221529.91515-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730404370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1CsyCkDor1Pyh42HXtihx88HvBS9Y5Gsdau4zOPb5U=;
 b=Oc5ZfGZe9STTEx0xsxoJ+JQDL3mbKSovMc8bWMKcGMJo0XOqRD3/trAOgbJT0YOrTKO7yO
 VMrKIZWl1nFMk2IB3ZUh2PbphFl0IfJs50IPs8HfPq4cGEL44hYZzZbcZpumozL8OG2gF5
 nU0cDlnrh6YIth7i5YulwOO0qXFGbKzIo53qVT5uAvv4nHkDUVdpvVB8E6QrBgZIhd5eNU
 MtjUt/2h/PQVAD7R9vM1tqbsK9WahBHZzimYIts0qM+8fbgwOGSv+rfKpwbMQD3tl0uJOS
 YaJQkuycdmPizZ0Pp2M+Htj66i1fxqKrTnCKsjMX5EoytBLFaHxy6AK3VazZtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oc5ZfGZe
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add rrdtool runtime
 test
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

On Sun, 13 Oct 2024 00:15:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8070566041
> ---
>  DEVELOPERS                                    |   1 +
>  support/testing/tests/package/test_rrdtool.py | 100 ++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 support/testing/tests/package/test_rrdtool.py

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
