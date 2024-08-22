Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FEAC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4607280A9C;
	Thu, 22 Aug 2024 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zU0jq4qOj-N; Thu, 22 Aug 2024 20:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE6180AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FE6180AC4;
	Thu, 22 Aug 2024 20:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B89761BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A507540F77
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpqC_cA0U_8I for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:09:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F69840F76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F69840F76
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F69840F76
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:09:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8695cc91c8so119652866b.3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357386; x=1724962186;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxchdh8hYEXhBxXLRPZHfjCK+l4TEKsP9qZBRqqR4TE=;
 b=erBJbE0onp7T/rBTZOp3mMxl2oAeCdKhYlyifVoIBoa49p1Dvoy/LXuU+jHm1XgM/5
 tWeUgsFt4e2gLiYKBmW5vEIYMU74b+/c5+pbrh+NBbnowDO2Qo53PZtzeGuKKKdx7hYH
 zE6OTd/pEQ5PoW0s7klrNaQvHbYYBjeUhdk8+4uu31YT/+aP59Ld1ZGr/hpc4PwuOGf3
 4u/vJ/cbAfBNXxM0nwfKXrQpBmYtPlK8gAhoYScKzhWFYEBciv52H5LoBddYbowGUx4o
 o7vS3TBK6ozC8OzLUJ4fcBbGUx/xS6W1rOFFVwVDh96CvbyPZNtLEnDU9cG1+ZvvY///
 pIAA==
X-Gm-Message-State: AOJu0YzOucuN9M8fnp0/5di4HWu1KtLTN/it849yPnN8Nvau7wkYqqZV
 BDNLiLQ2WTuGFMn0VPM2mu8ppKceJEYylwuhW5zXJk75Iwz3ASdT5cyU8Rqj
X-Google-Smtp-Source: AGHT+IFt45pw+ZiBlkvahMgBLsrEQ/lDJ2n3DdNx0vrlMQ+ftkj1FfMuP4qtm3ypgU2jVJttfA2+XQ==
X-Received: by 2002:a17:907:918c:b0:a86:9e84:dddc with SMTP id
 a640c23a62f3a-a869e84de96mr52658366b.61.1724357385604; 
 Thu, 22 Aug 2024 13:09:45 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2206a1sm159497266b.6.2024.08.22.13.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:09:45 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:09:42 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822200942.GA1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-7-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-7-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724357386; x=1724962186; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxchdh8hYEXhBxXLRPZHfjCK+l4TEKsP9qZBRqqR4TE=;
 b=O8z15B6LE6Jn7kYSYDjSM0GakdW/Vg8jxVeL0n9QEkbpwyTmrBquk1ZIYzFDt9vDLw
 aVhzuQY7QJe5hcJx9GoK1hLuiHPH/241hDyllrYrX/iFj6PcnSlr+0pnt2FNY7RiRQH8
 O8xeWazBqda8JanDnEmitJ/F9OCHXDw+p8xYxk5RiPTbJQJKIeL9VmB43OydlwfdXkmI
 +aK4TxBLqunlAt5zsXuuFaiqMpcMzloGXHNZUZOXR1c3O9jDY1uCs+zyYQUETIaFjkKb
 YB+9xB8ITLDCixQKZj0IrSTH5MF5451AlaDXEqidesRY98tj3WcbdVvcQs726/EWP5+H
 DWXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O8z15B6L
Subject: Re: [Buildroot] [PATCH/next 07/13] package/libtirpc: bump version
 to 1.3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,


> Release notes:
> https://sourceforge.net/projects/libtirpc/files/libtirpc/1.3.5/Release-1-3-5.txt/download

FYI this has been already merged as my patch.
ffdbab3642 ("package/libtirpc: bump version to 1.3.5")

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
