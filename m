Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B23EC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58AD409E5;
	Thu,  2 May 2024 07:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoG99Zu69rRw; Thu,  2 May 2024 07:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FE5409FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2FE5409FC;
	Thu,  2 May 2024 07:45:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29DAD1BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16C278225D
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XS8azDi0G2Uo for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:45:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A947182294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A947182294
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A947182294
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:45:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F3F11C000B;
 Thu,  2 May 2024 07:45:10 +0000 (UTC)
Date: Thu, 2 May 2024 09:45:09 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240502094509.2ab81b47@windsurf>
In-Reply-To: <Zhyux5YZ5FffsSJg@waldemar-brodkorb.de>
References: <Zhyux5YZ5FffsSJg@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714635911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LL48t+Z600kldmzrDqRZs8Isdp5+eIXxorKseh3reVI=;
 b=OgfvpP6efwiWqeVBFufH1ZLG0OKKjWw9UwAxE9cvcGscuubYpEmGzjZsUJHCd8V3UNYyDh
 Fjuk6r4G1uINmqzbFlUpYY8SeHrC15C5ZFvpkhmYdy5AYuwxWyPFtyqsjsCoHlLr2+0rAx
 DDbT4beHZhRBa4kwKVbjAly04meWzBNpTwWDeCtCEj5AwWKevg22s0UTcCBMeKJeSWn63C
 MPct7z7f1j85ocsd8gOrfkXWz/qNG1N/EeUAIShXfp7nAn3u5gYDVIJXTgoTqBYrXNVT4L
 SmpU08UJR/uNeEqSPkKqxK6WSbLrGREpV0e9zlUyiOSlOzx4xd81mdohonFoHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OgfvpP6e
Subject: Re: [Buildroot] [PATCH] package/shadow: enable on uclibc
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

On Mon, 15 Apr 2024 06:36:23 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Package was disabled with commit
> 8035ea0a712eaa16d2ac96cd29db0e8726b0f685 because of missing features
> in uClibc-ng. In uClibc-ng 1.0.47 the missing feature were added,
> so enable shadow again.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/shadow/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

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
