Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E69DC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64566419E6;
	Thu,  2 May 2024 07:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdJKPbYNzOiZ; Thu,  2 May 2024 07:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE4941989
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEE4941989;
	Thu,  2 May 2024 07:23:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0731BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC994013D
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0oocST-1qaE for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:23:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 772E6401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 772E6401A2
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 772E6401A2
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:23:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso9679015a12.3
 for <buildroot@buildroot.org>; Thu, 02 May 2024 00:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634613; x=1715239413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahmGTnYYC/+JooUXtN3SgpMZ+bWJyiMAbHb2tHBSn8A=;
 b=u0x3ePDWmwdNcN2iq3TOuXQ2XHPuikn1lVGxsvPaI2fMYXJZOJBT5atB3K9Mzhqn+K
 Z7KjSN19DMspV+WW/7tnQ9GYGzQG8o10a2lQLGWJn9N9j8wyOinG2OFhtHqXHsl3oxMi
 k56Dwb20ym6W1/8/bKn9+0nb6v93MRdURdH3nRteOqW2vPalu79+bc7T/rVJdht3hwY4
 oa79M+1UOJDKJMoTCAYCYz+qwLrtboX+4Tnpb+w6zOQfwdctwbrSUD/iHO/0P2Uoova7
 FV4rdV8tU7/sD3SlxM8LCZ+vyX3OaOxr/sqo9zacToLXXnXcG0czdW/e/IgkYXdOfNxB
 XI4g==
X-Gm-Message-State: AOJu0Yw0yPSuzFOqierRlfPozP4dcmHJcPi/jpGzBjBeHz6lWsCfD4qF
 MxC1vykYpl9ZTIVtIr+GRDG7oCKr8jzpRCSQgZr+oV963vZeR1Kcb6hc5nqHLIw8QOx5BoaEa3z
 3Tes=
X-Google-Smtp-Source: AGHT+IH51gtUzsWV5fFk5BDsbohvGNTvUESrlgVbCiThhLse5DKh9iDG+CGwTLx6DyXgNALrxKJA1w==
X-Received: by 2002:a50:d49e:0:b0:572:6ab3:39ee with SMTP id
 s30-20020a50d49e000000b005726ab339eemr3314321edi.29.1714634613575; 
 Thu, 02 May 2024 00:23:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.201.29.159]) by smtp.gmail.com with ESMTPSA id
 l11-20020a056402028b00b00572bba6745esm194758edv.81.2024.05.02.00.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:23:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 09:23:27 +0200
Message-ID: <20240502072327.741463-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
References: <20240502072327.741463-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1714634613; x=1715239413;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahmGTnYYC/+JooUXtN3SgpMZ+bWJyiMAbHb2tHBSn8A=;
 b=d1B8unJJ6xXd4eGZIDhzmY+Rldxi6bg90ysXnOIi+5v7Ox/I+gsyDhF5tl0M7l3jeg
 tSAeCYIW/ss9C1y6tJhGq6KpdDkJe9RnCGyeEcCM6bzJ8swAnQn/gcxpgJUD3GAxjqYk
 UCYMbD51RMZixt6WAKQhH3QK8+/kVAkleezQM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=d1B8unJJ
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: renumber patch
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
Cc: Romain Naour <romain.naour@gmail.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 3fa1ae00681ca ("package/qemu: add option to enable tracing")
added a patch with a wrong number.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
Changes v1 -> v2
 - Replace [Upstream status: <url>] with Upstream: <url>
 - Drop the added line to .checkpackageignore

 ...003-tracing-install-trace-events-file-only-if-necessary.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/qemu/{0004-tracing-install-trace-events-file-only-if-necessary.patch => 0003-tracing-install-trace-events-file-only-if-necessary.patch} (100%)

diff --git a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
similarity index 100%
rename from package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
rename to package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
