Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B63C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C0480E19;
	Tue, 30 Jul 2024 07:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKjsoXdLPveD; Tue, 30 Jul 2024 07:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C077A80D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C077A80D5F;
	Tue, 30 Jul 2024 07:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3B81BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9758810D4
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1-56mJULmFF for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9875680CB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9875680CB9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9875680CB9
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:40:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 891334000F;
 Tue, 30 Jul 2024 07:40:11 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:40:10 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240730094010.0edc0e0b@windsurf>
In-Reply-To: <20240730064202.72774-1-egorenar@linux.ibm.com>
References: <20240730064202.72774-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722325211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mU8AHVjqNGdYUJ79tqdsfycPD5GgS28f4tgZa5ZhNEg=;
 b=SPc/n2T7Vuaz6ccL1kKZNrF49dOkcQoheqjpo9WPAz6AKekzQzvxLnx+Pks/8auyx4B1Aj
 DFGBoI2p/lm5ZyZSH8Nxi9dbwlBX/yG10vcuJYaG92zz9IrMUfPMuHJOqy+EMiSZT2JO60
 cA24x5yM5BojOxh/zcyFwS55WcYWsymwSp+vLPnfIZEOy2TyUFBP38d/BR18NHUZ6yQkNF
 AzyXxtMUjuYwtrs48DPRlQ3fvwfgXcm7qPh3fCqD1oMxCZ+3TFoSOM70oCkB7bQpCsurEv
 T6Y7Fxs34xa5KIDk++7GUqLqI5Lci/gBlbCuTHg2RrNT+B3sIAoLcXN8znalbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SPc/n2T7
Subject: Re: [Buildroot] [PATCH v1 1/2] s390-tools: bump version to 2.33.1
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

On Tue, 30 Jul 2024 08:42:01 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/s390-tools.hash | 2 +-
>  package/s390-tools/s390-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
