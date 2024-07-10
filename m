Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE84C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD96408C1;
	Wed, 10 Jul 2024 22:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApOuG1rVn13N; Wed, 10 Jul 2024 22:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F9740711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F9740711;
	Wed, 10 Jul 2024 22:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95C661BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9023840126
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg8hDF8lNuJU for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E53A400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E53A400FE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E53A400FE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:04:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B71CE0004;
 Wed, 10 Jul 2024 22:04:23 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:04:22 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240711000422.4e811cfe@windsurf>
In-Reply-To: <20240621210904.319172-1-ju.o@free.fr>
References: <20240621210904.319172-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720649063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD6zBwV/CK+DtY08J6lGjni38kEgrnylBDBGajdshDI=;
 b=PkmHTtmQu402B4/k1jF4WIM7FacUYtD+8k1C3BE+NMHbvT/uVk/oD/9mi/rcckiZXQAhVF
 RQuWf6I0adVCm7nsZ+rV/leiVrQSSsOQQ4FPGVlDrryz5qwKuBWGVT3J5jbC17XizX6934
 Mid8cZkZZW7ne8dW+QxSdHOEVkRt04fm1DB79c3ZqvnXLAAFtXbfWjVLkAgDuPTH4aFeqo
 94n7PGrUP1hAhG5Ch12dzuchY7Yc9NdRgb+sg875yhqrxU3g1Tjw0lfCDg2Xiyy5hJgtPn
 YjY4e86Kh5+UsxWnRd51zivpZvvLUmMhVWNkDmhxKULksG32wJPCRVY22dauUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PkmHTtmQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyalsa: bump to version
 1.2.12
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jun 2024 23:09:04 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 1.2.7, see:
> - https://github.com/alsa-project/alsa-python/releases/tag/v1.2.12
> 
> This commit also adds a comment about the pgp signature check in the
> hash file.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 4ae18c5 with commands:

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
