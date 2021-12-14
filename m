Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE885C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974B58176D;
	Tue, 14 Dec 2021 19:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TtNbTrENPM7; Tue, 14 Dec 2021 19:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C438174F;
	Tue, 14 Dec 2021 19:45:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4301BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B2EA60BF3
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxRI4QDhwzhN for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCE3960087
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:45:08 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r11so66079748edd.9
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qhC8y53b/ETF4Jw6IhqPhWZmGOBFbqUDdQEMs1L3ylk=;
 b=Livc5SEGWL5xS1qrfmcAiztoscDPMcA4aRwZkbH97sTW0RxBNsqZPzkKcv01jSAATw
 4VplPF1vev2PPtg0MPzjIQ5z6NfoH3fTpWpZtLgyvvmJadOzrXKuq2z4uM4U+sF2Pb+M
 PkoP/5O9q35+Hikqp332JnJj5OzyZTZxyY0bc4Ot6BkIdA9O2Zh1o6cDSkv2JOKPTder
 VAyvNM2mELrTPxYU3lwRjRR82MXzH4HP6haZM/qPnA1Q+EhGz5J9c+0kboJ+xO93kYT9
 TZDOmkrhjLdy44XZ76ehR8FlC8iPX8m7x0vkB4rls33tTbSQyJi0kvrmCd/R89rncUdt
 5Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qhC8y53b/ETF4Jw6IhqPhWZmGOBFbqUDdQEMs1L3ylk=;
 b=G5uwM7YVVcnyQe9GKl/hxl440B+/V94giSm+rpov1E2tEgdelH+NPluZHsgLfRyORh
 d1caY56hsZLjYnHaphpW3vPU3SIrxEuGaX5bXoN4/G/vgkJqx1L51aUnhjofv+Zq4dVe
 MuwqMo3gbDP47ePEmq/UA5z/60ff/xkvrxVQawp2gyw5o4VgD72m8NPkPi8NJzVM6xzv
 oj6FKqFOjrBkW9A+hrTcdamPSJnz7w2fLWnTy4KVSr+YLzIbsFX3ZyO9ttAeb6R3ACsx
 4sUbKTf+P0czPyO5bnaxZKITxsjyXWmdVP/5+gWsWbHhVBznw2/XuwSsIk4dXdVVHcVT
 1Q8w==
X-Gm-Message-State: AOAM5321tkiJkbYOzSa3gQpoh3eh/V7pwYHfHkiXr+ugZY2I3Y9RU2Ie
 vF0bc360HLy2RUiX0vfPaf+oAQ==
X-Google-Smtp-Source: ABdhPJyEh4XhpumxD7hS4R0TtFvJwFi6KILuV0pqjdcV05lMV/7tbosDXEHrwAm9wU/bG03DzhfSsA==
X-Received: by 2002:a05:6402:124e:: with SMTP id
 l14mr10510295edw.74.1639511106938; 
 Tue, 14 Dec 2021 11:45:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n25sm295761eds.9.2021.12.14.11.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:45:06 -0800 (PST)
Message-ID: <f8079f4f-d570-9e0f-98c5-202127ce6a90@mind.be>
Date: Tue, 14 Dec 2021 20:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212203447.944473-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212203447.944473-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg: add SELinux module
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



On 12/12/2021 21:34, Fabrice Fontaine wrote:
> Support for gnupg is added by the apps/gpg module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gnupg/gnupg.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
> index 9729441bd2..68df11a0c3 100644
> --- a/package/gnupg/gnupg.mk
> +++ b/package/gnupg/gnupg.mk
> @@ -11,6 +11,7 @@ GNUPG_LICENSE = GPL-3.0+
>   GNUPG_LICENSE_FILES = COPYING
>   GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>   GNUPG_CPE_ID_VENDOR = gnupg
> +GNUPG_SELINUX_MODULES = gpg
>   GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
>   GNUPG_CONF_OPTS = \
>   	--disable-rpath \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
