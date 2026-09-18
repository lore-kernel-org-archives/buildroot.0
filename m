Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FC2C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CC260E83;
	Fri, 18 Sep 2026 13:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hhN6V3OlUQe; Fri, 18 Sep 2026 13:09:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CD06260E79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736976;
	b=KlKhxt7CAg8JblYvhQeFaIIdfAZEartLPIN5Ts2numCxhmTbwtvsycMPxApLednJL5qN
	 38QwAvj1/R2lbSvMnJSCCsMR2Mey5aYTxWntaJR9uMT/howZjXlGusxdZePpA3hGjrHik
	 SCfOjy6E1hMqNswiY1XKMLZYMIQzm0bPfqDQlmeqq8hyCs3IpCuD0zoc2WETlWUbYyK4q
	 xJt67P/BbpaDwlw715soM9XlOLhlEjyKoPfkfa0xrcPiVjj1yEHDva/wv3CLyVM4yNKdu
	 8AjT8hhNpSdEpYxuc4uhBp0mKzA2jEsiuJ93tZgmLX38xS/4mEjp8lwIe42nzaLZUIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xyR0QjQJxcfC1wB5lzeEyJXVAgwy6owjW2rA5oFAOeA=;
	b=VGj2hmUjwIoBj2J3MPxq84grn5hLieI7pwn+7SBNkgJPHqlBtRbcLqWT47NR/730rByD
	 AIZcH3fkNbn3/brP4u4JfiVKuodV6fFNvWP6yDsiwvdOysudQ5c62Hyb8Cq608q7cMlNe
	 zyY/a8RAxxcx+2VL2Wbujw3m9cVWOkLy70OhTjCmjwgv2LzGLF2dPXC3kBV6wOFlssk9w
	 PBSGn2iyQawP3d0EIyJO4fNcjC82em8PYXX0BgyBQb/VE0vkj2NEQPwSFGvbfZVtxvVPI
	 /UN8Ex0RHZ+1u3whgWjKLIlg0TELZvfLwRioxXQXSkXfbtAbNWWHk4kmaCy6RNJjYCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736976;
	bh=xyR0QjQJxcfC1wB5lzeEyJXVAgwy6owjW2rA5oFAOeA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=abYFoQ54YVX0z1c+oGncq08RLUf4ZkwZd1h6V5uN2EB3rRmSFyK8JiDKa78azUTpV
	 0WJmDQ1RXe15RMQE0sDunH90RSLvGCoWenoSFRhRTa2qvmkuIvxu3aeOibvY+bnuSW
	 0M0TaTVwMhhQhQ3J5OXFP1RTifYjVnmpOHSOBK6jWSfzex9S0qN3APDqE/I/RZ6F+w
	 teQmUw/9xMFn/YFWAKYdnf6lei4lu0HkrGUY2812knLBmlQrbe4GGuuxklE1WzU2K9
	 YO4ZV+mxPmQ5yjCkkCwauPqFX1y4L1H787dxNIho7Fif4ux97Rcz3SrkXHbqkPE2yE
	 0jMczgMMKJstQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD06260E79;
	Fri, 18 Sep 2026 13:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77918224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68FFB60FAF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUw0az261G83 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1289360E42
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736972;
 b=J5i4y1cskTU/wwHIMdvdegaNNlHm5xACL1KFWo2vTeS9jVJVQbok3lNKLqqkmoqH9nxh
 AGkwQNmKPUJ9JUzvBweJD6j0zyMo+LA3t4Isk8GNPKWzBQzlf+SWE9qrZ/mzQoOyK+FXO
 LI8aJ5m/uPU7TC4ayba4v19TeBky+fXH1Fw8M2+mz/EOYyhtpo1Nl5PtP+e7RQyRJveep
 RLHaCeMZJQ5NiSvHF466Xa/UnHhVKQ7h9wFbDX7pXtGglsGQh3lBkBgTKtbPGZLqOYAXP
 UEOPy2R6eWIUCfs/pu3CEcZZb7FqZas1+uKXsaeHyMyYIGNF7WA8gVAxiNNsOIXX61Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736972;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=dW0NLbGMzI3CPB3GXm75IZnXMlyufyFbs749F1RUd04=;
 b=q5einhPoeAyOYn/560U/cNboYKFnzwECAaM0PzduzgJ2qZx2ZLcuxFrMH/u5p/5woihe
 RWOcg4lIS22uY/1VqhLpCr/bhkMSiXJW6O1b0GIPW2Mzs6nzbjiT4KS0wV1lO/OD9mcM2
 QtzlldovvOEM2bzFz5Unrvwk3MQxuWxg8lhFCnROToN7wvzaQqPgbhicMTHZS7aKbcF5k
 0DTP8FU4EKLtmCfTnV4gTf4VbGfjfhlpJPso2CxUVaOEQ+FLBCkMxa1+A9VMTZWKLK2A+
 Tz8aqQT1JUSzCnWIosa2hrRW+rJeSlyTQ0d21OxBiBRry1bvEOvmehj4gvy8LcVwXWg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BUkkn8xn; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1289360E42
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:09:31 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so6086035e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736970; x=1790341770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dW0NLbGMzI3CPB3GXm75IZnXMlyufyFbs749F1RUd04=;
 b=DnGWWXMF+p7OWgRxumYr2s3DX9beLHsbHab1qAJ2Mju4GmjuE7eeCLh1BypGmRfQlH
 WCp5Kqkw4WhZSBDCpIfYu/GtkUz4ZoQfc9ftmSxwvHY1Pur2a+rHiUtGiLFLXCsPjtG5
 ucB6eefiv8TCIlcQupJEZrnCQpXMhptAbTeCXxOk7DC4g+IZuNWBnjmkQTH+pmke+CqP
 lswb2m+tbjl3kDqgYazOBNNKYoUIQo7SpNDe5KMexYyuHjbnc/offgMy4StH+RjXrWS2
 g/cnJPay46TpE5EmYfLL9ARA7etJJIm56EDKTg16xx6bUN2SaFyRxb+90UWxdxZGOqja
 EONw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlu8Bsi+x/FkHrzIJ6kUCY+MLWThNVImbagL/GIFlOToFVeNnircBLD1FyLJFTDd1sXW1EFIsF2Z8=@buildroot.org
X-Gm-Message-State: AFuF++lrsWPzSpNReXMo8r1DduyPQZltsk1wCpd9OJHTbH/3/E9Ycf0D
 nd8/yqUTTH6iXJ3XVM+UGKhbcrUK9fw5hM5v2uNrjtz392aDU8iayKUfus7erVy58Wa3ZhYEb9t
 BT4zG
X-Gm-Gg: AYBFou0JtngqJS+u1nbv9+wEhF5iBJCnbKgp6LBZxS59m4fxDEkLjVtIyzqWYzwdNM7
 kDIINc16yjl7ADDevGt7DFGawhivC8OdqeM+cy1x91PbEJdo6ZP1JFp5wUdI9M44hrkkusX3tFp
 V8NqiVsiRT+B22PWCrQ/CyxCCi+XY+BCT7wgl9eSTT5OncljWgtpRXekNDDNVwxZFqWNWUDvF3w
 xO0HhQPNnrxRgkXSI9dKbeZgX53dUWBtknfWwDoDJQmni/2KJDhGldPOMV5EQSgY0e9kPZ//+75
 jPqT4XUOZTdr2/MY45njHKvIsdVYkLcoJ9Jet/LNfOWHvL217k+PCyDFqvjO0imWOYmU1gAtSFz
 QHFrkgziTnPrKolUB+KFf9k3NMvD+Z0dvBUNSuDunhj/3d0owJP/3yCHQPI+83kkXcRm4wT+IqL
 qZDdnlToefyorEMqUljHGeIBl8A2RaJKQuJKczTwgUitUKqgtDRVTMvct+0YpA8dB/
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id
 5b1f17b1804b1-49fc584fee0mr32248265e9.26.1789736969706; 
 Fri, 18 Sep 2026 06:09:29 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd216028sm154787195e9.7.2026.09.18.06.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:09:29 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:09:28 +0200
Message-ID: <20260918130928.163363-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
References: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pocketpy: fix build without
 threads
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
> pocketpy enables thread support by default (PK_ENABLE_THREADS=ON) and
> then requires Threads from cmake, which fails on toolchains without
> thread support:
> 
>   CMake Error at /usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
>     Could NOT find Threads (missing: Threads_FOUND)
> 
> Thread support is optional, so enable it only when the toolchain
> provides threads.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.08.x. Thanks

> ---
>  package/pocketpy/pocketpy.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
> index 23789dd62028..c1ae075d3897 100644
> --- a/package/pocketpy/pocketpy.mk
> +++ b/package/pocketpy/pocketpy.mk
> @@ -12,6 +12,12 @@ POCKETPY_INSTALL_STAGING = YES
>  
>  POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=ON
> +else
> +POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=OFF
> +endif
> +
>  define POCKETPY_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
>  endef
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
