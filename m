Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685ABC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:18:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E6860F23
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E6860F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D39E860752;
	Sun, 25 Jul 2021 21:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lpJlFO7OJZ7; Sun, 25 Jul 2021 21:18:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB5E60731;
	Sun, 25 Jul 2021 21:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B90CE1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A83A6403B1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjOvyudNhAAh for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:18:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5288403AD
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:17:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b7so7947554edu.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=2zWzHryVe73lcg/R4x0fY+aaqWalii1k3hB/+CPgdi8=;
 b=Le9lBOvKJoZAq4iiexYnjr+3riejrqhChLPX9ja1hhS40IBF80vJyKUj6eOa5Ekmw0
 num2rjoYgs0XYR1W7N3XKvohD/77MPPBh3HcgJiJBJ9XTvQ5pj0N4D6XbrnLMqI7tYpe
 1hW+ogpBr2W+v2l2tSDNz55RoDBNs+VZ3mm5snAutcZOMifD+w6Be7R9EE1Mz4ZSgX3n
 Eb708TyrnUJFKyN2tDXWwZuHkiqCXYUlyauZy98onqeQ66SsqpqhAmFgJNRvtbFs67b2
 IWhAnR49YtPVkt+40MH7PsmJHDf0kF2RYGn22jsou/zcZtw9UkQf8X2knAaqkU4xEffX
 gZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=2zWzHryVe73lcg/R4x0fY+aaqWalii1k3hB/+CPgdi8=;
 b=S6fujnTzVoBk7NQqbRd0+XI5HS/kmP5QcvbKG/Wdq9YsNrOSH3ofWj71deERbqehBV
 0UDjl4llIXDsUjVCapG5GJ84KpxlzkaqaOgEe/jjSjGnIRdnTn2plTbKIxDCCW6vLs3x
 HlOuznNp7SV4JSrVwN5O6/EezFFOi5EzowMrxcczZBW69l+j13Hf32RyU88mXAg9D2kt
 N5JxslLk6JwJs8uuVQiwgsbTkIlzXFzZC8HFIANAtCcIrbLr7vbEVeCe+7Sw+RF62qWi
 E6pG2n1vDnWrm7pV/3N3kTsZTbIHnQ/jTsXvsjCwt4lF1ZUFHvyN33RWQaSgR3ZxX2WY
 umJw==
X-Gm-Message-State: AOAM530hwO8kg3v/5PgaKg/lSjH/C78PVEZkT5GjMfGScTEWJ9xviQZ3
 3N3L8SfqNyVx7yedRGfsYve5M9CvWutTgQ==
X-Google-Smtp-Source: ABdhPJx57/k4A+pgDqrWy3n/r/sol7xYSr4INCHWjOiMWWbes2J2EigNmaJQPYS5A3CTA4X4UiJq5A==
X-Received: by 2002:a05:6402:384:: with SMTP id
 o4mr17541143edv.131.1627247878178; 
 Sun, 25 Jul 2021 14:17:58 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm17873480edh.62.2021.07.25.14.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:17:57 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:17:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YP3VA0lMGT1olIv8@pevik>
References: <20210725204624.1620567-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725204624.1620567-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Good catch, thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
