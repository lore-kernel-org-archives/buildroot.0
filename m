Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B8FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A04C161240;
	Mon, 25 Jul 2022 22:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04C161240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHwYfcCBGy3I; Mon, 25 Jul 2022 22:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2B3610C1;
	Mon, 25 Jul 2022 22:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E2B3610C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D42891BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD75B610C1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD75B610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICyqTkMRUICN for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3D460E57
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB3D460E57
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:27:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c22so7681733wmr.2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/c03KwGgAE8GopN6xmQbHyOSwr6jDXCo6EPgbMKERrI=;
 b=WgiyMaAePA7IuelENKBjykOkIkD+3rDwmRw5jHk7g8S6yQPl8KGBZNRynz1FOT0s9p
 gEr+piNhFscQQw4a3JCr+zlEpBH/z4O8UEDMhRGic83POf0OPs+bk08mpfo3RcJ38v/Z
 8d4Lw+adK5sasV425az0SZGzW1iKHD32rYFD+6eCBdeTukeNMUy/xjigvksYOP0MxBac
 8gwJUQMPrSVUQQqZzjXxFD+cR6Atalvkbb0FVcS7V8IVBXHeM1wusWlVop2zYNs5HZ1E
 Gym25pR5LuqfxA06qaCZKVK4uAT+LwVNaezfi3a1FqacfMLMkwKBoGvNDxPW8uYMj45W
 LsKw==
X-Gm-Message-State: AJIora+qsHEcgU9/3+rvH1imzzfIe1jX5j5UU0FYS6TvXIXhMjpwnTy2
 TFkPtkwuv6R5hVOXMDjzl/2f0Q==
X-Google-Smtp-Source: AGRyM1tNdSyP1v9/D9kmJ097mFCuAjNsVOuGwQKJnBtZWoexvd0g8XcwU91owgNsg6g4lpGhhTN7UQ==
X-Received: by 2002:a05:600c:358d:b0:3a3:3819:c07 with SMTP id
 p13-20020a05600c358d00b003a338190c07mr15731815wmq.76.1658788075945; 
 Mon, 25 Jul 2022 15:27:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 id19-20020a05600ca19300b003a3211112f8sm15145148wmb.46.2022.07.25.15.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:27:55 -0700 (PDT)
Message-ID: <6cc3d183-6bb4-a8dd-977a-dfbf536d1a73@mind.be>
Date: Tue, 26 Jul 2022 00:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220725193251.92785-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725193251.92785-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/c03KwGgAE8GopN6xmQbHyOSwr6jDXCo6EPgbMKERrI=;
 b=aT5VQDFU0d91/BT8eYnNDNmepA0msODf4GRs2hwZndnK17lqUeQXJ6e3pCnxTLMNwE
 PmdTxKLS0vv6RGm4+5we4qpbsUkpfyf39KbrsXPvOPa8yPwjBR15Kx/r9LLPti6m4xVn
 lja/Xv+zTfM7PR5W5651Tm04e/1eLc8Md4BIrg62Ftiin5LCUfq3rDL+U/F0Q1dZ08U6
 h5MUvyPyA3YKujAn7m6g88ayxQcUJoKk9/ITlZ6Gm0MIpoL2WhZ/Eh0/d4R+k1hkwwak
 uV+qT5uINWCB9Zy1BGpyOZrs4MKloZAfMUbEoLFFc4O2ePof0DMmqjn/Ke1uTd6Ux+6d
 DxQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aT5VQDFU
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: requires RIPEMD160 in
 openssl
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
Cc: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 21:32, Fabrice Fontaine wrote:
> Enable RIPEMD160 in openssl to avoid the following build failure raised
> since the addition of the package in commit
> 8aaa7ecbce1d10cbcd880c3da5e429988f96176a:
> 
> /nvmedata/autobuild/instance-17/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pkcs11_tool-pkcs11-tool.o: in function `sign_verify_openssl.constprop.0':
> pkcs11-tool.c:(.text+0x6b00): undefined reference to `EVP_ripemd160'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6dc5baa2cfb037431b9ede9f2e0c5705957ee3bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opensc/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/opensc/Config.in b/package/opensc/Config.in
> index fe3dd0836e..6a0329fb39 100644
> --- a/package/opensc/Config.in
> +++ b/package/opensc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENSC
>   	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_PCSC_LITE
>   	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>   	help
>   	  OpenSC provides a set of libraries and utilities to work
>   	  with smart cards.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
