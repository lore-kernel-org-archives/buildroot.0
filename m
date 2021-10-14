Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E616C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C75861041
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C75861041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DB1760755;
	Thu, 14 Oct 2021 21:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkRNh1d4F8ER; Thu, 14 Oct 2021 21:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF0F606FF;
	Thu, 14 Oct 2021 21:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB2F51BF9B9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA028606FF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3tGVnAD6gh7 for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:41:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D386A605DA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:41:35 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a25so29785383edx.8
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=wIjgrjvdMtumH7R8g2p4Iars1jgQ44kWggQ2kjUWFSs=;
 b=GWs595BN7uVOL9xEClI8kitY7KcY0K//N/aYBTO130S/Tsd+EoQqRbiuWSwQ2H9RD6
 /WyS9u0ApP69aN0bSK/24DyqyDmihwdIpxCD6fdqmHlZNP/48WTtXAkGKoz9n3dS0L+K
 umWjn0BNkT2tbMHvm/S/OUuLB5SMlFWbymlGyp21Zb1W+VQS7yM1eOejwg7ZwTRgvk+u
 1LKDNlqEiSN1ve3MMYSVbJPVXy8DxspZMiOwwuYyq5jRIB0R59TY59mpnVn84TbpHYEV
 xbYcmOf4Uuh2xxmv+In0wrUGGoywG1Lz3O+fY+8o0/yRqtjaaEBf+EtF0rCAJAC2KugO
 f85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wIjgrjvdMtumH7R8g2p4Iars1jgQ44kWggQ2kjUWFSs=;
 b=l2YoW4IqAay2gIZccK9FzmbKEyiWM8VW6+uBdmdcFqKhmHkjqOsgRg5xx3BhIL1q19
 CyJKpwukmlbXXLUoXVqrjRizGEq9A4N98Ri5LARltI4OgwSvWkPnwnNx5uVmql3tbbrv
 +jvogsCIbWg36+88EgiXTjS/2le9U1NXYGoibnz9PPm1WAH0eZsRERSqOK06q0publLV
 nBhUoNAvFYw52bX0pvArnk9udAnKBftREE1h/Rv60cYSkQLROz1gqA74OJbyNIUiCQ6Y
 p2ePk4oOMNrCp6/j69GPXZbJ1+/iTF/v1QVarSz4EXQjGzRdf4q0ISa88FT4FETCO0rt
 uA0Q==
X-Gm-Message-State: AOAM531IlF8CnBUIxi8ebrlCaxuUH4pv+qfz8HPF3Q8UARX28Bn9va5y
 tZ36P6rdFwwM9FHbbj0l/JT7D4MIdU7N6nsV
X-Google-Smtp-Source: ABdhPJzQ4PIe/2lX/D2rJVGr0va/BcXlh6FHjPfhfUhHt0UIjsl+goWIG0vauz+M/GXo/ZjbEWsvfw==
X-Received: by 2002:a17:907:6d87:: with SMTP id
 sb7mr1739298ejc.254.1634247694014; 
 Thu, 14 Oct 2021 14:41:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f12sm2180160ejl.5.2021.10.14.14.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:41:33 -0700 (PDT)
Message-ID: <2c2e59f5-0060-4bc5-810d-df04715b0b3e@mind.be>
Date: Thu, 14 Oct 2021 23:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20211010101510.128202-1-gilles.talis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211010101510.128202-1-gilles.talis@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/ncdu: bump to version 1.16
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



On 10/10/2021 12:15, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ncdu/ncdu.hash | 4 ++--
>   package/ncdu/ncdu.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
> index be2b6e0788..c2d367f15a 100644
> --- a/package/ncdu/ncdu.hash
> +++ b/package/ncdu/ncdu.hash
> @@ -1,5 +1,5 @@
>   # From https://dev.yorhel.nl/ncdu
> -sha256  b02ddc4dbf1db139cc6fbbe2f54a282770380f0ca5c17089855eab52a9ea3fb0  ncdu-1.15.1.tar.gz
> +sha256  2b915752a183fae014b5e5b1f0a135b4b408de7488c716e325217c2513980fd4  ncdu-1.16.tar.gz
>   
>   # computed locally
> -sha256  978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05  COPYING
> +sha256  e9ed7095eee84ad6804450495738277b539da0c0b2006f50faf8e6e67a0a15aa  COPYING
> diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
> index 532f145b20..59fa8deb25 100644
> --- a/package/ncdu/ncdu.mk
> +++ b/package/ncdu/ncdu.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NCDU_VERSION = 1.15.1
> +NCDU_VERSION = 1.16
>   NCDU_SITE = http://dev.yorhel.nl/download
>   
>   NCDU_DEPENDENCIES = ncurses
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
