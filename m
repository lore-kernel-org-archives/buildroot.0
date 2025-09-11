Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF4CCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D030A42566;
	Thu, 11 Sep 2025 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4LDt5zAoW3Q; Thu, 11 Sep 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F22421FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F22421FA;
	Thu, 11 Sep 2025 20:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4AF234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601BB421FF
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aras2nOkF1nh for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B310A421FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B310A421FA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B310A421FA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:27:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D927B978576; Thu, 11 Sep 2025 22:27:53 +0200 (CEST)
Message-ID: <2649dd5c-ec99-473d-9cae-6b1e2401a9cf@rnout.be>
Date: Thu, 11 Sep 2025 22:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-20-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-20-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757622473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SA7kZkAUvTOTKczbLn1LsCK7Aq0Pqu6c5zZ5e2mmF6E=;
 b=Wb15SElHGl6DyYc2y+NU9pHoXXfcXV/Eywd+mF1mKj3LgFPJGivKdC6tBeOn6EhZr/awfu
 eBKCR34X0XroiW1z5ZlSEGTqyUIaeB8RHVeNWkfMHPaBm1VlHz9tUH4CaAi9yJYhBG2xRX
 mQFnCMxUWp5PtuEVLlZtcBOIadD/z4rk73ahasA/4FCMmyMo130Yv84/tNGa4uEhq3PlHk
 Nh+TiblqHQUutU9q01SXrP6FXm7d3wOaOAInbogVJglskI7NciaHXLfXkec9ueqEdBqtpi
 Lhev7/cBRwBhi04FB8iV2XpOTtdjZyvFj5izm184zmkfdGvJXdfyjiH9Bw2w+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Wb15SElH
Subject: Re: [Buildroot] [PATCH 19/23] package/putty: drop optional
 dependency on libgtk2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, we need to drop the optional
> dependency of putty on libgtk2.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/putty/putty.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
> index 617518e647..ec65991f41 100644
> --- a/package/putty/putty.mk
> +++ b/package/putty/putty.mk
> @@ -14,8 +14,6 @@ PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
>   
>   ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>   PUTTY_DEPENDENCIES += libgtk3
> -else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -PUTTY_DEPENDENCIES += libgtk2
>   endif
>   
>   ifeq ($(BR2_STATIC_LIBS),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
