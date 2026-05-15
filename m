Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D73CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C1D84100;
	Fri, 15 May 2026 13:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmaLSrHF9BeA; Fri, 15 May 2026 13:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CBE84176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852009;
	bh=8R5bbiHbrQAvqrezIkgKqKf1ZG0GXMM2sLMkqt57yIg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IHgY+odTz5dFbc5XiiKjnWJk9j/IVywpsBWG6EElji6KZ+31Dtj7/5Dpzc9HbYJtL
	 CI+r1KekbxCkFWVxsdtAiA19mlVLrq8UTAdX2xToDvndWepiZ8iljfjxWTghlhByji
	 qUei/Ice3fjkXOhut0CCN09QylNp3OhpqQadXZHk8NaiFOp/l7rBqAGJUde79fT4qx
	 bOvbfSkZvd5hBisgoCTQFFVStELeHFN6860+XXIe1LspevvQ0695SvKBhpxMQMApdw
	 6gCsEtgCihaO1ggvCWXeDH8/85RaCy7/039kJrXcCgIGPZO0SIZNWBK940CxI+hJN9
	 ERvRjV2rL2Pvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18CBE84176;
	Fri, 15 May 2026 13:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E2036F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B9983FE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLR10vIF5rF5 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBB9E840D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB9E840D4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB9E840D4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so101950955e9.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852002; x=1779456802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gJDKjCRumJj5GueFLaSIqxMvlGGfYYPzRj/wBE1ueQs=;
 b=BOgRvcPjtAtEyzZ9L+NY4+UROBI9xphPw+PZvEZQbjQoC1vjvquXTgOnq8LRGCO44p
 LvlyAo8C6ACkZFagqPetZeYGXDw8+U1s7vHl6Q1dCIJkJJ6/p/v0QSi+SWFthvJbi38r
 7gORx4FXog68xuKJq4G4d/VV+SNx+bpZ/mNsUHIM9v/fykUqw8HB1OfCEAcscexR7bL2
 nt4q+drsmcLaaODYiF39x4TyAR95cTU5QqtQDB6vjVMb6bLghWubHxBpJ2z96L5KpNlF
 ma4nSDWNQb0140PYJtvoo/t/shV7hco/YzB0xGi0mOlokKOywo1aFDGdtQfPhXCfsBn9
 kMOA==
X-Gm-Message-State: AOJu0YzQIf1WFSNkWRholix5ADhwcrC7lGRL96tgAQ98969tDDQB1ll4
 RkYWjOAZOsMm5lfaVpQQ2j1kRbSuR5OQ2TPqcovZA4bbDSXlfWXK4VIOd+pekdKAs+g=
X-Gm-Gg: Acq92OFC7+tNR+hzH7ZHHYVc5RHcgvwH/8UkipF4YtVVTV0CpY5ogCIfZXqbk85intU
 SgKRtYYZ+Qq6tvDdgmHtnnLSNzZh+U12fkcI0yXnTeR9OuZ1ebZ/6JvJ1mhwvBdZuDYATLv1JgV
 jxLSZRzoeSp45hsKlNKY5oJrIf755Uau+gNvjwAiCWzsG+e1YKb1rMjBaKwkM29VZ7qa7CgH/0r
 4CLOcNF53bKJuCoXO0kc/OmcO7dcbe1c4LQO1BEcVC4IA15fkGgETQ4pOOZJd1rXzkwSNaDlTbo
 w2TdnBr8Hjiq55/EoPRyQVMFJDjuYd8eJvSJuGkcFMcmbiDsbR5zLHoRWDMiQAScG2EXyW0HY8f
 3JWOM1FpB8LzQOCqwUvo3GYgP44puFZEcS5ywK1oUwftZjvs3LSRwi0KFwB6Dej1sr0FmuxS+/g
 qvo5rxRhi+MNmyUxpetXjY8+HKTaXt7G21SeCIBeewMEly
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-48fe6322416mr59569175e9.18.1778852001748; 
 Fri, 15 May 2026 06:33:21 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767cb9sm14470909f8f.2.2026.05.15.06.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:21 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:20 +0200
Message-ID: <20260515133320.315072-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512093117.154895-3-thomas.perale@mind.be>
References: <20260512093117.154895-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852002; x=1779456802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJDKjCRumJj5GueFLaSIqxMvlGGfYYPzRj/wBE1ueQs=;
 b=YQuxuttpDFOmwClwNAJDfmI8P4iiLbqyDDJFI4JYglbIdh+r81wupplsRN5Jein5Bv
 hJFH/ctCMPpf0+31BbYYA/9UjRFVQxY2v08gycaAB97dj5L+BYLo4UhFo5BrFqlA/dEl
 QDW8zX5nQkiWx3cTnrmH+tJ5ABTECduCdBrudgef2sR4XVsCretSrC+mzWvla3Bl3fRl
 KaSO7O/IQQFeZCM7GSvmz5TG5iK9gAYK3tpCxai8XFWS0ijgOFo66gA9v+bHMPBj2fOI
 KxHhALE6fozP/r01nKK1lS6v+lKatgad9wZIwg7TST8UGdxLYSVuSyhPUw/ugo3f9lCP
 /fnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YQuxuttp
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libinput: ignore
 CVE-2026-3509{3, 4}
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
> The vulnerable code was introduced starting version 1.29.901 & 1.30.0
> [1] and thus doesn't affect 2025.02.x version 1.27.0.
> 
> For more information, see the NVD entry [2].
> 
> [1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-35093
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/libinput/libinput.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index ee15b781e6..1930a8cea5 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -15,6 +15,10 @@ LIBINPUT_CPE_ID_VENDOR = freedesktop
>  # Tests need fork, so just disable them everywhere.
>  LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
>  
> +# Code not present in 1.27.0, see
> +# https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
> +LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
> +
>  ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>  LIBINPUT_CONF_OPTS += -Ddebug-gui=true
>  LIBINPUT_DEPENDENCIES += libgtk3
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
