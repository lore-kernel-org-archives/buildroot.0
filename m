Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7D3FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFAB942042;
	Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td3tRgbxFqX0; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1487441F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826799;
	bh=s6lb6oZo6MiU+tiuF9k+RlpMcrkmRzz607aNDIvsWzg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=csDXACv8PXm+XQUJXoffHom0QSSTO5+9JHD+1tBa74MIMZyGKIn+B+Kau4rQDLDDL
	 Esc3EUtsPul6wDtMvkyKdPd9vZYz2kdw7j0oyT77RasKvVWTS5Ea+ejceC0wGlnKyp
	 1dkpy8pUgWkAKw/sk/zdhT22UIulKaiwYjAhL/OJbzXvVjef28SRQed5qMuRBT0QwB
	 zY15abIpxqAIs+2rAwPsDWbdYGwarE1pTdL/xSTJZS03qtTGsbrdlViEuqKBx/Jslt
	 CRfOuBcadf/fTHYxJz56MJPQWPpuhY4ldiDkvD9H6MNO4kF3E9lczOvjTmJDjtiStz
	 4SvPf1Zv7KBjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1487441F62;
	Fri,  6 Mar 2026 19:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7C75223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1E2061491
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mwF3ddRTBK1 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 912CD613FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912CD613FF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 912CD613FF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso89940105e9.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826790; x=1773431590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SPzdkOCjiKO5ofZSv7yPKJBszK+/G219MK2BXFb7eF8=;
 b=MzrPptg5TFIctsN/NhE/l8EQbQk5xG0jH2sGDG60IuDIT6+zInngtA8FdLqCy7XcSS
 ivAHjDuviDdPQYWqKCS7sShOcgrx9I6L2ncTRvfXrqJZrMvX30WoliECk3alfYv2PRuR
 /BVKGWnosMHXVus56C1HKjBdOpfC2FjYYl1LWA9Bdq76xFLGYep3jXfXYZ7RPHnetoiY
 pOlYNEehmQkGZG7s4RUKEC9XT8yvQlv8RiCqvPL/zMSv0+iKyWfgESqrBeXT6SvBkCkj
 KpNKxVo1cuYWVr9BP1BxYP4lXA2UWE9kCOIiz+YiYfl1bL+BwevZpQ7pNzweWk1F9QAs
 +8eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/6FQf/uxpjCdiceAn9NoxhTYt7ux9lWIYRWj3tWaHlNrDBQXTUE5ej3LN/PR3gLXz8aAycBI/3eA=@buildroot.org
X-Gm-Message-State: AOJu0YxF3PwAMnqzODvx+RzK8NZe31mmaStG2+A6zWbBYEsTYrjuz1/6
 2oMrN+nzkVX34UgS97xsDAlelq48OJo6LdkI4Mne5XKDFLuG29sElVtLcsE87bqH1BgtGvBc278
 H/zap
X-Gm-Gg: ATEYQzxqYYHPIyj1eFNnL0A5v9MvH1w2zedbW9khyXzIPdAKClcCBnpumDZizRyfAPt
 KW0t/gmTVDsH7u40QQGzovC5OHGr/jxDV3yU0R8M6vlTpL9jyxIT86jEzgmsUPS86kajC5aOZZ9
 VMlonBllWZkE0gul6gesSBDMZAHBu2/VNad0C/fAITeg3s2ypkmb8cELoZ478Cuhuc0v/orbkMs
 BZvfTsWuXeQuf+HhL/0pwxyVDbHLGPqQKWFUtdTA2S0OvlBROdOlPfJ8q9oXQjBsIbOxtGA9vzf
 qr6fLH45qThZr0D0OV4/pI/vjce74sNx09GFthnQnNUKv61r9MdCxH9PMvgkGI9/xW2SAn4YbfT
 noPjFnt0/enWjSQjykOaFRjTS8Uvp3Afku4UFo/JqYs6Cg0S6DWjuQBRlmLZFkkkmznCp5wXbxu
 ssMkNcN8oC4rlAJlA=
X-Received: by 2002:a05:600c:4fcc:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-48526964a1fmr53669445e9.24.1772826790389; 
 Fri, 06 Mar 2026 11:53:10 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852687c1ecsm43225465e9.1.2026.03.06.11.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:10 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:09 +0100
Message-ID: <20260306195309.7697-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227190752.2041167-1-bernd@kuhls.net>
References: <20260227190752.2041167-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826790; x=1773431590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPzdkOCjiKO5ofZSv7yPKJBszK+/G219MK2BXFb7eF8=;
 b=ILuGaUgrzJXncTQtDT9qdejj+DAEd/D9jVUWJkcByZ7tlaSLh7NnAWiCzQCQcyTdsp
 X7Qqdq5/Y3kuWZ84s4Dp3F9KlmSpI5CgPVQ0BZNYxy5KXFycYhanY4P6AfFd7+DlTs11
 iTzG7ag8KaPdc+uQtY0sipu1hWgyMeyj8sj0V1KTAjmy5h2oFphIOAy3DuO5fmy0vpYU
 B7i/MG8GIr87dnj7GK0E63od66yOTR74zXmkEbFGR5BDTJiFAMklCrAlcVOdVR8s874w
 bYXTUam3h3pDvYTy/D00wnYvcwJvQkWDxqqdFyR7uoj1vF9QUj26QvjgYnucHowBpU9B
 06ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ILuGaUgr
Subject: Re: [Buildroot] [PATCH/next 1/2] package/flashbench: fix download
 URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The original source is offline, switch to forked repo and use the same
> tree as before to only fix the download error.
> 
> Fixes:
> https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/flashbench/Config.in       | 2 +-
>  package/flashbench/flashbench.hash | 2 +-
>  package/flashbench/flashbench.mk   | 3 +--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
> index a50f482ac3..8f64275745 100644
> --- a/package/flashbench/Config.in
> +++ b/package/flashbench/Config.in
> @@ -7,4 +7,4 @@ config BR2_PACKAGE_FLASHBENCH
>  	  SD cards and other media for the Linaro flash memory
>  	  survey.
>  
> -	  https://git.linaro.org/people/arnd.bergmann/flashbench.git
> +	  https://github.com/bradfa/flashbench
> diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
> index 274d890f2d..8b087c2a10 100644
> --- a/package/flashbench/flashbench.hash
> +++ b/package/flashbench/flashbench.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
> +sha256  408a2642700b7f8daf4356a49948b921137ad15bb6e0fd05b1cb8dc700c154dc  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
> index f5791c3e95..28ce7f7dd1 100644
> --- a/package/flashbench/flashbench.mk
> +++ b/package/flashbench/flashbench.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
> -FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
> -FLASHBENCH_SITE_METHOD = git
> +FLASHBENCH_SITE = $(call github,bradfa,flashbench,$(FLASHBENCH_VERSION))
>  FLASHBENCH_LICENSE = GPL-2.0
>  FLASHBENCH_LICENSE_FILES = COPYING
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
