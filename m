Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D609EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 342D140C39;
	Tue,  4 Jul 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342D140C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFhrok6KEFI2; Tue,  4 Jul 2023 20:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C885405E8;
	Tue,  4 Jul 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C885405E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2092A1BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03F8681767
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F8681767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtJI7YRQ97Tf for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4B581764
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4B581764
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:52:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9928abc11deso707922066b.1
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688503940; x=1691095940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwLiVXRQQefYL9xz0JAEno5IaDBHiN3O65eu1KN5OGk=;
 b=CJ8+quN7d+460x0zDAaIyH6mBr/L0sy6ZpEPQpbRcDCm8BzXwdqFAaEHsB0EATZ2xY
 Tg83uhnRIU8K/FFZYnhcVd1nIYLiIFtzrGO6BDkNrXVgwcJ0VnZJjeGN9cy9vDseuAFv
 p2hltvnQXun7uLm9W17Og4toe8Gybbromlsr8vzoZecKmmMINfy5A1OrSOc8etXSBYVB
 NmyXgSKugKD8Kn5qtU9sQTHUtjQx9rgYkjqi8W3vAQL0z8tVuVirOj1d9QCNjEGRuGzh
 UpUdnJbJ3f5qTT43dzfotHMwJT8JrGfGRcqqs2RRmFUrRN3OcBhF6kmxYOgKV5g+Ir2s
 EC6Q==
X-Gm-Message-State: ABy/qLYM7lb+aDoUSKGmw2oDf53Acil4YrWrmpiPkvCjZzTpKfDLVWrc
 8xb5kP6DqM+T73dmNgiBB84bcA==
X-Google-Smtp-Source: APBJJlHXsudvFIGjvLSc9IGCRZevzvIktkCOdI47FOmkgqL35iNgfhjFJ0Vm1iyH0Ru/oaR0XZy2GA==
X-Received: by 2002:a17:906:3b45:b0:991:e694:d699 with SMTP id
 h5-20020a1709063b4500b00991e694d699mr9617175ejf.11.1688503939800; 
 Tue, 04 Jul 2023 13:52:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a170906499500b0097404f4a124sm13806764eju.2.2023.07.04.13.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 13:52:19 -0700 (PDT)
Message-ID: <90441867-5bd8-f01a-633f-520fb4182b5c@mind.be>
Date: Tue, 4 Jul 2023 22:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230626054652.661940-1-bernd@kuhls.net>
In-Reply-To: <20230626054652.661940-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688503940; x=1691095940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vwLiVXRQQefYL9xz0JAEno5IaDBHiN3O65eu1KN5OGk=;
 b=epSLjP0bwUOMncx6ohxv1gxJefOiYsljhIdD35aWncf7+PaVMp7C894AMSOCxkiCiF
 y0cEgdaURvKnFN0WeMtnPS7QAp8PAa3j9k88AqKmjd0e9goVokQrwAXfUzOWfjxA21gY
 Dbpua20svgoQO0ueBusOgjhMr+tItwvGq2LTHUVXjH6VQhfdsSdiXdTGwlJXu9Pcc5Tu
 IKwpiBo+P3+Q5HGSh3MQpM6DDlzVqR3eT2sqiXjKuFZw4cwwNKyHuty07FPuI0ENQmwJ
 DcCOOQmcfgDDlQWHMHnsB/jmhIOayHC8V4G11oNrZJgvEOb/JAjpc244vOMDwgMHhgy4
 Ci/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=epSLjP0b
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix install
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2023 07:46, Bernd Kuhls wrote:
> buildroot commit 4c8ab13b960edcd290ea5ca7a7e739cb993fb863 added a link
> of /usr/sbin/pb-udhcpc in
> $(TARGET_DIR)/usr/share/udhcpc/default.script.d/ without creating that
> directory first.
> 
> Fixes:
> http://autobuild.buildroot.net/results/778/77802098355dd99a9e7e6d9178f900a9a8fe72a3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/petitboot/petitboot.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 4d56b73938..8b4c14207e 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -55,6 +55,7 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>   	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
> +	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>   	ln -sf /usr/sbin/pb-udhcpc \
>   		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
