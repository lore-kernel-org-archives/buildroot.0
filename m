Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B95CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E83F4244D;
	Thu, 11 Sep 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rb9Ss1PQmHNS; Thu, 11 Sep 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271F4422B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271F4422B1;
	Thu, 11 Sep 2025 19:27:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 049322735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC2C84B12
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mquFOetY5dYV for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:27:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFD1184B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD1184B16
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFD1184B16
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:27:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so214882766b.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618862; x=1758223662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pn/o9svo/Y5uUW7dntch7denh29i87j5Hl8SbN73+I4=;
 b=NYgoTmqpI2NO/asb4Jh6MVHlqZaxRoaRBJA8So0qD701AMvubmeWLG4D9MHhBCR9JD
 Qc1fMKRf6rXE38qabIAOwMYWREn3VsdTnhzZ8dVUmKV2IoEMU6S328iSrcD07ycnyeVw
 LY1rwCEKhjsEhR0df7MVfpkpyr3JATcrqryouPYvTGBkzmKvyZu0q/DTiYk77jpEZIdw
 dJi/ZlRbrGEs9r3wwfAG7iR8DeisNViS5pUzO0I8GQBk66FJGzHtt2Cwhy/ox39FKP5c
 QHdG58v8cu2nYA8FGlOm4bzSD0O+qyh6adkzXn09i+zsSqo1Sq/H/eRRbJ2qm5fK12vN
 Tizw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4OuMmsujlQ58IG4FeesU2wm2Xyhz1fEgIU2/C9npiiBJ6QBVs6T1lHcgZyM4tbDYiLcPQbV7pBmo=@buildroot.org
X-Gm-Message-State: AOJu0Yz2lDm692QSazvk4sv+Dq73/2YUYTGhgVhfth7VqsJmBiU++JZf
 hY3Nq6dubZzjRXNVKb7EkvYAnwXfOiI3DVaLuTunmQAB/qkr+VuoIJJd8/HdbTIa8ubAZaA6rrd
 QtbNZ0eY=
X-Gm-Gg: ASbGncsqzyN0ne7/k6HppTtIgcTAWrmHGEkqsymfTJqdJpcmI0KhH8nK7eCZ31wL+Z4
 F+vPOFIWTgqzQkLCu2/MWHHbE3dQssYxJFWlu6rSCaJupWSTcsTgAxrhpyPj5jV0EG3nYYxxN6B
 s8CXExj1IZlvfCiOeTC+e7WD1xPmCJc7HAk4mblmA25oHsSNWOvubM4BLQu/6RZ/7hN56Fyb1FJ
 RyVAg36GSFccuuBaM+z3TFHAZoceBIqFyfFBtSxV4+CfXiT97N3PT2h70Y4wbWLWzKtArDL939o
 9P8mNtGFH4Vqrmfky6KBCrOZC56+5NU0oTXDIflcraP5n3TWZVokYAQgXL1xRGp3Xu6U9cgdJ6B
 zJHwG4vLDjEmAglXXdv+Bgde+lcWdmnQq4dsAe/VWhRl3or8=
X-Google-Smtp-Source: AGHT+IHapQgYZoSPUmL+MyNBCbftp2RZAGf1RE2kAt1tjKXcRekGWgURI1XJ8q8BNAYcShAMSOGAOA==
X-Received: by 2002:a17:907:3e8c:b0:b04:3f7c:409a with SMTP id
 a640c23a62f3a-b07c384b214mr28604866b.11.1757618861794; 
 Thu, 11 Sep 2025 12:27:41 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31295c9sm196187266b.43.2025.09.11.12.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:27:41 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:27:17 +0200
Message-Id: <20250911192717.2672803-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250907095717.2202752-1-romain.naour@smile.fr>
References: <20250907095717.2202752-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618862; x=1758223662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pn/o9svo/Y5uUW7dntch7denh29i87j5Hl8SbN73+I4=;
 b=H5J2i9IP+HwUwY57gZ6rvbERU3p1/sNzTIVh3LCquvlOdapCKoIzRKsu10TuVEmh4K
 M5BQxzAPxN0IaYvQjg6Cdoqn1HC7LTEXzShO7kZR8OQiagFzQKCkLptMId1IYfQTqUxn
 lXIWnNxnrOoFSS8gnS37uR2DwiTwDeijVtx/wptwmQ1reXYRQYTeUTb8/E1FKgpVSH6c
 KG9csLQpPtZ5Me/RkeyPa01NqAMke8QLc+sxxtXrUjn/7nzfqf1tbCDDWS4BN/AweIUD
 TiyGkm3Lnp3KhaEg8vxGzecHQXYImYHN0/QI+pjb4m1gPFLZwzQAQapoFHPloar7lGoA
 xqzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H5J2i9IP
Subject: Re: [Buildroot] [PATCH] package/micropython: fix segfault at exit()
 with gcc >= 14
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
> Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
> the TestMicroPython segfault when testing if micropython can return a
> non-zero exit code.
> 
>    micropython -c "import sys ; sys.exit(123)"
> 
> This issue is related to the gcc version used to build micropython
> (gcc 14 or newer). Using gcc 13 (like Bootlin toolchain 2024.05-1
> previously used) micropython run without issue.
> 
> The issue has been reported upstream [2] and fixed in newer micropython
> releases [3]. For now, apply a temporary workaround (suggested in the
> bug report) using -DMICROPY_NLR_SETJMP=1 only for gcc 14 or newer.
> MICROPY_NLR_SETJMP avoid the architecture specific implementation of
> nlr_push.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774762 (TestMicroPython)
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
> [2] https://github.com/micropython/micropython/issues/14115
> [3] https://github.com/micropython/micropython/commit/35f3f0a87db2580041dd0f7dfd4361df48887796
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/micropython/micropython.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 949abe3b0b..32b361db16 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -29,6 +29,13 @@ ifeq ($(BR2_xtensa),y)
>  MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
>  endif
>  
> +# https://github.com/micropython/micropython/issues/14115
> +# Temporary fix for GCC 14 compatibility, should be removed after updating to
> +# 1.23.0 or later.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
> +MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
> +endif
> +
>  # When building from a tarball we don't have some of the dependencies that are in
>  # the git repository as submodules
>  MICROPYTHON_MAKE_OPTS += \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
