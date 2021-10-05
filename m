Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA5BC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CBB61211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07CBB61211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C8260D53;
	Tue,  5 Oct 2021 19:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ueWF87siQ_sJ; Tue,  5 Oct 2021 19:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D4760D4E;
	Tue,  5 Oct 2021 19:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9795F1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9217E407BE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2j_qpHQFWwH for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:34:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45C874024E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:34:18 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id f9so883014edx.4
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dsc/D4DjBfKWHXSiQjKlg0/x9sJlhft1nJkEOGmYGbU=;
 b=V/TXfPxS7XjP0dI46ObHkIEc7qfQ2YKV39CPYWn9OnlTeLX7mSBwQQfrYDXo4V+sL3
 rttE+QLHLC/FYo/IaVRJjAOsxovDKNiaAZv/CF7S9zQcefvXL6mKP2RugFTYXiSi8CMt
 97i4oX1ja6Su8Skeg9j0oELUP130viSm6EggHFrLi6oT8hn8vRfHSU0BHkgVWFydduCT
 4iLSHX5AdxS0EnV/yW2E2f0I0yDbbf21wzH+c+cf/l9ib11fMF+YGNkaKPA9xDOznW5C
 0hcMyX8UirJy2zYJff4WKmDBHSk9TIlUhEKOH2P+T2wzCf57bvlC0Aax5YlREeaqiNf0
 2oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Dsc/D4DjBfKWHXSiQjKlg0/x9sJlhft1nJkEOGmYGbU=;
 b=XgroaFcnoxgvULvj0aF0Gbh+dsJn4Fm2zkDXgL0q/pQpMMweufZGa99QWvNhOhquFC
 7bn7+Ua8KMR6NPVHMdTigZhUJ/5+O10+f5i6EzYODZsX5cbXx5iRf46S3GQrtSbxumQy
 YXbRZhFbhgHj1oLASxgozHco7uAnaphXuAylkakYUAA594MNdkt2VON7itRGbetf7Ft0
 MHXFq38YIUMqsVfM/N7oft9q21SSAJrNnLWpZeimcHT7TWiBh3cvyWOeKTSPzT1hQeqK
 efO1W6IBqL3n+l4oOzxxZuZ0oRjIUT2+3RNM2T1YytPYluVbvgJOAz81VIYINPRehvZT
 Wb8A==
X-Gm-Message-State: AOAM532yOZHC0IL369WsZmcKVYO6PHqMFB+Dp53FGgKUTnHBKvTUhNZ6
 cDFyxMdWl/qCj4Ylzq7hL+7Grw==
X-Google-Smtp-Source: ABdhPJyvuowc/wy9NngcqX/xX2ceKXo7PukIj+9LBms30aiv5Bmnr8vRW2krKCT3gTW/PTbXFaMXfQ==
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr26590516ejd.268.1633462456416; 
 Tue, 05 Oct 2021 12:34:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p21sm7971037ejm.88.2021.10.05.12.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:34:16 -0700 (PDT)
Message-ID: <370f0b46-ec59-50c6-cc03-29bbd91f3775@mind.be>
Date: Tue, 5 Oct 2021 21:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927163516.1472524-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927163516.1472524-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: fix musl build
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
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/09/2021 18:35, Fabrice Fontaine wrote:
> Fix the following build failure with musl raised since bump to version
> 1.18 in commit 1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a:
> 
> src/netconfig.c: In function 'netconfig_ipv6_to_string':
> src/netconfig.c:188:18: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
>    188 |  memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
>        |                  ^~~~~~~
>        |                  __in6_union
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2c4e6cf22e6fb5582470930241904878070f1144
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> 
> diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> new file mode 100644
> index 0000000000..f6b3d24516
> --- /dev/null
> +++ b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> @@ -0,0 +1,32 @@
> +From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
> +From: Andrew Zaborowski <andrew.zaborowski@intel.com>
> +Date: Thu, 16 Sep 2021 01:58:29 +0200
> +Subject: netconfig: Remove usage of in6_addr.__in6_u
> +
> +in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
> +the headers shipped with musl libc for example.  The POSIX compliant and
> +universal way of accessing it is in6_addr.s6_addr.
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/netconfig.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/netconfig.c b/src/netconfig.c
> +index ce95db0b..421270c9 100644
> +--- a/src/netconfig.c
> ++++ b/src/netconfig.c
> +@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
> + 	struct in6_addr in6_addr;
> + 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
> +
> +-	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
> ++	memcpy(in6_addr.s6_addr, addr, 16);
> +
> + 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
> + 						INET6_ADDRSTRLEN)))) {
> +--
> +cgit 1.2.3-1.el7
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
