Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB79D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4129E40AB9;
	Thu, 24 Oct 2024 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sv2iosj542Ue; Thu, 24 Oct 2024 20:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A57440B38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A57440B38;
	Thu, 24 Oct 2024 20:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2DAC497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE927409FD
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYvBYG1k3WvR for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C56B409E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C56B409E3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C56B409E3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A46A60003;
 Thu, 24 Oct 2024 20:01:53 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:01:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241024220152.0c88eb2f@windsurf>
In-Reply-To: <20241008175003.3626016-1-bernd@kuhls.net>
References: <20241008175003.3626016-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729800114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUndZw2iSmOUVkDWzCEeQMkz/3Cr7U0JoWsXiJ5Wj3Y=;
 b=VyGQ8drPH5RU5VjkZ7tZxbSnRmGjY6+dBF4TVmfcWSfP+wxYRYEBwjI9JMpybpLi8RYEce
 92mpKg3nR2nc+jBdWykekXk73E2PrrZb674vHErzs0PrripqpCIIY2I/dXY2KTljROMK1O
 oZs2fFKLDd90R0Tt0MB0j1beAEvhNx4+Vds5MRtvvJqjxrTbNXuxjliiQ57aXqt3/4ckog
 jgiK1Rw8+Y9hq9c0f8FRmsbT6fOB5OSCPUTD9gk656GSCfAUkkNBauZ0rvdFB5M4Q2v+yA
 1S0Ypj2B+DTpk66SvLqEVgu7C5g2DlpHroP4/kCCRCoxQ1juOzH6ElHOAyL4zQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VyGQ8drP
Subject: Re: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.24.5
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

On Tue,  8 Oct 2024 19:50:03 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00008.html
> 
> No versions between > 1.21.4 and < 1.24.5 were released:
> https://lists.gnu.org/archive/html/bug-wget/2024-03/msg00012.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/wget/wget.hash | 8 ++++----
>  package/wget/wget.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
