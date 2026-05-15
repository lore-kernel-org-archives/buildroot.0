Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F95CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEF8615A7;
	Fri, 15 May 2026 13:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pP2PVN-YFxUK; Fri, 15 May 2026 13:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0255F61589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852029;
	bh=mG1CQXYjv8oHzrALGsQD/IZkKyFjeSvdgJDR6R9n2/U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kw33RoTO/az+YfgoUZwreY9G+O5/tvxlDSY0/VXA4kZ3KVSLsN1icnn+Aybtk79tN
	 UIE63T4uRLSfKLPXsvkSOtuwdvoM3L4cleMni65vnSGqDvsPN5SXHxf+e/giVSzlyP
	 AGordmKc5MnHKrSgowZop/Dh0hjFIyU72T9yHq1fOF6cOLaHYEe17A+K0dpvoTJENb
	 lTVuJySYgFhrMbCBmuUSjBKm0ixBhw5R7GJOu2qgcokRuZm0WRaq1TzvO2GfdSOfpk
	 GvbyplvcfVhkB5r9mx4RGFfRG71qi20M9CS8xyHWKWCM1oVSN8KwIpxPDB9KtsRDr9
	 fF3eGOmZ/fsxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0255F61589;
	Fri, 15 May 2026 13:33:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC8A36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C06615A6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7SdWPA71U9s for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B7C36159F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7C36159F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B7C36159F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso98142725e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852023; x=1779456823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L+jeM9vw+Sh1/OWL/kLSYdnn8UKGPwvdAHmlb2jRmpc=;
 b=KcDt4jnOxYxC+RjrmwOpsOu+5Xy7R19OaeA1rJ1Ydfx5epLq5wlxQIwmd1Z2OP5816
 MwBQOIYh0j3LOffZk/RUamuSoEgjiui0jShwDRY6TRfmvuArTDB4DPu5ar0DtjORswYp
 IKoaIlu/C0yoTp9tc4baH8MnyCWQAX13/E9TZ90lsjaU5bSyrAxMz6rzAVSBXQAkckd2
 uvkoCg/wqvpHSB9CmwiPhplnw4KbyvNsqpJnjXW3bedU5Y8qRWduxs61TDJS2uk+x/jJ
 D+65tf0ouHgd+NfKFP1snZTxZRUaBDQlOuvI+iZ9HKGwpW6R6D2qyvwhOp0xfl+wpXpF
 QAAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8KE6/nYzRX64gJ1S0v54RkszcFzXFN+Kf4D8FgQyxqSusIZ6Z+39U10oLK1iQLCvzX+uKNxiv8wok=@buildroot.org
X-Gm-Message-State: AOJu0YxsJxtchU+8jA2brPgHZhaxIfeAcmbBzcF56lcOPm+UF/E3WTgg
 ra8BuvBZAAzkcIoBgNMVNcxr9SwVwwJANSEgG7aNntNY4MXDvM7LdCKAYNl7GTZPO+o=
X-Gm-Gg: Acq92OHn2w1A2Gffchu8NUXQm4RIFV65TTrAlWyTxOEBFvVMZb3K0s/+0RABEkyZI6W
 c91NQV482UBFD4YwTVkj2xFJg/45oR78l5cgEFjzeF488MuHNI6qXaaPw3lI6H41GWhc8rT6WXB
 /LmK95eD40RmRQPT5fLWd1rvkEThHQOJoJoB1G2DFg9WQ+CQ9Qand5+WrkN5D6Kky3ZGo9aLyhQ
 LYdQSDP6hgixbZTxxnWjHAjkhshcuOPfd9KYa9x3LBb98U2SWDFhAB3x4kyojkO0MtppGUrJPf9
 K9syp3P6UtTDvKkbNWhqzT/n4RlyUOxtSnMPdZfY/PpqRt4+wjk7B5is2zO2z3O0RawpiVmK0dK
 QZNlJTNgqG2z+OqbT6ucKUy23wETMEroDCB18Fh5sYWj9yjSHsmnCXnjgQZ8qoG/xq0aercM0Pq
 deD02rwgtJ5K7FwtcZjl8lhz6Yy0fvnr9TZsvJCSmRQmjj
X-Received: by 2002:a05:600d:c:b0:48a:56de:d62a with SMTP id
 5b1f17b1804b1-48fe60eca75mr53324145e9.11.1778852023505; 
 Fri, 15 May 2026 06:33:43 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2accfsm16461545e9.3.2026.05.15.06.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:43 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:42 +0200
Message-ID: <20260515133342.315517-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426093148.2744165-1-bernd@kuhls.net>
References: <20260426093148.2744165-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852023; x=1779456823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+jeM9vw+Sh1/OWL/kLSYdnn8UKGPwvdAHmlb2jRmpc=;
 b=LyKSVvxXT1i+uEYXD9tjzQRQX1xeFWv6SVftOUuyDUjIoiNQa0iLqVgcJnH/Gfe0Y+
 hkqTVfMPubH82homj0jp3w0y3hIXFKJ7RM8kuGRY5bphU0oF27C0QwtqT0BhJRP48ni5
 noW1C89EMZo44mpNEIEr9QHdaGkykcIeMrJAqfSyNr4nrkJwFGu2AyQkMMokAtieMAWj
 10kj8k2PopWCtYY1J2Dblp2aw/7Y02PLUhh9AR/xMWYhlt7CFy3toZVt0KoxHftp5snh
 sYh6bi9tIIjRLssV7PPV8TlbJoK4o8BX+uAF7/QgZradYh/6eu15eezlyvzGnvdfAfAJ
 ycKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LyKSVvxX
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.19
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
> https://littlecms.com/blog/2026/04/17/lcms2-2.19/
> https://github.com/mm2/Little-CMS/blob/lcms2.19/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/lcms2/lcms2.hash | 8 ++++----
>  package/lcms2/lcms2.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
> index e2277ba610..0ff881158f 100644
> --- a/package/lcms2/lcms2.hash
> +++ b/package/lcms2/lcms2.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/lcms/files/lcms/2.18
> -sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
> -# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
> -sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
> +# From https://sourceforge.net/projects/lcms/files/lcms/2.19
> +sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
> +# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
> +sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
>  # Locally computed:
>  sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
> index 4ffad41014..32a78a4f35 100644
> --- a/package/lcms2/lcms2.mk
> +++ b/package/lcms2/lcms2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LCMS2_VERSION = 2.18
> +LCMS2_VERSION = 2.19
>  LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
>  LCMS2_LICENSE = MIT
>  LCMS2_LICENSE_FILES = LICENSE
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
