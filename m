Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD17EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBBC84884;
	Fri, 13 Feb 2026 19:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJqhe3mycoxJ; Fri, 13 Feb 2026 19:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F092E848A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011550;
	bh=XE2uWKe6LmFW8SU+vtYJquHGnyhZpiIlk0Azj6qRrFc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R6lSZeo6oOQU2XPMv9NxujBR+sLtvnUsOn8aYWb3fyTWacqeNK+pl0kFTGryk1HsB
	 99bgdYta6TORQin6/6nlLo1pfZHTixuueyvGZ/wmn6XUeSkF9/wLyWy2o/jDs090OA
	 LIeHtk+WFqNOga57lAod6l5qYSc9UHUpGmfjkapsigB7J8Gdqs2rOJWePTtRzWxg1W
	 AFCWhkR7KaWsXjaSw4C3MH+J4NCuOABqDeA4Y1zszX+XJ6alMnBeR5xDtpPq8vhA+3
	 EodCN+Sv0yz+ApDt7ihsZC3h+75C91wUIJnUZCV7bozZytAhuGX7BFOckLaWox0zdW
	 TD+TaQ2NBMgHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F092E848A1;
	Fri, 13 Feb 2026 19:39:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C882569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A818E41FCA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neYyzHQ8wTyI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91F7441F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F7441F69
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91F7441F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48375f10628so5559935e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011477; x=1771616277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YR/C230z/qD/4Eg+tUB5WQECOX6cnpJ22p1fm4L9bz8=;
 b=C1QqRDbhvu1EYZCCWUDOZ6NYfVge2lVDkJjfH1IWEq+1/I1graEeSCZ8rPkxxooMyK
 WAaJy0/3Z3k0812GKiqYIpPHCvtDSE9bs07l8waWlggKJMIkx4KZ7m4Ovc8/jn5jVJr9
 31/jfuDs7jMruXt1zRFrrGDyHLQxFxIrxKhjft8OPbs8Py3z0tFB93JZooPl6F/xYCOD
 YNgoxe+YdsArDLhLxJZ2xmBreZC65qGG2SOH9eHBOwjONno/RT0aUa03cvoTHMDMOQi9
 oFX3fXhko5twwNOdreE1quh1svbG5MkRrIGF6KjgaiUSmIQlmgQNcwbojWM39u2Sl6mK
 L6vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4AqrDLDl0DV+iyWDfyN8X1NfwvQFLJKur6vqMN5iqvU1lIBHvRO6tPmru+PVbQbirh2WU61tyRCQ=@buildroot.org
X-Gm-Message-State: AOJu0YxpwLzU05gZ+LyqGQ2XkA8KOXvG6B9F0zM6JwZ82iD/oW3MlLS9
 FEJJrjEsdpr/i46AxAm9kJwwSI7r1DzGIQe5R4J+pxRhoMNNCuh2mhAwY9+IT/D7SiY=
X-Gm-Gg: AZuq6aL6YEUPS0LlzWYy/ruDzGNPjkbOayq52v+hQvuDUQgNG01RItW/MrZ3LcjLiSV
 nYuBle03kf00NJrRorNw3NKs8bQTqV1GVC8Oq7yCiNSw8Xx8vvom3WLwB63rfyFjKFYUWwjTIQq
 vu0iBP81lPrXZmJso0g2n6BpoRg88opO9zLzmVW9Qo4vmT+cKePLkeCexE/gB69/ooRDiu8sEDf
 Eb9AFs2xE5lP9xdR6KxpiCr+SVAvKNKhqEhiou5heA+haI0hgNPGjmqgxPRZJ1sqIpy0Ps0Cqtw
 TKb9G1HG+aZDH1hiduT5DdEdmZTY0JFgJBNwFOcuyy1jLUeySV+7bQCaJSOIWZ1CD1k0ddbQTiQ
 zvwNQ6k1HO1nlnS586/tlzjUZYBMoFXDSlRdRH5mkDd7J/p934bYVDxeRn+S6WWmbx4V4bIAeNj
 lAg1svBarr6xL99SU=
X-Received: by 2002:a05:600c:3e88:b0:480:5951:fc1e with SMTP id
 5b1f17b1804b1-48373a02bf6mr43693295e9.11.1771011476637; 
 Fri, 13 Feb 2026 11:37:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d834ebesm281037345e9.13.2026.02.13.11.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:56 -0800 (PST)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:55 +0100
Message-ID: <20260213193755.41062-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125114310.246433-1-ju.o@free.fr>
References: <20260125114310.246433-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011477; x=1771616277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YR/C230z/qD/4Eg+tUB5WQECOX6cnpJ22p1fm4L9bz8=;
 b=aYZLOroG5LptVBhz5WfJDu9wQF4ySoLT7ct2J8e9gnw3kJeK/Zeh668s4YZXXXmSGn
 1sTv22Fux/yh3Mpeu1FvK9Lwkk9CFz19buCDsq72IQuPWt/YTq4JOqE5/wAygdYVTQRV
 N72NkwFplVV4pWay+lN+IArKY/xArTSHjr4zfXrGDh/HB5xl/ex573oke2qcCs+EYmfv
 Vwb9gLI88xhnhDWymCnm/uHnWnWZo4Oga57yrxEWfUZI9L2KJjNE93kHYrj7/sVas1UQ
 oI4s2cy8VIqWUvHowGhUsgvOf3EGL7O42yqy4reywo3vF+nvikkXgVbrRsvpSxAnCnlt
 JcMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aYZLOroG
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: add CVE-2025-15281
 CVE-2026-0861 CVE-2026-0915 to _IGNORE_CVES
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
> Commit [1] bumped glibc from 2.42-3-gbc13db739 to 2.42-51-gcbf39c26b
> to fix some CVEs, but forgot to add those CVEs to GLIBC_IGNORE_CVES.
> This was needed because the GLIBC_CPE_ID_VERSION used for CVE checks
> remains to the same value "2.42" which is marked as vulnerable to
> those CVEs.
> 
> This commit adds those _IGNORE_CVES with the corresponding upstream
> commit references, to make sure they will not be reported by the
> "make pkg-stats" command.
> 
> Fixes:
> - [1]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/18de297a5ad3d1fc1b44f54ae69289ca10200ad5
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/glibc/glibc.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index e3453b8cc2..44bf9c4b06 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -28,6 +28,15 @@ GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
>  # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
>  GLIBC_IGNORE_CVES += CVE-2025-8058
>  
> +# Fixed by glibc-2.42-49-gb0ec8fb689df862171f0f78994a3bdeb51313545
> +GLIBC_IGNORE_CVES += CVE-2026-0861
> +
> +# Fixed by glibc-2.42-50-g453e6b8dbab935257eb0802b0c97bca6b67ba30e
> +GLIBC_IGNORE_CVES += CVE-2026-0915
> +
> +# Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
> +GLIBC_IGNORE_CVES += CVE-2025-15281
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
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
