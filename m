Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27DC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F85401B1;
	Tue, 16 Jul 2024 12:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GabFcU42fsyk; Tue, 16 Jul 2024 12:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB0E40B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB0E40B98;
	Tue, 16 Jul 2024 12:39:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 322471BF97D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E7B540B9D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ndcw-vE1aA6j for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AC5340BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AC5340BB3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AC5340BB3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:39:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 181AE20007;
 Tue, 16 Jul 2024 12:39:42 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:39:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240716143942.317bb76c@windsurf>
In-Reply-To: <20240611152202.951202-1-james.hilliard1@gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OIBBmDtmEFdc2nHROpftz3GXnn2Pzvqgwh/yAnmD/w=;
 b=kO/sVOFDQCH1ylk1oCXmZv0N/6fbOSYJ+jE6PlyNvOOeKR2IvHLcX33JzWztvB5+qdHGs/
 kybujPTzEATObYBixIDT1stkfQhMU0qTwQNkZLjMYAy6zRLSa4Z6IiD3rjrlO4FXuk2LVH
 XMddHMy2kpIjFcUm1q2ENUT+pmZlFAZnndV4GSUL21d22yqSjzIWu7Ap6ud4jK91og0BCF
 ijDmaEnwydBKyE5FXprwF6+jZVVVxzTghqJ2mwpekTDIScPZ1NJym9AsWasBc9mw7nhs0m
 I41BeLJeP4NPVH7qw/ekjO4JbSqvEzVF2SgnMvfVTS3YzxqOlQcDfSZdsiN9Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kO/sVOFD
Subject: Re: [Buildroot] [PATCH v2 1/4] package/libjcat: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jun 2024 09:21:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/libjcat/Config.in    | 15 +++++++++++++
>  package/libjcat/libjcat.hash |  3 +++
>  package/libjcat/libjcat.mk   | 43 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 package/libjcat/Config.in
>  create mode 100644 package/libjcat/libjcat.hash
>  create mode 100644 package/libjcat/libjcat.mk

Applied to master after adding the missing entry to the DEVELOPERS file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
