Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FE7CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C99481685;
	Fri, 16 Oct 2026 15:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jZ_PIL8Nf7Y; Fri, 16 Oct 2026 15:04:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AB4281682
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163061;
	b=Ze2Rj6LfSU5boABLrp1eb/l+7KncXs3/veeGn811gOhcSBY/gaOhVKA3crGq38NLrucC
	 fERNDVWkSoepmDIeddNR1v9W6p2/i9h8r+rGEI6EmRe+MPCYBN70yLUwrP9DkkxEpIrs1
	 KPcX5q5jAfn0nb/WnqATg8glnaVWBxSetVRGXpxfFUrPhL4g7ogpUj3WzZ1SxGTYzsQ7f
	 X1ZWMAVTLDsoNiQT3LRUSQkMvEMIHERauaSVmTHeAD2lO4Eu72Kw4i7jArDrdTVHGb3qm
	 zBUK+LK/gWpNoD1s2CMDEGoQGxFPjQEOh7Y/Ii+/EbO+954Fa6dVDpM/hHOV0ojTsRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163061;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uASV+aI86r9Wun7RCsraPjC+ENm0aoykZavMCwAX4Cw=;
	b=ECD9hszI3bdlV4qimxQ2rMQ5I4VzxBQigQnuGFiVRXQHc8PDR0JHaO3TsAsaBr2F67pm
	 SF+GDvq2c/OW87deQQI0I2Q9fEwNiDatHQN78V+0C8fTglQbnOBu51wM/MVbbbkkF8Na6
	 ellOMHMDPlcnaiREEZMopg1wJRX+eSl8Av1Q1duztC2bkouxFpRqtxUGrIZpg0+WSc1Oi
	 kmkDfgGI2v0m/Ix7Iv9Ew5MXKN9ocrLYMGO14MwqFQkzSuVp4zd6eT0N5nNqteTsK3CjV
	 JdhbTTegCb6AG3DrbcVaymeAwKip6JUao9I6Xj4n2fy3B4m2jxaMr+ICRZbZaeZ9XpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163061;
	bh=uASV+aI86r9Wun7RCsraPjC+ENm0aoykZavMCwAX4Cw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EvGLdEwZUCjIgFVWBcL+SYN3EkxpM32yoQYU6hxMFmd8aqbvkazI081wH1M6F/cwc
	 iTeLHqz39AeeuAD00A70X5mVQVZpAGiptQeeTrXBxHzUMafdD4WPHkhdc3V+i2bPDn
	 qOZeXGHa7GhYxHkdhJTVJxhqpNr0sLsoNy3ho8CRoSJIGahbGtl417NoJMmg/Vf9pf
	 MJ+UsmMscLdfNqVYVjEbSFP3DvaoQCIAbkVXbhwKN5NXXPR78ANenC4F0jJuTLXXfH
	 t/TThXHlcMbYMplbNQ2mzZbKaUL0D94RfbTmvXniaZr+HWK2yUoIxRvfhMF155hOkA
	 7aJCIFGdWS/3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB4281682;
	Fri, 16 Oct 2026 15:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8E2E255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF91081676
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i29zaRdMjDGQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBCC181675
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163059;
 b=PJA4FLk571guRcnG4ESfOkioK8kt9UJJ+Jr8/6Z42GwsDpmgJ9vNlC2HpCW2l3ZwemXU
 Ixo5NjYsNqY0muAuNVLcZyKHYXFr8D1T65vc6JCw0m9Jnz0LNDZArGfqap1rx8JqGoH33
 sUCZGVqXO6FYyDOgHg37Mrst318Y/D04Xaj8Mt/92P3qgv10rigyT2JuADAJ1SZOlOjFe
 7x3N456xqwbbNnBiH8odcfkcs3D8tWaEj5jasJnAdWasFMh7sC61tIOmSFamOh1Vk2M4P
 Rr9VDzGYh5ddmZuUvl6DN2OyCzzXXxZ5CrmFVVZEEK+9okH21rMC8nv8/HVNiHBrjxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163059;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=EKCE0iRVb9eZ5zu0DFDwXxheEIlXoqoX6RQSlmBSzjA=;
 b=swjT0mvVZmolvMxfhV5OpmE/qTOsMEqy+jIOBnfDYceoTvJnpnJwxM5A+KaZAWv11Owi
 WDMd9L5WpwcIQIgwrN6mcqjrHiru/vb3hvjyuD8idkSx7Z845x9whY58rN8t5T2/zJnvI
 7UJUXoyQuX9u97ySOPAq6EFjkuZrF3k1pUlabRJFLb6K9X3g90JO2RMvtoEXLzemae+WE
 tWbESmYLlIiCyLLN5ZSBtroNpfEEdKa0ODnuwXrS+/B9p9sFxuXP0hacHIuNsWqNtu77g
 AylPqctHxMS3MLTp8+jmevPXPDEgmntyVJmCXsXVIRDakQ/XwY5/js7X2/mlLaCG9oA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ow6S4jSm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBCC181675
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so421075e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163057; x=1792767857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EKCE0iRVb9eZ5zu0DFDwXxheEIlXoqoX6RQSlmBSzjA=;
 b=hYUsbYwXpSKssaBu4cmq9nU46EQb5q4Qag5TcMUsPGNI6Kn+ED34Vw8tk1cB3K6BLc
 J4nl/vv59Kf0k0W7h1ljqbReIGRHbZVxFp0VkDgerQlrd2DuyNdhZAADivmcBkq5k67b
 jPAOYgpAve783Z+M8vVk9p/Hq8hhfJpGZh19wgYws8Xs5jDpPfSCPw19CkXV7M1mYtOn
 Sha0VrCim+UW1n3MKkcfChvwZZwJzM+H2uZAAgns/yRLJ0fjCMIBijH2xYs4HqOn8SI1
 v60r/rjmUx889o/j7aOjE+vpTjCwMGTcV8IQPoaIgfPTwQt2GpJHPmLNz0NTOqi26ZkW
 336g==
X-Gm-Message-State: AFq9FYKVGItHDMyNyMMHQCs0eyNRk4+1W90ukFEHkrFjhzRCqMwX4d/A
 atcZP9nFkKrtr6kabi0kVW3U7ZHHt72wz4w3AxNUhvZjULEhvsIWO2ku+rZIKBbrweuE7TSSzFT
 kDDv6Y/g=
X-Gm-Gg: AYBFou35T5OhHYS9L/3md+fBKO40rwBAYB0fNlj+ydEkG7UcCaFuwqoHlmne0R9IZQS
 WPamYpqwyTvdAA48HzP81nuJyg9szPg0XYP6l0rkyiWprO7t65DiXX03ukbDg7Fx946NpkLM6Wk
 Dobw+C2erwDTCEbqgQBaxsRjGAo9sLbZ5UuYkh05V5srwL3E/V2zQ+ND+vygv3bFitJt86h0LUv
 l/F9+QlPcva4ttk0yQYx6PcoYUrCFdrOtILStR5YP1i5xv99RM8oNYCXkADkOMszWt3Q7GHIjbm
 KVEeTZeJaJ72zL6Ljq6sDIK6H0eZF6Nf/BG1GjxLmJdo7vXoSANLmNMIztz1YgtjjVSKYx0OZuz
 8OEN5u0w2HInu8NmyXCpMfRnWoJAVYSBocRKGq6lHxxCenLbanAvOWQ4jYXi/e6QbxSwXYE9igY
 h/3cfEDCFZPIN3DmEEuY6CjIN6t5EHBpubuki86WaG8DUufgpLeRI3vj6cW8DBILIxAXVtHCtjN
 tetkmnNXX9c3tDcFKP9hW9gJwEyVO2dmztBjC05pQ==
X-Received: by 2002:a05:600c:4752:b0:4a1:d41a:afc2 with SMTP id
 5b1f17b1804b1-4a1d75af1a5mr2647205e9.3.1792163056787; 
 Fri, 16 Oct 2026 08:04:16 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8a81587sm127675915e9.1.2026.10.16.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:16 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Devoogdt <thomas@devoogdt.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:11 +0200
Message-ID: <20261016150415.67929-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001075427.539773-2-thomas.devoogdt@barco.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/wpewebkit: also disable
 internal ccache in the build step
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> WK_USE_CCACHE=NO is only passed to the configure step
> (WPEWEBKIT_CONF_ENV). During the build step, ninja can run cmake again
> (e.g. when a cmake input such as toolchainfile.cmake changed), and that
> run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
> sets ccache as compiler launcher again.
> 
> That outer ccache runs without the CCACHE_BASEDIR that the toolchain
> wrapper sets for its own ccache call, so the cache keys and manifests
> contain absolute paths, and the entries only match in the same checkout
> directory.
> 
> Pass WK_USE_CCACHE=NO to the build step too.
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> Acked-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/wpewebkit/wpewebkit.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 1f5f4aa5e64..c424a3c4b92 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -24,6 +24,7 @@ WPEWEBKIT_CMAKE_BACKEND = ninja
>  # Buildroot adds support for ccache through its
>  # toolchain-wrapper, so tell wpewebkit not to mess with it.
>  WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
> +WPEWEBKIT_BUILD_ENV = WK_USE_CCACHE=NO
>  
>  WPEWEBKIT_CONF_OPTS = \
>  	-DPORT=WPE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
