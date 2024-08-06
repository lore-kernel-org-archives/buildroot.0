Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED73C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEA9740A03;
	Tue,  6 Aug 2024 15:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfadYKuAC2Vx; Tue,  6 Aug 2024 15:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 608CE40A21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 608CE40A21;
	Tue,  6 Aug 2024 15:04:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E386C1BF3BF
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05D94052E
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SyYhQBlDmeZ for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84F6E40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F6E40373
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84F6E40373
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:04:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 952C6240007;
 Tue,  6 Aug 2024 15:04:26 +0000 (UTC)
Date: Tue, 6 Aug 2024 17:04:25 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240806170425.1ca088d2@windsurf>
In-Reply-To: <ZrImuaWe+ZTWX+9d@waldemar-brodkorb.de>
References: <ZrImuaWe+ZTWX+9d@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722956666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEQlf5sQUG5WcoP4rTRWJ6h9KlH+IkFRe1as2ItU7JE=;
 b=jNAmVYQ6vh3UjCrPYSX4Dz9u8RejZjAWURv1VfbiptFgXFCtIpTaESE150XSperJfi58Cf
 QK06IwzDxSx1uaNbTx5YK9Wu8/BlUg1e84yqKZE8NSKlYHpDTVEgjQu71ZAr6kuy8bl+DN
 8tPygI0/yUNu/SnpO0gqFo/gjRMvxqpTjwkHumq+7aQncVrA+cKAvEP6AxYsWFH7nrMFPO
 7/DMOpzEJ8nLlgRONhqo0VlrbVIZV/A/CaQlNSFWRsejLFnXDLlE9CCLV9j42iRej/AGqV
 22ArwgzSqAz4ntv4phcC6qziylL4bae6CUkFs98yja/6uMgzA0Z5J3xnw5/AyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jNAmVYQ6
Subject: Re: [Buildroot] [PATCH] package/libressl: disable asm for
 mips64/mips64el
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

On Tue, 6 Aug 2024 15:35:53 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> LibreSSL fails in the same way as powerpc, so disable
> asm too for these architectures.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/788/7883ffe9ed96f38f9ca359e99a18a548b6f35c24/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libressl/libressl.mk | 2 +-
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
