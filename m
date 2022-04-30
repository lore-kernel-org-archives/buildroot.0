Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DAFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D06C883459;
	Sat, 30 Apr 2022 18:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrRL_43YLH_y; Sat, 30 Apr 2022 18:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D640181B70;
	Sat, 30 Apr 2022 18:53:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7092C1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D15D4034B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIVQnlKW1WjA for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5233B4032A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:53:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so21064508ejb.8
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xFL5R84PocnkhpoZCaUO9m+CgbuuG3omzOgbPv79ibU=;
 b=bD9jZ0qwuuXbryXxfk7rJXFWvcIMsqTQo2XRa8uSNuwP2bbbmmTYIy1Gqfd2pQW8h8
 8h+2QY1VXZ6Cq6MQMOJ7L6TmasYixo8w7O4YwiD/1cL0d7iznnfjBcjKuO0fR5UleIgK
 KAVybFzH7PX8nS418uakELmXrNpSCG4IFjaE36dmV6ESWh7r8n5vZI/5ceX1jYV+9vn2
 y+j88CNNKRccBrW4XW7Daho0AIDy399LIvPD1o7wYbD3+5tO2ANaGyjAG7WmbxmUxV18
 UvGotyBlQmS7eurF2akqH0DWd3Dwb2DZM+WnPQp//JGSp8vdDPebeRjsX9D7O3GfQzcz
 CdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xFL5R84PocnkhpoZCaUO9m+CgbuuG3omzOgbPv79ibU=;
 b=4mEc4VMzSZDQx7f1fkuvJbL7RQhHG85bqZJ5uvqkmhRD40/XYFlC4ra+0/uZZSlF00
 vr74Qe9WMiEQcFf/ZsNV1aks6GeH62EP9V/njd/TtiQSLadzSZdlIittMv84J90Icd/5
 ctGS3FZAKljuTDiHBbSI2akFm9QQs+Phk+0JR6qFAf5Zb3qK+jhTXtxxl4MrDcJZKr/0
 2jpg7u+xjgAsLwsB4pNPBoKh33bTOTr5y8lZ+tGjp8n2EFaQKXzpHjufpnnaRebssnrI
 U4HNkYWHTGWYirnIyZ/N6pGzDRLeUR031tiBtFd4G7gvOTJ3524Cz2WaPRuOWih6W2yN
 FnKA==
X-Gm-Message-State: AOAM5303Rr1+miuT98xIERyZcCj8pckL8auT60lLgcEqf7btJ1lszSPs
 BIA6cUQpyM8zYArsiSHMC3nASWj4CywEpQ==
X-Google-Smtp-Source: ABdhPJwSCqbSyBesNDjvLoLLrDXgI5vmSZQDZRcd15DjLcNQLYDmZo7T22L0be/9HzzVAZes9GFLcA==
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr4892234ejc.435.1651344816493; 
 Sat, 30 Apr 2022 11:53:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906845000b006f3ef214dc7sm1818245ejy.45.2022.04.30.11.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:53:36 -0700 (PDT)
Message-ID: <de4fc480-0d65-d12c-9ccc-1dd2a63baead@mind.be>
Date: Sat, 30 Apr 2022 20:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220430113548.461720-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430113548.461720-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.6.1
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



On 30/04/2022 13:35, Maxim Kochetkov wrote:
> Release notes: https://github.com/timescale/timescaledb/releases/tag/2.6.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/timescaledb/timescaledb.hash | 2 +-
>   package/timescaledb/timescaledb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
> index 556cdaf329..f186684339 100644
> --- a/package/timescaledb/timescaledb.hash
> +++ b/package/timescaledb/timescaledb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  b1a20832189c22ce378f009f9a24ef1db61d7131f7f79bde74fdcde87bcf2d7c  timescaledb-2.5.2.tar.gz
> +sha256  226af207105cc9e2d1744b303e475204a947047103f0e5697de4e8949e4dde75  timescaledb-2.6.1.tar.gz
>   sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> index 1d8b2a69a7..16fba11e21 100644
> --- a/package/timescaledb/timescaledb.mk
> +++ b/package/timescaledb/timescaledb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TIMESCALEDB_VERSION = 2.5.2
> +TIMESCALEDB_VERSION = 2.6.1
>   TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
>   TIMESCALEDB_LICENSE = Apache-2.0
>   TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
