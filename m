Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423FACF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F5E541C1A;
	Wed,  2 Oct 2024 21:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kru5nuXYBIqe; Wed,  2 Oct 2024 21:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C9141C33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C9141C33;
	Wed,  2 Oct 2024 21:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2444D1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E368A81ED9
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z15nnMt__RPO for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDB5F81F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB5F81F71
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDB5F81F71
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D528FC0003;
 Wed,  2 Oct 2024 21:02:42 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:02:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230242.16ff58a0@windsurf>
In-Reply-To: <20240926154627.36691-1-james.hilliard1@gmail.com>
References: <20240926154627.36691-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgqlIYuHAugC4C7T0U5Ph4+tNouEM/NCzqlksnnPrrM=;
 b=H8Q4UP+PtaNOaTwxKTx3tMG/Xx7IBZINveuMdbHSQb5n/6NaUvJiVS+hVKmE7+4khT5Ein
 vSBXwGCod5RDVAIvESrfcp6/v3u2IpDgfZW+Dn+8DAOOFm/jYYz5wUKmPaak2/Epv4Dwm7
 a75qev4ieoqGrsy/t9f4DW75yl8PdfSY9J5lVhOO7K5yJVVcKPnNHrp0skXeOpb3zc+IAN
 M9Ga99Dmd9C14+mOuQr4S54Mvpt5lEWWedAU5GqVyUgl1Hx8u2YTUp8o3epuR+kZ7XM6uY
 BM22i7CZ5ysFQCxFki/E5DxY3uMOXXxoUFS3bzGBiVEgvVjbU6YZO3pfnHviyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H8Q4UP+P
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.27
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Sep 2024 09:46:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-boto3/python-boto3.hash | 4 ++--
>  package/python-boto3/python-boto3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
