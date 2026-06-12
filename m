Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5799CCD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECAF06106F;
	Fri, 12 Jun 2026 11:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsudWnGcTiQ5; Fri, 12 Jun 2026 11:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FF06136F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264304;
	bh=nbwWRO7t8kcQdzmuSEvqaiqzs2H0HAZYsu2erQYOapg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jOgLEG7Ai+ITzQYw9ub32fJL4BqQwhA4tMoyWe1HlRZyrtczuobrGu9mOIUrkGxpb
	 a71ROlPuEkJ2wqq9il5SL1J9j4iTTfd2WTSo85oux2lqTaouYwe/NbxElRdFuEDcJv
	 AsF6RFIOCh/crQ2kRx1JrIs/2BNTatPC4ErmEeo/HL9zhgXpbmM+y3W/p2yoAWbrw4
	 ahY5M9RVXp+2YD3HEXUwuXh6QX9gujVXyV3Z3BFLCKWD6mSbiZBaUZnU0OBE64Q75j
	 GTGT8bkED1lE0q3WDMu2oRqDr6Ck8MMioeZ2IR4Q3DgsFnXi1I9rgElodkg5ZUNhAU
	 xK0xcWU+YLthw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FF06136F;
	Fri, 12 Jun 2026 11:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9B3712F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAEC2412A8
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eits_NOgtsPk for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB546412AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB546412AF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB546412AF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5917065e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264290; x=1781869090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HrB7LAk9euez8Xb9m9782JLn9q2NXWqLWs6dZswMyuk=;
 b=dIuIEapi4UX+wWP7CN4lCPWKK5QeLVvXTudPPhmAY7NVEpcHVC2s/l+XVNuAEw90mp
 68UgXuK0sUTn9+iMwHF+jNOWFBgFR+b5qqRsBZuH83Lz7qOFC235M5LXsRx0S7Rqoyaz
 DTU+wDpgo5pwN6OVzAcVegckFFeuulpvYFxHDiunFt7PUiry5FZY5WTG4rYlcVHaBXz9
 5fqLinZwJ8RECkS2G525I60Gllz/4B9Mc5lDzvZRkuT0ShUHM30ZJmu9pbFzu2bvLdD2
 LeWEDKgiv4eoojnKgK9dzM0m7uPjfjh7EU1CYwpa7IZRgP1D96qfbwksxh3zNTkkVYOP
 GHHQ==
X-Gm-Message-State: AOJu0Yx3Xhtl1jqw3kT3MbTAyHLZ6U/pxB7H5DCgjhmjpeMaeHzgj2hf
 INGlsDKBeGXzzcS/Mr9zk+EGiQ3A4rzRWt0YPOKjFyI9XjXlr6k03jmz9s4pIVALo42L00SrFWF
 xP0yZ
X-Gm-Gg: Acq92OFtVwHukDOLtawoVs3yiYbZw1zkteK7zxa/if/Fv0vtIDDF36yTyVxupu1UUiP
 p1bLFQ4sambWxzHpBw0VCAs8n1KqiAqFNeI22E/PoSMibiY1GKD0cSM/BE/LVchY/P33cwTXeNi
 lQCVNiAkGL2wbnI6+fL1puwUnDwdYhzDsXvLNeuR5qOXKC9AR4mrUA7V0YK7NRXKu3yngDimvk4
 qa2y49KHMW0yHlc9+4/RME0nwdI4Qpwh2to71Pr8uMK1WcBKj+NitBvTN8R5nak6y3/MpiNXBkF
 UUS7qKERyxQCxzzjOpfoRI9VTgxQIxn93iJkcMU6tnyzFd6eioj0ZbM7o4SOwHW1T0/gdVvkkby
 VnbClas2NMjiPUjN1JtrpNhSND9/yBoxJgZ+Ts46EoIFamfTl1uBev7TSE1OX3AnRGMG5UOs4jE
 /Q3nQUOW98raH8tBU=
X-Received: by 2002:a05:600c:c494:b0:490:b2c9:e284 with SMTP id
 5b1f17b1804b1-490ec4f7c07mr32567605e9.30.1781264289750; 
 Fri, 12 Jun 2026 04:38:09 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d09a85sm137564455e9.14.2026.06.12.04.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:09 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:08 +0200
Message-ID: <20260612113808.253055-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124035.287632-1-thomas.perale@mind.be>
References: <20260602124035.287632-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264290; x=1781869090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrB7LAk9euez8Xb9m9782JLn9q2NXWqLWs6dZswMyuk=;
 b=XrDOuZR0BzmpSjdj8Xd8r8wq4X2MM9U40lNZZZ3AmOdMR7cnbjl9gihN+GIvxLQK6G
 7FfmKPkeemS43pB4PgvSjyFHAxIhY7qcWAgWMmr9eIhqG9CA9ycF0ga8KnOJy+NxRrKP
 YMdWjrU62mj/c2fBTVQFa0heMW2cl3omhhMV08CjqTeHhWaw7YPretuc9Qn8yYnb8IsB
 4skGGY1i2OCabk9Cdc/zGNx0mli3hzD7UmBp3+btWUDa/tk63CWzck3e4l6bmc14OPWn
 s9IZHS690iov1exZx+vPavJyjDDRVU6eqSYLO7zfbDc5y9wLUsAtAeogAvT2Xfh6Ys38
 Syag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XrDOuZR0
Subject: Re: [Buildroot] [PATCH] package/python-ecdsa: update CPE
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
> The CPE 'python-ecdsa_project:python-ecdsa' hasn't received new CVE
> since 2019 while 'tlsfuzzer:ecdsa' received two [1][2].
> 
> See the package CVE history at [3].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-33936
> [2] https://nvd.nist.gov/vuln/detail/CVE-2024-23342
> [3] https://security-tracker.debian.org/tracker/source-package/python-ecdsa
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-ecdsa/python-ecdsa.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
> index c94cc0512d..b1ac6fe1b8 100644
> --- a/package/python-ecdsa/python-ecdsa.mk
> +++ b/package/python-ecdsa/python-ecdsa.mk
> @@ -10,6 +10,7 @@ PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/c0/1f/924e3caae75f47
>  PYTHON_ECDSA_SETUP_TYPE = setuptools
>  PYTHON_ECDSA_LICENSE = MIT
>  PYTHON_ECDSA_LICENSE_FILES = LICENSE
> -PYTHON_ECDSA_CPE_ID_VALID = YES
> +PYTHON_ECDSA_CPE_ID_VENDOR = tlsfuzzer
> +PYTHON_ECDSA_CPE_ID_PRODUCT = ecdsa
>  
>  $(eval $(python-package))
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
