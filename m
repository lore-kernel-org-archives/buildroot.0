Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69146CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AB141D92;
	Fri, 15 May 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23C-_WhZqCn2; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0520241DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867206;
	bh=RJWmm+Z1onJ88K9NvQOH8hVY76TnOp1t+gEHtu0lVZk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lAIOIHJjmvp9VraB344vX1PkIgf4F0hwi/HVxG1P9IQlNl+VfRXZas5EjQsd8S9k5
	 vMLYxCxOpLNQI+PsBYa8YykQkgxv5JvYPDqLwP+7bGoARRrDl2A1YuMaL3KMRY7I6w
	 WTZ7FZp1dAu3LCayyzyFeEuKCYJmwxkapfQvjyV4bz4VoP1cS2Z8G/iJmVy/PHawyX
	 SyB7WYSdziNX0UO86qBPA3VWfpGSAs/99sMdYNYKfRvjh0qEIHn/myhfRdEfYx4/+F
	 blIfJK32HRj7ZSbkqxDYfzXh13AV/dirgvvE86u1TCH8dIUMK287QHWmUScnWUdRo/
	 Qc1kYQ+ncMNWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0520241DA1;
	Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 056F023F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB61F41D92
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FA3abju4GMyl for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA5A741D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5A741D26
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA5A741D26
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ad135063so790955e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867196; x=1779471996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vWppZkA4HxvtglmFR6s1LW5tP44kpa5DguJHPGQ34V4=;
 b=ZKp0oBKcrMGWdLRciwCaEls+1GPogCEKq3EWrYpSLbt4kOgSOfJUtyacoSvdKl24tg
 EID5/rnqRUCvXXmeUz9pwEw11W1ghyJUOY3b7U3ZsG/ictCGX/nRjRJ/b7bUnDmTHur/
 Bp9TfIsSgdZMRdAMhl66tXpEa/3XvvyuqifcWzrthFdKX1y4hR8x61ZUrjUcZ7PoyyCG
 YoqlODrZaBXopWsE2BYtQuyr/13Wb+cveSW4LuymK/3V/NAEOTZYiSmaPXCOQITIkPWB
 lBNtZDmsLl/Bo12bKIM3Fes7JmYqddU8h0e0LMS7p8D/e6UpFuDcO1MzUgCA4MS6Z8P3
 iSZA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hdyYzNuaZaj1YjLSheSOWpYCzvP0+BH3gj3JPWw3wQ5+4eCRZs/vz899ZlwXFUJ3Xbmnmy9Y6HK4=@buildroot.org
X-Gm-Message-State: AOJu0Yw4OrL6DWOPqOunKxRAVw75DujlfAnSJ/pOx/mfi0HVr5jbTcDp
 8trfTh0rnWMS/D2rPHV52xUh6vHIAs9dpr1RqU21N/L0ysmNKbb0jmPMhs+lPVe2ZCw=
X-Gm-Gg: Acq92OEa1y480n8S0VD4wIiKrxGGZtHaLIvgeFmTe4AOm8EQpcV6t6Dw589SHzwldLf
 Rbmz9BBOevgFW4vviFMEILPuDASyfggB5jEVmVOUAJxcXwEod+R6/tuHpb5NeWaaZgYY/+2Dq6m
 NXV6n8N+6w92FarFj494uDFvqhtuBM+WZT6vHZDI55NaQwkPPz6Xe0hNQJXK4rIRSuYJf2pORIT
 lwxu4MzZNn+1C4StHx7ZdlDSZJCfTG6At76+dztJI6uL8o7E24l+b1+Jh/ruLwJo7HFGJ8Yhuaj
 9W5+/a1ZDOrbe1sk3juLh5HiwtusnvhGB9zkMo7qcUo7/n2/5+BTJzTRfmY59Xwnxpzrtx9jQIV
 fSciz8LmxyB0yONloSkSHodKGLMqmD6fC4S7Mq0ogtohODlG3c7MEpLmC6aKXVF6+GI0ueb0p18
 WKuwq/HM4Ej/0FGAuiXfzM9zXIByOwUCfyrI1fiPjSXsmI
X-Received: by 2002:a05:600c:3f0a:b0:48e:82af:d9 with SMTP id
 5b1f17b1804b1-48fe6612a59mr72046185e9.29.1778867195639; 
 Fri, 15 May 2026 10:46:35 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5e9d5d9sm83299735e9.15.2026.05.15.10.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:35 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:35 +0200
Message-ID: <20260515174635.530104-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-7-fiona.klute@gmx.de>
References: <20260426153334.1026982-7-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867196; x=1779471996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWppZkA4HxvtglmFR6s1LW5tP44kpa5DguJHPGQ34V4=;
 b=ZkRklmBYU8NhLZL7TBAcWH0fc4iYcDWIi7ojXGp6eUC7aKX0hvvswYfkx5zetGTSvg
 B2VO4i4a19p8Z5V07rW9vA/Ii3VAtzipGZYU3rWO+//NVh5betnxbpBnWE0kaDw6MLOf
 KKllO2suGH49kai4M+SbtIWLzIhB5RMoj7jm8f2/MTDqwkSX7R0e4ma1ft/ndnoTquKB
 rbN5APdE6BMX8dGCn8fDpNYpl8Dexsq5BeDEnAHMP5/5Z7dDC+t75xHDhPE+5ZkpLwW7
 10CO0RHGaJfuWxjrtKOVYs641y3jYfhPJKrvGDGV+fxLaRKcsQwDmdW3jN/+UgW5yWCx
 uxGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZkRklmBY
Subject: Re: [Buildroot] [PATCH v2 6/6] support/scripts/pkg-stats: run main
 function only if called as script
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
> The __name__ == '__main__' guard allows importing pkg-stats as a
> module using importlib, circumventing the normal module filename
> requirements. This in turn makes it possible to test/debug individual
> functions.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/pkg-stats | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 5dcc812e2b..2b2194b9a5 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
>      )
>  
>  
> -def __main__():
> +def main():
>      global cvecheck
>  
>      args = parse_args()
> @@ -1403,4 +1403,5 @@ def __main__():
>          dump_json(packages, defconfigs, stats, date, commit, args.json)
>  
>  
> -__main__()
> +if __name__ == '__main__':
> +    main()
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
