Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEDE706E3
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 08:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E10B83A9B;
	Thu, 21 Sep 2023 08:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E10B83A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gU4oROHrlcxr; Thu, 21 Sep 2023 08:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05A01838B6;
	Thu, 21 Sep 2023 08:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A01838B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2F9D1BF2EF
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 08:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7741E41BC4
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 08:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7741E41BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHGYEn5vzvMj for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 08:09:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F0A641961
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 08:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0A641961
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2bffa8578feso10494151fa.2
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 01:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695283741; x=1695888541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjvYygbYFDwgCuWLHivpaqYEtYm+8q/X7K6TyKzQR3I=;
 b=YWKXRlnp4oKUx79ckLJBMewXXNIqzM2IoomR/Rq51NSva4CZvcAPwTkvPzXqlAzMee
 JPt1kFscyqMPf3/IIwxypQlz3X7gz78shnFLc7giHnwbQnVY+4RurA6jWI/nTloFI8Bh
 v2uxYlgpxY13TK5yuzB7kKdAtRG7Orzh+hJaCgqJpAuKqpFUZbjbhqBgErZ3RU2XBzPT
 diojVoCASyQXi1tejiHLJuS5uazFqYGiHgpOP61hoPqQFEuGfOA2Y977dxVi97FmwAYh
 jhXLu/SW63comcVs0Yqp3P6XFDRJiB1k9iS+2IvTezrOEvpOArs7xVHzJk/sfsRPhh0D
 goqA==
X-Gm-Message-State: AOJu0YyntfLc8aiX8g+6TKF8FVoeMGVEkUu/iPgWYLjIUXjRZbCVnjAF
 28TDcSXDuN2A+dHRAZcUUOritU5ZZjnVxw==
X-Google-Smtp-Source: AGHT+IExbLbpswFggYPsgX5uKSKknZFPJuCOZJsgrpOt6tJi70KAhn8seUC7hR1UWYdB32PUkd4ZdA==
X-Received: by 2002:a05:651c:93:b0:2be:54b4:ff90 with SMTP id
 19-20020a05651c009300b002be54b4ff90mr3869386ljq.53.1695283741196; 
 Thu, 21 Sep 2023 01:09:01 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 j8-20020a2e8008000000b002bcb89e92dcsm221482ljg.6.2023.09.21.01.09.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 01:09:01 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-50307acd445so1198489e87.0
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 01:09:01 -0700 (PDT)
X-Received: by 2002:ac2:5a50:0:b0:500:90d1:90a6 with SMTP id
 r16-20020ac25a50000000b0050090d190a6mr4096227lfn.63.1695283740968; Thu, 21
 Sep 2023 01:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230919172300.9901-1-brandon.maier@collins.com>
 <20230919172300.9901-2-brandon.maier@collins.com>
In-Reply-To: <20230919172300.9901-2-brandon.maier@collins.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 21 Sep 2023 10:08:49 +0200
X-Gmail-Original-Message-ID: <CACXRmJirVYUH98cf9d-g0DnNo+ubMgWUOhRa_V6_0A3Fh-0oyQ@mail.gmail.com>
Message-ID: <CACXRmJirVYUH98cf9d-g0DnNo+ubMgWUOhRa_V6_0A3Fh-0oyQ@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
Subject: Re: [Buildroot] [PATCH 2/2] unifdef: add target package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon, All,

Is there a specific package, or reason why you need unifdef to be
installed to the target? It's a host utility, used e.g. to build
WebKit, but I don't see why it is useful on a target. Further, I would
move it to the "Development tools" section, not to "Miscellaneous".

Kind regards,

Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
