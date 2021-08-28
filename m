Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C081C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F036606A5
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F036606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14652426E1;
	Sat, 28 Aug 2021 15:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVC31PW-P3A8; Sat, 28 Aug 2021 15:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BEFD426FC;
	Sat, 28 Aug 2021 15:00:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 947541BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 908DD835C9
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nU33JJhh4quk for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7BE5834C6
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:00:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x6so6943083wrv.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzQs0BiJCQwLWf9iJZa/NlPEt3M0pTQVXDZxd2LVb24=;
 b=Ve8K/56o1zgtLNck6mXpDzUMB/FgPa+mxypw00suI3l3xHx/f04NQpQnfXaDk0oXkq
 8SH7KtZVjbsoKBnug26/k2/T7QVh3gx6IHx/To8Y1jqliGaH3xwrCTIRdYGpPztWGjGt
 4jKIlaH+SjCiGUsnVYrrlSLUFqbU5NQSXDdIGWXVXteoccacmYwYR4NpWGx/yXg4Jisq
 1A9jyrdeNuxllUs5QYvTRaeAMPuvJhmE2Yguo61FGOerlV6pWcGwakjc+7HmpCrl5xz5
 CEl7NKI/N47w+saiax3xIHhKHH30lLcQmeQrH92BXWVtY5SOWUcB52eWsO8ihvLlskSo
 9CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VzQs0BiJCQwLWf9iJZa/NlPEt3M0pTQVXDZxd2LVb24=;
 b=p8Dv+EDApirHjKkLaCTi9Yd61cqt8Qvxy58uUYn9SLMjmHYL+shdkF3yZcXn7N8TYx
 OjCjDXWc2R1kuNfGamTU0sBFHR859SoKe+ZWS2hPT8/eQl4+bXNV1cQ4+oaS3V7zcmF2
 XmOFhRqlBiVrdik03RoCgEDnFJ23vop3WTJwhjIzBpwUJgKHUIn9SfkoPBYVX7IMIQ7j
 h7jdWYIU+m5Q3iriHJKJr5lut12H6mV6ejB3jh8Pw5WcI77P0sBP0HJrvHEhqTBClYXB
 FybuhecUmWSvwp2KVRuvdo6h8s0jaYF61ewYrRGEp8ivk1PRn19d3dtDcBUZO8DYrncZ
 w73Q==
X-Gm-Message-State: AOAM532OdrD0HqP4AO/NC5ihzstQ5DSPIoeiF6neQeGyDORWPmrGf2ia
 MRrcJEKsSpI4scjY0HdK9+IUhA==
X-Google-Smtp-Source: ABdhPJwV/rzsGHylnT+EqPgmAY3kz0Ypj0EE+dkxuIeHxns6xjmyR2970R1A6CTskM5NWy/uK7qCtg==
X-Received: by 2002:a5d:6e0c:: with SMTP id h12mr16673009wrz.334.1630162851308; 
 Sat, 28 Aug 2021 08:00:51 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id x11sm9831922wro.83.2021.08.28.08.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 08:00:50 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210821104403.1184407-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <6f8d2382-0f16-e9e1-f396-47fea320bea7@mind.be>
Date: Sat, 28 Aug 2021 17:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821104403.1184407-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/log4cxx: add libesmtp
 optional dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 12:44, Fabrice Fontaine wrote:
> libesmtp is an optional dependency (disabled by default) since version
> 0.10.0 and
> https://github.com/apache/logging-log4cxx/commit/8a35b429c6b1bc73635d9b6db482523619199a90
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to next, thanks.

 Regards,
 Arnout

> ---
>  package/log4cxx/log4cxx.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 0ddea9466a..075f8cb371 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -22,4 +22,11 @@ LOG4CXX_CONF_OPTS = \
>  
>  LOG4CXX_DEPENDENCIES = apr apr-util
>  
> +ifeq ($(BR2_PACKAGE_LIBESMTP),y)
> +LOG4CXX_DEPENDENCIES += libesmtp
> +LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
> +else
> +LOG4CXX_CONF_OPTS += --without-SMTP
> +endif
> +
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
