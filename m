Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84954CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A0640AE4;
	Wed, 22 Oct 2025 16:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TwLBOMNbBlQ; Wed, 22 Oct 2025 16:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F176D40A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F176D40A86;
	Wed, 22 Oct 2025 16:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B312643F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A55D040A86
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh6BFnJWSx0L for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1B8B40746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1B8B40746
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B8B40746
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3f5e0e2bf7so1467559966b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150678; x=1761755478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hiM4wFyUr1sH0TlW2Cf5uInKdAfw0wfz2oUl0ueAsE=;
 b=T0NnoxVKCFTg+J1oMRxqZOIBckS/NGJF0O779901X1d6vRtatVEJprz6wZUpFh2o6x
 1MkaSVTYBRbGmDUVudJBjIC9tBmo48McVN2n+eeBFZ8xzqKxczUSdccIU56ed+de2Zdd
 8yMr+cqBIvYXMi2azkIbpiFrfkLgKhpi4glGHopZ6LUS2q3RPyGthTJa8BZyLPIxw4U9
 29JSuMxlqzfYTxxCx92rvjtjsBr/pXAv+sMGeMWArtV8aETXCqwc0RS6tevHUZBGH6Fb
 e6TIxdoZKY05K3XPg8tRx88mfj+bxvj+aQjtrOW2LRyxPSDOPcJPQrTsSkpZTTnMkX01
 rFdw==
X-Gm-Message-State: AOJu0YxsI8TSi+mMjGfGqpKhTZUVUCNaXHxyXOEfCfZ+eblaJZR5WXUI
 SuC5f6XzPjs+iXsdfsqDMRtg8L9piVKpv4AomSpzBqAUIrJGHUMisc/1rTeTNb/aCega7nnkKrA
 6hOnE
X-Gm-Gg: ASbGnctoURmIBq2Fj07BC9T0rq3tYCLNqpmkONBkY68MOufyLojJRQdO22Tjo37r1zF
 vR6E8qi+hZFRq+1lq1d2aZ+VWFNmPmkKceGnlnfORQDmW2dSrSVxyrgwaBZuw/jX4O3renwIRTv
 eZKxLPSCVrBBZ0OjdMZxNhAHISRCtAlKRJY8rC5ptlFFaIGYRRrQ3ZUKOOxvVStnmKgo1l1tcVP
 WrpUG1CK+CcZe6hmzAIBR3aw7EFhEKHxviqz7nJgG2NogjZIyMizEhLx+7Ct2sxMVEDOfDfu6d6
 VLzk9wcMskHcukwWzJBej5Mh2tdnTGZYKcB+1HErbAPZXvoIKsbsSZr08RFGZU48TDz7jLS62Au
 t7OaVQKytHofN/iTOOw1lj/i9N5yrzWFSdggz2MXuuYyPQs8rNYnLKNLyi7tm9Ej/PdagpwTqVQ
 mSBP13YuQCru30Q7IPwwwfiqaFjEH5+dsBIQVuJQ==
X-Google-Smtp-Source: AGHT+IHG4zaSZGBBcTq/T4EyLPYTHxH86mpBMvzVLyUAhDoo3u7oHA9LxNy5666ouAV3wsM/L1DvBA==
X-Received: by 2002:a17:907:1c28:b0:b3f:f207:b754 with SMTP id
 a640c23a62f3a-b6474941139mr2674082466b.30.1761150678325; 
 Wed, 22 Oct 2025 09:31:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3fb6a63csm43837666b.29.2025.10.22.09.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:31:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:31:04 +0200
Message-ID: <20251022163104.17325-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
References: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150678; x=1761755478;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hiM4wFyUr1sH0TlW2Cf5uInKdAfw0wfz2oUl0ueAsE=;
 b=eeItZI9pSE91ufj6mttFswv49WOLnzBSvx1bu3I9Qax7UBfhocY4iEOZtGeADz4tbG
 f/vjz58SHb/NOlwGjor0KE0eYRV+CU7C8P8GpIoavdBecaAG1rYv6uR+fx5i6IDi8uC9
 jcLjijqrP1teS2SAE5mUmdCbZvQCeIN5VDuIM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eeItZI9p
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Dario Binacchi for
 libgphoto2
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
index 66199a5b72cb..63afce3facb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -812,6 +812,7 @@ F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/less/
+F:	package/libgphoto2/
 F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
