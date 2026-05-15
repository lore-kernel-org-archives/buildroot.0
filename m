Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD63CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD50241D92;
	Fri, 15 May 2026 17:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCilb9lg-0CO; Fri, 15 May 2026 17:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D102141D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867198;
	bh=NUd6z/0Bf7sXc08y3CQw7HOGHrEiDw7R5R7ZHucYteA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pmM5V1ARGl2N1VV1Iw7gQl8Xob9n3Ipr05NvEQ9cOVG4uodEfPrs42dGGwhLNf7SO
	 sc754oK3QUl7XYC/RQBGh6hI2riJY9HGVbiiPXRTBPIWu0RpWhq8+3QyrdhpTE4va9
	 QIL2TI8PLJa2q2TZGPR8WP5zJG9hdmvz9BLplXBLbJa1PhsMrdw/INbu+fvyBNCRau
	 GAl2N2+UuyzJaWbNqUpm2xbgN7BxLZPIb+VU5LS3TTmeEbppPRq+rNYKOyzYRX3fmd
	 mMoe3RQOF1+sPnhKBqEZ8rdfLNUTK3MY5ei28waWqhoxBQt7gLS3mfOAC7fN/NS0zA
	 Yb9WNcQiRk0pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D102141D4E;
	Fri, 15 May 2026 17:46:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D451223F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8A2861623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6eblN1cnRUJ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBEC561697
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEC561697
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBEC561697
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so449515e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867193; x=1779471993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N+Uox1OOb5elubTJTEBEyVUTQ/bKay25EVJwR1bm/eg=;
 b=metlP3SEV9VRjzrDhnaBT3I1f7P3+BikBclY4Rjzs3IenVpmPFVwaOdPy2Bm5L/zUg
 wmSEm35zPsNsYxt7cRX4TJe6HnFBgMKl6qw+9GOxaSJ2UmspupZdWb5fVWjj5gWEtgUx
 evlzsx6yW+nxfS4vlxc8MUmetT+6t7AE8F/aHN+GbMYEcz0gVFOGIO8TzzdKGuIdy8kh
 IbkGxLsiHHPMXlFKQK4U7uTXDfTomEW/CICvoxrobor1GgBxTUXkkQMs/JrGwBB9/K7m
 IYR9AEMRsYzoncJ58iWqIUdgma51IMBDsFEvnbAuTNL7jiI0os2Ss24M5V47REDx2yeq
 qKEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sfzY23vMIRcDHUP+vEqbn6l0Vybxm4L89limKLJnFX4YUB8+RQh8V6KEQ3mERUYchE0qH60VjUDE=@buildroot.org
X-Gm-Message-State: AOJu0YxXfKXpKlbcqBBpvbTl0B2TANJXdyh9qgqYuOuLUoDes8h/KGwK
 41HxbT5DdtXQlF2NTc4Tuv5vOPczDybOuBXTzWP7wsr4iWV3/3hmTdcsqjmtdSkq+FU=
X-Gm-Gg: Acq92OEItopVXHq6tSzLWpomc25fWjW2QikWtJ2UtepRnQoBQB3Rd6bIYc5iNJ6s5tG
 1Fe0sRUJ2LAJ/9aqN8gfo01vZKbfGLLfki2R7kO+imPAsjF5RlknqWBqtgJkugmOKgq1+XLF/0I
 IfJ3lheanGNXosjjg0IVxjpanOPKdvD+hyNFTJE2M3FV+ni9NudbY40LYQVfkl4Ku8HN4kO4wm6
 rgC38ZOTAoF39COVsHO2X4Ak1uTwjxPN/1hyT7WLLfJkSKSt7K1TFtZ+1F8qYCnCr+o33mQ0Ply
 yHf5AKKMYSuPwN5+eZFSF4swvQ2PwGtTq4CRYxr6T6x0Q5KWKYOgXFXR16tlzl4Kvy5D7KrMqZE
 yXTjusjXlOW3lwS41j1mOE+fzugKDZassK6gIa6NjxPsGKmjlA6j7oSYuHNWzexxhXN7V5NlGY1
 fqAO3aAEGCBowrozj4jn9Zbl8D5mq5aogj36oGwMbasfkz
X-Received: by 2002:a05:600c:3104:b0:488:ab1d:dcc5 with SMTP id
 5b1f17b1804b1-48fe651b57fmr66857285e9.27.1778867192870; 
 Fri, 15 May 2026 10:46:32 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm72277315e9.2.2026.05.15.10.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:32 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:32 +0200
Message-ID: <20260515174632.529941-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426153334.1026982-6-fiona.klute@gmx.de>
References: <20260426153334.1026982-6-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867193; x=1779471993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+Uox1OOb5elubTJTEBEyVUTQ/bKay25EVJwR1bm/eg=;
 b=U84UoUnu0xf/96nzW7p0eMHcEHxk4liAwQgS9mKxEHNNYBwV+8e1jHe1dKoIF2sNmC
 yFxi7YU/R+v+MFRbzYEdd8YeSNOdeKKzy03LsZ/r4jZ8v43CqxaivBM9pb2zpcZBbRM+
 uC2LbRZD/2cYWhWEZfCetpavs0XORFTIdDIGbDKSap1m8fX4gTqD+jCd+i429wvZnUgR
 lu1LghilT8kwd8SAlWXRrL3n5s7+DSAXXpau92znuiJxCw85z4wgnUGVwHnFD/pGaEF5
 jCMORILAmY5CB0OGDEMwU2hGdVC/pZl76AvDc3AMWGe9zMuFqqEal9CU7ZOK7GzHh0r8
 nn8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U84UoUnu
Subject: Re: [Buildroot] [PATCH v2 5/6] support/scripts/pkg-stats: don't
 buffer whole file searching for infra
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
> The file handle can be iterated over directly and each line is used
> exactly once, so the only effect of reading all lines into a list
> first was higher memory use and complexity.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/scripts/pkg-stats | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index bbd1e3e6f0..5dcc812e2b 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -197,8 +197,7 @@ class Package:
>  
>          self.infras = list()
>          with open(self.pkgfile, 'r') as f:
> -            lines = f.readlines()
> -            for line in lines:
> +            for line in f:
>                  match = INFRA_RE.match(line)
>                  if not match:
>                      continue
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
