Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B6FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E22C40004;
	Mon, 10 Jan 2022 07:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOWJAS1sU6SP; Mon, 10 Jan 2022 07:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BEF3400BF;
	Mon, 10 Jan 2022 07:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6481BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A0EA8270B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsgORDsMs4wR for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D8E82864
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:21:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e9so23401613wra.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=F2q8Ji91efPM8PmOiCu/6svcT5A4TII9NioPxfMA+uc=;
 b=GQaZ7MIJHh5Gf01BoATUEpMTgvXDUafha8kOwAJzdECmNHq7X2S2G9X6LHlqyAEHqS
 9lQEStrBwzKJ6HZof4s0owdgWJjO4sPgSEaTZD0aVV+cPqRs5uVQmMY9JnXg9p4STSIT
 Slcr1kCEx8rxxZg3bQ6Fdbvv3xcY7v6qnejPN73vA/akZlO6QpNuXnvcrGYLvru872K/
 3w9Po9WnT6JyfMgH5fY+35vkwn12Jx75X6zR6grXtNdw98GWmd6ROzHOsrqAsz5wTIVI
 jUPc7+Jj4wdZDeCqD6XLQHQOLClIOOwB+mf036CL3PlwYe3awo+7z5fFKfzVXqYsImI3
 74mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F2q8Ji91efPM8PmOiCu/6svcT5A4TII9NioPxfMA+uc=;
 b=CPq5x4BSfZ8JMxf+EcC7zYCHqgc65X7HzRzTNwDDTr/TbgIEJkiX70PcZ3cmIR59Nz
 0r2laZCuyvhVvsP/YLVQw9z/kqUysLhaF+imNpxQI3pYw/50OtnPO9/gFF1H7uMjszea
 NCzS5zl7Lyj2EfzRsHG81/CEMZp3z3jcG6AZnvHqZaM1V1DaqfK9TsYp9Uon4iUanqjx
 3L6XAt9KYUpMsx5dbUWxNVG39c9/Wd8dkFkHMMVMZ3oGn7j7xCNk3BJGFG2onGJDKQGC
 DOOIhl0loFQzff2DR08abrsEBCAqG8tFeJQ/Aq0bukg6+1hS4V9jNlLYhcJWsof6AJ0a
 R1SQ==
X-Gm-Message-State: AOAM530lnPRiiEC83OAhckfx3dLHmHDo5uz9Ph79Op8+PzYLQ+AKl66Q
 I/byVrHF08mA5HrSHVhRb6/QSA==
X-Google-Smtp-Source: ABdhPJzHD2ecJV8aKau3JiO1zXygR+VlpmWiksPS9EWXQ//+3zWOfDP/wdgAPw95Iy+sgflbtyIlwg==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr64675500wry.150.1641799260401; 
 Sun, 09 Jan 2022 23:21:00 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g12sm6408833wrd.71.2022.01.09.23.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:21:00 -0800 (PST)
Message-ID: <47d73898-1b4a-322d-a2e5-432d00eb1f91@mind.be>
Date: Mon, 10 Jan 2022 08:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220109223135.1409181-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109223135.1409181-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: needs threads
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



On 09/01/2022 23:31, Fabrice Fontaine wrote:
> squid needs threads and
> https://github.com/squid-cache/squid/commit/7dba4ac446341548a0b101489785f2cef9a33caa
> to avoid the following build failure raised since
> bump to version 5.3 in commit efc07b7a1818787229ddb335ca26ff2cf03820ae:
> 
> ntlm_fake_auth.cc: In function 'int main(int, char**)':
> ntlm_fake_auth.cc:187:18: error: 'std::this_thread' has not been declared
>    187 |             std::this_thread::sleep_for(std::chrono::milliseconds(response_delay));
>        |                  ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2aabc8375d41ad4d047d20ff8ee4fe1c978e7ee1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/squid/Config.in | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/squid/Config.in b/package/squid/Config.in
> index 0df2aedef6..6272140768 100644
> --- a/package/squid/Config.in
> +++ b/package/squid/Config.in
> @@ -1,13 +1,16 @@
> -comment "squid needs a toolchain w/ C++, gcc >= 4.8 not affected by bug 64735"
> +comment "squid needs a toolchain w/ C++, threads, gcc >= 4.8 not affected by bug 64735"
>   	depends on BR2_USE_MMU
>   	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
> -		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   
>   config BR2_PACKAGE_SQUID
>   	bool "squid"
>   	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>   	# needs fork()
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
