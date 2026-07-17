Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF1BC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D89540B98;
	Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYBlbnEk4pru; Fri, 17 Jul 2026 15:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4542940BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303268;
	bh=nXk7H7bB09rLn4W/zjLVEMrU4pOVRw9G/bYNENFvAJI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dms1/ule3+9PvNpOW+2jK37RxidLYLIt96dARcOdv8Y3eNYnv0vlHrzNn8Z+UVK14
	 Jikg8+QM5hWaoI34Q8Pr0KN0sDiolPiTRGrLrFvukQaW75dPCzywYMgBdEMKNkEnzg
	 bdtKNzs2PUzHQnGsC/bhV/MlGaQMNFj544l5nOS/T1G7YB6saD4e+nLa0Qbo3MR0Sw
	 ksPIQDItEnIZN6dEouMZUON+C0huzMwmEbja8DrdpCfpry4WXzP7Ohl2NfEKb2HM6C
	 RwQ2xfhpYkpJBUsXgYOohlza3yXc7jZdeFYXl1ZRKCQ8LVF/pWgEEPu2shiovGbNk2
	 U/nqN+rG5UJhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4542940BA1;
	Fri, 17 Jul 2026 15:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC8E51F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE24D40291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iTdCWHCBw46 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 765E440056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765E440056
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 765E440056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so32686295e9.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303260; x=1784908060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tpOWZb5ePuRl6dxNtiPM899LX+RB7AQD7AZUTLY8QeU=;
 b=XFDawLFRG4KA6C0dZxtLUvLyjMTSuw0kcwUEgsRZcUtIBA+MlkG9KDMElzfiQWG9uw
 J0Xj3huLd24SrmeptsYedl+44VVnjB6xHlhBdZiYRsdKn229E+PuuB36iv+gmBcCZbjb
 sE5YqR68N9zq7nAMhfpPQKgadq2pDxD0NipPvn4jZ+tRuAr76aC8Gq54KSWCaCema+Le
 9pXE/XiWwtBO3R16LAwQSezuTVDZlYS50Aoozka8YfPAzBl9yHECNBwbwLIHo77bQuwL
 N66eQl4g1Rwwpzw2qBDxCMqTYpknAfLIrOrykToN2epy5aUka02cOuug6pr6hbNV3/Lw
 bQLw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFX32VscwcpHvC0XEWCX0uqZ3InhF0U07hQuQ4XYgB6WxcsmvPPii9u+3V+0JaU3p5P2f2YUxLAH0=@buildroot.org
X-Gm-Message-State: AOJu0YwHxU0ZEW+96HcDmfViXI6q7Rk+FEYi5erhRodwM26byq3Y64KM
 cytjcVONAroNj3PxicbEoVWoO04mgdVXjx0I02NmLDV/2Qg2USCrN+QupT+08Sn99IFcvWQ7YTl
 tZnPo
X-Gm-Gg: AfdE7clCKhGyWqkKp5MOKV/hPdf+mPWkMuSzod/+MegkXOCeKibHdobyLYBou3FIfNV
 w9xooEkm0/AQQSAA4irvcoUQqN7JcYWIHMRfW9pgkMjz/jeuHeB5CVVvrkHBL6tWeraPaeXQay5
 Zhvf+EShodG70xVCRp9RelAPMxK8V80Ev6gjWCItf0ehTNlrDxFTFZpSRTj4wmfAuqLf44VsNd+
 4iXxqJ64TMu9fmVGWom2rsmPmURBuy5UleRB4jcZ2jezc28DEIfL4QKxMiNpR2izxVR4quro5MO
 T7AVH8MxcmmbCh1x6MW/rJaLEgbFFRimqh1MjtRYmKa4xvkgchDoKhkChb6BiIUFcQrK4YWO3q8
 bLqDDxmVZSq2k4SaiO7PPJLn8LPmEp5kSGoFV7avZSccWwQoBZC1PPjd9Z3IdgYIwD6LOWqs=
X-Received: by 2002:a05:600d:10c:b0:495:409e:bc80 with SMTP id
 5b1f17b1804b1-4954a51b852mr25594785e9.37.1784303260277; 
 Fri, 17 Jul 2026 08:47:40 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f67466e09sm2097943f8f.21.2026.07.17.08.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:39 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:39 +0200
Message-ID: <20260717154739.192324-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712110525.1544641-1-bernd@kuhls.net>
References: <20260712110525.1544641-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303260; x=1784908060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tpOWZb5ePuRl6dxNtiPM899LX+RB7AQD7AZUTLY8QeU=;
 b=GsNO1ourM+CnMmbqV8s7kPGrvCpB4sHPy3tjAnXvY6lVnbj2ZCKrgILq8hUEGiII5s
 ukt+VYwfvYNP4yOB8QMD3zmbCet6/2hVjYoB2bTywvtM48MHi0A7pOvoI7vD4LsnFjHg
 1ylO84XRBbJ/JKOzAtnt2wiRcmUZ72F54ckR/RZB1FaUy52wiw3KJ3YtYieQYJI3LRJ+
 gHfwXHEjGDAHsucQT1qVCf3ndBNPLXXdoQMFMaxhJCOEqHv7d78jE2nNRMXCc4B08V+8
 dcmFmtb9VGZ5cnyZ4PpaGGpUP8f8O32jbkDpByJTVJpyXCdZvl83mOfFwEIEaQ7LwhH+
 /zxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GsNO1our
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: security bump to
 version 5.0.2
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
> Rebased patch 0001.
> 
> No CVE entries are found but these commits are part of the bump:
> 
> TOCTOU + chown-follows-symlink in socket directory creation:
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=3dea5ff20c58ad497062d094b6a9b80a7535a7db
> 
> fix potential null pointer dereference:
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=ff9d98b8e39f33b07156995188ca55f3459f4d53
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/06012fcffc60a88cad7beb43b73b149d453eb3db
> https://gitlab.com/bkuhls/buildroot/-/commits/1f1b7f8d36e68f6ded627ff203413de028443d8a
> 
>  ...001-Do-not-create-backup-of-old-installed-binary.patch | 8 +++++---
>  package/screen/screen.hash                                | 4 ++--
>  package/screen/screen.mk                                  | 2 +-
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> index 4a8a55dcec..36a8c9a2c2 100644
> --- a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> +++ b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> @@ -11,6 +11,8 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  [Julien: rebase on top of 4.9.1]
>  [Julien: rebase on top of 5.0.0]
>  Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Bernd: rebase on top of 5.0.2]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   Makefile.in | 5 -----
>   1 file changed, 5 deletions(-)
> @@ -19,8 +21,8 @@ diff --git a/Makefile.in b/Makefile.in
>  index 92f434a..860ecd7 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -77,12 +77,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
> - 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $*.o tests/mallocmock.o
> +@@ -85,12 +85,8 @@ tests/test-detach-cli: tests/integration-detach.c tests/macros.h screen
> + 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@
>   
>   install_bin: screen installdirs
>  -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
> @@ -32,7 +34,7 @@ index 92f434a..860ecd7 100644
>   	rm -f $(DESTDIR)$(bindir)/screen
>   	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
>   	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
> -@@ -107,7 +103,6 @@ installdirs:
> +@@ -115,7 +111,6 @@ installdirs:
>   uninstall:
>   	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
>   	rm -f $(DESTDIR)$(bindir)/screen
> diff --git a/package/screen/screen.hash b/package/screen/screen.hash
> index 61bacd88ff..f030e45490 100644
> --- a/package/screen/screen.hash
> +++ b/package/screen/screen.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
> -sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
> +# https://ftp.gnu.org/gnu/screen/screen-5.0.2.tar.gz.sig
> +sha256  ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332  screen-5.0.2.tar.gz
>  # Locally calculated
>  sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index c85abaf411..c279fed8bc 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SCREEN_VERSION = 5.0.1
> +SCREEN_VERSION = 5.0.2
>  SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
>  SCREEN_LICENSE = GPL-3.0+
>  SCREEN_LICENSE_FILES = COPYING
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
