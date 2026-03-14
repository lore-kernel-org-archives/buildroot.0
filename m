Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B288A107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 883BF60EF4;
	Sat, 14 Mar 2026 07:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzAHkCS1g34G; Sat, 14 Mar 2026 07:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F9960F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474845;
	bh=gp/6EQuGriFy+c53gcgGkZcWF3JAD8uWjlGEPNfi6wU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G7xizfDca1qmIpZ0DI3MTGbdfcHDaK9AVEl4u3cMMb0h1qsxPGLCIkrb6tvc9HLBn
	 qHN7QwCXwGIbmorhcBA3gyOiayriIt2pYH+01DtAjZLGsE3x5rT+ixGp4hmYVCrvdI
	 a2vmD+fwws+3Ubh3E2mE+6mTOcgE/4zqpp0N13qPYyoej+OYi989Wt8nIyOsEE9vNG
	 4yLpBG6ghAKLHmK81q8pnp7xGZ0lfWtmiCEPLOYdgGdYouUHTqGsCNCytN+tizvBNv
	 9+NnwS1b142hXzbv8LYaXhu4bYtKvqHcE6TaOEw/6D5SukYTuUoKVF+oC6UD22qTnk
	 c9+t1O6U+Ez4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F9960F0E;
	Sat, 14 Mar 2026 07:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 435A9201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352EF60EFB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5FMnD2ME1i5 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33D2B60EF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D2B60EF6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33D2B60EF6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439bc14dcf4so2878305f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474838; x=1774079638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BoDM5k3y36OOC7fEU+HGklt9NZlFP/PIAlz0XdV8s8U=;
 b=Ej5I345vK0WBbRAuaFb4qbKOjFvUrtObB+cEkW+06UQ3oSVHqGXDOACK+WNsMExLWl
 a8DQu98HznjN8/1bJJusVb6T98U/e+P6WgxwJv4FZz18DH6377bLZyYkKde4ySx+gufj
 dTDzxk64qWCRYp+skjyVu2AXW+VujVWThPRABDeL+oTWQqqQ8ZOBPhGrByMEEj2E1MP9
 50LY8DWiAY/mZ3VDCBuJFDGE7TPVXU7+Ap6q59YpFtePHgmEuXm3FDOeRPE9UD7aQz5f
 OVWjA7mxCDZef+CF5In0sXnuZdbzn7qo5p17sjKCP7r6q66rdeFMq/ayt/5FBET4QB7H
 z1Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViA+zqY/4Kgqf5aGr4b/68sf4/ZblxHfE2V4QQgQUboLBjE0W24NFniqBSzPxdXoDpoaCTcvWjoDE=@buildroot.org
X-Gm-Message-State: AOJu0Yz8T7Y4QemhR1dAupfIjqbIaFYqht1y26o7zdYRSKZ34/1+unYF
 M/etHgPdWSad1DB6RRi+49Mb1JHP21cJ+BFGAViXhtQrU3082GOSKQf7mh7xFyoERgcdqIASuiP
 J8bZy
X-Gm-Gg: ATEYQzw1O4DE4NPH0CmgUdI0iLys6SZ3UL31oX6NRgZeO3Jf7eOVOjGolkFaoAYVRwB
 7vfbJ2HnuYIYKI66lacE9SYe8r4NBjR97PsabJRJFoq+hrLOCAT3fyMqO43hDXTFW3RF0K2dXMo
 +xAI3pMbjFP+B5418zC93Y9h4WgxiarUteKo5ohSQL6FJMqpZqn71wLLYLjZLI5dYDv0fWSGb6j
 9f/Qy02th8YtPBzkpMqd4RsjCc/V66+Cr+3CLYE3dhEIlEmhliBswXB5kjEgC6022Uy8Mb3x0bD
 A4idcgLDicddnW83JLdg7ui6TYQno1SpXiM4x9GRI3ot/puyqf6OxUp9/VLSUxTC6xF0Qc8JL1T
 2ayBdbFgB0O8tRHe0i0qfhWyCyf1bPlONXssn5FIjrJJ0SJMYIEUdY1k4CCPLvWJeTXOeI1XtPa
 lOwVnaus4jSQz9axA=
X-Received: by 2002:a5d:5f96:0:b0:439:c8b3:a3e9 with SMTP id
 ffacd0b85a97d-439fe194765mr19074554f8f.14.1773474837987; 
 Sat, 14 Mar 2026 00:53:57 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19aec5sm23769691f8f.4.2026.03.14.00.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:57 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:57 +0100
Message-ID: <20260314075357.15060-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306224203.121328-1-bernd@kuhls.net>
References: <20260306224203.121328-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474838; x=1774079638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoDM5k3y36OOC7fEU+HGklt9NZlFP/PIAlz0XdV8s8U=;
 b=LtC08CV7/I6sacbfB+jsPaobaps8q2U1O0jsXaJ+WAZweo/O85pBjAEJnLiCh80ToY
 dYFaeOdcntneT2ga2Qa5wq3CGGgmOlz7QXMxE4yMzSP4dtOfmaXt/WuOzZ3yTRv4b5Cb
 IDwZjrh3Qv0Y9tejpYWS3OZFaMyfDpPMMIAY/Fxr4TE2w+lSDmX8GksEtz+yAhy1/JxD
 il924mEmDOG4STTfb9kZvaUb+q6Vhzd1hXLe/n/ydGlXRFkhO1vVKifYHRGZ1VVGfw6O
 3BdMYZMDucTaVH73IM+BMirT8FQaxRoh1/ANxDGNg18Iu/CtzFIJ/n+kcl1KBDVhRnpb
 aoeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LtC08CV7
Subject: Re: [Buildroot] [PATCH 1/1] package/faketime: fix host build with
 glibc 2.43
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
> https://autobuild.buildroot.net/results/911/9112933e2560b155a9c61f321874ec245b62b2a5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  ...qualifiers-to-fix-build-with-ISO-C23.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> 
> diff --git a/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> new file mode 100644
> index 0000000000..ce84d40699
> --- /dev/null
> +++ b/package/faketime/0001-Add-const-qualifiers-to-fix-build-with-ISO-C23.patch
> @@ -0,0 +1,39 @@
> +From dbe865dfdba0145d993d70b7fd4ec88b2f47554b Mon Sep 17 00:00:00 2001
> +From: Tomas Korbar <tkorbar@redhat.com>
> +Date: Mon, 15 Dec 2025 11:03:21 +0100
> +Subject: [PATCH] Add const qualifiers to fix build with ISO C23
> +
> +Fix https://github.com/wolfcw/libfaketime/issues/524
> +
> +Upstream: https://github.com/wolfcw/libfaketime/commit/dbe865dfdba0145d993d70b7fd4ec88b2f47554b
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/libfaketime.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libfaketime.c b/src/libfaketime.c
> +index ef1dca9..02839c8 100644
> +--- a/src/libfaketime.c
> ++++ b/src/libfaketime.c
> +@@ -2666,7 +2666,7 @@ int timespec_get(struct timespec *ts, int base)
> + static void parse_ft_string(const char *user_faked_time)
> + {
> +   struct tm user_faked_time_tm;
> +-  char * tmp_time_fmt;
> ++  const char * tmp_time_fmt;
> +   char * nstime_str;
> + 
> +   if (!strncmp(user_faked_time, user_faked_time_saved, BUFFERLEN))
> +@@ -3338,7 +3338,7 @@ static void prepare_config_contents(char *contents)
> + bool str_array_contains(const char *haystack, const char *needle)
> + {
> +   size_t needle_len = strlen(needle);
> +-  char *pos = strstr(haystack, needle);
> ++  const char *pos = strstr(haystack, needle);
> +   while (pos) {
> +     if (pos == haystack || *(pos - 1) == ',') {
> +       char nextc = *(pos + needle_len);
> +-- 
> +2.47.3
> +
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
