Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EC9FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8C384E42;
	Fri, 24 Apr 2026 16:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx2ZL_K3Ar6h; Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A95384E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048040;
	bh=4s18y+hAsdM/Cwjg7GGAfRuxSkqLbKRmhalKfTAekwI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rYnlb1ooV+HVav04CrxAqOacikeHh+Nmcvn2v1RYBnjZdd4a2ywLnyLy6/kODj72E
	 EZHn8F76D7MITnmGv/Aknalx0d326+WFk7UorPH+wrHxWlpZB+gnDrJsY7soVHPepU
	 UY17FwJr7WIFXFc3SsKtVnQGJHzUZJKVK2XQborlz64ptp9Mw8fBRcMORVZu4ijU8K
	 7eza+hOIiK/VshpzHp8rIWwLcjhcyYzY0RqbrdyIec18nJqSi9Zxj7Ft5TUp1b28ms
	 CjS2djES0FjecJ4BhyJ70VwswvO+7yQhuF2jeLcaGIWpInzdf5DDYRxk/cszBnVAVw
	 6XqhCqoL7IGKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A95384E05;
	Fri, 24 Apr 2026 16:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4122206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 962174295F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFYFui2267uV for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E9D14295A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E9D14295A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E9D14295A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso62481825e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048035; x=1777652835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hdDlHROfs6FrChznvkvBA/uE0FwYKujrCeVnR7H9CVw=;
 b=TfQRiLNvb5zI0IVJRI1yVzzpIJ/SDOc6XMTzM+kfOteOFMZDCsHg4zRb0nvThEih6f
 ZACvnuzpjdpLsgZiLg8dlg/KO3vnSXI0lmVjZhvhmOEmVkUVbCWk/QAIIqFvzL9oS4BE
 pb1s7XHiU15BhBQHm7b+tF4sgmnrLQAS4SVOIqS2nIp/glGveer1bHDd5OBhsWC7uXo1
 5TZH/lIoOZ/Ymb54J1qhr25JTUMlLhgKH7X9FPXh8zCfLUQspZYvu16XMdPCoxidVQ/s
 FtV3WpCVBWr934u+lHaMj+BnrTSxicP7py/ilkn0ml82Khijq97UvObMb7TFuhJfCLKf
 FpZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NeGcV0HGGlNCT0RmC5AW+K683vlhj14MdER2v1Ff2LCw8aPfWjifl8b51hW0tpsFIA4KGJMR3HPc=@buildroot.org
X-Gm-Message-State: AOJu0YwvsCakaSGY6Gu1tgLE3UvPz5iiUuwz11WfKpuJ7WoxKWmVxsPT
 vppSi21R13pz9zLusIUihqJoPPxdhWOzn04MTbalWwSfbQ+POMICHLREnrfYM6CX2Wg=
X-Gm-Gg: AeBDiesbW8HFQTc7/o/qGefqel0AXFguCA2u7nTJ4HrTrBDqK6fQ1HK7ee9sx1t3A6f
 w8MWb6XItDF/3r/QXC5TbD5qOaBT2D8PCEtzxUzRFHyHFBL8nTBze8ACZaVViHYt+m4cQbMrFKy
 6iUlQbfqEg6E5JDb79hOzpYNoV/kRl51i1ac5d5B6v1mzkM0eqVMtT+RxQpy1j/voYe+arPsHw+
 31DFmKyZ4SP9ZR37bRkfH31zOGQya+9morXHgy6tDbO8MHuzMZjDIVYKfagpAlTmsBT4KGb7k2H
 sML1CkleXY/3OpbB5H4xzaPjbvOPoZonjfIHfTIuGcBi2PtFnUnrLbiuksOajiGBd8lbyKp4s01
 KH5ulxiZTEnajaY8yoWMXW/7kTdRHk6c48jVjawT89Se0lLsZbsAor72JsfYd5veunju7apxUvd
 M8/2HR090auDLb/cYbuBW545GOC36DoIwDm1rT
X-Received: by 2002:a05:600d:8496:10b0:489:a4:e555 with SMTP id
 5b1f17b1804b1-48900a4e79fmr263913995e9.21.1777048035564; 
 Fri, 24 Apr 2026 09:27:15 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc10777csm680029815e9.8.2026.04.24.09.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:15 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:14 +0200
Message-ID: <20260424162714.161585-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260405104659.51959-1-ju.o@free.fr>
References: <20260405104659.51959-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048035; x=1777652835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdDlHROfs6FrChznvkvBA/uE0FwYKujrCeVnR7H9CVw=;
 b=Hn4RlaWwVdMvvSqceENMnyYtnsfiTUtI7ehEnDCErDgLhU5lMC2oWRuwXgHb7Uf7Zx
 8/XUpLEsjdfAafSL8Yg3r4i6jBFI9CDV53UbOLwSWhE5feN38WnaVlz/zOqX+dce5h/W
 pW87vFt7g71bt4rskAmVIoQMzeSgCSV4bFfMxKj84aUY1AX2zyHuZh+3wPkdssS9iUHu
 1bly2Of8rzgwNXFIiJTuj/RjHr/So7NfgGr/NRZy9lB0FmYYl+PcJe7fEM94emuoHm4h
 JzyDoB+vwlySWC+sdzPs4ImN1+BuuSd0la9iE/jGWOd8uyc78tW7f1K6XzsrmDsu+mE2
 ekyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Hn4RlaWw
Subject: Re: [Buildroot] [PATCH 1/1] package/mkpasswd: add dependency to
 host-libxcrypt
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
> The host-mkpasswd package needs the <crypt.h> header file installed
> on the host. This file was initially provided by the libc headers,
> as part of its libcrypt implementation. libcrypt was removed in
> glibc 2.39. Most Linux distributions continued to ship a libcrypt
> replacement such as libxcrypt in their default installation.
> 
> Some mainstream Linux distribution (such as Debian testing) are
> now starting to remove this libcrypt and <crypt.h> header from their
> default image (of development files).
> 
> In that case, host-mkpasswd is failing to build with the error:
> 
>     /buildroot/output/build/host-mkpasswd/mkpasswd.c:54:10: fatal error: crypt.h: No such file or directory
> 
> The issue can be reproduced by adapting the Buildroot Docker file,
> by setting "FROM debian:testing-20260316" in [1] and removing
> the build of tar.
> 
> Note: debian 13 (for example Docker tag trixie-20260316) still
> includes the libcrypt-dev package by default, which provides crypt.h.
> 
> In Buildroot, there is already the host-heimdal and host-systemd
> packages requiring host-libxcrypt. Also, the host-libxcrypt is a
> small standalone package. For those reasons, instead of adding
> the Buildroot prerequisite on the user host to provide a libcrypt
> implementation, this commit simply add the package dependency to
> host-libxcrypt, to make sure it will work in all situations.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/docker/Dockerfile#L11
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/mkpasswd/mkpasswd.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mkpasswd/mkpasswd.mk b/package/mkpasswd/mkpasswd.mk
> index c1117ef65c..6ab6419824 100644
> --- a/package/mkpasswd/mkpasswd.mk
> +++ b/package/mkpasswd/mkpasswd.mk
> @@ -9,6 +9,8 @@
>  # at revision 5a0f08500fa51608b6d3b73ee338be38c692eadb
>  HOST_MKPASSWD_LICENSE = GPL-2.0+
>  
> +HOST_MKPASSWD_DEPENDENCIES = host-libxcrypt
> +
>  define HOST_MKPASSWD_EXTRACT_CMDS
>  	cp $(HOST_MKPASSWD_PKGDIR)/*.c $(HOST_MKPASSWD_PKGDIR)/*.h $(@D)
>  endef
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
