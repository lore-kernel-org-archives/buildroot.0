Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18194C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D204083DB5;
	Sat, 17 Feb 2024 16:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwER1W-8-h0F; Sat, 17 Feb 2024 16:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5240883DC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5240883DC5;
	Sat, 17 Feb 2024 16:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 068271BF860
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E813B4076E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1Psu38BHVvC for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10DD64076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DD64076A
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10DD64076A
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:12 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so2116110a12.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185791; x=1708790591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FsXlxNCgsbxigp7XMtSH7ojlqRd9bv0v/jEidzr1xbI=;
 b=qzpiBcaFnZiY5Hn37lPbr9P9CcxqFoDAxC2cIPKCkWEmfZU3d44P8ZhkwD8sH2O8TB
 SZgYuVPUmx1FGLEKoED9hvGaIK/MddN0U/nXCz3gpYfvFhObWx7L8itBnw3rZzPO/KPa
 1gtFHJd1hRdFwkjcfpElUicF+ikxVli0IHXxoHiWbgf0+kMxkaDcor0UbJ5XiZCA2Y4l
 zcBDbigKxw/d1o46kE9E/Fqb1Z97JKgm+3C+xcQGFHgmvPDUhg+2ZjCn7n0BCHX6Y477
 6mvbAfAzCTzP9TthguaOVMqPx2vOWhVYm5yzeKaEQG6acbnwC72oJ121z9l/0NrW4PHU
 HSow==
X-Gm-Message-State: AOJu0Yx7b8a/TssYwPJQSLsByKIENEk6g/Koh40/XQZEUgIlxSFkXDYl
 tYuoeZ9zfVAoCFQXNhRsUcr1LbFuK82y/IuqEya2Yf+776uKTXPz0AB1ijWp0+Aph6nio22LuUK
 j38A=
X-Google-Smtp-Source: AGHT+IHAD/plwjebdbyxEfVPwXqXABVAlh2tLZ95irQaAmlzc/D95JuoVJcHHoBnBSyQPnUpDBirhA==
X-Received: by 2002:aa7:d6c1:0:b0:564:35cb:fed2 with SMTP id
 x1-20020aa7d6c1000000b0056435cbfed2mr633930edr.20.1708185791080; 
 Sat, 17 Feb 2024 08:03:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:10 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:34 +0100
Message-ID: <20240217160244.1320482-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185791; x=1708790591;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FsXlxNCgsbxigp7XMtSH7ojlqRd9bv0v/jEidzr1xbI=;
 b=pcYBR5BW5EPzPRLbnvV7yh+cE+ptq6g6flkPcDhojYDM7Gzu+nn9tianTUh+lDGNxA
 KwPrk0H8iP+5oXmtO24119B8TsLm0cpR90+wld/MwOVchTqGK7NqqK1pQK9dvOO5LNWd
 TcLDBasZmLnEP7vb3zOuIXyLp/ME1uQkFj9OQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pcYBR5BW
Subject: [Buildroot] [PATCH v4 10/20] package/python-referencing: add host
 variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Drop host-python-attrs from PYTHON_REFERENCING_DEPENDENCIES

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-referencing/python-referencing.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 27d1452e913a..f00a0efe73e8 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -14,4 +14,9 @@ PYTHON_REFERENCING_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
