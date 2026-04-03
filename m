Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D603E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E314A608A9;
	Fri,  3 Apr 2026 10:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nGwnEq9bi7Z; Fri,  3 Apr 2026 10:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF953608A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212072;
	bh=x8F/vjmpn/2Fj+i5T6QW6UED0NAtB22vZmzMxSEnWZs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ERWQowh22S3mS1V5CeR2u/aF0wvL7tQR1D3bAbKhwHnhabQEkh3QozL1ESWC6GTtu
	 vBWpdLeeo4ARkLEIWmV6Kp+hWuI4wXqDVey6PWpeeippOKiaFxw+1ogqLC8cXYsQ7o
	 8pOCo7DzNej5RSki9Y2lohylx7+wuEp7u/mj9SsHDdKUQ6FnDqpoPJUqtd6Uhtb3cz
	 UzQGTyHt6V9S2U7vKZ6orX6lgm/QXUntUKjMnfKdxhp536LVqgZwDM/aohYmLGnVOK
	 xr4LEh6tqzfMgXb2NOPV24/5sPVBZDjmwmwXDsxtyHixOcs7GeF+YyYp9p+eIObMlX
	 yJmPBfprSEw1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF953608A8;
	Fri,  3 Apr 2026 10:27:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 843BB2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 760034020D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBNSXJade6Us for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84ACD40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84ACD40055
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84ACD40055
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:27:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso1556894f8f.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212067; x=1775816867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qhVHA2W9nFsMH+k+HYaoDSrGHHZRkkOqofNhOoRB1n4=;
 b=bGFOhDwNP4JyzBhfvCZsFUvUzmILwgtm7YvKNQDmcY3l0xEAfnrC4s/V8orXAAGUTc
 lUfzZxxWXh+mr/xrHjOkrGcA2rO+KSw+Kir0ZJEABN3yihuT189PJSU3mlLGdS42+Ggx
 dVeSDmRcsWlh40ml6BCZbTp3OZzSalcVCYibSRtfzYeBkZGyITyERqN6L1gN4YDCJAkk
 7B8X5yRaggMErfbBQHGO8OC+oACEvM1Uve/CBQ9tEspRAZG8fTPW61xvYN4FFkrjE4sk
 rK3Tosz4YBp2CIrrDwqraYwHDymZBQDr/RbqqGWUn8AG5ZyIJ2+I/no4yZ4Frc/d8Rpb
 FDFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuS0Y72YkXEb6hm4O2z+m4XNRiAVsJdQXMOIsAlAxZ6A1xys29GS+RljigQVO1fnpfXVq+jy0vM+s=@buildroot.org
X-Gm-Message-State: AOJu0YyDWdlLxOEY4nEZKUhd/CvWYHEApbWCZkjJHw+RN4a1w4juTvSu
 s+TVVHhzwO4rA8oPzEMivYJ/g1GND/HPv1e16omqLSBHGt2ez50pUI4GE1OaOxswSH+QA+qTG4H
 wU5bf4W4=
X-Gm-Gg: AeBDies8r2flAmbp1juM8noGNmo/9z7AqHrJoAY0JVtHJGFtxwR4mLs7VBzrRLnSy/k
 qJGYZgs/7NhRNMx95GKe1l2vp5iPr3E3V93uQ4fKiZ4QPVMIVrtcPZbPerPHU6IAWlSgQ+dS9Ic
 U6OJPoRvLvB3urWy2K4pm4L3D6oAHa3kpYdKRyveerTfBcq7Y0jiRWL4TPvAxtiwTYYwX6ru37j
 MHrZWqFT/IqtVVuMR+nP/5aFrgSqmj8O/nebTU6Sfx9s5c2VKk9jhNJQF4b0OWnH6fVTzy6iPAI
 8o7Ve/hXjRZOkqAesI8DWc9WRYieJkIfOoxemS4bsuDMs211yxToKdVXTxpvHG2nKN7O2zyqeP5
 53b53HQkacEPdTWGgf/N8/tdCmvnJ2Wx92AgOjWhi8g+lrYXOLIKt6Hynwdkm25plFFc7V0HKKo
 MNymEswZTXZjVBXklJWrbcwtIa2b4=
X-Received: by 2002:a05:6000:61e:b0:43d:613:33de with SMTP id
 ffacd0b85a97d-43d29294815mr3818041f8f.20.1775212067569; 
 Fri, 03 Apr 2026 03:27:47 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm17104518f8f.6.2026.04.03.03.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:27:46 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:27:46 +0200
Message-ID: <20260403102746.209751-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218204738.915516-1-giulio.benetti@benettiengineering.com>
References: <20260218204738.915516-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212067; x=1775816867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhVHA2W9nFsMH+k+HYaoDSrGHHZRkkOqofNhOoRB1n4=;
 b=VRuDA+guNJuRoN/8VdBlKlgppEscank3si889c1S6jcVAD6+QcUuVYsuofJKNAPO/r
 Nv05uWTKN5/LtkY0L1z9u1uaSAeP2UxGTP4xncSj1smFATi3cWlMd/kEgzrGZ+secPYM
 JXsOvAw9w1DQUv3Y81TL4KUjSV1OzSxBJaLu2CBrQcWVzmuyvYDdiQs++6WfGaXvLmZm
 5F8AXC9yVny9LP/TPEIrMPjKz1QcdJuYjcAsP6YdXdkdJa6JJ4OornzTiFl2wBxJH4L3
 yQYHaRJsxGs3OnYNuC8glEtUSPZ7r1K7EmE7Q4phmfKlH7k3oZh/FFuncqvm5VBWHB0Y
 4v9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VRuDA+gu
Subject: Re: [Buildroot] [PATCH] package/bind: bump version to 9.18.45
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
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.45/doc/arm/html/changelog.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index aaf3519ced..6f016a3317 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.45/bind-9.18.44.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
> +sha256  096ec94c10bc9d2ba686325660a615962d0fd6529429149acfcfb7daefaf2421  bind-9.18.45.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 041541b037..1b71bcbf66 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.44
> +BIND_VERSION = 9.18.45
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
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
