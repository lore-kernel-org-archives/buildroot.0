Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CEFCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCACC61068;
	Fri, 19 Sep 2025 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wQrWIsK9fGD; Fri, 19 Sep 2025 12:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39F06105B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39F06105B;
	Fri, 19 Sep 2025 12:56:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67BCDE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64EA16107A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1Qyjrnli5Hd for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9ED0461056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED0461056
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED0461056
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so11150575e9.3
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286578; x=1758891378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahhZsBXYhpYOnmpXc76lIyHbkE+C+3PPNuqUplbKbKI=;
 b=s9/T0dTvL+bfYGwsBiSSUKZgVprYYM02Xf64npXntQ5aKRGfZeHqEAIxmbMrKNfmK5
 0mWuccvhULaMRJnRuLNCfv4lIaTdW8SOfsvLwf/OcPhv/zRFUXnG5Ry+Bw8oEabVe7ME
 AldRtps50vebbImW7GHCN1VL7WB32I7/P6ome8IlgmaY6LdT4glGc3QTtwREGUweBhFm
 L+P74ZVNck5KFm9aEkuQMZznozZ4LrIBV1NVwyZB+vnLzuckHyXCwNs/R97LDreCmCdp
 mQ/pqURrRUUZwa3xbXF0Jz9QB3E/wPQM//TmLPVvRhE/WVpSDtxEAmSqJIhvoE30WUIA
 nrXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrVnvBVLNSF0RU22PdifZcdnjXeZwqPMnROpnAm4nS2f0zpBFIiE1b7u/o8ZPLXNANI4w3hrAG9Zo=@buildroot.org
X-Gm-Message-State: AOJu0Yzat4T/b0AoZWl13MWAJnJQDko0ywOrrSwNqlyA1/Tso4DDgVlk
 httN/Ia8edfrSpClsS2578mlF+m7/ihoY68yJhzznM9KKNlAsRiYfqw+48nFIjMJ4Fk=
X-Gm-Gg: ASbGnctF0fxZ+gc/BaQaSCVXLEIlCROygwjjoHhMbvQo+ZiSgHiAbJgfHHQSHBOdnMA
 uSndkEOkd0Nocq/v3F2R2lCHD9ozcZgTxBr2rKfc2eHSDyI/CtgPSUW/LRdiw5bEVWf7jFMzNR+
 U2DBy/z4yAUgU4ennwzZFEGJv2wjxnU8j9eXetdHbZVqmDwOQPffr+4Bpcj9+0vZupFh4nsgTB8
 kLFWtmfAGPo2L/D5XWZa2OkC59sZTiYYcCjmTFr1mKknvngM1+TMW9hV/Vy8/keE54UIdkEHEPB
 zAtwz/T7GusOu3rFssNaiFSe+w5zMVrwHgvGJVhQE2HQUB21U5vQgpqFkp/BUAvAdu5L3o/f1PH
 ALziblfhNtLWXqaw=
X-Google-Smtp-Source: AGHT+IGbckdR5GlsihN45vvaOhxV/t2iYm8cvwY0LyQ8FikgxYVYINUspfw1vv3QQYN19HCO4vbbHg==
X-Received: by 2002:a05:600c:5491:b0:45d:d5df:ab39 with SMTP id
 5b1f17b1804b1-467f2cc83afmr24582725e9.26.1758286577552; 
 Fri, 19 Sep 2025 05:56:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f6695a9dsm88026765e9.24.2025.09.19.05.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:17 -0700 (PDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:16 +0200
Message-ID: <20250919125616.136316-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909161259.34807-2-angelo.compagnucci@gmail.com>
References: <20250909161259.34807-2-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286578; x=1758891378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahhZsBXYhpYOnmpXc76lIyHbkE+C+3PPNuqUplbKbKI=;
 b=ZtaNozcY+3KA7f8yVyNx4y1x5P5+icOFuNswTQuJYZNscLHc561njFFp5bXVxBp6Ok
 MpShYN9CzY6ZoobuVoDqnWttE10lNHsFlQxU7Xwt88bG3cFX6VeBkxDuJbhHAdfZJ7+J
 24g6f+h+24toaYz8cX6urTI/yuickBAgSxOFVnw4kou5QvW5wvqjK4T+xytuWM5tbUzX
 nlg4O3M4Rm8acoP4bjq8TKEAiZvwFDPrsJqzE+Ggk/QhmEzOGMWLwJiOKI1LSwTpI5Fw
 xwWqSOeaiSnnJOAq7N8mXy2PYzIRVe1UfxI1dq07BVi5L3W6fMAJX8nFI9v7wjMdOoh8
 xg4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZtaNozcY
Subject: Re: [Buildroot] [PATCH 2/2] package/htpdate: fix shellcheck SC1090
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
> Using /dev/null as file source because the package doesn't provide a default
> systemv service configuration file.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/htpdate/S43htpdate | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
> index 5971d70639..22e5e6c803 100644
> --- a/package/htpdate/S43htpdate
> +++ b/package/htpdate/S43htpdate
> @@ -4,6 +4,8 @@ DAEMON="htpdate"
>  PIDFILE="/var/run/$DAEMON.pid"
>  
>  HTPDATE_ARGS="-a -s -t https://google.com"
> +
> +# shellcheck source=/dev/null
>  test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
>  
>  start() {
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
