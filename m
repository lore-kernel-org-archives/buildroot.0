Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CFC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D48811CE;
	Fri, 10 Jul 2026 13:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgVwr9cW3TnZ; Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBDE811C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691534;
	bh=FAT6i+dpYLbsBn1QE4QckuT7RF6O8tFM2RZ6XJfjzrY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NOHBvGwZf1S13C2nyXMQlS9HtC63i70WalDcPIlyeolfJrR9bYcjmv0FG3K+alRoI
	 Ro5s2KoIoauMH+erMC0DvIF6sEmgqrvzszM9BVN7psnxGLuqytlS15WjfJbxC2y1Cq
	 VC4pWIh0dvHyqhoO4JEeZO3rQTkGPaRiRVnUJijiLAFGc1mbens6rvEFc2gcwFUHCF
	 rni/IAbBGB1VfXHO2kr+Mm0aYMK+IMTK27bLyBrpwGOdiOBF0pRrHVIMNrOOSi/eqt
	 FsPOQCUPJedG3ZAIJ4Rv7+wyzsnvgyUh86M31FBM80OXW9W3bWMOx95+g811Ju1ZJ8
	 zeDvfyClr2Nyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBDE811C7;
	Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61F532FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53C1A81195
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUL_mRdCKraB for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46AD8811C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AD8811C7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46AD8811C7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47df6a5202bso575839f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691528; x=1784296328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VSjzCbH1lfiypbtZrcpRrEoWQWa6xnw6woYBkB47ImM=;
 b=SsVZtRnDoS/Li1AEoopvnXLPBGcm0BdnffyMbfNEsmMK8Jq+yurgwIfC3HqFIzyakF
 M7JJX8j9JIrL6Bq26RutRFccRxSuX9ug/HIfPXGvC4tRK0Hyaq/72ZS/89nBA9UcwfN6
 TIR4RAyAcMFNair8UwM52/MM4j3E2YFXNau8z7g/wnMMw1jEwRXX/WLl3bVrpby2IOjw
 mCi8bohO3FQUTitT1zwJO4nAtDTKJDaha+uJDUfKfQCKZE9rFBMgm11LRa5akfySCA1T
 1iXlv7ymzWafyhQVPrA/qyv6GVlTjjMhgPZOZ+aF8rjhpXMEb0a9l5bgXgm0Zx/kYVl1
 ZB8g==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2ptugYuEFtzb3pM8fl16jMZW6ITV5iEIT/AxudXLWCNDiNgfgDi2A7zuusiRVf/Dm/gO68sKtPmQ=@buildroot.org
X-Gm-Message-State: AOJu0YwL3izXoiJIaAZsJ8tDSXQTQkhyJV7lN7Hv+Md09q9Ro92mRQYP
 sEJWmF4bezTyKcGMz5DgxxSn4CbwTq94DxFCf2SARNbdPtD9bJXN3MOR+N9Eu0rfRNw=
X-Gm-Gg: AfdE7clQWsmEFYSDP01EpSH4rb7R6r26h0sX2p9RiXJOXWFv/U+glkUtnd1Ur83GIWR
 LKVo9WCqG7r68k2xOlVBAK55N96m9T1XslycV3giRnCLDtVA00J+A3bHZ2wTj5t9wJ2pVAouN4g
 blB58famZ5GRuh8JiRZhbHsJG1WGu3RtLPwNh/+QLCGCMlGmdGfcflNJm2smDJaILVdPZbZk7D0
 g3OzV6LswzVUMWSn93docELUhrqI1C2HAAs0zgSx2B41DMQPwSGpSzmY5k6334cLRXUIAojO+/q
 ju4BRC/xPPl1WnzCxGknC49FnO3jCJk2JOc7FwG1dmlKYaQGI7cSwkTkWAXP+on1FchJ8wh9BP2
 AdZWHClQcOiaSgCLCAwfvGO0oCqCuYBpebi/4HZ7TBVaFSmAV8/5DnzP/S/Ru/EMyNrw1gfC3Ar
 IAVvZjuA==
X-Received: by 2002:adf:f008:0:b0:47e:f4c:508e with SMTP id
 ffacd0b85a97d-47e0f4c5128mr4839952f8f.46.1783691528217; 
 Fri, 10 Jul 2026 06:52:08 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f213e8sm58510624f8f.34.2026.07.10.06.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:07 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:07 +0200
Message-ID: <20260710135207.760272-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6f000416ccf3c83ade242ea0619c1df08aa9af64.1782886248.git.yann.morin@orange.com>
References: <6f000416ccf3c83ade242ea0619c1df08aa9af64.1782886248.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691528; x=1784296328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VSjzCbH1lfiypbtZrcpRrEoWQWa6xnw6woYBkB47ImM=;
 b=cMEV2XmZpfotNNq1Vz8KgCXN02xG6JRl4iNwqnk3dd690ndc8plcS+nONMCATKbMZb
 YXYK3hMqWJ24qrN5681aETwO59yLSevG1nd7NZkuSHQB9cRoAybVUFY/XHEnlHiatknP
 xykyMRCEfAlFFE8bwh+XdXbLeQ0HMbeXKW3E0Bo1Ujcq9TgXkiUcIxclRjlMx27WR3Z9
 jmXmy5IRbqrRbjeeIBX65PYcK5VAx709fnPmApUYVfebyOw+mclZVZ75PNsnwTmbU5Rv
 SH0cqbvivVTDCLjCs+j4LjHXAIIirUvtFXP9h96gTZW6qu7IuWbsynoaLW4/40/aQKjB
 XRpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cMEV2XmZ
Subject: Re: [Buildroot] [PATCH] package/shadow: needs host-pkgconf
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
> Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
> required pkgconfig to find libbsd.
> 
> Add a dependency on host-kgconf.
> 
> Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> 

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Can be backported to all maintenance branches still active, as the
> oldest already contain shadow >= 4.14.0, and so are affected.
> ---
>  package/shadow/shadow.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> index cf05fc1bdc..5f9b69ef88 100644
> --- a/package/shadow/shadow.mk
> +++ b/package/shadow/shadow.mk
> @@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
>  SHADOW_LICENSE = BSD-3-Clause
>  SHADOW_LICENSE_FILES = COPYING
>  SHADOW_CPE_ID_VENDOR = debian
> -SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>  
> +SHADOW_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
>  SHADOW_CONF_OPTS = \
>  	--disable-man \
>  	--without-btrfs \
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
