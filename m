Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC63CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2AB84019;
	Fri, 15 May 2026 13:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNLz8XJFiBVo; Fri, 15 May 2026 13:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE0583F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852000;
	bh=BAfapCQSR4foGdkF7bW0lgxkPdrvUgey/IiANo1Uzqw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dX9s/0m2h6Q07UHjFvQQra2iX+6dqRX8uS22jmobzz+43zOBkDehqLG8/PODxH+cy
	 xlUZUcB24IHO06uAm1BveavnVzuJGG4KHMjvoiw8Jbxa/SgHk9gueiCXFBkf55zWTb
	 CBoBewTUMtoyV78uX0H/8JsALxZHBymvs1OPpUsttJZLeRE6RzpbyS439z3Z7fL6qO
	 eeq1sN+X6zSQE9ApwM2AnDybaxfXlGbo8gwx5kRkKtAtDkAR3i2lvLym+aQytkrEGY
	 1/53kq2rptCjHesr2gv3ZcGB3ZJTu5AriI13bGI9NsCK2AbHEvHPtcLonavD6iHnpc
	 9xPEojMaoMIHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE0583F43;
	Fri, 15 May 2026 13:33:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE4E236F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB0A41A50
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0lA7Uuh1iGA for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09AC340C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09AC340C36
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09AC340C36
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so80204365e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778851996; x=1779456796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jQ6sChZ8a2O1NTPQLhHPJMSpkI2AVIWuHL0FTPcbQZ4=;
 b=tS26oXdMOcRkPpLF/Msaxg3oBJduQ+tWbeUXfm4JvHfwlHywA4mY6Qgw5HnHklWZHr
 5cCyoemImM92ZlK1sbaQSaVgrXCaZCZ7uWh/EFob0mwJaVSuH1g1ZHc2PXeMl9sQNfCb
 WtQ7gVZLvhrFlYH6CGrY2HyHSpaf7iLolsmMZjGfM+B8hZOBR1xQoqmyF5c84AWE5MAO
 VasAqrEMP16UlwbyxUIIeRBdE4O2/tjSRKLCVh99yoql3yYnxWSev9nc8d0nxyzFXRMc
 usKuxEQLvVajdK1sS1PNq42xINHIBIn/wvyUBWaC9JDVPIy/KOD5a/RGsaI+4LmCqGD2
 AyZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/RfzpAyyvEOPZ1I0iFLdanqSbCvMvwkN59ie8huMvuhVghjBwoL8UqH2TFBCl6CSSyNaMRSt+bBus=@buildroot.org
X-Gm-Message-State: AOJu0YxHrJ3vLPY0DxWu/rpViIFwD6N4/FvN2TMHcqufrLWr4wrMUotR
 OjVI6AivbAqRlCdjB+AtH0AfuMc9E4PnPx7ZYzbWEBXTaUaET288n7ydnmdkC0XJg6zGI2ovUc8
 Rgc55
X-Gm-Gg: Acq92OHKt3u6G5eQVdkAgsQHttADWvloIh1PBG9DWDsrwptpRrtj26GJC7wdAAX4bB8
 mjCQJMjJYCC/zfLp20btbNcNhm15SOnSzEIcugBTuNm7Tcao2hnAyfPIXdyo/+gBDQcc+TJDoM9
 t39gJDXva6WngZjOqjpC/WQuFYoleg8E4e6dP2H57KeYBtVBnSxDc1DLd344zlH8dQGr8IwH/c1
 TObhJqT7mdGwBnNxW2zEMKkC6kqd0rGvz9o3+BG217Hx6rf1z3Ic4Xq8oZ+cF7gPzNclzO1UfiE
 RGpGlrWT7oWuygSaJp0u+bFca5OI3AyPdOUtyLGb40k882SFS/4tEwqjZKnCeL4tbnCBTM1Wv83
 aSMUEuY/dgwU4cmhjmcOh6BjG2rcJigISwtm7RzpyJfR4LZcqDKRfRKiJTVGkyCBl51dfATUlqJ
 TzyjNZxDW1DunGxpJ5nyVH1p9Qd+iceeCnnaug04zfmUM6
X-Received: by 2002:a05:600c:3f0f:b0:48f:99a9:bbcc with SMTP id
 5b1f17b1804b1-48fe60ecb9cmr50629995e9.10.1778851995623; 
 Fri, 15 May 2026 06:33:15 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c90b27sm67274275e9.8.2026.05.15.06.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:15 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:14 +0200
Message-ID: <20260515133314.314735-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <Z7eHWbet74QuCfJr@waldemar-brodkorb.de>
References: <Z7eHWbet74QuCfJr@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778851996; x=1779456796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQ6sChZ8a2O1NTPQLhHPJMSpkI2AVIWuHL0FTPcbQZ4=;
 b=Dy8xBbgZkRj+h6N2gLdXsCDLhbXyFTSsLId+UwcYd/k+k/lFCk9sBnT72odbuQB72F
 i1sYnPJcf7JSt4PhqT3ghqM92mW60pLJx95n840V5wChGp2ee12GzD0pQewpPySAOdQH
 yNBRB8FQTKTCXVPoiS7ueVFlAfhGzv6hOj0T9POxIIWpHHON05PwBA8o5b/GGQPyx81I
 g7xUPnv3qje9k7Z0l5Q7ctGiYknSVXVHTPEB+JUj4mpODsxyTUtDfzbKJsDxrIFbM8PA
 MNytjuc/A/5Mz48DPA/bs5Sku0/8mlHbIUAuDl/Q6+Trev01SlFev1f2qz/L5dbHQMJn
 AmBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Dy8xBbgZ
Subject: Re: [Buildroot] [PATCH] package/libpjsip: update to 2.15.1
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
> For a changelog see here:
> https://github.com/pjsip/pjproject/releases/tag/2.15.1
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x. Thanks

> ---
>  package/libpjsip/libpjsip.hash | 2 +-
>  package/libpjsip/libpjsip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> index d72e1090e3..e85d1f47b4 100644
> --- a/package/libpjsip/libpjsip.hash
> +++ b/package/libpjsip/libpjsip.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  5805c1171acab4af9684d7ad096dcb92f71fc42809852144e97e1413468c9981  pjproject-2.14.tar.gz
> +sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 8169e0dcee..69b3c1cffc 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPJSIP_VERSION = 2.14
> +LIBPJSIP_VERSION = 2.15.1
>  LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
>  LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
>  
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
