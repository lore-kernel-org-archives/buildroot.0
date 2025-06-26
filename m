Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A03C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 14:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60B08611F9;
	Thu, 26 Jun 2025 14:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rve9yx03fpDu; Thu, 26 Jun 2025 14:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DDC960DD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DDC960DD0;
	Thu, 26 Jun 2025 14:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 560D310A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 14:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5325E6114F
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 14:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvUGve8Gheza for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 14:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86E2F60649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E2F60649
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86E2F60649
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 14:36:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so6019935e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 07:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750948578; x=1751553378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9hJvYgooPjweekEKAUWUGdkYo9y4HmZpwykvBdxiMzI=;
 b=RmOP6lDJW6yZm6JPKAZbvRE5rBU23i7So32KOEtxLQxWxjnpJSZORs7gYXZVvrGce1
 7JbMMg0U3G2wnUFFvkP8j9iaULI2Cu/7C2lM+wMfJzYmzUeagws85BQWQk0upySo7kwX
 SFWbHyFyEvrRz3FgFNkYeh5Qw3MNfLGhgxUtph48jByWU8BcGf/EuZorqNed4NKqPAjR
 +PzJt1ThDw3/KuGxPKpFNtjIhbvKG2dUVbJAdsMxqKAiMAwB1jI+Vynr8C7UEEAgxGdp
 I8ESwiIeXRMsvfwyOH/6Qa4CEh0N0rXmlnUkv6R2H2vwtnZNWWnqfD7Gnoa5TDmah40j
 j+ig==
X-Gm-Message-State: AOJu0Yw0X5GBYi6kwcMS0B/U2L8yArenQMZYX7PbkgxAaB8j1miYs3to
 Rrz5mQLeuTIw4zA3141GtRIfHwpGYbebl6u3a0uPUU6t7+V2FryJfqNF80E5ivX3RMlona6RVv4
 LkeHL
X-Gm-Gg: ASbGncv7gS+AN76PS5BFPXlhZs7+HVjapUxjJ/Hna0Gc0CxrYhBpok1oj/W8Y1iJ6Wq
 wRBE8/4U+SdcogOn456T19BnRJOCwC4Nl+ilfcZgQG1dAPvw4J1/j4MWgxZyd065xUYU3kXga2M
 uZ7u7Nvw/avftJpJjRXZOau6mb+CBafs+qp5f5QuH176JOl/tbt/ZDhK2vyW3tN9s64x5BgyWbm
 wRXwFl/fuJODSbCPLNSb9xz+l3sP4uOqWlGBg+LltncnCxTkjfbfWUcnd6HlZZhYdJupASvkixO
 2yKHIYuUUoAxHYzMD3oq4w4O6EBRuslLVX5SnTelR2gvLDWxZpQQQBcE/1LiQnq73a0pQCis9T3
 +fT1UhhsJa+YFoThatWq5avf54am0hbB3XV4Z0KX+3VBpltefp5dxETpM
X-Google-Smtp-Source: AGHT+IFhDzIgjPWpwX/w04v50J+yZZ66LS+Kf7FBfrUyM1F7KK8su8z2cQen7VgSOnbCWEi2GRIDfA==
X-Received: by 2002:a05:600c:1d87:b0:450:d3b9:4ba4 with SMTP id
 5b1f17b1804b1-45381ae785cmr76166695e9.2.1750948578279; 
 Thu, 26 Jun 2025 07:36:18 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52af3sm57649f8f.50.2025.06.26.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 07:36:18 -0700 (PDT)
To: shirokovalexs@gmail.com
Cc: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 16:36:07 +0200
Message-ID: <20250626143608.585689-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606080248.129891-1-shirokovalexs@gmail.com>
References: <20250606080248.129891-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750948578; x=1751553378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hJvYgooPjweekEKAUWUGdkYo9y4HmZpwykvBdxiMzI=;
 b=kkwIqSaNYMfIy1F1TJnzzjA1Ff+HlSc9EFoiBJ6vjQUk9MbRFuGiQMKNsCdVro5Qt/
 DSi6DTxwa5FE1ddDXve9DNoxSpoK9zE8+BlmN65w+M11aOwtdYV60HOHRL+acZHAIf/C
 klGsHzzT0WlKTDOkp9BcaUq1lGmAxH8RUoGe0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kkwIqSaN
Subject: [Buildroot] [next,v5,1/3] package/uutils-coreutils: new package
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: multipart/mixed; boundary="===============1258728695719522408=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1258728695719522408==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi Alexander, all,

Thanks a lot for your work on this.
I’ve spent some time trying to understand and improve the
way we handle the build of individual utilities, mainly to avoid hardcoding
a list of tools manually in the .mk file, which is error-prone and hard to
maintain during version bumps.

I know this might be something you're already aware of, but I also want to
re-explain it here in order to bring more people into the context, in case
someone else wants to help or understand the discussion more easily.
Building individual tools with Cargo requires
explicit `-p uu_<util>` arguments, which forces us to define a list of
utilities beforehand. The GNUmakefile does this by hardcoding
the PROGS list. However, this list isn't directly usable for Cargo builds
in Buildroot.

The uutils project does provide a script `show-utils.sh`, but it hasn't
been updated for a long time and misses some recently added utilities,
so we can't use it.

After exploring several approaches, I found that the best way to get
a utility list is to extract it directly from the '[features]'
section of Cargo.toml, especially the 'feat_common_core' feature, which
corresponds to the set of tools that are known to work across most
architectures.

So instead of hardcoding the list, we can generate it dynamically using:

""" PROGS = $(shell cd $(@D) && sed -n '/feat_common_core =/,/]/p' Cargo.toml | grep -o '".*"' | tr -d '"') """

Or alternatively with awk:

""" PROGS = $(shell cd $(@D) && awk '/feat_common_core =/,/]/' Cargo.toml | grep -o '".*"' | tr -d '"') """

This keeps the logic in sync with upstream and avoids manual updates each
time new utilities are added or removed from the common core set.

I haven’t sent a v6 using this yet because I’d like your thoughts first.
Maybe someone else has a better idea!

Best regards,
El Mehdi

--===============1258728695719522408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1258728695719522408==--
