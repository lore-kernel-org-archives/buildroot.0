Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749DFCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A654035D;
	Sun,  7 Apr 2024 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VjLwzhpfcaJ; Sun,  7 Apr 2024 19:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2938E4043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2938E4043A;
	Sun,  7 Apr 2024 19:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2E41BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E9B40209
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5VcmlTn6_pk for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:38:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4C9E400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C9E400B3
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4C9E400B3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:38:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4166ccac75cso2433665e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518702; x=1713123502;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eEb1ymZ9gVlzx1hO0qMftTuQ2Zu/7Z8UwdCH1EaYDrQ=;
 b=CZNybx8dqGhxq6ku1tK+J61Bg4MwO2jXHG09hBTFVqNpuVeWsdMaAnI0LvM70iVSoF
 Gk+pmKHH0rKrZgwZQQ9YKDw+XfA1Mu7ReitY3xZCU/WF8LjefccNHke8Jf5lQGR3YAjd
 /szzhWmWN7AQn703hkhxX4dB5UOiKCs+9eXyCmTk+c1N9xJliWuHYVjfQB6TAVV00Ot2
 q2Cda9GPXmKLz7Azlqn4JYxG95mej1s9lNdkSj9Ale39LvhGB9J+csU4LUnL5x6d8V19
 UWr2j5PiBxwXOLAt2Mg4aDNX1dx2oppB1y0fcgmTxjQ3aiPaEeMvlXSH3WA1OP4snHza
 2B8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXR5krfsKSXi5sjOBgbDD+I0RocWhrICMnJsj73lhMteQ/W+Th1qPCQrfCACgNNT3GpQFnlIF3jt7x69d5YQI3YPCA3f5oQQ==
X-Gm-Message-State: AOJu0YyKpMXpAr42plMozdhaDHLZhU+pfBCrXgVkcvoFZ7AqwuJ6Z7Ib
 5Y2P+UtYcp8EjBoGjb2xFHMmMxqTy4L/xjIQnR/QImHtTQ779fXk/XG14a7B3cc=
X-Google-Smtp-Source: AGHT+IES821/g9gQ6MFm/UlVS+Uy4lB2daxxcSr7U/OxF2oQtNnOUGIrCFvQ9Lx9KL8XHPSHtYv8nA==
X-Received: by 2002:a05:600c:5021:b0:416:5508:256e with SMTP id
 n33-20020a05600c502100b004165508256emr1681829wmr.22.1712518702210; 
 Sun, 07 Apr 2024 12:38:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b004156afd6843sm14279814wmq.18.2024.04.07.12.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:38:21 -0700 (PDT)
Message-ID: <722331c8-c6f8-47be-b6e4-85902aee8d84@mind.be>
Date: Sun, 7 Apr 2024 21:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407161339.2439456-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407161339.2439456-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518702; x=1713123502; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eEb1ymZ9gVlzx1hO0qMftTuQ2Zu/7Z8UwdCH1EaYDrQ=;
 b=GxHYHCHsZ0wJ8ug5Yht08QLutN++uJz0v773L8ka/32p3ZfofLGPNTQpt64KHXxN9V
 cQ9lilXwOMNJjTKiYbQ/f/333KHLkDUozBB3qGHVHENor7NZfddOT5GDLMcoquncZmOv
 7Ym+s/vEBbDwqInBVbk31f/oObCFzrPEBajlrfSJRSMVzdqA7D2JAvF0M/zqtgp731Fj
 bbwF4V7AqsPw8vMT+gbHZ1GnZGUH3LrUqkJ+nWA4a8v6rjTagTM/sAgFMac9LMCIU/ss
 6TwA23avVMxnngjbDnZkS7K3320LUGjJHbpggbGdH7nDPjv5oWHWYienKoszzDwPexgO
 6OPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GxHYHCHs
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: fix CLAMAV_LIBS
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 18:13, Fabrice Fontaine wrote:
> CLAMAV_LIBS is ignored since bump to version 1.0.1 and switch to

  It's actually the LIBS environment variable that was used.

  Applied to master, thanks.

  Regards,
  Arnout

> cmake build system in commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
> resulting in the following build failure:
> 
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: CMakeFiles/clamonacc.dir/inotif/hash.c.o: in function `onas_ht_add_hierarchy':
> hash.c:(.text+0xa84): undefined reference to `fts_open'
> 
> Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa
>   - http://autobuild.buildroot.org/results/fe71ab29d02caeed609f1a181fccbd46b6feff65
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/clamav/clamav.mk | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 7c6dfce6f2..c548897c37 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -45,9 +45,8 @@ CLAMAV_DEPENDENCIES += musl-fts
>   CLAMAV_LIBS += -lfts
>   endif
>   
> -CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
> -
>   CLAMAV_CONF_OPTS = \
> +	-DCMAKE_EXE_LINKER_FLAGS="$(CLAMAV_LIBS)" \
>   	-DCMAKE_SKIP_INSTALL_RPATH=ON \
>   	-DENABLE_JSON_SHARED=ON \
>   	-DENABLE_MAN_PAGES=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
