Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13731CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C097260ADF;
	Tue,  7 Oct 2025 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kwCanm8qRmz; Tue,  7 Oct 2025 20:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E363660AE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E363660AE1;
	Tue,  7 Oct 2025 20:07:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4890119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E3A40A72
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGrmdz5r4ZVj for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB0B140A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0B140A63
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB0B140A63
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:07:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso44362925e9.0
 for <buildroot@buildroot.org>; Tue, 07 Oct 2025 13:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759867661; x=1760472461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIeRFoRuvTc/uKLXd+Fb2oW6eKWrIKoHUxE+BEjEBPI=;
 b=duQXPMWRLdjfS2tfkOvk7D36XJ0D6EkzDKdTATikV5z7Jdvdd42bbBcAkcMQ5KI0t4
 2O3eVE4uoxmLInh9Xrm/l6fHDD55SKnniEZdg4+LGAJApxbDWKXm1Zx5+2KOSm+sFeKx
 X12UJ+k5AUzNK2CIIJOSdRmfuNds6FIAO/zugHxt41gW+WXEERUhBv2tJoecSsL5LaRT
 kqepICQGs5GUnh8E2RPTb1M+9D0cDAv4G59Hd5BJabIU6KK8fUrIBMEAMQN/vMoHTH/R
 H2jRm4Z4DGbFfcVXGrzswJkx2nGOTk+29QM2Mc7enHnsviNjtuxqsGWNtExQPPVUhPEY
 KNbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB6VFNr1nR1wck1U8Ki+HFRNFoEmov4pdftL6GuMZWZV1ZtR0418HsoDGJRl2ulfgr42tWCOIAPLc=@buildroot.org
X-Gm-Message-State: AOJu0Yy3L49pS+To7j4F99/2qxnvGWOIF15Nbh4DUz7fk8b7Gbr30k6L
 zt6iHbcB626//Xq1hp/ULtcgb9ZhC3GTdGKQdjMh859H29x8CDuMR1HrvKiENXbYNXIG0Gvqt6J
 dvMVH
X-Gm-Gg: ASbGnctGCEG0Io9L1L8LzXygCOJghOx+nPIuIWcImbSZ7aB4IBGNDYO3K6P5FuNImyP
 xC+IbapdDHOyyAW5R06/4PjViFtFiFaknoLS/nNiA4cfwEqmFTVOuO2glfCCoevxkQPUHmkg8bb
 XtNmRUPpeJU51hi4IfkbSDZl6ACQNkPTP24n56ua6mJSYGcAPAY2Am5vjg73oANP9KPUn16VqBh
 sjeAV/28hqofE1uYCe3p/nakSSUMsznBmznBApuRpIpNq6sGzHPn+tUQxlxDd7TI3ZBgKCpWYDq
 0b8gy//Hwj0dBDOYFEBnDYWNmYWwooCBeSdeMCmt8FNz4R3aWKCHext+SDgXcQrFCAe2nrasSl0
 okIi8hoLVmbzpoIBVDGm6IX6frvGc9bI2Nms4zTZv
X-Google-Smtp-Source: AGHT+IHnowVRAaOwLNvC7vs2J4cv1DjyXIRCaKTy3OZBz/Fumsf+dd5MeCcsVHQQuIixT5eDw0JlbA==
X-Received: by 2002:a05:600c:37cd:b0:46e:6d5f:f6c with SMTP id
 5b1f17b1804b1-46fa9a8c2ecmr6605925e9.3.1759867661543; 
 Tue, 07 Oct 2025 13:07:41 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d6fb41sm6807075e9.17.2025.10.07.13.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 13:07:41 -0700 (PDT)
To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Nevo Hed <nhed+github@starry.com>
Date: Tue,  7 Oct 2025 22:07:40 +0200
Message-ID: <20251007200740.152121-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007174036.1178955-1-nhed+buildroot@starry.com>
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759867661; x=1760472461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIeRFoRuvTc/uKLXd+Fb2oW6eKWrIKoHUxE+BEjEBPI=;
 b=GeXLpV4yH08SxgYU/gyU/wC8eJMi1Xy21Im4E+9mnMgBevVaSAViJRrv2fWuHa34Us
 4e9KUqT3d0udFRYM1gk7IDeJkGprvt2KF3rgwseancdYgYSz6IWfiTSCsvv+mTFYLakj
 u69+5DeXMPXaCkt5MZLKnFAyYFn3Dy/oR/ZWP7FcwZ7dAwj/Sqn1KPdfFmLYGVqIRQR0
 v+DsGjKUbnh7pVkZ9baMRaP3rObaUy8YaYeasNvP1akq+GhCE87WwHuTyLcCp7xakswe
 Gdk6fLAMxKgbvI9fyKcZKzMM7TAViGwsgxmooico7FOwGaHeDm4Sr2b0PA8pvW3Gwn6K
 rU4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GeXLpV4y
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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
> Having mutables as default args has unexpected behaviors.
> br2_parse_deps_recursively had a default arg `deps` initialized to the
> empty list (`[]`) except that on subsequent calls from `main` deps would
> already be populated from prior components.

Hi, thanks for the bug fix !

Reviewed-by: Thomas Perale <thomas.perale@mind.be>

> ---
>  utils/generate-cyclonedx | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 60983ac1ea..7d3ef57ab3 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -238,7 +238,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>  
>  
> -def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
> +def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=None):
>      """Parse dependencies from the show-info output. This function will
>      recursively collect all dependencies, and return a list where each dependency
>      is stated at most once.
> @@ -258,6 +258,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
>      Returns:
>          list: A list of dependencies of the 'ref' package.
>      """
> +    if deps is None:
> +        deps = []
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
>          if dep not in deps:
>              if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
