Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C43CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B0681303;
	Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvhCLotiz3k9; Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C846812BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C846812BB;
	Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 090069DA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECFBF80FA9
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtqhWRMUJ-YR for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4A2180F48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A2180F48
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4A2180F48
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so11031685e9.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021686; x=1760626486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8fZAJ5SZ0wum8Q+XQfHJnXOgluEPyUuGhUtDbk818s=;
 b=sNy5N2JU+p5xvGuvNyCOenAYtIvIoKsvBfcgmopJcUr5KJgeLvI+wDaKZD+DaOyGq8
 t04zWPM+Gogv2APMv732VOiahw1bJZxj84Nr5zCPSQq/NCFTHbb57foaFqS5dDyX+a33
 obtlzm6W0SK3HiMO+qAQoLby02Jam9AVNboywkaXUZVb6dzxm23FOA8tsnY6mU+6oKh3
 s8ODUnXdJwMarCYaauX6ARppxoA67sbl7ENXG7/KCU0UnzhIRWofPUNYpmsIkDpVzLxG
 DODD0VGXIdGunAtFXHbYBSyerE2fYzmy3RlALRu3E4/Psmf/Y3ziOpcJ1EJAYcEwYbxv
 Yuug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNsBLya+Ntl+5vJvVTev4cG+Cwl0oOR3BnW3YO/LwML+2tDvQre7PVNB/rzOSg0hca7zEpXO43z4k=@buildroot.org
X-Gm-Message-State: AOJu0Yy57a/fS80JMgmuZtuk6XIK1Le5RFcix3AxYdRQfkSw/tTSyWfK
 3emCHQTwpHtE9jMdlmw9agzOB5kOfTQkug3Swzqfr6gR/l5fBpAcs4/0cllfpglXGbTjmEGQnRp
 Zn5O9
X-Gm-Gg: ASbGncuINJvmtGB29PDcTshYzZJlj4iOzh9kXW5OJhY6+Ew/4T05iHA6YZBxf+gYLGO
 LvM9cFvp0jqNfxTef2Ni9V3D695F55H16fDu80tYmkmLFYQPDD8Rviwpxea+dq6HTgYhG7OwJyg
 0T2XzEXeyNbg09GezmDv+jSvbX6Y8v6cD3IZenmbiVzsYBzh/vEcobUEe4KzWLa28XVtwcR/9f9
 l+34wZDeDh9jKzsTZv13ksy+x2HUkrj3RSjYmQE+pEVihIeHlFb4CsMcEagwXPoPkxJSFCPeS/H
 tYswcCj91mYeYJnCuFM6ZITqXUcuV9Q1e4NNS6GZZr0f3YseqiVZ6Ls7Kt/MKVwyR/8zw4kna4H
 wbUH17Nd+Egq2UMvJ5I+ZWrpRQaaC6km2jbWrJlf9
X-Google-Smtp-Source: AGHT+IG3wnN3jQbBrqRFUZ08bQAm7UigajM7PxhpiL5pQi53ieTlm2IrO06L8pfLRGQKHwaZR8u3Yw==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr80824865e9.16.1760021685861; 
 Thu, 09 Oct 2025 07:54:45 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab633cdasm38675135e9.9.2025.10.09.07.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:45 -0700 (PDT)
To: Neal Frager <neal.frager@amd.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:45 +0200
Message-ID: <20251009145445.482473-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003092514.3686293-1-neal.frager@amd.com>
References: <20251003092514.3686293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021686; x=1760626486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8fZAJ5SZ0wum8Q+XQfHJnXOgluEPyUuGhUtDbk818s=;
 b=XlZ48e/l0v6Hhr+aPSIlhykHQD3EmFBW0PpbP1/fY+Cfmh2ZDJayPkhsIrBAhuPdH8
 vJDM764Z+fojc7KXmTETT/6HzqTzcVMTkvT1diePHPVKeTLHB3B9R1C+fMkb4q0kJhP+
 AiHvnoAGL4am87ldibN3Ri439v3sf2eg/5nflDVIRb1FeCgaVCNf/2VR16lsfuXKLEQK
 PyCiHnYBgcL0x1vlm9+Lw94JnDhYVWdXM6Jf2OV5fyOY/z276CR+r4KzLS1vlGgXLkGK
 SETVZ9YibyL6hp3sgVnuhJ7dvlvlszDqVZ81n6c82B8mClSWV1y6kkjriP+2wgTPLK0b
 GVDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XlZ48e/l
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal/post-image: remove
 unnecessary mkdir
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
> The board/versal/post-image.sh script has an unnecessary mkdir command:
> mkdir -p "${BINARIES_DIR}"
> 
> Just above the command, the script is making a symlink for the Linux DTB in
> the ${BINARIES_DIR}, so if the ${BINARIES_DIR} did not already exist with
> images inside, the script would fail regardless of whether this mkdir is
> executed or not.
> 
> For this reason, remove the mkdir call from the script because it is not
> necessary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  board/versal/post-image.sh | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
> index b5ce2e3f0c..3242e4384a 100755
> --- a/board/versal/post-image.sh
> +++ b/board/versal/post-image.sh
> @@ -12,7 +12,6 @@ FIRST_DT=$(sed -nr \
>  
>  BOARD_DIR="$(dirname "$0")"
>  
> -mkdir -p "${BINARIES_DIR}"
>  cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
>  	the_ROM_image:
>  	{
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
