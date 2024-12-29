Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C784E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE91809DD;
	Sun, 29 Dec 2024 21:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUkxArMTeDqw; Sun, 29 Dec 2024 21:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4391980A5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4391980A5B;
	Sun, 29 Dec 2024 21:52:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9964C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80D240297
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlZlLWduVxrL for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6881D401A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6881D401A3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6881D401A3
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:52:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB3D860002;
 Sun, 29 Dec 2024 21:52:44 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:52:44 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241229225244.0922292a@windsurf>
In-Reply-To: <20241023213643.915658-1-ju.o@free.fr>
References: <20241023213643.915658-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735509164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhAORfkLTDgbVCxzpWC6K3O8z9GeUQlHZWATQnlFu9w=;
 b=U5S0Verupdwqc76keUHtDAOyo2yT0Rialjw6gZN8ZFRooIc0fJqi3FGCn6NypbLU7fNhAD
 VbwUsgjwczKssD5miok9Gqh0Tsf//lsaC44HCrhqVpm/LNsr1GXeBCbEVh4JXeUyW9gFw5
 UV3uIJNeGkCcw2uA6d2rqlBG46ba396mtCRcH1q6qSx446+x4b1PElz/48oy768vnc7ujK
 YI4M2v6V/UnvvyZB02BRsxg2ViAXwPB/nmPhXJsN6KDs9/YtjqYyosxWvNd/zrFqvTOOsp
 Fv3lklPbhEv4BsrtQ1oZryR5ivMVSS/NkyjRp85JWpfOkopuGGpEcQCUt2w3GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U5S0Veru
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add dpdk runtime test
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

On Wed, 23 Oct 2024 23:36:43 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8169488724
> ---
>  DEVELOPERS                                 |  1 +
>  support/testing/tests/package/test_dpdk.py | 46 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 support/testing/tests/package/test_dpdk.py

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
