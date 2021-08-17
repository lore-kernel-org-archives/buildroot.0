Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB252C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:55:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2569760EB5
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 20:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2569760EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D60E9400DE;
	Tue, 17 Aug 2021 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pva1KtgH2KoW; Tue, 17 Aug 2021 20:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AEBB40112;
	Tue, 17 Aug 2021 20:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4622B1BF95A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4268780C2A
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJsIJIxx7JhQ for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 20:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 838B780BE5
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 20:55:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v2so22975357edq.10
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=leTCD8KoSRkvHWLsLtjFas4ybt3v3hkiGDTMk3t1lfg=;
 b=anHRYKXRXn5QU2RI78OmE1Sw00XSMqFf4g+eYwWb6400HmAlE5xvF21UamTm1GnyoN
 n+qgLHB04X9vm1Yz48ug1NftXD1mTmwzAEttZK13Zl6lBEEx9HGvVWwII3QReMAgLqOp
 QRwnThSAhJVe5MKSg+/pVWIu07XxXGdeZan8oBuzkUMTpHC7N4ZZ0g7FQJu3W3TbMYCb
 qBcr9EIb6Y78ypJfh52Ix1uWNhQ61uBSIShS7xPvL7WEh9Ky/bqRWb8JMTNnqIPCj9+E
 roDDA/3dxH3HhEUgSYm2z3Ctd9XT9rK/DcxY0n1yPGgb3tTWs+48/bwSbDSZhLYr9JMJ
 4Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=leTCD8KoSRkvHWLsLtjFas4ybt3v3hkiGDTMk3t1lfg=;
 b=cn9FNr3fcWNIqMjdNR3EstSaZ9tBAevihdQuexwgk8hgQQLLm/THKwNQu57TCxGPMq
 eYJvXL6/3oMLNNVzZRSweAdPIxJbdCknlmAI2/CGndjJ0KkET+FzuktqzdHOnx6dhQgg
 EAwv0JXuPqWtQbj2NtZOxOz49/MIE59tKqvAoTxnc25exY1OxbUw0MNVEzUk5Raeh6CO
 KHSjuFVr0UutcvrFYTdcCdzxgoGv48QnBRKbc2opgXW90PhG58eOwCsPWHfUFjHMbYVq
 xgXRsW/6yBUdoiR3kmYeg3eUnag6clcir5XNbDYClDBSF1zmpiV81wF+zxuI82DIuzye
 hXzA==
X-Gm-Message-State: AOAM5335XwM7eLX7kRcCcCK1j3COMh3rwKOVLOn59PQ6cYp/HALfjyst
 2KPZHQP38aEDFZsTcqq3VMYpz1IiZXmkhg==
X-Google-Smtp-Source: ABdhPJwSNpm5JskcoU3Ws0QbKLADteO3eRxGL3BjSM5uw7Dy1+s9xmf3tEcTIWToXyyTPvBsjKi4NA==
X-Received: by 2002:a05:6402:1d19:: with SMTP id
 dg25mr6004566edb.153.1629233720633; 
 Tue, 17 Aug 2021 13:55:20 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c28sm1172229ejc.102.2021.08.17.13.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 13:55:20 -0700 (PDT)
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210815135249.231896-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <92ad8dbd-77c2-6a5c-6ca2-b91b5632a1a0@mind.be>
Date: Tue, 17 Aug 2021 22:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210815135249.231896-1-francois.perrad@gadz.org>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/vsftpd: fix build with libressl
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



On 15/08/2021 15:52, Francois Perrad wrote:
> Fixes the following error:
> ssl.c: In function 'ssl_init':
> ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function); did you mean 'SSL_OP_NO_TLSv1_1'?
> 
> in ssl.h (libressl), the definition of SSL_OP_NO_TLSv1_3 is under the condition LIBRESSL_HAS_TLS1_3 or LIBRESSL_INTERNAL
> 
> with libopenssl, this definition is unconditional
> 
> this issue appears with vsftpd 3.0.4
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/vsftpd/vsftpd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> index 8daf07c62..e36ba299c 100644
> --- a/package/vsftpd/vsftpd.mk
> +++ b/package/vsftpd/vsftpd.mk
> @@ -41,7 +41,7 @@ VSFTPD_LIBS += -lpam
>  endif
>  
>  define VSFTPD_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -DLIBRESSL_HAS_TLS1_3" \

 I don't think this is how the libressl feature flags are supposed to be used. I
think you're supposed to patch opensslfeatures.h before building libressl.
AFAIU, the flags are indented to tell client applications which features are
available in the library, so vsftpd could do something like

#ifdef LIBRESSL_HAS_TLS1_3
... do something with SSL_OP_NO_TLSv1_3
#endif

 So I think a better solution would be to patch libressl to enable the two
feature flags (TLS1_3 and DTLS1_2).

 But I could be wrong, of course.

 Regards,
 Arnout


>  		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
>  endef
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
