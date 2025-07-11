Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4635C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A198083367;
	Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aU3Z714gFjHA; Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0CA82362
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0CA82362;
	Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41BF41E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3375540094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5TG6P4er0bS for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 382F740510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382F740510
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 382F740510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4530921461aso12766775e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230676; x=1752835476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xoc0Hu0PTPXKHJEhb40A/NzbfWFgIGlf31dha/0NYHU=;
 b=mIuo1Ap1RgASZtV1hMKUV6oM/C7l6p2mj3/aEMs1Kww3IScMKb7K6aUQriMDmr31Q5
 hk90LBauBNnY++EaY5zV3BPY+2tCrAhzk2oLC/NhE0DIjyEwu778CAflOvCCE/KLHd5M
 90btxAlw63sGbe/59+no/SVDZW6TQofB1PXfOnjPSVEclSe1EK+ILOteMbRHA1i6VzuF
 MnxDyOkuRvAwBeTsIHWaJCGrMU4z5KuktsOiYm0TE9OAECSxwYGSYOj+EHb/dnG4vFv/
 q1XbM1qSDMa30HS9mc84Q2V6E16JjSt7IK/dTm/B505sWzJDV5cK8vb50FynDW+FyW5M
 +Cug==
X-Gm-Message-State: AOJu0Yx2mglJPD2CzR/gTtc6vUmRrqJMF1/znLL9ThIdrWAofJ/eSkIT
 jE5flFWpPUxP0o+ytmN66Ja/8IM/+6WbgQtj+WfiJhNttRzYboby5Go5XS64eL/8pn8=
X-Gm-Gg: ASbGncsXKyzdYrnfov5/5/zai0VxCATODil5omUeJVv0f+7Bo2Vy0GRcqy9a4tuJWZt
 TQhRTSV0hDJ2JS4KmW4bNBZi2KH69bpUCzEoSXgqwmtrMWWzB+RR8flGiBNYBwKuQagiWWTyRgU
 7gxg2zLKQkiVUMCiozfCpk3uvSIhbjYdfdbxMQfVktDwCDwo/aXhvg9oLLqztFfngOUqJ5ynnuj
 VcWzccQyPyQ40HuZhIkBzO5XaHAhGFGnKGHbUr2xGwE26f7q7naex8GmX+cuvfzsYV2nZMR5EZb
 +xuaBJoCPi4DLc9HDlBz5lT/i6yk6kN1JfzFGJY2DH08uHtddcP1OljdK6X7i/HVPnAAMRrcP4n
 vqEM77OHSxrUvuYdhJ0GHAoB7
X-Google-Smtp-Source: AGHT+IFOTJ57yCO5VPTBjcBbGNLyyUKNgOJAI3xStPvvWgewVghVwFXHADihFcGBz32+mq3VbgQFQQ==
X-Received: by 2002:a05:6000:40cf:b0:3a6:f2da:7fe5 with SMTP id
 ffacd0b85a97d-3b5f359996cmr1314701f8f.55.1752230676173; 
 Fri, 11 Jul 2025 03:44:36 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e8b1sm4097759f8f.82.2025.07.11.03.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:35 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:35 +0200
Message-ID: <20250711104435.823337-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701153448.545594-1-thomas.perale@mind.be>
References: <20250701153448.545594-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230676; x=1752835476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoc0Hu0PTPXKHJEhb40A/NzbfWFgIGlf31dha/0NYHU=;
 b=K73IN7FMLtPhAowijF2WCpfCSBPDL6NrFkB8Z52iU5yvd2OSxaFRQXsMjyvaTRIEQ1
 eoHTWgbH7uoEo0w9pLzuJ+o9tg5Zp40hM6w1UelE2qaWp0rwkSv21hNU3YDxK3r+wji4
 zEiuru6KJhnsV1LyvNyLl3SoQZRiuaCD44JBrmmIxtYGH728uZjsq0BzWa0w7AOgsjKJ
 I32T22olRs6iC6La8Ety5HTmGKsW3RPGd/UWnsY7EyqjbgqWwCJq+rq4gJhor4dD62au
 JlpZRIZkyJXCADo7qFqDXATc8MVpmEq8Fwq4Bl52FCjoNAZHqekvmOcKC8CDcnejJyZw
 tmCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K73IN7FM
Subject: Re: [Buildroot] [PATCH] package/net-tools: fix regression
 introduced by CVE fix
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
> Commit [1] backported an upstream patch to address CVE-2025-46836 that
> included a regression.
> Upstream later fixed this regression in commit [2].
> 
> This patch add that fix to correct the issue introduced by the original
> patch.
> 
> [1] 323aaa9f54 package/net-tools: add upstream security fix for CVE-2025-46836
> [2] https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...46836-interface-statistic-regression.patch | 30 +++++++++++++++++++
>  package/net-tools/net-tools.mk                |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
> 
> diff --git a/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
> new file mode 100644
> index 0000000000..60cae48aef
> --- /dev/null
> +++ b/package/net-tools/0002-CVE-2025-46836-interface-statistic-regression.patch
> @@ -0,0 +1,30 @@
> +From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
> +From: Bernd Eckenfels <net-tools@lina.inka.de>
> +Date: Sat, 17 May 2025 21:53:23 +0200
> +Subject: [PATCH] Interface statistic regression after 7a8f42fb2
> +
> +CVE: CVE-2025-46836
> +Upstream: https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + lib/interface.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/interface.c b/lib/interface.c
> +index a054f12..ca4adf1 100644
> +--- a/lib/interface.c
> ++++ b/lib/interface.c
> +@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char *p)
> +                 /* copy the digits */
> +                 while (*p && isdigit((unsigned char)*p) && dst < end)
> +                     *dst++ = *p++;
> +-
> +-                if (*p == ':')              /* consume trailing colon     */
> +-                    ++p;
> +             } else {              /* if so treat as normal */
> +                 p = dot;
> +             }
> ++            if (*p == ':')                  /* consume trailing colon */
> ++                ++p;
> +             break;                          /* interface name ends here   */
> +         }
> diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
> index a227d6477f..0468a00bf0 100644
> --- a/package/net-tools/net-tools.mk
> +++ b/package/net-tools/net-tools.mk
> @@ -13,6 +13,7 @@ NET_TOOLS_LICENSE_FILES = COPYING
>  NET_TOOLS_CPE_ID_VALID = YES
>  
>  # 0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
> +# 0002-CVE-2025-46836-interface-statistic-regression.patch
>  NET_TOOLS_IGNORE_CVES += CVE-2025-46836
>  
>  define NET_TOOLS_CONFIGURE_CMDS
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
