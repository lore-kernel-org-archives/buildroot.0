Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C533FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86AC360BAF;
	Mon, 14 Feb 2022 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJ1gSdWh3inX; Mon, 14 Feb 2022 21:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC45A60B78;
	Mon, 14 Feb 2022 21:17:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB7CF1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA42481992
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYT586vTKtyc for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:17:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD83D81496
 for <buildroot@busybox.net>; Mon, 14 Feb 2022 21:17:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u18so28959016edt.6
 for <buildroot@busybox.net>; Mon, 14 Feb 2022 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hkswc2LE1XjVSqp/gtZQLX9nKILQ3SofOZg3xslMk1s=;
 b=GegRs7O7JpKr08N4YCytof9rRVV6DFqq6IXWqIq06vHewWXco/jUpEGkrAWJuVfVOP
 XXqcpFeiGn7WbwkTXgHGzfWu8NDB3/sU0A9D2A1e147Srrsb5d+0bog703eEmghNNx4a
 ttFrmvfQdmE63l4rS8GiC+GI1cPBJg/+tmnKE3BR41Wx8vJupaUtRjajB30XcqsyS3RK
 Ez0Kt3Xs74kmVndhmLoqufSCowO9TuXJOB8TAWvR40VvQuOZ3GEhvmplYZEF8f4G5/4Q
 fqbs3oz8rgvrJbcdVUXV6Q3HcQMPvd5HmBE4KPpj04ONTictvDDjHbG7nbOXjix+L3dY
 NYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hkswc2LE1XjVSqp/gtZQLX9nKILQ3SofOZg3xslMk1s=;
 b=7sfHWlbyCx8up7dT9YBaUBUi8NZjzpGWLm6RLeYsoy3l6o9O1Z3RyVWSwsFo3mi9XT
 ETMMlLi/JCwnOI+e/mpqdMhYLL21pdFkHXopwU5Cga2UvHFp5akUWTOsYhS4Q8kYqh3T
 6j0+IGRu3wDNx5mrLQuMt8XCSLWjNfY+5hRkdExxdC1CRPgJo0ZK0f+zh4rBD2kd3nYF
 ase8L1RvpztU+kQvKjF1bhw/HUgm7DkDWYTPWuPskU93Qw/wKn+5stmj9L5FecBU5iOl
 2znJMNJJNwOorvhJMqGrGoVbz4cEUy0NcWdy5Df2oDeaTpMb6GSs2RhegRoo/f4jS9QX
 JGpA==
X-Gm-Message-State: AOAM530mniX7xhfWOTFfz1MYD0y17b8kMA5AEi6PR1NSUJIn1hOm3RDI
 HKiF6wSI2R3y1NXumRAh5lT8+13vkgWMjg==
X-Google-Smtp-Source: ABdhPJzeD1KHg2u7I54+V30qoAt3B6evuWKB+Jrkc8buOF8zkMF9gxE1NDgZWa1q15S0/GMFqUZRQA==
X-Received: by 2002:aa7:c253:: with SMTP id y19mr799590edo.150.1644873461891; 
 Mon, 14 Feb 2022 13:17:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y9sm15795093edj.108.2022.02.14.13.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:17:41 -0800 (PST)
Message-ID: <1fbce0dc-9ab5-cb94-bd17-29c18200f20b@mind.be>
Date: Mon, 14 Feb 2022 22:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220208121928.28519-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208121928.28519-1-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump version to
 1.4.0
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



On 08/02/2022 13:19, Guillaume W. Bres wrote:
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/liquid-dsp/liquid-dsp.hash | 4 ++--
>   package/liquid-dsp/liquid-dsp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
> index 31bcd68767..7e5de6b259 100644
> --- a/package/liquid-dsp/liquid-dsp.hash
> +++ b/package/liquid-dsp/liquid-dsp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 85093624ef9cb90ead64c836d2f42690197edace1a86257d6524c4e4dc870483  liquid-dsp-1.3.2.tar.gz
> -sha256 4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
> +sha256  66f38d509aa8f6207d2035bae5ee081a3d9df0f2cab516bc2118b5b1c6ce3333  liquid-dsp-1.4.0.tar.gz
> +sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index 9745893b7c..fcdf572532 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIQUID_DSP_VERSION = 1.3.2
> +LIQUID_DSP_VERSION = 1.4.0
>   LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
>   LIQUID_DSP_LICENSE = MIT
>   LIQUID_DSP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
