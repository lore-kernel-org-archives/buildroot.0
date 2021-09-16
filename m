Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B16FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1B5611CA
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF1B5611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770426082A;
	Thu, 16 Sep 2021 18:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxpl6NVWLV87; Thu, 16 Sep 2021 18:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B45607F7;
	Thu, 16 Sep 2021 18:50:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF561BF8B4
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A8783F1C
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfEzddAbQzKu for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 18:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0042583E9B
 for <buildroot@busybox.net>; Thu, 16 Sep 2021 18:50:50 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id n10so19867124eda.10
 for <buildroot@busybox.net>; Thu, 16 Sep 2021 11:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ODyWoCC6Lt5L4nt+e8bnyqQXRwIrQUu9kR0c8UhnTe4=;
 b=CKiGYw+XD+ieu8OKFslwdxKNpMYU7owVkCg1L9nvE+OQnWtFzphBZzZX0q5pp8Gbkd
 OB2+M7EZ7EKgQadZMi/qc+1UAf9aYe88/GgoF24itR1aOUd40ajycxM64zhoh8bOzGLC
 bNwpvJmwDN/pLXcPXaUWc0bnIiAy5gzQ7lTZt9N/52PCUr3UX2pSUQb2YNockpB1vp2+
 wvpjWo7BiSadT72wDbv0OhQQAPC65bK/522VpFs08b8Pdk/xj3jH2TTZV+BiwfUQTwl7
 t8sElEz6LlJ4OhFdaMr7JdVtlyCc+REKY2gi5D+LCHmmo8xfG9IcAQPeQbKVmvC81TUu
 MB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ODyWoCC6Lt5L4nt+e8bnyqQXRwIrQUu9kR0c8UhnTe4=;
 b=tFOXGwhw7ZLoK+UgozLFMQmEqq16fHmaUKMBHo2tBDRUVGwCdWz+lrQ5U7jdR/BqM6
 E79ojuxZWX41ateiTUFHamrEJRxydTCWI6ZTVZxc9NYIKZx495t1PtjOE4Up1q22A+wJ
 B+c5vBfLkW+MvYZdHnLidw80QMYW1Cyz5ZgOKKmz60hsU6IR/Uu1ugAK8QkyZ19+WfKd
 FPea3L3QY5PUBuOb4NiXjPpevAsqzN9BMk6ETCEmST8Sspk7x4hbxMG3Y/NTZRSW1/Pe
 GMLraO/jeGkevMkfE8umwuJfqaRVXBIexqJScchHpCiu87m0S/gd0s/RaxGoWgKqq3PJ
 JL1g==
X-Gm-Message-State: AOAM533esj+Vcw0Iyo5XsQTJl18oUVBSJD00Gq/HW2DVoRwn4VsSxMQ/
 +vFqcrgjqpX19P6tLjUpcbWDPtfPS8pqJg==
X-Google-Smtp-Source: ABdhPJyu4kHeO55SQC7+pee/Ldwk5BPcnYuUFjcV9vTOeDKRaNKuuNTvs2yeombtv83xd9Usaaa4QQ==
X-Received: by 2002:a05:6402:4cf:: with SMTP id
 n15mr8060828edw.269.1631818248377; 
 Thu, 16 Sep 2021 11:50:48 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j22sm1500293ejt.11.2021.09.16.11.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 11:50:47 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210906152525.1831463-1-francois.perrad@gadz.org>
 <20210906152525.1831463-2-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4604d2d6-83ea-9aaa-83bf-e1fcbb01eab3@mind.be>
Date: Thu, 16 Sep 2021 20:50:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906152525.1831463-2-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] perl-libwww-perl: bump to version 6.56
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 17:25, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 All three applied to master, thanks.

 I had to make two fixes though:

- The subject line should be package/perl-libwww-perl

- When the license hash changes, the commit message must explain why it changes.

 Could you pay attention to that in the future? Thanks!

 Regards,
 Arnout

> ---
>  package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
>  package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
> index c419c1d7b..709e94647 100644
> --- a/package/perl-libwww-perl/perl-libwww-perl.hash
> +++ b/package/perl-libwww-perl/perl-libwww-perl.hash
> @@ -1,6 +1,6 @@
>  # retrieved by scancpan from http://cpan.metacpan.org/
> -md5  4df22c50511a3f01063d2ba4d91bfbec  libwww-perl-6.55.tar.gz
> -sha256  c1d0d3a44a039b136ebac7336f576e3f5c232347e8221abd69ceb4108e85c920  libwww-perl-6.55.tar.gz
> +md5  0ef270c43ee93e22c2086ba9998aa11a  libwww-perl-6.56.tar.gz
> +sha256  94362e68e5c6782f3987a9dec6adc409d20e28665dbf28ff47d1d701443ce7ce  libwww-perl-6.56.tar.gz
>  
>  # computed by scancpan
> -sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
> +sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
> diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
> index 99adb5665..10fda9de6 100644
> --- a/package/perl-libwww-perl/perl-libwww-perl.mk
> +++ b/package/perl-libwww-perl/perl-libwww-perl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PERL_LIBWWW_PERL_VERSION = 6.55
> +PERL_LIBWWW_PERL_VERSION = 6.56
>  PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
>  PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
>  PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
