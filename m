Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52637C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 09:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D659940BA0;
	Mon, 12 May 2025 09:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bd11lM2R9E0E; Mon, 12 May 2025 09:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B32DB40BA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B32DB40BA1;
	Mon, 12 May 2025 09:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4198A154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 263C760DF4
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ni_uCbmkfbKs for <buildroot@buildroot.org>;
 Mon, 12 May 2025 09:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59F5D605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59F5D605E5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59F5D605E5
 for <buildroot@buildroot.org>; Mon, 12 May 2025 09:43:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so30270655e9.0
 for <buildroot@buildroot.org>; Mon, 12 May 2025 02:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747043019; x=1747647819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MnXVEkQmHq+UUh92MJjN8rZaQlUg3LcHxuhZcw2jTgc=;
 b=uAnoBIr19js3fZEp2nVcNz6HtIRA51uv9DEAaRTg6yHa3eHjO25bo8m/J9pmvMu5P2
 l6/2dbwpHHT/vN0jnExhK6UasyxsuPIDg9ZWzHF8rKvzUNLdCbyf3djHAjsKmM/vihyU
 Wo4qb6NKM2f70DuSqFUBo3sHj6KLOb6SBw28oyEoyof/eHakuUpC9sJjxiBQNKOApxgn
 pS3nzk4Jek1QXllQrb7y89R0nxRe3tbEPftPrmZrReFBykiSipZlmkFpQGRALPZtADIy
 JuUYp7BZ0hhJRxP/XB8GHE33y1a91YLF6MZy9oj9T95m712Vyd9u5+5k9z7VEww0ADDx
 1eqQ==
X-Gm-Message-State: AOJu0Yz9sGyM+jBzZqL10xC9Uv1TqyuMeYuG7DqoxEsbeZDPXXLnkst7
 n87vMmJIZzAmBikAIRzgZjuXF3RHIfeE/4+FnoCGMxD2Fm/Uw7kd39SWic7z966hn/nT3TgI6rN
 9st5V/Q==
X-Gm-Gg: ASbGnct1787j9K5fzjhaYuPXMiuIuFCdTvJIA2fgH1MhLpJHEPK4JZfwmlyJuRsACz6
 imYqhIhESeOjhw480CDXLugUzgW8W+d/QitTeHtS7tBP+B2FBkL4YEyZViuBGrnbye6RiANXle3
 1A4hXS6mz45JTpSoeA7k9Cv3Zq1NFp/aDZNBvoD/yZNySpIZV0qZDrshDNt99NmI0QHn9qNP10N
 tOPM8lLxn3X1uNE64Tc9G/ygqiqbDkiwsxMt4gkGDnKsJXByQm+luMyf76IWPS7sezyqmEIONlw
 OXHbrBrNQCv3c0tVJDmM3q/J2oTiPTxIX2YgKXbOdGYRZTLTogQeFl/XgYXjyKJn8zfKvQYLkrt
 PTs9aqxRx4SzWmZHjJFqiWYPLJAna3lPYLlgr0r29FX9ePPimTXlx56MUxQ==
X-Google-Smtp-Source: AGHT+IHoDN/2IZghkY3YyoWIGReVDR7GFNdURrJ/lLlJtAUbIP5LC5lNE5GbYsJsAz2ndxrCp58OOQ==
X-Received: by 2002:a05:6000:2dc3:b0:391:1218:d5f4 with SMTP id
 ffacd0b85a97d-3a1f6c98496mr10328466f8f.23.1747043018842; 
 Mon, 12 May 2025 02:43:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 (p5b26784b.dip0.t-ipconnect.de. [91.38.120.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2f4sm11863244f8f.78.2025.05.12.02.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 02:43:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 12 May 2025 11:43:24 +0200
Message-ID: <20250512094324.127864-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
References: <20250512094324.127864-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747043019; x=1747647819;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnXVEkQmHq+UUh92MJjN8rZaQlUg3LcHxuhZcw2jTgc=;
 b=rODUjR37tEhfNYzPyui3+74dPasxwUD+M3Ng051Cf8ET4arnvUj9GK4On1ACnOr7vv
 7xDVOSrYSScGxvMDtsUo4BtWAHdGNJMVAiDvmaBPZ0hrjlqmIBXUS11omBBrk1+Zonqg
 AD8+rb29m3zGGSz8veSfua+uOm+BWWxE7fcF4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rODUjR37
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for inih
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
index 7f01b46c70cd..c4d14aa87589 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -809,6 +809,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
+F:	package/inih/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/ufs-utils/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
