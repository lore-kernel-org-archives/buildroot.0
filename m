Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D798CAC589
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D85884F58;
	Mon,  8 Sep 2025 10:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5KCgCOZ3PAW; Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E4A284F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4A284F49;
	Mon,  8 Sep 2025 10:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 282F3186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 251B484E6F
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQCLSgaLqo2J for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21CF184EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CF184EDC
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21CF184EDC
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3d118d8fa91so934306f8f.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328955; x=1757933755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zmAOjh5zh/zruS2CjKYIw+KUF9VMoUi4QrIR0Nv01E=;
 b=cO9n6ChkrZgNtS3VFLt9sSkU5quHi4FEFys3QCHMPNFlNJu6W3BXfCVt6soulBRUa2
 1GVusCjiO7yd0gfW8ZGuqJFO9FviYpfw0uq1E4xpkIlUK7b77eWw7wq9BEP9Xh0iWN88
 UA/BbuK4UymvZ4NROK+MNYOrABuzvIU4LkX9hiNhDT1F8459tR3xI1UDi0oB0PRpNhYK
 5JsRDM0SYQeTOxjS0EYEcoj7VLW6yZo8e4sRWiZxWf5rwVtkmsrhxjp9sf41bB2lyrRw
 MA49sM3+Il0M+k+yK0rratQnnRKHhUL+YDDcpSz+IYfV/VYrOTG80GR6WPp9ufK06UwU
 0oGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRhBwyVImXrRNGp1NQRotO+UzsuLZaKNhS7ECN/txZxfVhLNhwr0IMH3xE1DUa6hHxJ+1JPTtaQyg=@buildroot.org
X-Gm-Message-State: AOJu0Yw8KmdO7okFUEOeF00oYNhHz6W324FI4o/mn/2d6FdNjP7OBNig
 vTYNXt1q2gep6F3ULDL3yPcCiisk+Rh8mPsQQbpxE99yMlReQulMv0FRpIzKYwAPiMGl6n/rC33
 JQo3tN1s=
X-Gm-Gg: ASbGnctVarCHdO5U1Ul2Zw2GK5aokaIKZw3Gx+POYJGr0dT6yGhQBibHjESkx75EbGE
 qKzFqQp0ZkiZpjkOkOUxXTkC/LS//7jkEZUZmSsFvXx1U24h5TigfC36Q3uZEkORCQycGLvEvUZ
 MqWX3SPMJvl7rF88aqASEsY+K1NN6rsBI/qUwHZdFVqlS75lafXRt6hTobMi3OGaD5OZZG0InmS
 dwF5Ahb7LvDLi281xTQI6Zh33xrXy+52P+YgYWmvX+7xUdPHlYnzWGwdwilDLQFGEscEWYuvgqS
 XphWj8MG+YqFcdU36pROJ6ID7FXX5r3H3D0DDqlzYBqI8BlKEE/2jDZ0nGh6nk8+U9VhzrZ6Qsf
 WlI5QVP1AzJuEJHaSV9L1O55GvY6CmJZLIuoDrunKPM+y/C+lSLp/br4Vx7+rGrVVwvmtOYna2X
 OTzRfH+vRFlDk6+zwy18nZri4W
X-Google-Smtp-Source: AGHT+IFhOkfhUZIt2L16lNrbD9ymYxSKKCtpO0Zgm/pb1n0UH+bLCJV/h0Wa6cekGtYilu4baFiIRg==
X-Received: by 2002:a05:6000:22c4:b0:3ce:7673:bb30 with SMTP id
 ffacd0b85a97d-3e3048266c8mr10746126f8f.14.1757328955049; 
 Mon, 08 Sep 2025 03:55:55 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e06dbde2d2sm17545077f8f.12.2025.09.08.03.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:54 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:54 +0200
Message-Id: <20250908105554.681932-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819202922.3407686-1-thomas.petazzoni@bootlin.com>
References: <20250819202922.3407686-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328955; x=1757933755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zmAOjh5zh/zruS2CjKYIw+KUF9VMoUi4QrIR0Nv01E=;
 b=GTlKR2wfn7qkE1Y+vluvOD8QR8PaPqOggG4T1lE6+p+t4ct3A8bO5plxcL/7uFMPHE
 CKxdSaRXMLv0pdbddvcABUP78Pq3zG9LdWxzSE+1kY29PfPnkQB7SmZHWXolQOnOmMfd
 oTjhjoPoaNaPx1tlsgi1gZxjh3MPNjQrMeInt7/zhTVCPS9f5DuY22xa5iZF72Ub4w7O
 NkOnfqMPjxKt7FB32ypVXL3iydfXgdxBS15Gu1libwIzx69oFv5lpe1orf59FpgIhH7u
 I5S85IN8tDayJz5Q+liuKCecY1o2eJRDZV04gap1etA87d21LHgDheA4bYl1YHZcBsOl
 D9JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GTlKR2wf
Subject: Re: [Buildroot] [PATCH] package/liblog4c-localtime: fix build with
 GCC 15.x
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
> Add simple patch, submitted upstream, to fix the build with GCC 15.x:
> 
> userloc_formatter.c: In function 'userloc_format':
> userloc_formatter.c:30:5: error: implicit declaration of function 'sd_debug' [-Wimplicit-function-declaration]
>    30 |     sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
>       |     ^~~~~~~~
> make[4]: *** [Makefile:519: userloc_formatter.lo] Error 1
> 
> Fixes:
> 
>   https://autobuild.buildroot.org/results/dab64025e6a1688d5fadc2b9bd3738a2c886aa9c/
> 
> Considering the level of upstream maintenance, we did hesitate with
> dropping the package, but as the fix was quite simple, we did the fix
> instead.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...c_formatter.c-drop-usage-of-sd_debug.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch
> 
> diff --git a/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch b/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch
> new file mode 100644
> index 0000000000..8f54d1d6fd
> --- /dev/null
> +++ b/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch
> @@ -0,0 +1,42 @@
> +From 1dfc4a60ebf96766b682c464ae69c453ce15105a Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Tue, 19 Aug 2025 20:04:09 +0200
> +Subject: [PATCH] examples/userloc_formatter.c: drop usage of sd_debug()
> +
> +With recent compilers, log4c-localtime fails to build with:
> +
> +userloc_formatter.c: In function 'userloc_format':
> +userloc_formatter.c:30:5: error: implicit declaration of function 'sd_debug' [-Wimplicit-function-declaration]
> +   30 |     sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
> +      |     ^~~~~~~~
> +make[4]: *** [Makefile:519: userloc_formatter.lo] Error 1
> +
> +This function seems to be an internal function of the log4c-localtime
> +library, and is not used by any other example application. Since it's
> +only used to print some debugging information, we simply get rid of
> +the problematic code.
> +
> +Upstream: https://github.com/rcmadruga/log4c-localtime/pull/2
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + examples/userloc_formatter.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/examples/userloc_formatter.c b/examples/userloc_formatter.c
> +index 4299a48..7bcf0e9 100644
> +--- a/examples/userloc_formatter.c
> ++++ b/examples/userloc_formatter.c
> +@@ -27,10 +27,8 @@ static const char* userloc_format(
> +     static char buffer[4096];
> +     user_locinfo_t* uloc = NULL;
> + 
> +-    sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
> +     if (a_event->evt_loc->loc_data != NULL)
> +     {
> +-	sd_debug("Formatter s13_userloc getting a valid user location info pointer");
> +         uloc = (user_locinfo_t*) a_event->evt_loc->loc_data;
> +         sprintf(buffer, "[%s][HOST:%s][PID:%i][FILE:%s][LINE:%i][MSG:%s]",
> + 		a_event->evt_category,  
> +-- 
> +2.50.1
> +
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
