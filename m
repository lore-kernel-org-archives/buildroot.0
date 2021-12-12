Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B2A0404FD;
	Sun, 12 Dec 2021 15:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dREvgiV7G4Uh; Sun, 12 Dec 2021 15:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917E5401B9;
	Sun, 12 Dec 2021 15:13:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2A5D1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D227A80AA5
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbgi3jk0lhPy for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:13:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F32AA85453
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:13:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id e3so45232890edu.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qPVxyOcxTWzvcYzEWdX7RuUYqgPRlPKK2N4SJ1wqhic=;
 b=cr6xukvxEN3YHIu80OiM35VMZ02V0d5bfcMxmMQKZ0ka8vFaBaPjMhE9KAn/QdLha/
 xj5Jrcx85JmCFtIEIcuOykSWiTVXICHszuJwSmKKpk+9AYReIjGh1gq/ty5Ec5fVT5WP
 uvCYox0MmC7RBpAEPjLNXUMCudeVIr76dbRibuyGFFsG/+r5Q2aV6TbyDOyN/wJ7c9EG
 IDplMdGj7hM77mJUA/ToAzI+S+ONxv1+6N9IQCHPD74DQ2MqZEbpv/ZXjYAEM9CmFyXb
 olgYy+CAB66dX468Y1+WZKpJ+4FVwJTXg4nsXFF31hu+8YKfqgdZGOrRA+ROG8XwvYIM
 oGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qPVxyOcxTWzvcYzEWdX7RuUYqgPRlPKK2N4SJ1wqhic=;
 b=aS9pUFlCnQRDdFuUe5bYz8taMyhe9n/t+rTMe2pjSVB0pQUzo1J38m6p7IirmL+W91
 eE2gkSbIegfL4PPyUvzzsNozOk3NvqpFBRUG0ZpY74BpZh9ivn8aerp/F9ZPtZKL4yb9
 pz8I6bNojZAl4Qs5XUyaW+woTHrym/uPCb8r8KDTeMGYKfLHL24Fa6XWxDdiQ4FxJqrw
 bvMXJ1okJ9Cdz0n3CMBjEweyw2Bj20sZo0vL4WhvlRj71XBnS9uv1umSl4V+PMEV64fM
 DrRZGc4/IE+jef4ztUR8f+1cinPrtPF/Kx98qJs5w39WRevKMbH+GptVg36E39ULJH0C
 4zTg==
X-Gm-Message-State: AOAM533TUpbC73F7U20DD68KnZTSj+qDnqgGTmIIcCmOFxZRyldUubd3
 Szb3QN0x9UgPHbPaNv4jYTQtvB9SX1+BLQ==
X-Google-Smtp-Source: ABdhPJzTolwjACJAB38r161XOmLB3J2whwfH8zZM+Ttdbnh1OtOZ/PcXqnhxLsNDwjntMm1F17dUyQ==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr36863043ejc.374.1639322010256; 
 Sun, 12 Dec 2021 07:13:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id aq6sm4570368ejc.41.2021.12.12.07.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:13:29 -0800 (PST)
Message-ID: <d8c8ae3e-8cc2-b67a-f7b4-fcf3a267fd23@mind.be>
Date: Sun, 12 Dec 2021 16:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211212090552.389346-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212090552.389346-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 10:05, Bernd Kuhls wrote:
> Changelog:
> https://git.linuxtv.org/dtv-scan-tables.git/log/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
>   package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
> index a57409978f..8d4290fc53 100644
> --- a/package/dtv-scan-tables/dtv-scan-tables.hash
> +++ b/package/dtv-scan-tables/dtv-scan-tables.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  fc65b1f85195ab3d877f7ce802dc62b8c70b3a1815fa6e6a69de19a9d354c19a  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654-br1.tar.gz
> +sha256  186a6fe1755d83d583590de3f83013c2e4df47b258c88180dffd1afb0d36d4d6  dtv-scan-tables-25ee9e0ce4bbacdb278d4cff306ceb6528c4f548-br1.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
>   sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
> diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
> index 5fad615b6b..4150abd1a0 100644
> --- a/package/dtv-scan-tables/dtv-scan-tables.mk
> +++ b/package/dtv-scan-tables/dtv-scan-tables.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DTV_SCAN_TABLES_VERSION = 6d019038cd04e837d9dd58701202c15924c1c654
> +DTV_SCAN_TABLES_VERSION = 25ee9e0ce4bbacdb278d4cff306ceb6528c4f548
>   DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
>   DTV_SCAN_TABLES_SITE_METHOD = git
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
