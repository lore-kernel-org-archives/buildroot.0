Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E59CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B203582D45;
	Fri,  5 Jun 2026 12:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew0RDH4M_S7e; Fri,  5 Jun 2026 12:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7EEB82D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663848;
	bh=nnB0QhRVIV/XncL6XlkkRMR7/ggyfBxxOYhFRgUlVyE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LcedZPvYVhVDR1pOJ06WgF+DhJxROt6WVY0LWBfgs4eEFIKjGhfsYmeSGp8lxw5rC
	 3pPIy1KTXFLMkHev3txzai7LILrk+7JuCZqnzY+JRf1wF7dDptvc4wuwDdGOJa2unx
	 C30l3R2ahSOTXDip7MtYHRixxDOyslC1xMt2AmhVIal6TJuBx4hpUCmuqSnYzk7Q41
	 4tZ7sW3RgW35S1XsFRevaLk+XcHTHmWZJJWcvQv2IR1mMiK7ijZHPDzzV9wcc4SlZy
	 RUJLSG8OpMLrC3ysPNVQIt9N2eYQLW6ASoyqxFFC9kxsagzM+rVvVbFjlvd6PL8t5V
	 6unxsz5KjVlhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7EEB82D17;
	Fri,  5 Jun 2026 12:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83B84F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75F704037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyM_fDBIFieG for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5398A4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5398A4037E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5398A4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so16507765e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663841; x=1781268641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IUk1p3ATv0XzaPvVTm2TPlZOKmm109Zwir0pNRgGx2o=;
 b=P5+XZhf0pf/Ak72YD5t35aGGGe8Q6EJwOrViw8Hxy12akdl5b/dfuid3qn4UL5RIAp
 M6D92h9sXvS6ERlMTgbZKN55PzNufVed8HoRWS5qU3WOqFwoZhDl0j/2QFGpaR3tyIMJ
 OhDOrnzuv+WdPsPkZi+ftT4I67g30ju5wag+MvhldAPwVb5+zWe4wnHie4xIBXX803c+
 yei48XKjihOnYSjyBylAHHo88aen9+ek6r9UCowXvGzzgb2tYM7kb15aPWKhlonEHmXB
 Yct85KaVEw6/tcE9N++IfBc6UaIW4+pnktdcyb8FVliKS0mneSrmQdEQqcs11SRVrX7p
 EXPw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9I4LDdUuYbc4Kdk4YTewFFcuRkbG1PRnXwsLXBtXSzSrwiEWDdqH+3Fjh3WrCmuyCLGr9K87MgvGU=@buildroot.org
X-Gm-Message-State: AOJu0YxSomXy/C250sPekgfDQPKKm1hFa+UMjbQ4uANek6HzCDQAC7eF
 W6JW8enrYVFJUGyVz7JkkWDyuQF3pvmv3IyBKqzPBnyppuhmumBDCIxdjnc3XWoXQfQ=
X-Gm-Gg: Acq92OHmZ87WMbWCxlXQykFIFRLR9GMJfmguzj90oYJ87ZbsFdsd/ROuwiiOYGjbhX7
 bTI9AMLiAcxRFkzTwBFEut2+nBGX+SnyDY7r3e4VIxg5fpAkNB7v5TxW6rIn7mjwQux0lpPL2OH
 Q29iXzVebJHzQMhDol5rkJq1gD+7lhj26IQKzjOyWuTGx//AiYs//SlHfvZCAkEGmp/suvNZZ5k
 y7Vxnpjm2Rgcik6+w0xPB8I09PbQ2hCXw0xeSJ6YaDMbNlQelWbUMOEyi1TbVU5IdzdRBg1gljr
 Aa2v04K+W8AOlGI3ICOcfG8h5m7L5jPB2w1pnVM60u15vydKplPSYUf7m+RlIIhPIuttOO67Ah9
 0JoRToQlx7d0lwE2m5cwdpQKLlu++0EE10derukfH3prpeq+A+qswZ4s1AIaFJM7uD1G+I2nlNG
 I/78r2ypW8OVaVVsXiq1lKtJBlRg==
X-Received: by 2002:a05:600c:3f0e:b0:490:bb45:79ef with SMTP id
 5b1f17b1804b1-490c2508a5emr64368645e9.0.1780663841551; 
 Fri, 05 Jun 2026 05:50:41 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2c9ebeesm37825655e9.0.2026.06.05.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:41 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:40 +0200
Message-ID: <20260605125040.274103-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526200641.939539-1-bernd@kuhls.net>
References: <20260526200641.939539-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663841; x=1781268641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUk1p3ATv0XzaPvVTm2TPlZOKmm109Zwir0pNRgGx2o=;
 b=cHsn/M2PlH8zVQw4j52QMboDhhVQPONkFH6E59xziI0xvOXV4Coe19AXebPh1GAT3S
 HmuOgW3oGo7WAnFXX+zr8uihPlYd/PwwnxUk0liA9f7V0Jboy/WFNDGNDNyqKjKQK32H
 lqFzBRBLVYxEfwzLDI7gXJg8brmEejVh79Qa6fqhzoutayXSYnRq1PoVysTBALqUdBy9
 zvjkphy73Zm0r2fuvKdHWKnDRPPPxtd0Jrp3+sLGJJa7IW+cGZ1qGegkc68yzb3oBk1x
 0VLF69SkQfzdZ2rpmZhBKDlHf1kQnicxNR3yoFSSxEPE1+cmCMga2LCbgJwRIzg/NkSK
 NfhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cHsn/M2P
Subject: Re: [Buildroot] [PATCH 1/4] package/libde265: link with libatomic
 if needed
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
> Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
> package to version 1.0.18 which introduced build errors on sparc:
> 
> /home/autobuild/autobuild/instance-21/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/15.2.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  ../libde265/libde265.so.0.1.12: undefined reference to
>  `__atomic_fetch_add_4'
> 
> Fixes:
> https://autobuild.buildroot.net/results/605/605dc19e86f113662cc35fe055c64c52698d70b4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744
> 
>  package/libde265/libde265.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index 8c2fa4a3c3..d7e3df83ca 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -11,4 +11,9 @@ LIBDE265_LICENSE_FILES = COPYING
>  LIBDE265_CPE_ID_VENDOR = struktur
>  LIBDE265_INSTALL_STAGING = YES
>  
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> +endif
> +
>  $(eval $(cmake-package))
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
