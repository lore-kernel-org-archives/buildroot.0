Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E94CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB2BC82366;
	Sat, 18 Oct 2025 16:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz7v96YlUc05; Sat, 18 Oct 2025 16:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 187688232E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187688232E;
	Sat, 18 Oct 2025 16:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7C01CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3BA240EB4
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rs8T_JnCsAH for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3885840E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3885840E7D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3885840E7D
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:54:58 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so498973866b.3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 09:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760806496; x=1761411296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7qBgy+Jx9giJmU/oeERcuUdaWUS026Sv6pWdwUzsw0=;
 b=Z0L9MA9Bp+5UqbWeOIw2vdgCNB8eKU5qs4tRpzN3qk/vVzWoqx7bV9hgN9iox0CJ2v
 Htc/74qumW4oRq41I89kHJpfWki13tjmz7efEZ7w/ULNcMAT6Z4og0mFNhOPfCJk11/p
 vw0+n/M+6znxN56HPVkTnex4g4UBI3lTJhKg6gt/hnuER3aZih2ewfH8pZTNxJ4CetJf
 vZYZHfOLRBnNmX6S5qo3MwqNRVPqyZD0wK/qilmLHNLM2Y9P+5uXVdQufXX0KZLDiFoB
 JdjaWDu4EZWYfhp1gr/r0lkIYbgRbPG6jCzIa6eWN9jXnHZRw/g3qTMP+1O0BSNx8rcW
 MTzg==
X-Gm-Message-State: AOJu0YzXSDS4Be24nwAtBxDCzn1Ua6/vXOPAzJ5BzyiWaOc8iJcJmcT0
 trt+GZmQVGeYcRxStzGleVkUjnh0lPo0IWACZmtx4RjuMGo2+lDwCpcqsAVrb1aC7K3YCwQn7SS
 4+GVM+ek=
X-Gm-Gg: ASbGncurBA3jOOWEoqspzcu50l9mGK+90V9eMlOjyiMphs8gtBmZwhtvDnOxnNsKlJb
 q9Mu3mq6s+FWWMxWVkw8h4Go+Pm2sphHeYSAjMMQ9JBhvpSq2n85ehwwWGQ2oM01LhNGt+APrEH
 rZNowUYzu2bmlJL2cFCu0AEpu3uBLisrfOCVBzg6LpyhE8faNRyCCBZNGGmZl7rn/R2dkdMR46Q
 7UF3AaLy+QB7/eVL3CHs87PSBBgfiAI8H/nrYp5RQbXG/FraBTWOeTzz2gYaLPgjwWer+YPT2XQ
 3D7HDFn5QMksGRiEJt+9y5098MNneePvqW/J7V16SjUj09d6nFMmUxG29yzKSO5vo/Be45i4xP0
 LPqkmsW+ccBUOSNEenUGp+U3vH29AolOHoBj+PeH2RXVhninIS+Y9NvQe+WjrAsp6JEm/qenw8R
 h2/UHFq0KTzCOy8Cjv04yVaNzCuxqCR4VHXP2gT+c=
X-Google-Smtp-Source: AGHT+IGd7lokOwXH8t8lK9QAC7+J8/2D3ZbRwwkN0NO2KEgfYM9UU2OGl9tc/XarLLrNtqyhHurPIw==
X-Received: by 2002:a17:907:980f:b0:b46:1db9:cb7c with SMTP id
 a640c23a62f3a-b6474b365a8mr897801966b.33.1760806496024; 
 Sat, 18 Oct 2025 09:54:56 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([95.75.36.126])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2c5dsm283715766b.15.2025.10.18.09.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 09:54:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 18 Oct 2025 18:54:44 +0200
Message-ID: <20251018165444.1197208-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251018165444.1197208-1-dario.binacchi@amarulasolutions.com>
References: <20251018165444.1197208-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760806496; x=1761411296;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7qBgy+Jx9giJmU/oeERcuUdaWUS026Sv6pWdwUzsw0=;
 b=fRnPYeEC8OcyBqog61j29vI2h/IT1THIXCYtYAmT3Qgp8qbq1GhdwuyEgBGeR98OkB
 XKgCwIDr0rAWa0KjmVNSe/ePCU3Eu7GqoJUGb1AYhG68B1gHBkFXg/f2gSSUfONyTuwe
 bScrDZLL/cl2mCuVhjOCJkcnQ+voSSk9EWfyQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fRnPYeEC
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for less
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69f22259e899..66199a5b72cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,7 @@ F:	package/connman/
 F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/less/
 F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
