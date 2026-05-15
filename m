Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70CECD4F49
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D52C6167D;
	Fri, 15 May 2026 13:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLyB7fwVJFLE; Fri, 15 May 2026 13:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BAA661677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852077;
	bh=6qNcJq90685I0HFuFFhVwLIc2BdqblHkWhwqpqm4u4A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b4CKwm0qMOxyUjZ7kYkIq09F1WoRqeVzHdIIZscB9XMSozUp71yh1ljJ5dtd24LCP
	 fCxqPVh7LRUqZjar0JomugL+C+fR1IKzTkHUIBKpNU0xcy76qqfncHflro9cgAfo4m
	 pK1R0eFT0tuklnr8lWtDWTnW7HWVYrTf3t+uBw7SSKmPchM9vXXmz4egk5o+haQsiO
	 H7qC9Uj6l7jFgX6MzRb3JYxIp+S0EB5S1n7/AXRlyxB0YbddaGuTEUsdwOYl2nJ36V
	 49qpIfBnhWaKnYnb3OUAsHlTK2HoakZWj+DEu0V1iEY4XUJofVqNYYTF0Yx1a6BHZA
	 TaoLpGa+dikmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAA661677;
	Fri, 15 May 2026 13:34:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E72B36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCB4961665
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zQP8dTu3fnP for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D771E61662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D771E61662
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D771E61662
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso56641685e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852065; x=1779456865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0H/YunLfujzyAmjvobUTJL5YzDK1FESJrQ037zaw/So=;
 b=mXq3vLVFe8XVe6Ak3OfBN72tA32uOSZcfGpN894fUpBD2hYh4AiBHjdsPmuS2ZAiyy
 RfmIJjx3Jiv+dMPRjPgGq+LHbF2aWT1qoYK5i7NShyZwtK4vUCf8zc6RJeMR1uwxf9Ba
 epNTPLMWLa9LYrto/QQASAiqkJgMAQoyj2vB8qeiWmtesiwfFs6WOazZj9W1mm9iSDt3
 0SBW9031unAxTd6Kkn7QAku3NRx31Vk0I1f6eCVLc3X4cdFT5UMLZpszAETESqGIIORw
 soiHnIJmxhBHTsKhxah+hgmd4zlJC7AxAzN79M68IW4O+9FQmfs/D9evUZofUz9xvYvT
 2tcg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ZXLiYwtDk67pOOTgT5vnR22jr7iqVH1zvEHiM9tSx9oNE2QnYUTH5NXi5syvcc2iuZwsVPPbAR5U=@buildroot.org
X-Gm-Message-State: AOJu0YzXvzCb8p0KVbkM44UKp+mnfje8uSjXt4TLs31UJhuAwS5WeFAl
 wLmgGS7+6L4Z8XBxH98haiO7oHEIPF6IKDZbmwirXsjt/9Cu6y4/OIJx0nIooSPEnaPjeta/eV5
 ++nwL
X-Gm-Gg: Acq92OGjyxI34Bx6qLLK2s7uDnSMdVa5rXWVw/0xAvjtPmzPQrCJAyc7t0Umru9tGK2
 F8FaldKhwtkgmklWVf0tAQywrOdtApPJPFEDJ3lfFPeBfGKzJj8MJiOqWo4r6I9OVzBuPxnRLXx
 Dv1pU/1ahZHSxTJb7Rjf30WqwrXtOgQPTlgq2fOiSIzWYnNGDvqvF92qzAM4/QcFjY8G7IMHqC8
 LtlK3tNXNl8doOcSZgLapNj/qPkykmJQoUK3HrjRRTydG2eDyWpyiZmKVwOhGwpSZlKAsB1eM1m
 q61X4B7KIbEtkYGKpClYPpEjE2lfzaUNYIyiXcQ4fDOTIyq9+moMzEyYW9ccVnIMYQb1hI+vxst
 USkfCdOb+RsnJ384ERzhb1jZnX3WlpM1M+ipJH0WXGOClYmhNKFoK1AIBTLBjzi4xX1reRUw+r6
 nO5qhVEqPI93ZUpC40deJLyN1ogVyt7DoKioo2MeMXqazO
X-Received: by 2002:a05:600c:8209:b0:48a:58ae:993b with SMTP id
 5b1f17b1804b1-48fe61f2a2fmr60269025e9.16.1778852064624; 
 Fri, 15 May 2026 06:34:24 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe537c788sm60376205e9.12.2026.05.15.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:24 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:23 +0200
Message-ID: <20260515133423.317207-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503100130.1637945-2-chakrabortyshubham66@gmail.com>
References: <20260503100130.1637945-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852065; x=1779456865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H/YunLfujzyAmjvobUTJL5YzDK1FESJrQ037zaw/So=;
 b=J5MfHTTa5oaLkkBkOzacZcGpnYB67ofuTpoe50g21b+/Un8/l2qNWcMYjLSvKcI8W1
 +dHgwteAQhrNLRLvCKyniVoJmusTvcS0rZh5l2buZVqdtdQRLZLHxwsJrx9hQpa3WAca
 Dfcf+3QvRiImcHmY2bHcagFRG2hrFGNk3R00WaG+twnmLsT4lzZ7UMf8uGNUkT60Llqi
 O+Sksa//wKT69x58jO/F7dTvkAv1W7YdqVa9Uxciee4so+VDA+vwySqixaLWPZm6wRNK
 gsV0aKwNnPozi50GClr3kPsvaxmNME2+A9TI4YgL6kozAL44eSnZjE0d884wyzxzZlQA
 CW7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J5MfHTTa
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself as dos2unix
 maintainer
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
> Add entry for package/dos2unix/
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fd973d7f86..179cdf50f6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3050,6 +3050,7 @@ F:	package/wolfssl/
>  
>  N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>  F:	package/ccache/
> +F:	package/dos2unix/
>  F:	package/hyperfine/
>  F:	package/pv/
>  
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
