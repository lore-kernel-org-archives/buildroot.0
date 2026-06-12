Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA8DCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 859AC61367;
	Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rct3O7BobFCN; Fri, 12 Jun 2026 11:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D51A61364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264296;
	bh=vuHnV2xahkQwgmoSkjtHQApUrJWUS3QcY2SrHZ2IXT0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F2k2BoZsM3HqgKpurCHIKy23xO05K8weBZk9NfAR46lkvi2S4xdsc6YFmwPoeWgVt
	 g8jkLAngG79Z2k+0qVGkVgnfjdL2onPa/WLGL/wjTTjwqbuAm81kbQ2cj6cD9drFrU
	 B9KsvgeO7qpkrlu4MxigJOF2fnUhePIP6lNU9iZpZV9CRnQefGtn9kHIZaRFsDQ5zH
	 6f29KKqgikGZKOUJsdR11ldtojZgYBJVAkGjAGHrVxsBA7o7aUj9KeCSZkkFxL2hHh
	 Xt9DBMt4m2Lvg+toQ7rYXT5JCWYCJ9n3XdmHxhW6kpG022Ap0CZg2fYRiTzYWFWpn6
	 I13dwjGMFW25Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D51A61364;
	Fri, 12 Jun 2026 11:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E3F12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A2FC8330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EisrDLP2pUvR for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86707832EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86707832EA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86707832EA
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso663036f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264285; x=1781869085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8G2bxo384epyE31tk3c08Ax+xx8zImrUtzmahTsXIcE=;
 b=Gko2o2Fr3Yi0cRPElSMY2UsncIbYT43fLJE5Ozo9M422lvm0LEoAOzipKixFh+MJEu
 6w8K9IUjPkq+vyHmu5kYTGoKvW/CjRdSSykFYtGtFKhA5F2VbVkQjsAGq4yEbPhDDA/d
 aLu7c4K72Bp+AQEmdqKokReY3GMrPrW3r6s2ANPYOiZQB7yqf/fOebxzwjiEauTWBnXe
 41e9KHFKCIyGi5GwFCEsNxrc3Vd+ncawOMcn7K95u5/TBNEoqeqKxLCjZkFSYV+/chJB
 6O5HBqThq9DDmvu9t/JbxpV81RBIB3Rqv9bdy79JD7fwRvWRj8THZrXeVvkhbpZyBU7j
 PmEw==
X-Gm-Message-State: AOJu0YyhHcLqFoBf1eZYk408Fd15DBjZcKHcZVKgVZTyg6ESR1uE3HiA
 vL0BAS1hqxH349vFtnIw6751s2hwZIttMJV00wglViq9/jDUECPt1GbkotkNWesXi2DDih0P6fN
 WhgUj
X-Gm-Gg: Acq92OH4Bg8lgLMSY/X6jtosy7wGevjH0QRXyRJpre9rcsKRW4H319wNqX/UMq/zvRo
 zfSaOXWhHn/uEkpj4sYTUddTuPVCZ9NnfWWUrjtp8if/aYAE2LKFKY43/Qa4FUU2PeM7D8MSMOd
 MyNhpwj5P+koWtFGVeZ1aPHbdCNuKH8COlOxckPBS0IhbN01jgNPszUKH06M6s9lwwYi+4mZZfd
 /uCucNLDFVmuwdDypHpf5aGpPHURFfUiwpqlig+te7o9wHzwKNdGI6LnADxLneKjdI24L0+GVnW
 iVF9y4h+8z2YNHM0YX79tWVxfMjO5+dC1rxeOkNUMZS9PAv/SVW+aTYxG4IgTk8JsnsP23JoRjZ
 8glVZLMaE/lvhnLpjn1GF2PTZyuduOjZ2vgo8PPwCipmz5+eXewlNtwsu8nsGE/8v2iRpZbgIk1
 TjeIrqOji7SkLIIlv6x+MHpbsDNg==
X-Received: by 2002:a05:6000:469b:b0:45e:f5bf:6c25 with SMTP id
 ffacd0b85a97d-4606dba1fa9mr2722067f8f.32.1781264285277; 
 Fri, 12 Jun 2026 04:38:05 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2637ccsm4892335f8f.6.2026.06.12.04.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:04 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:04 +0200
Message-ID: <20260612113804.252847-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124101.287936-1-thomas.perale@mind.be>
References: <20260602124101.287936-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264285; x=1781869085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8G2bxo384epyE31tk3c08Ax+xx8zImrUtzmahTsXIcE=;
 b=S/BCK7jlSIzByVRtD4pfoaSnBj2OQ0i3O5dJgcCQwVPS8ntly0SlA+QuEc+9YzIRRg
 Gb9PptSuv69fTA005mRTXoikQd8xTVgq/854dBLcrHD6JOqkslwvr5tIxCNbZLmfXqaI
 ZwVMLEvGe7jerEAcqsZW8OyjYBPnDu4RcsX2ZstCXcyP9Ye/3g8WDQ4fR4ZnMruS+Ty1
 OKIXJh1vVKunaMnAWC6wEMc1Wfj9TuS1PKSwVQVANP6PRmZqdaWNunhlAVcJrSezGF+y
 XVhZmDi5Y+Skuct3J50xgW03iwqLTZwTItnDOZGTW3xMX4EqMEMDh8CttFsEq7KRl9Zb
 ml6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S/BCK7jl
Subject: Re: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-good: add
 CPE
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
> The CPE 'freedesktop:gst-plugins-good' is correct for this package [1].
> 
> Also used in conjunction of 'gstreamer:gstreamer', see the package
> vulnerability history [2].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-46470
> [2] https://security-tracker.debian.org/tracker/source-package/gst-plugins-good1.0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index cd1b9f45b9..1b48d83c8b 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -9,6 +9,8 @@ GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
>  GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
>  GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
>  GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
> +GST1_PLUGINS_GOOD_CPE_ID_VENDOR = freedesktop
> +GST1_PLUGINS_GOOD_CPE_ID_PRODUCT = gst-plugins-good
>  
>  GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>  GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
