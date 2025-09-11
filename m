Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06647CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E21425E9;
	Thu, 11 Sep 2025 20:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjC7CjxeZNZ1; Thu, 11 Sep 2025 20:08:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0854258B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A0854258B;
	Thu, 11 Sep 2025 20:08:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8264F25B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 741CC41FF0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsvDa7irwEz2 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7640041FE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7640041FE7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7640041FE7
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:08:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4CDEB978576; Thu, 11 Sep 2025 22:08:40 +0200 (CEST)
Message-ID: <6fc1253d-1ba0-4e6d-80b1-5a34d9849832@rnout.be>
Date: Thu, 11 Sep 2025 22:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-13-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-13-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757621321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=dgS+kyCBf1Jp3/MqBKEIfDxGbr1sKYrt/by5dOFWtJM=;
 b=DQDKc4EjwURRWa7JH1+N4lUvY5djsIaexRI/e+UTgVmfikX1Z1i3ZD27YZB41+c/JCVPGY
 gDaxCTC9FQ2rUvJV3H+aeJo44dGTBWbAOf5U+3E+vCmnkAncpr5qsU+DUTPzAUNNB2azVd
 DmG5whA7bOre4ezaU9Bmyc0Gi9lMLXqHnfqQxmIUVEe4k3RFyhhn4YOOBKQiBZD2fM/b9Z
 Ee63AavJxlnnMJePtWudpKI3s1VHcJLWyrJpO/w6pMCzw4zkTqDp66rPe/GDaECytWxTG4
 Bqn4MIbh34tJbYZBc+ck7jbckjCj5SUlcVw/B9dIjqTMcrAzNLFpq7xQptvh8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DQDKc4Ej
Subject: Re: [Buildroot] [PATCH 12/23] package/lv2: drop optional dependency
 on libgtk2
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
> As we're about to remove libgtk2, let's drop the optional dependency
> of lv2 on libgtk2.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lv2/lv2.mk | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
> index 2dde9b907c..cef90d13f0 100644
> --- a/package/lv2/lv2.mk
> +++ b/package/lv2/lv2.mk
> @@ -24,10 +24,6 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
>   LV2_DEPENDENCIES += libsndfile
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -LV2_DEPENDENCIES += libgtk2
> -endif
> -
>   ifeq ($(BR2_STATIC_LIBS),y)
>   LV2_CONF_OPTS += -Dplugins=disabled
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
