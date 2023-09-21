Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF79CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 07:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD14836E1;
	Thu, 21 Sep 2023 07:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD14836E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHkGzlXyR-Ap; Thu, 21 Sep 2023 07:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978B2836F6;
	Thu, 21 Sep 2023 07:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978B2836F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205251BF3CE
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05E454089A
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 07:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E454089A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JD6aFh9KsUsM for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 07:53:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 858C440898
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 07:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858C440898
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-503f39d3236so1198702e87.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 00:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695282807; x=1695887607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXk8MnE7wVW6WfAz3OouCC7zPWRwBK8/s7Jql4/N8zs=;
 b=cAVgM7eN0+xat87hi4VvokVIQ8ka5ipoHlAg2Hh+8Oyx+4QtsOpshKHXpYQDKO+46B
 uJ4Ou31NPAYQ4Iw9mz+qHXrOdJef4/+R649X/AkkmcPl2ipVxM/Gq00BCYvnumpHJMSj
 +N9O3FbHlgZomKyZgn5WqPXes0N0eUHsvtTssdc6d21X+ejGL0DOPyS5oKSe8TyXUsO1
 O/Wr07sgTSVd9bFvmPV4HuEY4PBE8WR3LSnrBphDRUJHxEAyjE2xJo2afKDI9yo3XVph
 6F/vxnf+Gmkd0bdnrWEf0NCaWwXEGplzg36gELvUwFdlWPlmip7oy+vWP35Iitcrtdq3
 pN4g==
X-Gm-Message-State: AOJu0YwSgeQO87GeyXT4eLPU/GheEXdH10tgcdUtTMUZoXq7a96xWts7
 8c205v/0mewOan3p4h3b02KrON7VBfrhK8DT
X-Google-Smtp-Source: AGHT+IEDhABpfNfQXnA5ZrQDQfwBUybF+luOizN8zQhjo+c0keRPiWUUPGq6+7iOTs4f2/Fda2fxxA==
X-Received: by 2002:a05:6512:3b9c:b0:503:3700:7ec3 with SMTP id
 g28-20020a0565123b9c00b0050337007ec3mr4757080lfv.39.1695282806989; 
 Thu, 21 Sep 2023 00:53:26 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 r7-20020a19ac47000000b004fb7359ab83sm187389lfc.80.2023.09.21.00.53.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 00:53:26 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-50309daf971so1161262e87.3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 00:53:26 -0700 (PDT)
X-Received: by 2002:a05:6512:32b8:b0:502:adbc:9b75 with SMTP id
 q24-20020a05651232b800b00502adbc9b75mr3577623lfe.51.1695282806197; Thu, 21
 Sep 2023 00:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230919172300.9901-1-brandon.maier@collins.com>
In-Reply-To: <20230919172300.9901-1-brandon.maier@collins.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 21 Sep 2023 09:53:15 +0200
X-Gmail-Original-Message-ID: <CACXRmJhRUpwfL0TdgTzW2YW+uhr+0DtsMYxuQbZVU2=niLP3QA@mail.gmail.com>
Message-ID: <CACXRmJhRUpwfL0TdgTzW2YW+uhr+0DtsMYxuQbZVU2=niLP3QA@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
Subject: Re: [Buildroot] [PATCH 1/2] unifdef: add missing license
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
> applies to "manual page unifdef.1 and the portability support code in
> the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.
>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/unifdef/unifdef.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
> index 7d10595d1b..fd74455894 100644
> --- a/package/unifdef/unifdef.mk
> +++ b/package/unifdef/unifdef.mk
> @@ -6,7 +6,7 @@
>
>  UNIFDEF_VERSION = 2.12
>  UNIFDEF_SITE = https://dotat.at/prog/unifdef
> -UNIFDEF_LICENSE = BSD-2-Clause
> +UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
>  UNIFDEF_LICENSE_FILES = COPYING
>
>  define HOST_UNIFDEF_BUILD_CMDS
> --
> 2.41.0
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
