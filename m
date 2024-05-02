Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E15C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D9F608C8;
	Thu,  2 May 2024 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4t7KMwu0HyoN; Thu,  2 May 2024 14:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B4E608EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B4E608EE;
	Thu,  2 May 2024 14:16:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB2981BF589
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 14:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B447B40430
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 14:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV62o6pfCLK0 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 14:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.43;
 helo=mail-lf1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1F14403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F14403AC
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1F14403AC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 14:15:59 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so602895e87.3
 for <buildroot@buildroot.org>; Thu, 02 May 2024 07:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714659357; x=1715264157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oKlPAM97kR3S9B2EbpmljcBJcenxV7l32SC1+OCeVY4=;
 b=rr2+Fkl8zdfdHJqzJ3AEnT2aOnJI4aziFwS/gbZFf4EhieNeprNHZli/Lovlru5ccK
 zukpzvID+ksZM6O6NpXP168Lf/ROYAZeIr7W55rDbVjsoc/vDTz4fzjrFhkl46JSx22C
 v7+dkRTwAjjgISeCjsSajxTfo2wXG1D3ZEWmlaQJeHSZfNkw/Bw5P0rTz62VEo1gnfYA
 Z05ypR6xhNN6Obg8S4BUKC8Ad58uMCCVNx1c7bqODUnQto7DVO2JJFI7dYBkOBJP9dta
 iNP75KOsMcsjmmUyPOJEIzv6U0VINfpf0KwxjTKO5+I4G4oIASDtCorx5rDz8YhnjscX
 31jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYqYkLA5hO8aNOMySfJ5owUg6WykewkW6FUUyLdTolCYkp9Om8Wr/gpSswjNThWEXlOyFMNOoPjDElVTR/KpCsZSVcBfaEzw==
X-Gm-Message-State: AOJu0YzFgRhjU3ngMUYdlP73rAuMOECRmqNZ3VXa2G2eHv/6RKbDS4Y6
 kDB6xgvhftWpPZRn5ZHVoqNuZrkN2gZYQFvEOShJrr8Fx+wqro6xHmfvSgml
X-Google-Smtp-Source: AGHT+IG4Z/feVLdIF8cF2+6E7tbkIYpDV9KZ8B7n1+D/GEoF2bAAFv35aSPrlqtGCbS6uFdAxMmRaQ==
X-Received: by 2002:a05:6512:3a89:b0:516:d692:5e0b with SMTP id
 q9-20020a0565123a8900b00516d6925e0bmr4692988lfu.54.1714659356750; 
 Thu, 02 May 2024 07:15:56 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 q4-20020a19a404000000b0051d86da39d3sm184089lfc.265.2024.05.02.07.15.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 07:15:56 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso50991851fa.2
 for <buildroot@buildroot.org>; Thu, 02 May 2024 07:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXeLUYJXr1ELe9Mq+P2PhmSu9JnPP2CLpZom9GNsud7LHReNvnnSdWwV6okpMxZs8WtmvACtIQex69EYVvKZVx0wiBgT/RjuQ==
X-Received: by 2002:a2e:1f09:0:b0:2e1:a726:3dfa with SMTP id
 f9-20020a2e1f09000000b002e1a7263dfamr2559965ljf.38.1714659356340; Thu, 02 May
 2024 07:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240420185853.4134260-1-thomas@devoogdt.com>
 <20240502095605.32987057@windsurf>
 <CAPi7W838wL-EiUvd6ShK7=__WbCBKu2SNVj3S8aCYPa9f3dY4g@mail.gmail.com>
 <20240502103049.3a143975@windsurf>
In-Reply-To: <20240502103049.3a143975@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 2 May 2024 16:15:49 +0200
X-Gmail-Original-Message-ID: <CACXRmJi6gZTgwGtHQ1VsfPj_SafGZG=8tQd1ytnmiqwvLVWY5Q@mail.gmail.com>
Message-ID: <CACXRmJi6gZTgwGtHQ1VsfPj_SafGZG=8tQd1ytnmiqwvLVWY5Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1 1/8] package/libsoup3: fix reference to
 atomic
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ah,


Thanks, Thomas for pointing that out, and Fabrice for the patch.


Kr,

Thomas

Op do 2 mei 2024 om 10:30 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Thu, 2 May 2024 10:15:53 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > Could you have a look at fixing glib-2.0.pc instead?
> >
> > This patch is available since September 2023:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230917185116.182810-1-fontaine.fabrice@gmail.com/
>
> Awesome, I went ahead and applied this patch!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
