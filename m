Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE7DCD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EFA41F06;
	Fri,  5 Jun 2026 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4G6_6QC6IYF; Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C8241F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663826;
	bh=9c8YsTnS86XM9DBvxEaQgpvUiDvvn1BUFiqhsiFOXDw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jnCuDVKdbbh27HHkHJtuGpPV9ebUfFA3WCHpSv4pQYCbIaCur9X4uxZwZTLPdLxV+
	 paqDXTgcOaJVSUUVSFqUUL7JTWQDw2W54+zsIq6T9+9c7AUlcL7/0GXrZOU7rpwZHk
	 j/k+1O6YEtrCaq/NVMw2U8MIQZNoHvZKFepcSk3ffxSkpa3lIIZfnqq0cPPx5CkwNA
	 e6H4y0WkxSDRe+pMpiXBwBLn7su0TwN69ZlmU3B2rZLLfunQdRNYGjvXGKfP1V4fYp
	 5+qWZujJyK/hnclVzJk68g09d/kUTOAezixvedtxxDLYmvqDyWP2UmjbeiDm/VcWD1
	 51OzpwYOasCtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C8241F4E;
	Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC90AF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C245740381
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P28e294X5AmJ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF0894037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF0894037E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF0894037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-bdb3fd39045so236364566b.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663819; x=1781268619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B7IMUXY0Stw9WKcJxs4+H/1CjFCQBaIwARUrFn05v0A=;
 b=E596Tl5f6YDpoJ8opymQkPH2NmoKpgiTfaDqkTaJcpJOY6w4Z9CaeHdaM7cyC3H3Df
 zVx9Rl/TdOpp2dOl+BcRpadOc4Db+/kGHm1JCp62CHpSdESnGQXsfbfLiOEg8FQ0xCTE
 CQpaFeac4mCULupG7vrYI66aiUGTtgrtgmIgPGhKMez7C9R7EEMZVrsBBTAMdhApqMwU
 8i26wtGVARK8ZmBMRmGWQkj9bG4oOgWHpfywZSIbRlziZUOqMchBXJljW2uUvzPF12v1
 YUpJ9btND2yzCQ9aArlUwEdENUYxZXaOFCwz4uRHiSD12JIF83bG+o6k24H7pAwJ8X/H
 RfRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9UtSASNnbZ/P3I9H7PyZZ8NeYLTvmM0SsIRM1sERoqAFIJ64Ck55sJqtO8VFVz7at6t0v6hR8I7M0=@buildroot.org
X-Gm-Message-State: AOJu0Yxvqa3Fx0FKCAQE0YMVVD3iQwcq67C6KXLW5sBf1s0+k79rygY1
 jeoI7ejkKmYQcwdy7aoAv0qwEEyGWAgnipUfbyXPzWrSqcsHaen8j6fi2iXKE+elSgOXtPY7E78
 wJ7Zr
X-Gm-Gg: Acq92OEHopQwziLtGFJuz+Ax5b+or+8AFIPTo3bf3JBjX0GGL71XEtqvMji67/Nruqc
 j8xQnR/y6VEm35A39Vh0QI/uFrBy3zOPUUbpOqQsCIz7Qxfn2TZS/8ujxMaqmgxH+FWPirNne8K
 2FMp+vycOYI3+0ld8Vd08qmY04UqC6v4AS/VPz0GBnhuLssSShMuERhlkSauWZQoRH8QXIFkYpA
 cIIhU4nAlHOr9ghWyHTcKKv5G5ftXj8gRGr37kW7muLIjkvcUoYMZLPl7konONrOZTqo4mKWvKE
 6tyvs9Al00zWf8SE68A9vPtZgs99FKEMIFF3j4iuRZrUCmLx9ETv8gYFZRGY59PPhX9zxrpUYzv
 PISOlTX9QMREpUIHmei7Hv9MnldQsA9vl+QMaoAt2ykpb68GSe2A9PU+Q+6bSgIc0mR/rtcSZEj
 hh59a0iyBwclpD4fKQJEl8eaKBYQ==
X-Received: by 2002:a17:906:f59f:b0:bd4:8b66:334f with SMTP id
 a640c23a62f3a-bf372931c66mr176817266b.33.1780663818616; 
 Fri, 05 Jun 2026 05:50:18 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0559f35c2sm455389366b.61.2026.06.05.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:18 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:17 +0200
Message-ID: <20260605125017.272975-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407-generate-cyclonedx-br-v1-1-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-1-03c45ccba2ed@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663819; x=1781268619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7IMUXY0Stw9WKcJxs4+H/1CjFCQBaIwARUrFn05v0A=;
 b=VLcEIiVbm6JdDwhuAE5UakdkKRc8pjv/5ItieVVEzB8kRsrt4DXob69Os5u7fdleqT
 qVB8ehVlaUh3psCtW0bDl6DKoBYWywe36mYNE3tIP2uj2PfnBHr026Ng+dmxHTU0DTQj
 HBY5yAPw/ck/ZM0jSWfFdYuDvhGCRvl0IgR4IiOsa8DgmS5qEcnNznKUMX80M/ZbLxD/
 vu3IC4QcpJaM0wQ3tse1s1tSr/8rQ34CMkVBgQ2elbN4pzWoeVvW7BSfb6MjzQGUn0Ps
 VEWo5yuYOq3SJFNYFsHih/FBPgLSrYqz026ySQzcEdZfIMA7yEPc1toRcmjcDAyDzwYg
 jiPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VLcEIiVb
Subject: Re: [Buildroot] [PATCH 1/4] utils/generate-cyclonedx: remove
 "support" for bz2 and gzip compressed patches
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
> Buildroot-local patches can only be suffixed by .patch, otherwise they
> either need to be downloaded via <PKG>_PATCH or manually applied via
> $(APPLY_PATCHES) in a <PKG>_{PRE,POST}_PATCH_HOOKS like in
> linux/linux.mk. In the former case, they are then listed in the
> show-info output with a full URL (prefixed by '<PKG>_SITE_METHOD+'). In
> the latter case, they are simply not listed at all at the moment.
> 
> By removing "support" for those compressed patches, we can avoid the bz2
> dependency and can now use Buildroot's host-python3 package without
> BR2_PACKAGE_HOST_PYTHON3_BZIP2 to run utils/generate-cyclonedx (though
> the initial downloading of the SPDX schema in JSON format doesn't work
> yet, though that is something that one can handle with a simple
> wget/curl to the appropriate place).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  utils/generate-cyclonedx | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 35198a47cf..d17aa805b7 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -9,8 +9,6 @@
>  
>  
>  import argparse
> -import bz2
> -import gzip
>  import json
>  import os
>  from pathlib import Path
> @@ -177,7 +175,7 @@ def patch_retrieve_header(content: str) -> str:
>  
>  
>  def read_patch_file(patch_path: Path) -> str:
> -    """Read the content of a patch file, handling compression.
> +    """Read the content of a patch file.
>  
>      Args:
>          patch_path (Path): Patch path.
> @@ -185,16 +183,8 @@ def read_patch_file(patch_path: Path) -> str:
>      Returns:
>          str: Patch content.
>      """
> -    if patch_path.suffix == ".gz":
> -        f = gzip.open(patch_path, mode="rt")
> -    elif patch_path.suffix == ".bz":
> -        f = bz2.open(patch_path, mode="rt")
> -    else:
> -        f = open(patch_path)
> -
> -    content = f.read()
> -    f.close()
> -    return content
> +    with open(patch_path) as f:
> +        return f.read()
>  
>  
>  def cyclonedx_patches(patch_list: list[str]):
> 
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
