Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDF5C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 156D46162A;
	Fri,  4 Jul 2025 06:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stBk8oRYoyPj; Fri,  4 Jul 2025 06:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4704F60B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4704F60B97;
	Fri,  4 Jul 2025 06:47:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46DDF1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DD881190
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pMCjAgOOkb8 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19DFE80F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19DFE80F4B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19DFE80F4B
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4530921461aso3901695e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611674; x=1752216474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puzRPsKeP1XZsYkTdlB5c5NQn0nLiIgng+sK2X+TMIo=;
 b=c8LDH3grqzoifYLvsWMuBzszOSCdEGxb06b963JlElzYehm1o7AVSpuegbU0OscyfV
 9X+2PQmLorZwjw7ipZMP0tlTyPrJtpRr5OYmvRRt0OKBwpxNJ2fBsW+jkNrUAkJlTJ56
 2TJnjQQJ+xBnw1wY8Rgqde9W+mxNMohLbKfMZXAUjvhJgrRfkoGpdef42nb0MD3OR7J8
 F20mANp1L/AufQOFcNrWTH968uhWKrKnXwGft36uSz6288AiEXRBfivL/1qNgJivzMKn
 44lfUAxUCk0EvvMEUPF/15IR8c+5fdvwJoR4/gcUTnAXkrsYLFjxjV0miI+IxDRy7qlA
 rTUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrN+/BSokIf1OmDZY61zXivATdiVinT9/VECm6ReuOBtenFdMryaWm5HYKULn6EuyJ80ITQ/C3V/s=@buildroot.org
X-Gm-Message-State: AOJu0YxqOeWBA8AD6YWGHczcOhkCIKndBu4llwdjoA0C+qbQu4vWRluX
 EmWXX4UqWL17Jz9ULyZfV5/nCtTKVA32FTFXzL2TdBnr9KzmIj9a15vRicI44d+b56U=
X-Gm-Gg: ASbGncvysrw2M0cKGynHoq/o5MHrIydzkjZV1d78RznKuXQ23ymWpnR8mHDfjNldUd0
 XYEJwmzyxENXGldlT6kf0Vt0emmwe+i1V49oqtLHC98lFbwaeNEhtLkeMZdzL1BLAJgnza6Ov7w
 JrPdqyVFMgKHIxtras1WOkh7p9japlP+GTpdwT1JdX6ec0+ZoLJDJQ553wsQUm02hSLDnJC0mK6
 +vamoatcT9ad8PR4dmIOzjc0LniDPhPwx2SaRqfbxxfdQuL98IWLHWm1GVkFL4fzFJZIjEER0zA
 MCtIT2nuVDBpufug8pqnlUIbZPgyUjM+htXMjTQ0u4jEPDzGl/JajR/XaAmmhu9n2QYtOtQeRRA
 F5FXfj643mQ==
X-Google-Smtp-Source: AGHT+IHErS5OMVaW83q8JD7/34edNJAiRFB4Kt94f4q1essMvbmCRCfEPRzvdQ5yq8xuPtINk5WA2w==
X-Received: by 2002:a05:600c:4754:b0:453:697:6f08 with SMTP id
 5b1f17b1804b1-454b31131f5mr10637295e9.26.1751611674128; 
 Thu, 03 Jul 2025 23:47:54 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a2dcsm1640521f8f.71.2025.07.03.23.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:52 -0700 (PDT)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:52 +0200
Message-ID: <20250704064752.4065189-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
References: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611674; x=1752216474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puzRPsKeP1XZsYkTdlB5c5NQn0nLiIgng+sK2X+TMIo=;
 b=SkLcZmyGEU6xCX78wqTSg/pTk0DME5NzycxXMyqNUP8HSt5xrVkYyDK9R1eGkmLhtv
 M4aKKvl34uAGf4ig5TETu1cTAPa6mOkFa9/HBDUdJeSQ6E4azmvHCEqGoCKGgzFccQYR
 +Nrv8umHXQvGdpaw2Ept6dOFBjmx3r6eYaMAxcvC87qkl68MDzghHqxHsuuY3p0MQD2o
 qTSaWMUISYRcc8HM6Idtvi2142NTA4hbM1xT1qINrx8+NqLOyPq48tZ8mDFEIm/7zKxZ
 NH742zyZHhFkNSe2dyGFhtqHa/2D3pyReeJh3zF5vs52WCKum0EgMwZQvqKnqFcHov2K
 Cr+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SkLcZmyG
Subject: Re: [Buildroot] [PATCH] package/linux-tools: rtla: Pass TARGET_LD
 to the make arguments
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
> In Linux v6.8,  the rtla Makefile was rewritten :
> 
>   01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")
> 
> The new Makefile uses default linker values, so the host linker being used to
> produce the final rtla binary.
> 
> This results in the following error :
> 
> ld: [...] trace.o: error adding symbols: file in wrong format
> 
> Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla cross-compilation.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to 2025.05.x. Thanks

> ---
>  package/linux-tools/linux-tool-rtla.mk.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> index 449371ddfe..d9bdcc3016 100644
> --- a/package/linux-tools/linux-tool-rtla.mk.in
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -9,6 +9,7 @@ LINUX_TOOLS += rtla
>  RTLA_DEPENDENCIES = host-pkgconf libtracefs
>  RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
>  	CC=$(TARGET_CC) \
> +	LD=$(TARGET_LD) \
>  	EXTRA_CFLAGS="-D_GNU_SOURCE" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
>  	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
