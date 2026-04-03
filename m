Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD52E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F47B81E1C;
	Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBm7TJNtd_oa; Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CFE981B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212094;
	bh=ifLR0UMZ/XoWRqaEcO1oUhaVy+qToEMbHAI5ZUoQztE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lS9a2RlKgDAEPvefD4k6e01CNWYii+19lfIvSmqe8Ots+Km0Hoh53ZeaO7uyxFxMb
	 pB+Y2dRxV+bU+uomdvUKzrnGk+llJeKlVjrssvXuXnSz7kwcBfh08FfEtIJsNFbAOm
	 0aWy4eSPpUBjy9jT3SfUKmAOaCmLrUQm2QbcW9p3cCXpBMUoqYF+NoyXY9loYON4vz
	 /Q3Uq9ZkCeZ5zfHHpasdNkaIk0WVlL37qMZt2FuN+fbFbT7OaX3dUNhf/EMTO0kF1S
	 zzwffY+fPwcDBkbIPjDjd+QVFl+JpJjCH/qRhTV55vlt9aL1PWQyo92hvhPYVYVIAD
	 RCaEzDx2ElBkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFE981B99;
	Fri,  3 Apr 2026 10:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D5B22CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F0B7610EC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UQESkXeoI1w for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72C9860EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72C9860EFC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72C9860EFC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso15727095e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212089; x=1775816889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lz8mUFo/wZJrNkfnaSxzwJ8jYw2AyZ1wl/VFehmbN6Y=;
 b=i/tMMzGSPPmtr8HXr/BfP+wSmmTMAO7R9thuAm2RytB3M7C5IFopG7JdxrzJ/zm+gR
 r5as6hAIczZ8CKyBbeItAUuw06Y7V+824VweWOYIMioxQYTN9yNMIx65yGZLTKk6SlxI
 Kfg7leppsbCPhn3554G+nxOIbVpGQMAoYCq3sFpGsRcpJlQjN+ufsfsIu6gWJqBJy6h3
 Ih31uzkOMNEIKNxGhzU/H/Pm6QEbLow84D4wKyxQoiKAgxCvk/PW4rpWNiOr2B9wXuqx
 AdfrXcliRnpCKDBWnDFSvyo6H5TcR+YPDiQ80U5OHCNP5JucaaUwN2mKvzEDlPx/afCK
 C40g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP155vN2Lt+SNDqc+mIQ5mMm0DlRL1WBiD/r+XUZpU2QSl+Z6L3nOsFT0TMdtR/5yHZ0q266pekzE=@buildroot.org
X-Gm-Message-State: AOJu0YxAlredtbo3911PFUn+0N7UKmZDpyEtZCy7cf2eAUnZFclAzjiE
 t3DOOD/JvVaxJ4/wWEe36VPiICn39ui0+ph/gXMQ+pFZ0a0RMbDin97GvsdWmmB3sDM=
X-Gm-Gg: ATEYQzx7b5on6xxuf2IvRvPp/VAuHBJ+pYNUjlJU9bvy+v9hH7nM0KNPU5z5n/wc3+/
 L0gQCFTpIEfmPw5TbZUqmSkl9+QpMfIjpY191WQ9bfZu2o8B8SoOAiyjJxxkz3lVjh3QCwxauMv
 RoU+pWvwQmo5SS4cT50UW0fsRAgo43NwjnI/tpsfl4p9RSxW0IK6+OjNojPx+LnuimNXfz0NoUc
 J6s+/3/kbeHvAhz4JY5RHk4cp0aecmZP5uwqoaCUXyHHENzpeDnOR6f05RtoJofT13H4iDOWQZf
 GGvxGeC/jNLTt7EGaIpP6dbREVpbeviHBk8Cdvh85mFv9CQYR9xyULDqy+P0JGQBAga0IvtU8ts
 nOjNESOs0Ug2kTaGxVq8oT8RzXLFojN0OgLak8Z1KqQXYDnIzXPyFTM02sRaHz4GSUttH9pI6PF
 6tOG82hLlesQXDfqk4
X-Received: by 2002:a05:600c:3546:b0:485:9a50:3370 with SMTP id
 5b1f17b1804b1-488996e1d39mr34136445e9.8.1775212089387; 
 Fri, 03 Apr 2026 03:28:09 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48895e19c10sm65647015e9.8.2026.04.03.03.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:08 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:07 +0200
Message-ID: <20260403102807.210294-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acDgfd2FRjjG4J3M@waldemar-brodkorb.de>
References: <acDgfd2FRjjG4J3M@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212089; x=1775816889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz8mUFo/wZJrNkfnaSxzwJ8jYw2AyZ1wl/VFehmbN6Y=;
 b=ge8w6ynSdt5h2WDeIh5MAmJO4U7csm/j9W/v7yJsDzvPkcFdS5P8lZ1GYCPskEJuBZ
 6uu6u+5ILczJpLu4u1b8YbVwaUpmvFKc9La2BXGXIg1K0ccQdmUsTVHrra4CqyDa3s81
 RljMqwCsUtEunqhzsl97j7qHtN+/0ItpGlvYs/e+fCLSYaze8au33dAfOE4fSXRXco9/
 IUfCHST9zN04MHyM7h5mx9bhjMowVbv8/zdghqoED3G/N//zJFEGd4gecgogRZnytdb/
 P/rdtRSbcBw+ZFh9bLti9kvS0DB0hqFZfTLGgB+QAR52JDvJ7+tNzFmZbZGg2lMlOY4W
 8Yrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ge8w6ynS
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Waldemar Brodkorb from
 zabbix
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
> I am no longer interested in zabbix.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 26f093fa39..87310f595c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3435,7 +3435,6 @@ F:	package/mksh/
>  F:	package/ruby/
>  F:	package/uclibc/
>  F:	package/uclibc-ng-test/
> -F:	package/zabbix/
>  F:	support/testing/tests/package/test_ruby.py
>  
>  N:	Will Newton <will.newton@gmail.com>
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
