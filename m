Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC76BC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC934038B;
	Tue, 26 Mar 2024 16:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tpSGgHhoe4h; Tue, 26 Mar 2024 16:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775AB414FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775AB414FA;
	Tue, 26 Mar 2024 16:07:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42FD21BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE8581846
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQPot-Puf5L2 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.33;
 helo=mail3.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B3F081751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B3F081751
Received: from mail3.hostpark.net (mail3.hostpark.net [212.243.197.33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B3F081751
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.hostpark.net (Postfix) with ESMTP id E16E71676A;
 Tue, 26 Mar 2024 17:06:55 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail3.hostpark.net ([127.0.0.1])
 by localhost (mail3.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id 0ZLtm5DzN5vf; Tue, 26 Mar 2024 17:06:55 +0100 (CET)
Received: from roundcube.hostpark.net (unknown [10.100.20.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail3.hostpark.net (Postfix) with ESMTPSA id 7A73316404;
 Tue, 26 Mar 2024 17:06:55 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 17:06:55 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240326154306.0a86db6f@windsurf>
References: <20240228145642.436509-1-christian@klarinett.li>
 <20240326154306.0a86db6f@windsurf>
Message-ID: <71f0807409d219944b2530eebd83c67b@klarinett.li>
X-Sender: christian@klarinett.li
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:content-type:content-type:message-id
 :references:in-reply-to:subject:subject:from:from:date:date
 :mime-version; s=sel2011a; t=1711469215; bh=VBmgCSz6bf6pEGDAX08H
 t4FPoO/DAWU+vtAF+TM6ABA=; b=X+208Vt9givO2S9zcngsscfZopD6/R2vzbFe
 iMrDbYM15p4QhITWHIUmcvQWQ7MXUoee3w42uXTIbqi8MBDlyfnDcyCYq+WrhQOe
 qJCLMkB4xVmQzchhAfd873EmiJvBJZEKmou/B2IOx5txG71VE80/yKvEY5DE0tSa
 6cd54ho=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=X+208Vt9
Subject: Re: [Buildroot] [PATCH 1/2] package/zic: add hash for existing patch
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
From: christian--- via buildroot <buildroot@buildroot.org>
Reply-To: christian@klarinett.li
Cc: Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Christian Hitz via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas

Am 2024-03-26 15:43, schrieb Thomas Petazzoni:
> Hello Christian,
> 
> On Wed, 28 Feb 2024 15:56:40 +0100
> Christian Hitz via buildroot <buildroot@buildroot.org> wrote:
> 
>> From: Christian Hitz <christian.hitz@bbv.ch>
>> 
>> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> 
> Thanks for the patch. However, could you explain why you think this is
> needed? We only have hashes for files downloaded by Buildroot. This
> patch is part of Buildroot itself, and we don't verify hashes of
> patches part of Buildroot itself.
> 
> Am I missing something obvious here? I don't even think we have some
> logic to check the hashes of patches stored in Buildroot itself.
> 
> Could you provide more details on what you're trying to achieve?

I believe to remember, that, at the time, I had issues with legal-info
and this hash. However, re-testing shows that it's really not needed.

I'll drop this part in v2.

Thanks and Regards,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
