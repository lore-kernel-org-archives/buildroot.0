Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8144BC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BC3409EF;
	Thu, 26 Jun 2025 19:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6vAyH6PN2QF; Thu, 26 Jun 2025 19:50:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E641409FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E641409FD;
	Thu, 26 Jun 2025 19:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6474A10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA16612DB
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqRdToA8QpLA for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.179;
 helo=mail-qt1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBDEC612C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBDEC612C7
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBDEC612C7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4a76ea97cefso15963971cf.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967381; x=1751572181;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pej/q3RkWycT+nbDPsNQzIiFQDQ3y1ifgPexSR9I/uI=;
 b=G2ZC3qg0zN4EcxtFuSoZgP2xeLYRLSWZ4u1zPQ35CCdL5aU3YMcVh63MEERAVk/SdR
 m084jM7OtC7HEjTrYK+8cpWl4kmLkE1E4mtjgDuUg01qWjnUYbMCi5kFDHXHNIxd6dyU
 p4bbw1fjjL5oRj5bNmT3lTqqDmfzz93DkAInbtEF75FVqTWpc8ymnIQq9+aPLWsZ/ZMJ
 VgQL0SWzh3XPjiDTBUHyLUjvMMDvH7E+RdzBwAoX7M7NErlx8ViEJKtrzsSTNc8+rwUp
 7EVQhUkbNxULHddalmZv9engBcE25L0S/i6P/VYl/du3NSy4hd5iTuAxXDTJ+cEx/BPW
 MNKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW33fjgzbZ5Ss5vOsmLOMLB5z8eVY/Gw3uDj8/M3U8lc6SLxCipM+7EV4X5hZV2ISuUHqLLiBQiNMM=@buildroot.org
X-Gm-Message-State: AOJu0YzBhgMMzGJBUiQnSTWSqlU74Qm2ZlnS6BfknuJQFfYUduOmD4j2
 1gauGJ8TFcrur+/eGysiOl+j8KbEaqL4hJhd+k6E0mIo/vmEqP8VYQP994dMgenW
X-Gm-Gg: ASbGncuZEpdeWweawpJly34ufPsXNsoWLd+6VW42jMtOcqYDB9ZvvixD6LsmTm+i3F2
 QV2u1fqaQnqp38NRuh5ZmNnPwF0Z2cQEr6FpmzkBvcYNHMxsnhJIDs79f2DfzV8SAtlDVq4+FC+
 oY6WC6bPdEk+06yBHvQsmPi4lV8GYjN84nwMWOV1HTmQ1alOKZIhXuPJ8pCyUAiplCDgP3Wvuvm
 q3ibryDh1Y+AeqWgvxTyFPtgzqBtJD8/DDagrDZMcFVQ7/m6jgPGW3cz5xHPQMmes+vJd1ZXmlE
 w7ZQ79nnjqAcFcZspHbqo7rhwfJ1MhdvXN50tCgHzlmUPceV1r4iE82MI1GrIM8mf8zT283BybD
 KfNk+2I+XFUUTQeK3i+oXdl4=
X-Google-Smtp-Source: AGHT+IFcFyHiXihKP/Xx10/DcKkKIp6ezAXap2SzDrjDbN295kn55dsk3schLLkffqUaGNusAo2sjg==
X-Received: by 2002:a05:622a:413:b0:4a4:3be3:6d65 with SMTP id
 d75a77b69052e-4a7fcacff90mr15550541cf.33.1750967381277; 
 Thu, 26 Jun 2025 12:49:41 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com.
 [209.85.219.47]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a7fc5ad5ffsm2913091cf.75.2025.06.26.12.49.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 12:49:40 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6fabb948e5aso16787066d6.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:49:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXY+rC9sj2diyFN7FLtvvlM1HPOuXEXXqVb7GZmqmfuXvhOd8F6QTVSP7exHt7KO3d/SI9kg9AthE=@buildroot.org
X-Received: by 2002:a05:6214:ccb:b0:6fa:c6e6:11f9 with SMTP id
 6a1803df08f44-70002b08277mr11153536d6.11.1750967377992; Thu, 26 Jun 2025
 12:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250422095528.0006b78b@windsurf>
 <20250422075932.2345-1-thomas@devoogdt.com>
 <cf2e6459-e6da-46eb-9fbd-64b72dae2ac4@bubu1.eu>
In-Reply-To: <cf2e6459-e6da-46eb-9fbd-64b72dae2ac4@bubu1.eu>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 26 Jun 2025 21:49:26 +0200
X-Gmail-Original-Message-ID: <CACXRmJhuKn4g0Xfad9115DK904gK0G-Xs3gZ4Mhwvkuaongr8w@mail.gmail.com>
X-Gm-Features: Ac12FXxums0_CfccdiWza4U18LvT3XQRLx1fCB6dNxXytOD_lTNjWHB0RyvFnos
Message-ID: <CACXRmJhuKn4g0Xfad9115DK904gK0G-Xs3gZ4Mhwvkuaongr8w@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 thomas.devoogdt@barco.com, thomas.petazzoni@bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3] package/util-linux: bump to 2.41
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,


> I just wanted to note that 2.41.1 has been released yesterday:
> https://lore.kernel.org/util-linux/wnfaquaapqknjnu2bdvddkp2xbleowfcr2g3cqiewpl54oclmi@mrseflcu5nyk/T/#u

I just pushed a new patch, see
https://patchwork.ozlabs.org/project/buildroot/patch/20250626194752.144160-1-thomas@devoogdt.com/.


Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
