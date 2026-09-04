Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CBC79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A3F60E30;
	Fri,  4 Sep 2026 12:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAVJpIRiTxgv; Fri,  4 Sep 2026 12:19:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C08DB60E25
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524359;
	b=GUaQ/rS7Vu6ivrsnwLDPi9WsqfE5fQPTtwRUcvpSZ/IRjgm6DcK3pPD9mnho2MgwH8QR
	 WoOT1pnUfHpjcAgc863r1pwiknB1Xaegj+mqfA1lZzHIYixwpK8u1sYdHCTAxb4rsbXDM
	 +NsF0uHhWGdyNo92nOuc2xYFcQWBb6yL/0Re9Ayw4wKmbDZCUR3LNuRG+zcV4uJmHBvgW
	 jJbkPrAgOSbLH4sZ14BsahXONyCr4EE4gHj5UJSRtZBq4gJxzlsDELtqm6nuRJoEtxUrT
	 BbMeZ3kIfVBVi8di7q+Kfnk9XLK7GNB6H4noNoJc2JGey2PWS/6UH8OMuZjrop6JuDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WotYMkVH+3hgFoE3mRqpqZyoT0askIqRgH1EX05FdU8=;
	b=jMgOnsLoMQVvthuiEmq1g6kYF7ZFOjqJgb6MWb/XcKV6ewkmK170j2IjsK9zIc1lzhB1
	 JXjRGt7LOtLzROAVLnEKgaKsRKEsOvK62Qr5M1VkZE8KMQ3XW/lBgnFpFEJfw4o/dQvaq
	 CZ28KYpWDAZSvcFyn8t1kiGr1bBO9A3Mv21qCDALf/6OBkohvkVJrUMDKLRlh1A+qB/Uh
	 7y62K6mkXekig1vh6dedIPJUkS/MRKenmioadHaVGgKTRYZscdolEGAbUCC9lUV+tHvn5
	 Ht/+tqYOlm+JVg1s8ziDkhtWGSlSDKbZ5djNdx8k8erx2cXnd8T0V5R2+piZN6PQP0w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524359;
	bh=WotYMkVH+3hgFoE3mRqpqZyoT0askIqRgH1EX05FdU8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rd2SXW05q8Vd0paBMzQ+O6h2sOLon9RVMS75L0sZHY5FRXSDaWx1xXlcq+2J5yn5o
	 TQUbB8G0RnxDQ82EnnPVuzOwfgGpC+sD0rOc7ExF/Jgj1QQ9lpzoxy2nYl2Akdf2XG
	 UyK3vBh42e632wsQjw3QzgRPpAzJMhCP5LkIPzOJDEud9+Py2X5ZNDB60l8JAvAzz4
	 0X50bsDDB+hEKFCLcdmWXmUcvP26z3OOzhMdqPM+MbDIKlQTkbZ7gpKlTp6bKWL07V
	 0whSrVeZAKyIWXN9iHzfBLTfiyAipUqqHO5gq4PVMiPw9kt6b4wZvU9bIyEJ2TyPy/
	 P4v8m8dE9lRqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08DB60E25;
	Fri,  4 Sep 2026 12:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DF8F10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3461C4031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4eO-xHMtG82 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 170EC40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524348;
 b=rnss2OtxKw+JJYY2qIjo58tmF2MmjHsGAhjSaFcouay4Nb8hMr7/Ag4MU2zi6wpBrct+
 HU0KLmfQK1l7uYSLUHlWwFwQi7us0Venme1DcDvh6qkagNHpAdjWphL6W9aAFkgY5PT9A
 Q1NHfbzg1Rbx3gz0yJHBGZ7c6gIBx2ph3+OAZfUhEGT6jQokh2MHcMOz4o2rrOsuop49Y
 D1VGsOlL+UvW2auCPPdLq/BQtz4DQNPfoeLsdjmpWZXlpV0b94OWV7WfhDy1qMVSlVz4n
 tHAx3uq51IH/INYUy17ZAMiexMiz/rwAnKyqg/vrX9DK7iuwu/bY3AaVuP03WHH84/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524348;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=983hBz2ud5ADXkCBfxBR64du7fbeXL60xDyReSMkDFI=;
 b=nt4LkSuZRbMTZa2PpK2/EDvkQNm2jgfmJIbWVgxUo4I+8jld19e6ugOSQcwVxWJHfDye
 JS6ZrzHJPjrEEHs0JjI6rgtv3ZEoNUZgdxyn0Zd7hN99jjLBjOzJKI7Ljw/1RumSAIq3H
 BkWqc7yGAhWYVntO64W5cXAliuWqzzhdRffscKrF6Hlr8XsS1lm9tRbVS/r/qmN8IFyYF
 voh/Rts8BpQBpzYp+cXeXbxt3+5PS0L6v5W3sNZ4G1D5qBYeu0mb9AhjPAKN/GkIr4lkN
 jlB7yZgx5Y+mVEdMYO2Hb+WULksjxD4gfeVc616ohVXDLTZjhIhdgKwC7KJnfux1ZTw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OqLKqUW2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 170EC40080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49b8be0409fso6549735e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524346; x=1789129146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=983hBz2ud5ADXkCBfxBR64du7fbeXL60xDyReSMkDFI=;
 b=YFAjfp1+duOkeA6ufvOxxaY5SI9/gPPLkTSzK/k03SWRK9mtFX1Em4dSYQJgl33S8u
 RwHkuGYI0gg40HhNijnCZCxHtwFo1DeKP5lQ+JAL5gMpo/XWfirWYk0Kvn+qqTpjwkE4
 FfCu6JJP1Uf+WQpTktpUEfGy+i3hgXY6BoM5anIdfzRvtCk0+HpNbYstb9YqI6Dn1cD8
 htoaxW3hfgjkah2wvUSmzpBfLe5nLMfdnyZpnwOcvT3E4uc8NRMcJlWBpS0kyGxpuQX/
 FzZ6jRkOrjxqKd7EzNkv2+0p9lmkkzcqmpWfji3hc00ctMGL9Zp9/t6IMUr3l60IVMOI
 f0/A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaK7tSwVaXtxHCS8x11orkrxH+NvEJlwlaAk2MBK2ZFtnxw/aS07w29rqI3xB0f37fCr0+XzvGJzk=@buildroot.org
X-Gm-Message-State: AFuF++nvbRINuIgV4vDAHQXTqjsprOguxL7P2JqCE73Ba9pZQPLPgvQI
 fU7kqsoVn5ov2yQ+zDsTrj85Lv2z6pdUxG5HtOGi3f8ijA4fZgmjBgDBTPJh780GvCOqZd7E9Ia
 uuW/v
X-Gm-Gg: AYBFou03dItjZ1+9eAtRTY+bG2ibsXCOaM8czLL4GUiQ+0pxKpSyIGURY3WIcv6hHQ0
 leMSZ2u7J5so6PUS6J/gss9ttUBEI3fbke1LtwpkjJr47TpDLfiX2zOvuWODGegFxjPHwJJ/g5o
 UvfLoZ2hthTKE//sBjHKVZsdMQUTZM7EBMSVMShHDthNNsojGIHCtfmGEDWRmtOZJmvRNHE7XnE
 523f7o2IRYHzWLtXsbqh2RD2sTpn/wdALlZPluISLWVh4s/n5b7cJcOwu9fF1rg1YbioDkb0X3O
 HVFFW/OZ2C1FwwtuB5GtKOsW4Mw5jeT+2aAbM9z3W2za4p7g2mNe/WEY0cMb3zfS4k1for/ZSyg
 o41MUqaryCGY8QofsQME4Dhl1/v9nlZKilDj9wo5AJjGu/ibgvv+MKFW3YVNi8WY2yJrldlha8X
 OBrGl1Y4eJbR2ux/TR7PywCt+3Avwckmdy6HVDxAGsDMJ+PuPGsdkRuw==
X-Received: by 2002:a05:600c:3588:b0:49c:fc6e:a3d7 with SMTP id
 5b1f17b1804b1-49cfc6ea7d5mr28005325e9.22.1788524345799; 
 Fri, 04 Sep 2026 05:19:05 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf771e9absm67165575e9.9.2026.09.04.05.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:05 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:04 +0200
Message-ID: <20260904121904.406524-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827165534.3741128-1-peter@korsgaard.com>
References: <20260827165534.3741128-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/haproxy: needs signed overflow
 handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> haproxy has a runtime test to verify that it is built with -fwrapv:
> 
> haproxy
> FATAL ERROR: invalid code detected -- cannot go further, please recompile!
> The source code was miscompiled by the compiler, which usually indicates that
> some of the CFLAGS needed to work around overzealous compiler optimizations
> were overwritten at build time. Please do not force CFLAGS, and read Makefile
> and INSTALL files to decide on the best way to pass your local build options.
> 
> Build options :
>   TARGET  = custom
>   CPU     = generic
>   CC      = /home/peko/source/buildroot/output-haproxy/host/bin/arm-linux-gcc
>   CFLAGS  = -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1
>   OPTIONS = USE_THREAD=1 USE_DL=1
>   DEBUG   = -DDEBUG_STRICT -DDEBUG_MEMORY_POOLS
> 
> Which comes from:
> https://github.com/haproxy/haproxy/blob/v2.6.0/src/haproxy.c#L3008-L3037
> 
> So build it with -fwrapv to fix that.
> 
> Notice that this message also embeds the build path (through CC), breaking
> reproducible builds.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/haproxy/haproxy.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 970347d3ed..f75f18e031 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -15,8 +15,10 @@ HAPROXY_CPE_ID_VENDOR = haproxy
>  # https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
>  HAPROXY_IGNORE_CVES += CVE-2023-45539
>  
> +# haproxy relies on signed overflow, so MUST be built with -fwrapv
>  HAPROXY_MAKE_OPTS = \
>  	LD=$(TARGET_CC) \
> +	CFLAGS="$(TARGET_CFLAGS) -fwrapv" \
>  	PREFIX=/usr \
>  	TARGET=custom
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
