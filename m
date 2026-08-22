Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD32C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 974D740931;
	Sat, 22 Aug 2026 12:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pz5QODvL-emm; Sat, 22 Aug 2026 12:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402511;
	bh=34ogobUBGEF1ObEcW7HhjJyDCNP+EYWPDYFpbTviPbc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=syTYg+raI9xLJhnt12eePHHfs6KAIqXP+0P6x/KDJXD4rJJeLRcf/GWTTVToSi8KD
	 yw2KfpyebfNBFi8t9dgFwZRkGvN9uVhXpPhF+FrOnJWV2xKaLHKovJWIw6x/3eQXZd
	 hr8pTAPa8CJfKAn4HLWl/2cKlnihWKPY90+bG3yo5Wef8qMXLIDRLg6LWT3fWA+yxp
	 PoEXtzAK4Dg8Gc1X6quJSM+az8EhcPOaiI0NWrxQd6LpydmznoHqwrLPIwvuwtg1RB
	 rAeMRJ/mNQ1UokQxsaMC8isn4bCKYIdX6a1izKHxXyMV6c5vZIrq3cdd/3nlzxwSBW
	 7A/JZ8DQiPajg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CA640902;
	Sat, 22 Aug 2026 12:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CAE118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7340F80EFC
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbMPxWd3G_cE for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB4980ED7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:41:49 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c15d47266baso224013566b.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402507; x=1788007307;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=31nS4VWShQIj2ziOpz/hDm3NAPKNGVQ8F2h9/KhDbyU=;
 b=IGCWiWcn198fl6MKbX2weokXnHtM6esd9MDMW5Xz3yR/jrQzyFSd7+FrDMMrbp9P+w
 b8xtc/PnXKPD63VtQ3wN4PwhSoWPqVnMendU1aRHLJfIhYzzg57MN1BBdiX/nN8CbMgW
 Zq5qF6Gh1PCG539iE6ma31V8a0CZ06L1LKQokuEFf8a8vMY++AzvAZ+wQLyZS8/pMGWG
 4RjLFWwcEvkcsPZIXbRWlJTnPmuSm7/fXPrS+tbCSwoTDctFg0WNpPnB1w1O5NEeXRyJ
 WPjXzs1BsJvzXuJe0nCDAClGjEgS9hzP77AJbsRh8VQIfyYTeHjjnMODKPgXT3xORxDg
 s10Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RowyEXEh+SOxaA0GPhL00V+RVOC3hfNf4PFGYrKc1R0SMdnnprB5k7PK2OzbuRowmRKYQcIG/LkAAQ=@buildroot.org
X-Gm-Message-State: AFuF++kk9/dhPMQQqGNVPxrECZJx3a2gcWw/kafqQ5gpVNgIkjEAQrb0
 BASgY4kL0iHhtZUPw/VHyA39ZNmxc4q4hXPE4d0Ntg4LMqxwrfDc8ZyJT29iL7jbQ3U=
X-Gm-Gg: AR+sD13Eum6a9s+7g2zre0H+EioBgjy5jsCnEx6syL4Gt+PnxQEw1z6Xcsbjn8vqE72
 l6iCGQGK0q8i9qMivnPgd0HQHZkPDfu/UGeqAVRFH/tLR1QJs3UUcbZt1pOUwMM1XxTxPsBoa2F
 /Y/6G4qsJk58cBkFuk3eV+11hZgkiMjQX7MniUIatF4m32hgEiz+FGB0/rdIQVqp6ztMI+HLkjE
 iyKXQnRs1eX8+OVBXGgutGBLhqNt2hNmDq6N6ddmBVLxLjLAUeEo2HfKlEnI7LAY3hoKX2DCoed
 DrKJ4aNp2c5lh3oqRP+JMtEZfPPuY5MhN1HNAhRvCkbdN/cGSXlGzV25WYhSsGAWR94AEP6e+c4
 vI98J9xnpwUlbHuGdKPuEG2v/D02SZpqYgl3QPfHaT9Kpf649LJanIsBVqpENbd/GD/3b1PuvzM
 AS+8AhT14ODpEPAGPK5fObCzGjB0bh6ZawSz1RgPoXWzC+JhgM4bDEzuPLvZJ9zhy+3t45vVE0U
 7fbaztRAaJE8CaLdxGASDyDbwug1MuVnym38OmSZwHn5xXu
X-Received: by 2002:a17:907:3cc6:b0:c17:cf99:6154 with SMTP id
 a640c23a62f3a-c246a6176b4mr1432117166b.16.1787402507220; 
 Sat, 22 Aug 2026 05:41:47 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968d5f59sm272541166b.63.2026.08.22.05.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:41:46 -0700 (PDT)
Message-ID: <a0709e52-e943-4997-95a7-debf06f294b4@mind.be>
Date: Sat, 22 Aug 2026 14:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>
References: <20260701230410.2522114-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260701230410.2522114-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/apache: use "Debian" filesystem
 layout to fix read-only rootfs
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/07/26 01:04, Fiona Klute via buildroot wrote:
> The previous configuration placed both logs and PID file in /var/logs,
> which is not writable with a read-only rootfs (e.g. squashfs), as well
> as non-standard. Starting HTTPD during boot failed with:
>
> (30)Read-only file system: AH00091: httpd: could not open error log file /var/logs/error_log.
> AH00015: Unable to open logs
>
> An additional issue was that the Buildroot-default --prefix=/usr
> override meant various Apache-internal directories (e.g. htdocs) were
> placed directly in /usr. Note that the upstream default prefix is
> /usr/local/apache2, not /usr/local.
>
> Using the "Debian" layout provides a standard-compatible layout with
> logs in /var/log/apache2 and PID file in /var/run/apache2 (both in
> tmpfs with the default Buildroot fstab). Both directories need to
> exist when the server starts, so handle that in the init script.
>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
