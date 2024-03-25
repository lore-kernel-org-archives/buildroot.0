Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85EEC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33EB81E2B;
	Mon, 25 Mar 2024 09:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx25Raeaow13; Mon, 25 Mar 2024 09:22:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1971B81E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1971B81E65;
	Mon, 25 Mar 2024 09:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D0661BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B5260862
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2WRyhGfWTV0 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3D956084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D956084A
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3D956084A
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:21:56 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so4333512e87.1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 02:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711358514; x=1711963314;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C3UkHpxrfvPWje4YZepwlBDjeDXLFKWapVOxBVUg/4k=;
 b=oJL/RyhgzjiXshehNbUFcPyZn1D6X7nFbvJ70EUX89BU9T/A3YbDu1G5W7YitCQd6a
 h/oxnGBQMNg2nS4NWK1bY5JoXMsXcXTyckVHKHUkxx5/3/BIrqq4/GAvOowltvig0NG1
 X+gjclv/4NTnUHvNcoDeJGF3WOxcg81skEiYhgnL926QGnGt1GcqH4D7Dmu+TzQHLoCm
 T8YZV5y28jb4T1Jti71r+zFPhhJl3UKZDtJEFm3QQHEoHMEv6YaEaG4ppcp0/QVtMYeZ
 jFy8A3MdJ4tgr44xeUNuyv7LiY1x3cCVddK52BoQ0/5cLgEyKV5E7xmfxCdMUUeNpsFi
 sTGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAxbovPVewabchV0IsJvBchlDGUMP4Ke4Wf0gDe0OShqCyoV+0FbO066y/c33NgsgEvj3QJBvc3FDyLLuYeVnjrtTCCF8ZMQ==
X-Gm-Message-State: AOJu0YwragMS8DVCB+Iryzhng+gHr+DSosdZ4xp+Dq2tGjsjAKKGP/EG
 ClZXwGvXT4PyHeZozcWcBr+mo7ZYkMUDOqlStgggmV5Q6mYyVPSGUhZtspVPnYeG63TfG2wE6uV
 9
X-Google-Smtp-Source: AGHT+IEH0/ZobBE6T5q9yijGcTeVfkFFGepAFaJqTOXVHdQvRzPHbq7a+D7xNH5PppKJr3y+Vq0fiA==
X-Received: by 2002:a05:6512:34ca:b0:513:d6d9:b0e7 with SMTP id
 w10-20020a05651234ca00b00513d6d9b0e7mr4136303lfr.28.1711358513732; 
 Mon, 25 Mar 2024 02:21:53 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b004147f151bc3sm7872453wms.7.2024.03.25.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 02:21:53 -0700 (PDT)
Message-ID: <ba0e3db1-740f-4982-9814-0e282f6a301d@mind.be>
Date: Mon, 25 Mar 2024 10:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240325064813.2004530-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240325064813.2004530-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711358514; x=1711963314; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C3UkHpxrfvPWje4YZepwlBDjeDXLFKWapVOxBVUg/4k=;
 b=GggfXng8DoFCd0xc7/lg316IZzjbzad4Y77kkEHi4fsm8Y/XSAF0WFaOP7Yi9jnr99
 li9dp2blte+JqPWsJ0nJyp+XYNBoEYvZEsL0gDMi2pm0Cfo4eSr7fjVipL7njkHD/sZa
 Jaonp2Dom5xXL3owBv8TV8UYt6G4HDkxoiGxuterBOCfPeptf/e8UgeBJdo9AuB9QmB0
 AlHCM5Hv6utoTpR8iNbakw0F+suEVkKJOHfIVA3vMLkZq4Adw2C3UjBLIx/GDvDH9Dlb
 s0T+ICYYcxbBaRO0V6/G70L3EC2CAiJ9SAawzQ2lBbKEvPt7kdiJe3Zz87Ui2QdshfWB
 bdWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GggfXng8
Subject: Re: [Buildroot] [PATCH] package/doc-asciidoc.mk: unbreak docs logic
 after pkgdir change
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2024 07:48, Peter Korsgaard wrote:
> Commit 748fc4be21e (package/pkg-utils.mk: remove trailing slash in pkgdir
> definition) broke the docs generation logic:
> 
> make manual-html
>>>>    Preparing the manual sources...
>>>>    Generating HTML manual...
> a2x: ERROR: missing ASCIIDOC_FILE: /home/peko/source/buildroot/output/build/docs/manual/manual.adoc
> 
> make: *** [docs/manual/manual.mk:12: /home/peko/source/buildroot/output/docs/manual/manual.html] Error 1
> 
> As it now ends up with the .adoc file one level below
> (../docs/manual/manual/manual.adoc).  The reason is that the pkgdir macro is
> used to define $(2)_DOCDIR, which is passed to rsync:
> 
> rsync -a docs/manual /home/peko/source/buildroot/output/build/docs/manual
> 
> Fix it by appending a / to the rsync arguments like we do elsewhere.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  I had checked that the change was OK for the manual as well, but without 
actually testing (which is obviously stupid), and I had forgotten about rsync's 
special treatment of a trailing slash in the source path. Thanks for fixing it!

  Regards,
  Arnout

> ---
>   package/doc-asciidoc.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 40c9a725d1..d6ecd1e30e 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -155,7 +155,7 @@ $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
>   $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
>   	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
>   	$$(Q)mkdir -p $$(@D)
> -	$$(Q)rsync -a $$($(2)_DOCDIR) $$(@D)
> +	$$(Q)rsync -a $$($(2)_DOCDIR)/ $$(@D)/
>   	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
>   
>   .PHONY: $(1)-prepare-sources
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
