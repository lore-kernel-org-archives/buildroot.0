Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47951CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E218422FE;
	Fri, 29 May 2026 08:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CC49VwzyCyHt; Fri, 29 May 2026 08:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BEBD422FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043412;
	bh=aoCJ7ftJj8StzjG0YecJvxic/T0eo5Kz6PkJypk01Nw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d/+YWBSGAOSzn5TXu6+KLk0XGm5Ja5KntM+vTN21KCqAkmptqgC0luJMwNw0HJ4Ki
	 u9+lpfJh22LcAAdv5q1u5XN+VQUhITlT7RIo3yX6hQihqLUP4vgVOfv9iNJsrnlt65
	 T2ZAeh8PvGSzz3xOIuTGi66yIjFbF4qgWddtfM7OJKCSGOomhxJ7zY5bNC4EXVlyPH
	 er2fG/SuTE2UK8pzg4nIHcUMyGXJd+aZR+vD71puoI20U5nteoovOzHPYLGhM2yIVM
	 CKzY2Wsh/rmAcW3RRYwqs07rFihKuNe+aeLZGMfkjv6sPzyIN+CBE1KFB4Qcs5xijm
	 /l53qMiwMcxQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BEBD422FF;
	Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1000A28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3833842B8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hEuJB0S7u1P for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD2F1842B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD2F1842B6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD2F1842B6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:06 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so62555945e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043405; x=1780648205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VNOtqprFNW+HmTYzQj1MGtljd5GAZnb28z4BZCcnu/s=;
 b=tT4qBUmbkwgKzWwBHzbvEkjrKT2/XiszveJorec/nP2JdFP9KmM/ghbnnesU85lynj
 coBHHhqbxpRhx/N3B0cHFN33FcXOPXaTIY+eDWP2ODlwM+W4bIXrxqt0eX8gYYGqORzE
 FyVaxU8LCoKwFWIqyeG7s2j02nRWGp5AMBVhMZ++recKzVYlknhOd5J+rLvHsNMkglZy
 TC3ryHpN5FgSsKBWwWsezk8kGsW0YAWx+vEwlXNfornK66Fa7vp0mx22iuwAcL2IlO7v
 nNmDSGtqKFo5qO3JsY8hnh4Eo/k0hLuof8RA9ZmeoQ3dgt6PrVghET/uHesrZPUSoai+
 XArQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cVdb4OSLhf0Irl1Idv3mky8fTVK78iuvITGDaHEQzLhRwa7lruT9P1eMluLwJldFnubV4DpIXzbU=@buildroot.org
X-Gm-Message-State: AOJu0Yykn/UiFs3yUkSVaz9sd87q6dmRa9iHquVvpKMIlU6lc+WG4Qts
 078VwDz0e0tDHsv0UwSs2AZJiBYCt1eGqKvGrjaFTwQ8lAbAjl9DLK9EEWmZGqsDFO5QqGRsKRO
 Wmd8W
X-Gm-Gg: Acq92OFRrF8uRfVPJ4Px4Ry5WCq75s+Gyhl0lwE78hy5DgOlcmJCDk1yIEPUkn5CfKJ
 rInJkiUKK+hMOcYPRb3taAatwKMl7uwRnMfC9CTkvEuWCjkqHNHNw67cFKjS3jabNchA1m2Wtgl
 6WyAAnT8u1Iykjvz2H3OuJJZFhwFqgMpVH49B06Urti2Y7VMl7o7YhbwAAw/rj2feLeT8cmLsBK
 7Vt7b0pQrgZxf0HmdOBq+KByHQi3F3K6uNXCXUANmVvdjJlzpZGVZUohMZYjFGOaDUFo+D97maN
 iglu2FWd93S2AMf8pHk95BV/HR9UEShTkw5livw0oLkftBhxZ4/T6feCApRtRPxOgUgSrxDxcsC
 O7GyEmQTMk73VMjlfGq3UYnC+YZWrLfTaQTmUcjg774pH9VFIZSmmcIkBnUgIP7+XeoA71euujt
 bg3RByqy2t6y8jqfgxfpMAzeFEIdYi40VO358pnDO01yPTQAbTVKGc9QI3vYwh2Tt4FEFQ
X-Received: by 2002:a05:600c:138a:b0:48d:366:b962 with SMTP id
 5b1f17b1804b1-4909c85589emr31424635e9.6.1780043404643; 
 Fri, 29 May 2026 01:30:04 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab0e79sm53940915e9.13.2026.05.29.01.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:04 -0700 (PDT)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:04 +0200
Message-ID: <20260529083004.58653-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407123424.3983175-2-buildroot@heine.tech>
References: <20260407123424.3983175-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043405; x=1780648205; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNOtqprFNW+HmTYzQj1MGtljd5GAZnb28z4BZCcnu/s=;
 b=aHm607Nj3xek0xoxT0/4/6StInt763sE5+zpMt7x+0l0s1hBO3VdPg1l3jWmXyajjm
 oAk91Oj4rCztLuD/cIgqWi/kTu40FoWcR+0UA0zG+LqyHhanQmlFGd4EJfzV5nLoJgNn
 2opMd/nAU0RPTY4WYKpxZZ2HnfKtRp3eqmnX3yzYw8mFN2b5gCBzIlEEXb6/4IE1BMz8
 xQG3vmbtw50z2kzl/LHFClH9FMbf9Pbq416mtpOQtlt19lBNSTv87isukMVxtIl5+A+m
 lc+6CUYGsESH3heeLBrqDPmyVGc7z4jbz0ASI0oXY1X1ETr6LmeDLX1rE1TCevuThvuO
 3cPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aHm607Nj
Subject: Re: [Buildroot] [PATCH v2] package/supertux: fix build with gcc > 11
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
> Fixes:
>  "missing #include <memory>" when building with GCC > 11.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> V2: add "Upstream" to patch
> 
> ---
>  package/supertux/0001-fix-gcc11-build.patch | 33 +++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/supertux/0001-fix-gcc11-build.patch
> 
> diff --git a/package/supertux/0001-fix-gcc11-build.patch b/package/supertux/0001-fix-gcc11-build.patch
> new file mode 100644
> index 0000000000..d5ada531c6
> --- /dev/null
> +++ b/package/supertux/0001-fix-gcc11-build.patch
> @@ -0,0 +1,33 @@
> +From 81809dd5e6f611b1d64d952f6d96310bcc9c5fca Mon Sep 17 00:00:00 2001
> +From: Semphris <semphris@protonmail.com>
> +Date: Fri, 17 Jun 2022 12:36:26 -0400
> +Subject: [PATCH] Fix problem with GCC 11 and Partio's ZIP manager (missing
> + #include <memory>)
> +
> +Closes #2219 on GitHub. Same fix, but puts the include closer to the copyright header.
> +
> +Upstream: https://github.com/SuperTux/supertux/commit/81809dd5e6f611b1d64d952f6d96310bcc9c5fca
> +Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> +---
> + external/partio_zip/zip_manager.hpp | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/external/partio_zip/zip_manager.hpp b/external/partio_zip/zip_manager.hpp
> +index 666884dda53..245303c76be 100644
> +--- a/external/partio_zip/zip_manager.hpp
> ++++ b/external/partio_zip/zip_manager.hpp
> +@@ -1,8 +1,12 @@
> + // SOURCE: https://github.com/wdas/partio/blob/main/src/lib/io/ZIP.h
> ++// NOTE: This file was edited for purposes of compatibility with SuperTux.
> + 
> +-/*
> ++// This include has been added to fix a problem with GCC 11+ (and maybe 10)
> ++#include <memory>
> ++
> ++// =============================================================================
> + 
> +-NOTE: This file was edited for purposes of compatibility with SuperTux.
> ++/*
> + 
> + PARTIO SOFTWARE
> + Copyright 2010 Disney Enterprises, Inc. All rights reserved
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
