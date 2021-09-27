Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002D0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9228960FC2
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9228960FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5D240664;
	Mon, 27 Sep 2021 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGPSyk59C2Hg; Mon, 27 Sep 2021 14:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC98A40634;
	Mon, 27 Sep 2021 14:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 963651BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865B88176D
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXJh_8MTM5D3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94DA0814B6
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:36:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dj4so70390347edb.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3NIvJhVY7ngk5piKnH7bTTI2NQFc0AYes47FjnDpo4k=;
 b=ZgnhLYIfYqwG017Du5LxEScZ0APGWRxmlg0zRqe5cNJ7Fukjrch1ZUjUoiIZHa1m5+
 dlkOQrXBLXFIz2YSc7u4USR1nz3T3CDKp1c+sbq2E5Byl5YnPN256BzWm9GDw/8efzIb
 ULSUlFXjIBxEhW3tP2k8xVj0647L5WG3JeZe34l4SZ5XSiWmfsr6exLcA47YxgjG9Yss
 O9rZTM9Aj9IXFL1V2Lz//fl9+59CYRO4/E6SYb/0/pP02UOl79fBel16R5pLoLLKA/0g
 a+mxgz36n1h6lLZh0Yqiieb2OcQCOHWQK3ABQIOfJD3GCxbze+Gq/zmwbvaSnpUD8ckT
 iHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3NIvJhVY7ngk5piKnH7bTTI2NQFc0AYes47FjnDpo4k=;
 b=SwceO7RIHlvSV5UHd47acvrBEQIZWHRt12o5LV8oTq9DHAJNAjjp84aRkL/saPNUrq
 4fvsdrLtofOFRSxj+gqGYpOICUUSRkd6RaE6/YdAu/UG+sFJ//KmKTwzoh07dnIvxz55
 j/5CFMSmbEVqpF1br4ERfzmm5FfT9rjahjv0NurizJRbfe7EupUGJjkS8v6WGkEEHPkY
 AloqMfG/AavvRuH4CjwoSEc9J5DIpZPiClNMxqUOuvhmrd3p/IjTIbsKPlObuOnjzO5p
 qxVwvSFzH1ZAC3wv+TRPVD3lJZpHQT4vRe3LgyLQlQsZZIb8ZP5tleLeK8QKL5WfVLrx
 hivw==
X-Gm-Message-State: AOAM532R7HVvPcuLzrl2/hEqpRB01fee68vwkkZnQvIQBdsrW0AH//r1
 If69/ipk2PENoyfjgqsrKQHv3Q==
X-Google-Smtp-Source: ABdhPJxuCUGc/kcwJHIovPUtjrawrktlSDvGD+3+ZSEnaSeJ/TqI3+LBj1+xKCkaUwckluy58a+Mcg==
X-Received: by 2002:a17:906:7802:: with SMTP id
 u2mr367500ejm.325.1632753389617; 
 Mon, 27 Sep 2021 07:36:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d3sm2155876ejb.35.2021.09.27.07.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:36:29 -0700 (PDT)
Message-ID: <0ff5f8ee-8b79-72c5-96ec-2c795bf0a297@mind.be>
Date: Mon, 27 Sep 2021 16:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210927055054.1068719-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927055054.1068719-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gdbm: needs fork
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



On 27/09/2021 07:50, Fabrice Fontaine wrote:
> gdbm needs fork since
> https://git.savannah.gnu.org/cgit/gdbm.git/commit/?id=9016182fe92dcdfa9103acd144ab01f30463ac72
> which will result in the following build failure since bump to version
> 1.21 in commit 60add404db424e2652673a7b6a3ba2bc80380b42:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libgdbmapp.a(gdbmshell.o): in function `shell_handler':
> gdbmshell.c:(.text+0x3dc): undefined reference to `fork'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/effc22ac47350bdbc19074dd724eab16f53913b8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gdbm/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
> index 6c668722d9..debe5660d7 100644
> --- a/package/gdbm/Config.in
> +++ b/package/gdbm/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_GDBM
>   	bool "gdbm"
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  GNU dbm is a set of database routines that use extensible
>   	  hashing. It works similar to the standard UNIX dbm routines.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
