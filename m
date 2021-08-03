Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3712DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C8160FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5C8160FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3AC140253;
	Tue,  3 Aug 2021 15:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1xc_RZdUjY8; Tue,  3 Aug 2021 15:52:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B887140290;
	Tue,  3 Aug 2021 15:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4414C1BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FA8340253
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcsJZ366Vu2Z for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:52:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2001740206
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:52:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id go31so36985668ejc.6
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6rMM2FQYzABB+HA2C5eRhyVF3PPvAS+mMFUTbfyIysQ=;
 b=PY8ZQiYBYxUniFuKSeqSqNk9l7X7arba4GqvlgJ8CnYA5nL3hi/eybwqszINgMTsT/
 C0AAmDNiOgHVBKECxoOp5N7j8heo4/Fe6FR3a9GTj7TUK2EskarlCM0DtSNmLz7Qi6ic
 2GOjCnUoVJtXTo+HOvgHSvR0T6DGJkMZdOC8YQtZEsYxEcFIoyDzG9fBozrsE441dKPx
 PPPpvCWcFHHfDJTb4Ty8JsPGfoLWbGFNAfxUmdo909+JbzgcVFdOFpOtXVSgaTDkf1JB
 jHL9VZA5ApkqRzCaZ7IpSbQwakyXsZFniuauF90j3DQ+HWDj+vV3DS8skxJHSoJOMpE7
 MocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6rMM2FQYzABB+HA2C5eRhyVF3PPvAS+mMFUTbfyIysQ=;
 b=Qwt5mqtptIlBO84CwiN7Id08Zhb+p8ritABxM+xzDmtylcKDk2InaVkrZ8E/PGsT7w
 eq2vQ9dVKW2E5k5/4vodQms4FFfyBYH/OQ8iNyUc6D1i1374LHTaucnR7xxh7RxRTj68
 oOwITs51sgpGd7ACrjo7Qosijpi/1OqdRsPM2SsmBa1V7KFv4y6of4Sxrnb3P2HwxLAE
 IBzrNZk3tDcSaWNEUbiC74WfS/UpzeWvrd6w4zoADcnaWYFRd1Gb//GdKWvn92E/hii3
 +ob14Wa6AkUrPqnV5/83kgHqCNgkBtoWEVDr+s6TVuKFa7CyvGBcHVRL1MwpKLrijMS/
 29/g==
X-Gm-Message-State: AOAM531lMmpM5Bembes9in/ahbj2cAMVltq0LO7vS43yRAkUZfT3wC/t
 CNjRxQHSa/droKnlrYgVa7xkvjPoP1JApQrHj3Q=
X-Google-Smtp-Source: ABdhPJydgt85BPnhMp3jmBq6uiL3K58bPZfe6xvu3K+ba9vu1lqM6ErMym1TV5L+Asn2nD5gBWFPPQ==
X-Received: by 2002:a17:906:8047:: with SMTP id
 x7mr21858459ejw.453.1628005949302; 
 Tue, 03 Aug 2021 08:52:29 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id h10sm7353028edb.74.2021.08.03.08.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:52:28 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <64aab3da-de20-d3c8-52c3-0b2a97d2386c@mind.be>
Date: Tue, 3 Aug 2021 17:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801222102.1244919-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/tpm2-abrmd: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 00:21, Fabrice Fontaine wrote:
> Support for tpm2-abrmd is added by the services/tpm2 module in the
> SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Series applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/tpm2-abrmd/tpm2-abrmd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
> index 0584ba928a..8de233008e 100644
> --- a/package/tpm2-abrmd/tpm2-abrmd.mk
> +++ b/package/tpm2-abrmd/tpm2-abrmd.mk
> @@ -8,6 +8,7 @@ TPM2_ABRMD_VERSION = 2.3.3
>  TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
>  TPM2_ABRMD_LICENSE = BSD-2-Clause
>  TPM2_ABRMD_LICENSE_FILES = LICENSE
> +TPM2_ABRMD_SELINUX_MODULES = tpm2
>  TPM2_ABRMD_INSTALL_STAGING = YES
>  TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
>  TPM2_ABRMD_CONF_OPTS = \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
