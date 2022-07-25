Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07084612A7;
	Mon, 25 Jul 2022 22:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07084612A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xT3tpsuv5f-b; Mon, 25 Jul 2022 22:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11A3A60E57;
	Mon, 25 Jul 2022 22:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11A3A60E57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0CCE1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77EE740995
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77EE740995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FVzhvsEpGyU for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 778F540980
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 778F540980
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:28:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so7157185wmm.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=24huGTPdIBLP7S7RztBPNuiI25ehjnB/iEFM6FS8PBs=;
 b=nOy4oj7IpRRem0wiS9oGm685hfp0ozck69UeUZYwje5VJGP+QRQFpYRxfA2HaM50k1
 U4b4C7HQ0ynh0sR6FmE2gfKvYSpQhZoWLlTmqch3h5IM6N+0fdtBMXg7CehzlS474lpJ
 279g0xuUEsJGk8SHpsZIJcg5BUnRAtr3g4GGUZc9sgCdZhjsTg0nckiw5cT0o08cfbe6
 V0flDL9Gaa5QayQsFPO6TO34cv8SzsbJZma5FwJQ8jU1lWcGfaKM4ZaL+1eX4OFp1tVn
 mPwsOkpW5J+9Tm8NtQpupnTCZQIZS/VrN8sMvDM4LxFyF+NQ0IeiynZfw41PwXEXN1vW
 sYOw==
X-Gm-Message-State: AJIora/+Ox5y7joj1zcJs+DAXZZcz9/kewVdfMuli3QQwX3nZxrP4pbx
 1OJrqbaPbY+6TT/tTZigPDuEdA==
X-Google-Smtp-Source: AGRyM1ujuv4z7g0i0qH/6U+2YRFRGHhZYQCiXHRpqzgGGNM4e/mSMe+ARJ1GG0OjBUmDKUDB/wXHhQ==
X-Received: by 2002:a05:600c:230f:b0:3a3:11ff:628d with SMTP id
 15-20020a05600c230f00b003a311ff628dmr22735225wmo.50.1658788111587; 
 Mon, 25 Jul 2022 15:28:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c28c800b003a02f957245sm19790679wmd.26.2022.07.25.15.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:28:31 -0700 (PDT)
Message-ID: <b871efce-8cec-322b-20e0-e1868baa0d92@mind.be>
Date: Tue, 26 Jul 2022 00:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20220725200818.1911402-1-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725200818.1911402-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=24huGTPdIBLP7S7RztBPNuiI25ehjnB/iEFM6FS8PBs=;
 b=Q1sBD+Aids8uQcwojbjs95M8KVPurK0zWouL7Z0Pxle5hp84xnOa6YYpVCl90PtVt5
 H6Bdu9aC8Dn2l3ssSzNBkSM0E9Jhq/Kdf9zDezWREqxtvmcjTidbFTaNYiJupve8Ogna
 M7L25N+De/uA79xCNM9qlhJXfdEfiNcRJD/PnNUOmuir6LfpnhQfaTHeECw4ing0NREX
 E/X0pynfr37WKrEwxlqjwxLqyC+9nAwSecc5B4YJZ2epiQIUz4kA2QBR6OVyS+cQI/Gi
 OwFtp/5MfesbClJFw9X+v00IUuAjtxKWinTe4odbK1PwiqN7MT8m5IPWPZFeN0EqAwTQ
 +60g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q1sBD+Ai
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: compile pyc verbosely
 when instructed
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 22:08, Vincent Fazio wrote:
> Only display the output of compileall.py when running verbosely,
> otherwise suppress all non-error output.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python3/python3.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 48d02588ff..9af384712a 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -252,6 +252,7 @@ define PYTHON3_CREATE_PYC_FILES
>   	PYTHONPATH="$(PYTHON3_PATH)" \
>   	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
>   		$(PYTHON3_DIR)/Lib/compileall.py \
> +		$(if $(VERBOSE),,-q) \
>   		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
>   		-s $(TARGET_DIR) \
>   		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
