Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE28C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E3A382438;
	Sun, 24 Jul 2022 12:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3A382438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHgtVkgjEph4; Sun, 24 Jul 2022 12:18:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B8C81886;
	Sun, 24 Jul 2022 12:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B8C81886
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9F41BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7833F84C44
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7833F84C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptYkvz295hbN for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3994C84BD2
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3994C84BD2
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 12:18:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k11so11851149wrx.5
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 05:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PWA5BbNsM4U6yjEEnAJJ8Bmoy0Y0SML6pBK0buD7Iro=;
 b=BvDbyvEJc0mixyKSisDVz06ZiWRnqDyGK2mKMUCtPVqnUnsr5dz/jo+QznmRH30Byz
 H2QZi5BU2eb8zcRaCcHEZQ2u26XWT9+uQR4Xsn9cvFX6bkaDs2HRkJ7IEWby3lNDBSbS
 U0hyQRkzhZ+T68LoCg3PGtiiEV81Aqf8k/oOrZnOOCsVbW++cOjm6k1QqLsJOPMP+irC
 hsBXjwELLe/veUWtuPgWFKB/Wo0JNJRsmFe8qiuhW7D7fgA9IzW9HN6lP+BZxQH7w/tI
 WsPN8JD42raXpVkJV2qX5mKSCfIGsZevcj0ChGZGP/MVaQvUVU2JgVW4qf/gmz+njNCJ
 zyhQ==
X-Gm-Message-State: AJIora/lKjwgrh1G54gBL6gGn6QB6T793gCfSbXihVw2IDGqQcokXL7w
 3Nul4sefYbPaT4N8wDAZAih+tA==
X-Google-Smtp-Source: AGRyM1uedlloXdiUAAs83zj1zsEEF4pJlEjwji+jfgy7zLEvgPu7u49DCgoOzCn75XhLsrmmNKNxVQ==
X-Received: by 2002:adf:ebc5:0:b0:21d:640e:dc2f with SMTP id
 v5-20020adfebc5000000b0021d640edc2fmr5042240wrn.227.1658665094359; 
 Sun, 24 Jul 2022 05:18:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a0560001b8b00b0021e6baea4ffsm5147807wru.29.2022.07.24.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:18:14 -0700 (PDT)
Message-ID: <7ede4c96-d7fb-284a-a10a-492891f6f363@mind.be>
Date: Sun, 24 Jul 2022 14:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220724063318.3305458-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724063318.3305458-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PWA5BbNsM4U6yjEEnAJJ8Bmoy0Y0SML6pBK0buD7Iro=;
 b=Q3wRWVSTdc9H5sv9JDSCnHYElj7sXY6v2TKY+W+//t+ntCGEXCdhqhusHLhr2Q6CWp
 PxwsgZkmSfcP/IJ3cKu5lAV1Ty4zgvfNJkvX6WKsLGGgjQzXkdkRY2/RG6lqF8gXP67z
 ZPm0iOArgF8+tWSSt8+nKsehLLjmohUJ+LBLvRdubKPUfbJ0oWtpv2DrBxfOMVkhN+3/
 /GnVYkhAlfU3Q6n1Pj/fvvllH421PvhBEJlU5T31xKh11mNoyfPwk5GRKXkDOfh8LSPF
 3gHnvAUEmOkFgL65T8YwdUtGCKEJj2iFE6zZGZ2cM/k6p85U8fS0H51yBy9TOPwfuPMJ
 nJjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q3wRWVST
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/07/2022 08:33, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/open62541/open62541.hash | 2 +-
>   package/open62541/open62541.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
> index c7234fd81..f5402ffdb 100644
> --- a/package/open62541/open62541.hash
> +++ b/package/open62541/open62541.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  b8f4bf73d50d3dc0e2e7343f03df7cd07ad169ff66056d5c392215662b1f8fc8  open62541-v1.3.1-br1.tar.gz
> +sha256  7e2a47ee6c6e5e7b9a9c803ff717670707d040710bb65d2615c0df33a614e629  open62541-v1.3.2-br1.tar.gz
>   sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 5f46703c1..0551c3bca 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPEN62541_VERSION = v1.3.1
> +OPEN62541_VERSION = v1.3.2
>   OPEN62541_SITE_METHOD = git
>   OPEN62541_SITE = https://github.com/open62541/open62541.git
>   OPEN62541_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
