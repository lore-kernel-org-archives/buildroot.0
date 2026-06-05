Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FDCD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8772961145;
	Fri,  5 Jun 2026 12:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K273gAO1KoB; Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42AE6112C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663844;
	bh=O66BPU1P2QSP5gXah5sMQ7tXlsGZ7H2r+ePSR8n2aS8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S+IbvdutZgas73aorHCKnkv1BFZ6o9MR8vh/BHWL+fbXa1B0zwWxiaGKtmpKkiycS
	 qE/XMaCFD0qVSTBCAsIy2TVIBZzDrmORcMev1E1zLkp6guxkOt+Pa1HTbEN3FEd6Zn
	 U6LfqD7j895vwucTCRAAc673MFO2S0etiOhpM6sJvQ+siTKlJaBNt3cY7cEjp2c/sb
	 q+je1HWY64Pply1qsleI10nV/P/kiWF4y4kKgYnM5d2JOiohvlnOFve7FGK08TIHX1
	 2L0iN1eOJnExMSCrViIp4+kxfkgR8WxHFhuYY7xPE9xxexXA+vZ3hLKHxRInnIrqdL
	 0q78fTfRv3pOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42AE6112C;
	Fri,  5 Jun 2026 12:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E24C388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62CDF61122
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I32O13epmzka for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 566D1610E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566D1610E5
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 566D1610E5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso1127490f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663837; x=1781268637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DJLQlcJvheAjkE+tSvieah0TDSvDkt+QuRJk+79+Cvo=;
 b=E2tfKw/yVNHSA74p1vqJ7BSIYfq2HIRUBKGIE1NyP9u46J+gHwM/YbgBYdbKldHFZ3
 367aDJzhF49m79LM4ytRzwaeGKS25kuz1TYWdIZ/2X9zs2uNUpoO2gMgzBOzB+XUFvWs
 QSLM5ZcgNKplcC9VjArzzOUR0rdRt5ehDOls6HA/XOTyX/nZ+mvaYHT2Z5l8JjX3mh8T
 byZ7AgqLlpg82UduDcvhIl5tR8tD5zFfAWnovMc2OT76ePUuSyKv5nC2vWodc+La0ren
 ypWup5WR9aVaZ07QInXIVblOEpQHtujSDR1g1urMwVfyvN6tmFPd0ctQGVhWgqPh6aE9
 IiKQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/u3EoVTMBoQKaO07DebpD1NVmI+KRA82E9op3aiveN6kfkKGdRRbKEqxyDfc7iYJ8d67fnU2GIwN8=@buildroot.org
X-Gm-Message-State: AOJu0YxFXcPEreE6rq9R+BSEUucAXjNNkakdaSmi8woYOQHdpC18SNn/
 jNG87H1K3HsyqBJ2YxaLKjME1AgLBJud23/C9F24YdnrkZM9FkZozgNMaTY4Ot0cGZfZefv1ZPT
 vF+rX
X-Gm-Gg: Acq92OEKhgX6mPJ7qsOTk0ZMjtPDSw8ck8PVPt3GoKWDG+CT5eHZa6IZcpZzclbXBvL
 r5Obq0hLVVnDx4WixhI6GvQHnwk03AqW+YaRVyJj/R69n6zoJ0QCZXXya5/bs9ZT5eTu/TCUHvw
 oaQ2xKDITRVmsV/DGAAxq4NvF7n4JhN9oXHisiU5UVW5u+aNdwiWiPH26Kdls8KTH3QBF1/ySft
 BbRYZw146xVlAj9HeenvuScTZn8jXvKabU1IC9InTdS3vKnR2IfYGPak5V+BmWtTGU59EqRE81w
 7luR+BJyt41JgaSppaDZiDUxd5a1yJAIymT1lWYdgsqGrsoVSsf061qSSXY5wJsiGYGAgO3uvXA
 acFK8ibSLRycPILTgNylFGWF2dX+3V921nB2i9mcDrLGzmmH59eaf7KiXWvWlBc3FmMwVWW96Hr
 gLImWizICU/bgGyHQbVNcYBi453w==
X-Received: by 2002:adf:f089:0:b0:45e:f381:cd7f with SMTP id
 ffacd0b85a97d-460304f09eamr4008976f8f.5.1780663837369; 
 Fri, 05 Jun 2026 05:50:37 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fb24sm26784017f8f.34.2026.06.05.05.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:37 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:36 +0200
Message-ID: <20260605125036.273936-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260523083556.51535-1-bernd@kuhls.net>
References: <20260523083556.51535-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663837; x=1781268637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJLQlcJvheAjkE+tSvieah0TDSvDkt+QuRJk+79+Cvo=;
 b=E6OyVvOcosPpDbXFb+44kpTuQDrzswuxVPS6zpwqZOCVRrp0YGkUzDNMplfIb6qvik
 R7UGTooPya2sSj7lyVaPJIgUpA+ZGRRneTKeY9BCySuvzy0PqQAP4k8G/IYVH8IMPSPW
 uB3IVjznumCzJpdL/g+ObY8y4QoZVUZ3Dfmlcvk3wZGnfHXXCupMFfbw73KUcamcRQ+1
 v1XYuY9OlX1gjmEu3mqC21KGPeVkGDREUZFy6GeQySOthSIN/FcRUXmkgeErHw4uYSjm
 oh+hL6Lma887Qge8aVV6p16gmzng/YMJElo9zv7KT6OWBtaG37wlnp8phWElW0tIUrH8
 F18g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E6OyVvOc
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: security bump version to
 1.30.2
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
> https://nginx.org/en/CHANGES-1.30
> 
> https://nginx.org/en/security_advisories.html
> 
> 1.30.2: Fixes CVE-2026-9256
> 1.30.1: Fixes CVE-2026-42926, CVE-2026-42945, CVE-2026-42946,
> CVE-2026-42934, CVE-2026-40460 & CVE-2026-40701.
> 
> Updated license hash due to copyright year bump:
> https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/nginx/nginx.hash | 4 ++--
>  package/nginx/nginx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 1d11937987..5055b4bd57 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
> +sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
>  # License files, locally calculated
> -sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
> +sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index a8b7ee7319..3f6aecebef 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.28.3
> +NGINX_VERSION = 1.30.2
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
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
