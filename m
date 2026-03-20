Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C674A10987A2
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA5861B7D;
	Fri, 20 Mar 2026 15:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ceoub474f-Wd; Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DAE61B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022108;
	bh=6HQv4ojNXTee0y5ufwMZPVb022yv0nSP5JoHimvzCLA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZnWWLiZTBPKzu8JKLrvnGP2aHYlGZ1qPjyzQ+p50OIzuchSwi+ZEwB9uPK38PYo5U
	 laMIjByo8qGIzDAAMmpQpKKC5EaarsMJ873LP9WqE10VJgzLXw/yPZHez2Ab9yB8LS
	 uc0rs58WsPsAiw/7meE/ZVhhDDzEBzxyEdJ5IT27vr+Ebd42p3TnA46sHCBaZp13Rg
	 aVV5idusjHrOLeD2Isykz1/231QbxR61MVQDu2BjBfkJEIJJebdqXaIBMRpfJV0hyM
	 rTmM5tnXoossn8ZO9SKl1kWIYfxFgc6OXL0WIbhauAZ8D5gM3Q6sqCkjyR1WI6GtTO
	 nsy1wd7pNr15A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DAE61B86;
	Fri, 20 Mar 2026 15:55:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ABCF1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C63E41E6F
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrPhiw5isK3Q for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0E8441E81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0E8441E81
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0E8441E81
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso18425195e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022103; x=1774626903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jwgCM/tdjiWbMt/wBZzcpm31hHXqwr6JiX7JWuExrKo=;
 b=YK3eAMvX300wicRMW5jYAU7p1YgHtWu9C+XXz73cUgMcWo7b16BjqluRcu3D3x9i/1
 9opBofkbebysmmAioWKVNWuR2qnM5t/pdO9EyMSwFuRBFs+/ihDBt2kdwmYBl780mI/A
 ndgoF/bYwtYUvnE/YQSEEM2PbF3Y91B0wafI4JxA4+EXcUQSFz/lUPezFw/nR5ZLsAry
 heA1kw18eCyvOR4TbTVnIdZ20omADSUH34ZRvWCcWKtNeyTdn5ReKVLq7Ck+O4HsVs26
 hgYxZYlSDO3nGKJDiHpxGxxt/4UVM5aNiOFoyPPZtclKFyBKBQYy+EE1VAqL/jBeHvoZ
 q1cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8BtdIz9ko4WDJ7X+7AJiAjYLdips3Z13cD+hzyatvJqs/el6igU4gxLy6BD8p7LCs2oSFwcxVvKs=@buildroot.org
X-Gm-Message-State: AOJu0YyMBAdHjBLMRp/h/pMHq941iIllhGJTnCFasd1X4U1csANWohkD
 BJBv9TsQQoR37LZxp63KBsjRRXhsYU7xwpgK0JYvAabaLuHOqfZq6SMbixYClruXuEfZ2zg8tjK
 zpXnI8jg=
X-Gm-Gg: ATEYQzzkd9zrK2qNwcTNWdIjC1J7WwmRS1WpAHRLY66Cd7MHl4sM9wbve2JpvItQ9pV
 XU3Wn5Zp8En3q2coWgJMKTM2lJRkivx8Iakat+6kONBzPYc7RoOpmcPMPzrM/ybFF50HXCJ/GH7
 WnL1QSFO+lm36qDFjQdAdWS4SlaGlWQOQroiY7jvfeQCulf65uGrmPMpB+htvG5XbuxZk29ABkK
 KUASLetThbG9UqMNxWlfcm2rhcn2jwWqfBAdhnPscw/pHtBWxXVXdsrhGEO8WLAh6Qu4lapnswG
 uvElB8A7vxwSieCuQWOUoIwI8JCJyM7PoRQXJJayCmVv+EN5PGF5AdoCP7xHoFeqoUvpu+NQxmc
 3PVouhfsgzJhUuKE1JsaxtCdA64YWkeJ1/p0HM3RsyfH6Wggj9Sh1yNE11cStk9lJFTyAVrrcIa
 3A6JBgjYjIPdD0cFhn+SmEsVPlaqI=
X-Received: by 2002:a05:600c:c10b:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-486ff0307d3mr41725565e9.25.1774022102861; 
 Fri, 20 Mar 2026 08:55:02 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe82ae69sm66440945e9.9.2026.03.20.08.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:02 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:02 +0100
Message-ID: <20260320155502.176473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <194a25b4dce8f83d709dec1003427c8a1f39d71a.1770155657.git.yann.morin.1998@free.fr>
References: <194a25b4dce8f83d709dec1003427c8a1f39d71a.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022103; x=1774626903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwgCM/tdjiWbMt/wBZzcpm31hHXqwr6JiX7JWuExrKo=;
 b=QM+pUnHiYwJrh93/NdzTfNoMHSSV1seh+GBWP+SRgwbb/HGMh3+VLnG6ckSi8KWq7x
 +VIt0/dAjnBm1g2alyAwY7q7rVnsiIO4APRoqBrCEJ4CI/M8/FR60uXgNhcetDhIsiAo
 KM6pph9ocdF2qCvLhLjZDmicHa9AyGU8ptym2TswqDnpggRLAmOQiAvV4O5ech2L1gYS
 s62lfQOpoQXdduHpPIL+uvpRp5yq8gKYSSBgqtsodjkEqcmkV2saIBI2u3ndCC0ur9rT
 uxQTVhNwnRP+htdmOyWG/Io0WB+3l3rLEf/aXlrUAnc8Zd7toFLas6r5Zd0W+G/ykL2A
 Bf/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QM+pUnHi
Subject: Re: [Buildroot] [PATCH 2/3 v4] support/br2-external: fix remaining
 shellcheck errors
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
> Boring changes: either do what shellcheck suggested, or comment why we
> don't want to fix the code.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .checkpackageignore          |  1 -
>  support/scripts/br2-external | 11 ++++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 16a0d5b511..67e531512e 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1085,7 +1085,6 @@ support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Up
>  support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
>  support/misc/relocate-sdk.sh Shellcheck
>  support/scripts/apply-patches.sh Shellcheck
> -support/scripts/br2-external Shellcheck
>  support/scripts/check-bin-arch Shellcheck
>  support/scripts/check-host-rpath Shellcheck
>  support/scripts/expunge-gconv-modules Shellcheck
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 6d4fc1a791..474feaded7 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -34,6 +34,7 @@ main() {
>          error "Cannot create output directory '%s'\n" "${outputdir}"
>      fi
>  
> +    # shellcheck disable=SC2068  # We do want to split on spaces
>      do_validate "${outputdir}" ${@//:/ }
>      do_mk "${outputdir}"
>      do_kconfig "${outputdir}"
> @@ -71,7 +72,7 @@ do_validate_one() {
>      if [ ! -d "${br2_ext}" ]; then
>          error "'%s': no such file or directory\n" "${br2_ext}"
>      fi
> -    if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
> +    if [ ! -r "${br2_ext}" ] || [ ! -x "${br2_ext}" ]; then
>          error "'%s': permission denied\n" "${br2_ext}"
>      fi
>      if [ ! -f "${br2_ext}/external.desc" ]; then
> @@ -106,9 +107,9 @@ do_validate_one() {
>      br2_ext="$( cd "${br2_ext}"; pwd )"
>      br2_ver="$( support/scripts/setlocalversion "${br2_ext}" )"
>      BR2_EXT_NAMES+=( "${br2_name}" )
> -    eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
> -    eval BR2_EXT_VERS_${br2_name}="\"\${br2_ver}\""
> -    eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
> +    eval "BR2_EXT_PATHS_${br2_name}=\"\${br2_ext}\""
> +    eval "BR2_EXT_VERS_${br2_name}=\"\${br2_ver}\""
> +    eval "BR2_EXT_DESCS_${br2_name}=\"\${br2_desc:-\${br2_name}}\""
>  }
>  
>  # Generate the .mk snippet that defines makefile variables
> @@ -272,7 +273,7 @@ do_kconfig() {
>      printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
>  }
>  
> +# shellcheck disable=SC2059  # fmt *is* a format
>  error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
>  
> -my_name="${0##*/}"
>  main "${@}"
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
