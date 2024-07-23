Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEE7C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1622C80ACC;
	Tue, 23 Jul 2024 08:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yeNMDRFFAdq; Tue, 23 Jul 2024 08:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2019780B04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2019780B04;
	Tue, 23 Jul 2024 08:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A60471BF296
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FC7C401E1
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-dXv9d99ZJU for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:02:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D9D440111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D9D440111
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D9D440111
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:02:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3685b3dbcdcso2780700f8f.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721721773; x=1722326573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rVTTRgkz/bMXRd1NZipLRXkVN/fQ42DsggeD//dl5Q=;
 b=QHFyAdSXcJtw44loUkuWaVizqLhl26ONqIXe1qbDLCLbYbQlyqq66XkHhiVnEMXCJc
 agdJRYx2ivAikFQQju1SaGo851z2QSQ5gnQSVlB2VHfhU/ktw+WhEwS3SqwLVn2Y1rlx
 AM303Xklyw/bmix3jFqx2A4rRXpB2/SQkLdhFXKCBMBSJGcHldr98gN1/UqTUJAJuv84
 v+czmqN1lkcp+j6xggUL3VCZ7GXNgE5hSfd7hPY2MA87T0W241eqiLhWp+wP1hnN1+jl
 eoWh48J4zXgWqLmy50QjO3xGAc89QBXFnQWAe/Zo0gsnTLRaABNQDr0BDngreN9y8ONk
 eydw==
X-Gm-Message-State: AOJu0YxQIJOw8YSkQSsQz4WdjDrtBFxBCaNLmWDknj8CTIoh3SSS/uhi
 kXlsYCPuXzFC7aOcCNZn+yf9mVhKTNN53AqPa6C5qcObLgwedFMTO4bI5A==
X-Google-Smtp-Source: AGHT+IHaLzG/4q/S63SM5IRhmZY+p+HD8zINk9oRB9b3yI3DH4PPSg9RI80QMsXIxeZlSrTkQXB4WA==
X-Received: by 2002:a5d:42ca:0:b0:367:96c5:ae88 with SMTP id
 ffacd0b85a97d-369ded23c58mr1394166f8f.31.1721721772837; 
 Tue, 23 Jul 2024 01:02:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787cee03sm10666098f8f.76.2024.07.23.01.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 01:02:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:02:50 +0200
Message-ID: <20240723080250.342850-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721721773; x=1722326573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7rVTTRgkz/bMXRd1NZipLRXkVN/fQ42DsggeD//dl5Q=;
 b=hCLf0vrR4vR4jgBqNqbuKpMAWfrIp9PVtDO2b++/jL+/hh/x+IVhCWHaP1gl0MWkkS
 IdQhbByxBvP4HFdQ13cC5rRSOw0ief3svlhdQR/4Ub5TUJUmxSFI+xnXqILwEaTZra0m
 DoUeof/0OMJbkfnf/+fCSXuYVuEnwhxT6J7NDM7kTh8C5ic5azLbaCdPqpKbTGEfqrI+
 Z72GvaSkyzg9gMadIHcm/VaGtD5I/U2zdhMO8kGJERbyb3ECeUP66B05RAYdu7zfnuf4
 Rc6u0TKUdnbKG197kDRY+FEIPIFKUcMPf+Zt2VGVABcpWdV3wNzxP/9VTDjEoRjZhNO7
 CPmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hCLf0vrR
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: renumber patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 94e072849e6c86a8c75402b1e600642673ebfb57 forgot to renumber
latest patch

Fixes: 94e072849e6c86a8c75402b1e600642673ebfb57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...04-Enhance-setting-write-gs-base-with-cmake-variable-30.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/fluent-bit/{0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch => 0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch} (100%)

diff --git a/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch b/package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
similarity index 100%
rename from package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
rename to package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
