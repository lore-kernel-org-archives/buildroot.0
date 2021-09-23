Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68886C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:05:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C2E61107
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2C2E61107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FEE80F75;
	Thu, 23 Sep 2021 20:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5a2xWcKtdnva; Thu, 23 Sep 2021 20:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCCC840BA;
	Thu, 23 Sep 2021 20:05:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72D431BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F2CE840BA
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujyfAEYBd8Th for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:05:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AF4080F75
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:05:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v22so26471392edd.11
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QS2lxSGXWyQtst1LGUSWi/wxgLcngHxmp88J4Dj0+wc=;
 b=CpKAKEWjdBO7UEAH/ZuCACB/wNjIgUgTIbqAstMjx9ovNpEoGGCwUw4KVo9BrV/JqE
 KE9wK4Gnr+IjDYRBLGFx5B+fkCTNLioYAe0ImhTTwZy508x9Yic7rbbVoyVLGGwnZTOr
 ArBNFrq9LUfYOY+yM13KKhNDFJOpCtHRYzt6lIdv+0SCGyhhvGO0UWm7wO5NiIYxjcEy
 sIpnuCJJgl2mXKnbqZh0UCtGsi7W7Bg0HKvRcapI5WbKA8TTzirQDkGK0eLl3KlhrL6B
 fjg2dz5yrKdugCChHS4EA4TNtTAtaHDCJKWA2fZuZjx5VtAD3hu5w9AI3Za1e06WOm8T
 NGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QS2lxSGXWyQtst1LGUSWi/wxgLcngHxmp88J4Dj0+wc=;
 b=nvOWCXxmuIxrzBgLOeXPaEox34LwYT1V4N74JO/ryJfkGKepTNS0AgD9gksCxQ8HP9
 KP4Veta7LD9njIhE95ur3m8ujLFhkZmUc6GPALevPW9bjmTI3mRC5TsosQLHIEfu5jLq
 qEA/jtegbsRX2g0/FCf4V9nDMaQHDGW88Bzu9sChJ0r1Zp73coJgPG3tFSQoeuj4ctfo
 B66WEie94e2DS5br9Q4FjpRk5cBJ6+ZWuYSBhfRSkdQs9SRAH5+5zPYNlBGTvrPg1Tg1
 6iuw1dB53JcIiaPBY8CMNI5asHO4pvqcjrPI1dhqa8lNM69fI8M57nBaKYmvUBO6PaXd
 jlRA==
X-Gm-Message-State: AOAM53187rwCbwgxbWhdTpcmAUNKTsj7P4ACiSWZC5DuxHL11xQUrs0a
 BF9dlXq800Nqb7dN4J08Gehn/w==
X-Google-Smtp-Source: ABdhPJw9mwnV13qPNtMkT88eyd3KCe1k/W1TL0KsCWKi6LR/x0XE/6mL9iuJTveNtF26RAkpTROAbg==
X-Received: by 2002:a17:906:30d6:: with SMTP id
 b22mr7378100ejb.442.1632427509930; 
 Thu, 23 Sep 2021 13:05:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j2sm4240862edt.0.2021.09.23.13.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 13:05:09 -0700 (PDT)
Message-ID: <9d059656-1d10-51e7-c337-34322fe3f3cd@mind.be>
Date: Thu, 23 Sep 2021 22:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210919121140.2323338-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919121140.2323338-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstd: needs gst-debug
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 14:11, Fabrice Fontaine wrote:
> gstd needs gst-debug since its addition in commit
> 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/10.2.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: gstd/libgstd-core.so.0.13.0.p/gstd_pipeline.c.o: in function `gstd_pipeline_get_property':
> gstd_pipeline.c:(.text+0x5d8): undefined reference to `gst_debug_bin_to_dot_data'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2f4de1b229df47d9bfd5a2576fd59da2ad45aeb6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gstd/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
> index 14cda7c45f..f36d25f11f 100644
> --- a/package/gstreamer1/gstd/Config.in
> +++ b/package/gstreamer1/gstd/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GSTD
>   	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
>   	depends on BR2_USE_MMU # libdaemon, libglib2
> +	select BR2_PACKAGE_GSTREAMER1_GST_DEBUG # gst_debug_bin_to_dot_data
>   	select BR2_PACKAGE_JANSSON
>   	select BR2_PACKAGE_JSON_GLIB
>   	select BR2_PACKAGE_LIBDAEMON
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
