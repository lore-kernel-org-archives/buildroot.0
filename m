Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4DCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BBE6109E
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6BBE6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9112D83112;
	Wed, 13 Oct 2021 18:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4sPmfByNPwN; Wed, 13 Oct 2021 18:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA1D83077;
	Wed, 13 Oct 2021 18:12:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C26D31BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA5440822
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5QYhWb3Bl5D for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:12:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4FB74082B
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:12:05 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w14so13665890edv.11
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/K6c1ghSSqOx2AK5p+1GGpq+n573F17NDe3Ef+V3s+Q=;
 b=HCM2+/S0UnxiXVVYlXsjAjGZ+BN6uOSC81p1nJsJeOReG5wT7tn1KhCHTZ+BTv25Ou
 QEfwSvEUjJw/Qjyw0vxWWvDn4L2DbRE++rGy+XLm3b9sathjyiiGfy1MLQ7T/rBOXI/O
 +HNb7Pl+lEKw7rARTYd7vtMrPfXBQaT/mZHK3jXADLItvHw5AU+qyct/DqMojchy7tz1
 kuPqYP+3eg1AxPk9/I7d89uRJQR1TzHkTzQ+4HZ6IYNdkwzXuNHwIZK2SIODgpM2fYe3
 gFSaJvOGLjO66R6sE8m5nyU4DsMnkdJ9V7m1rO4EH6c8cNju//oEM3BO6dr9ixx95fNJ
 kwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/K6c1ghSSqOx2AK5p+1GGpq+n573F17NDe3Ef+V3s+Q=;
 b=t6f32OR/jD+kwqdoci/6K1JKZ9Pkx94qLyQBO0Pv6MTv6BDy0zZprCMOb0J30+T1oM
 jvZhh4uiF/d7zeEwZBHrkllVZ7b/JEEIF85pnQKpLI46Ly3SXygkll94FYoojU7wcRPe
 5K7pvI16Pvie9fQQ9ojwM73JPb07KHC5DUan1nDCXPxCdsL9J/qMDJfjsT9Hp4GKrXAP
 9eaL2LJI7leK109s+8W/KA5XI/HWDl5GmwabBKRVCSa1QtzzAyQz3ENXmFdPKo52FsZo
 lfmEp/m/bQcNQ95C8TNqcRebmAOcIHfOw4sXo8utJt9HciaXyzSq9MmKatY/iv+8cYvY
 dPtg==
X-Gm-Message-State: AOAM533UtnB7NoIlzyP3fWbOqLFL+Q7uD23UC/j2PHHXDUPbo79XOU4x
 nJINIkZQElPmqcSBT6CfsKPUCg==
X-Google-Smtp-Source: ABdhPJxKXT3BWrSTy4Q1xVvIBxrNA86JwfPpNJ2XQJbJDUAxRcXVfLpzWnK/ByXD+A+AU8dWrhMuig==
X-Received: by 2002:a17:907:3f15:: with SMTP id
 hq21mr885806ejc.440.1634148723860; 
 Wed, 13 Oct 2021 11:12:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r3sm231270edo.59.2021.10.13.11.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:12:03 -0700 (PDT)
Message-ID: <c0d7bd32-5333-ca5c-ffb5-b2385c4506b2@mind.be>
Date: Wed, 13 Oct 2021 20:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Herve Codina <herve.codina@bootlin.com>, buildroot@buildroot.org
References: <20211004124316.355770-1-herve.codina@bootlin.com>
 <20211004124316.355770-4-herve.codina@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004124316.355770-4-herve.codina@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/collectd: add dbi support
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2021 14:43, Herve Codina wrote:
> The DBI plugin uses libdbi, a database abstraction library,
> to execute SQL statements on a database and read back the
> result.
> 
> https://collectd.org/wiki/index.php/Plugin:DBI
> 
> Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/collectd/Config.in   | 7 +++++++
>   package/collectd/collectd.mk | 4 +++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 82c24fdbc3..d44d4e4913 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -212,6 +212,13 @@ config BR2_PACKAGE_COLLECTD_CURL_XML
>   	help
>   	  Reads files using libcurl and parses it as XML.
>   
> +config BR2_PACKAGE_COLLECTD_DBI
> +	bool "dbi"
> +	select BR2_PACKAGE_LIBDBI
> +	help
> +	  Executes SQL statements on various databases and
> +	  interprets the returned data.
> +
>   config BR2_PACKAGE_COLLECTD_DF
>   	bool "df"
>   	help
> diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> index 9bfbc784ab..d01058471d 100644
> --- a/package/collectd/collectd.mk
> +++ b/package/collectd/collectd.mk
> @@ -17,7 +17,7 @@ COLLECTD_SELINUX_MODULES = apache collectd
>   
>   # These require unmet dependencies, are fringe, pointless or deprecated
>   COLLECTD_PLUGINS_DISABLE = \
> -	apple_sensors aquaero ascent barometer dbi dpdkstat email \
> +	apple_sensors aquaero ascent barometer dpdkstat email \
>   	gmond hddtemp intel_rdt ipmi java lpar \
>   	madwifi mbmon mic multimeter netapp notify_desktop numa \
>   	oracle perl pf pinba powerdns python routeros \
> @@ -67,6 +67,7 @@ COLLECTD_CONF_OPTS += \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL),--enable-curl,--disable-curl) \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),--enable-curl_json,--disable-curl_json) \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),--enable-curl_xml,--disable-curl_xml) \
> +	$(if $(BR2_PACKAGE_COLLECTD_DBI),--enable-dbi,--disable-dbi) \
>   	$(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
>   	$(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
>   	$(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
> @@ -168,6 +169,7 @@ COLLECTD_DEPENDENCIES = \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
>   	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
> +	$(if $(BR2_PACKAGE_COLLECTD_DBI),libdbi) \
>   	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
>   	$(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),jansson) \
>   	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
