Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D2DC3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F5180EE2;
	Tue, 30 Jul 2024 07:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf10uwrgDejz; Tue, 30 Jul 2024 07:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3CD18111F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CD18111F;
	Tue, 30 Jul 2024 07:40:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE77E1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C93E4024F
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cRv_zYKFZF5 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 704A74056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704A74056C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 704A74056C
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:40:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79E9040005;
 Tue, 30 Jul 2024 07:40:14 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:40:13 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240730094013.1e0650bd@windsurf>
In-Reply-To: <20240730072725.152016-1-egorenar@linux.ibm.com>
References: <20240730072725.152016-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722325214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcLLzSr0Gwx4ovuc1H4JxI7IMLR9WszKp68B5lykAMc=;
 b=a26EoDnmSYBU3hl2DH4c3DN8w5iVjPAj3FtJ3ji5pDJHQAdWuk4IG4NAgs3Tyk9DhhVCLs
 Y8ik+nw26et8nSxUJ/we2q7hGsCGTKQdLQShFr8SrdVH2x2f/eE5DkSdBkXcz5xnqbxWSm
 2rMjjrtjkPkDD88RpKrELS34K+m5jXII6Mv1lWQhl8ql+QUrXerOKct4r+oMzIfGA9+veK
 TnkGCiG0DoKGNUHWXiXctDepQHqZh++D+NWQFxBq1uft7NJ4zdTnClaIzCcC0mwsSyc4+9
 4v9U7XCTk3ot6cE+E8onMHiX2ma8DLP19YFjKXSenpq8oZn7Dc8rZrJPne+5/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a26EoDnm
Subject: Re: [Buildroot] [PATCH v1 1/1] package/qemu: enable s390x arch as
 target package
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

On Tue, 30 Jul 2024 09:27:25 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/qemu/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
