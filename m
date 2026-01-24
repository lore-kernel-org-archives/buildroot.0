Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA60D715E5
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D364940A57;
	Sat, 24 Jan 2026 15:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wK5WkjaT-tN7; Sat, 24 Jan 2026 15:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279A740975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769269010;
	bh=HREkDOoRzabE1/tMljDnftazENf3vMCtNmdnvF431uI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mkEf3N9UVkVJ8nQLXD4sRB7XzFPTkIZKxLi1TKNd/TUoK+T5uCxvwlGV6ZcDBk1Fr
	 CnGC5S+tt6kTmvNNW7ko6FKE2qT90ddERuxw2qxQ8pazW0P7EdakDDXZLFqCSBkc0O
	 mHkkA0kO4Z4TSE8hHGFWN7x2pqs9d6QSn0LamsmI1Tr0pwz+hcGhVFteg7ykjFSBOc
	 tlzKYpHmiihIQITSyDjgNJuNyIGBU9J1VpzRGSA4r8KbEvgZQ5+BaDFoRzttu/N9wc
	 uZByeniR7OCeHN2rI4DZ20NxOeMjcb4rG1AS9avOljHtoNOBP5dL+HwDRyPB0LFwX6
	 3icZFG12Sr8bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279A740975;
	Sat, 24 Jan 2026 15:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6513471F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5254940975
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpGVJze-ObPc for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B5B340930
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B5B340930
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B5B340930
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:36:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so44969145e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769269005; x=1769873805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0S3O78IRihgNlgoeWgzFYvaubyzoeHdjMswiyeuv18=;
 b=jXffEfz2adAgoG8r+4lh+SaVbdfb1UCZPiyJJFWzwGQc/h9yFTXiQCr1qxAqGw8ZDU
 A4CX5x17aXfwSQ5v++Z2TGXhWWR0usaTNS+zwOgA4HNV8MhtkEMZ1M0aodTBj2+D6NxQ
 1fi1w5x9DCsLnF0jYLZVZqR2qjU5WfhLO6iCvNhsEuOtqrRfcaPP1OJp8yq6e5klnUTn
 CiQaBWb/01AmuL7h+U36/p6jUhKYRkM13NwQQTlXkZIR0icREjtouGGgmgFn8EZ1nBTg
 xwns8gKXOS+OFKoIfQbfFVo1SpDV44jBS2SQ+Vg14sffGOvMhxzsgp/oXrIvUeiB656U
 fGqg==
X-Gm-Message-State: AOJu0Yxsef8PhIio3kO9w/pyNAshJN632Em9HbP6iBxDbYCyDXNv/nZ9
 /UjwxR30VkdXHhs3P0lrW0/J3VYh3PYyYhZiSKpITKmb5fc/jSecWmZwe1AnOrNzPoJHeKzrV/V
 wO4DZ
X-Gm-Gg: AZuq6aJ8Y5TuVfaPiqbbk1qOsi3DXcbharNXRmZFGDr0EGu/+DaUfub65EYp1E8YklY
 EMc1zTNuv47sZSbSWxUCIUqMa21/Dc/JNmJaH3LoVV++bEb7xQH8XtXjoFzFrydoS5uwgbBKyba
 M2lf/L+7AK2LszahkJbWVcWJya+03Rua1PusKB9mPFWTi/7dUppKVVsin7uPffJpzDBTyaSull+
 7bp4hR765BKMWh4PfLXa7uXPjS2qvoE8LsNqYIukKENCKjqRhC1YSesheBYlDZK86r4wdnHssQU
 fR48F+u9zYE7la8nAn98IGNkdMOel7Yj7liFCzNVW2H+0zn9qCHo88m6CYtLmozAevBGw4sJEDQ
 a5XYpE+SwAS6e9RdKoSSyLtrmCQeuvlJjAYJNSSaE8F2mpo0MifC6LvBSVLDUh6DEEevfkpPKx6
 mJctIGPo+HCyZ0VeHPcuDt8fp0CgfGYndnGiuJXX5ta4FF/GJ/P5iG3vnbGrTuZuv2Di0Roirgi
 jZTh3bnFKMKNws4vxUY7DjbpKVYq2/cQN62N8+BdEPlNFnuRGOlJ/8W0rh5vyTilVdWpJhb01cL
 cYMh3/gxejQ=
X-Received: by 2002:a05:600c:1f84:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-4804c947f2emr101947125e9.2.1769269005291; 
 Sat, 24 Jan 2026 07:36:45 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470472f1sm235034635e9.7.2026.01.24.07.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:36:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Lothar Felten <lothar.felten@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 24 Jan 2026 16:36:42 +0100
Message-ID: <20260124153642.1076905-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769269005; x=1769873805;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0S3O78IRihgNlgoeWgzFYvaubyzoeHdjMswiyeuv18=;
 b=PjNbOZ6LAEmEK2X6y1EoOXfaIxC7JJItT1iXmrVdfbTGSEx2Tsk4Rgfog9dsQZUiqn
 ma3LZ1GOoBFnHUa1HSO4XgLh9Xcqj1fZjslVC3z1asZhTxAlyq5EHtSetYwZ+j26uYKO
 q2Z+LJjj6Uww02/kNTxh/+TA2J8IJ+6wwB97M=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PjNbOZ6L
Subject: [Buildroot] [PATCH 1/1] board/beagleboard/beaglebone: exit
 post-build.sh on error
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

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
index dc84d26eca63..dcb923356dfb 100755
--- a/board/beagleboard/beaglebone/post-build.sh
+++ b/board/beagleboard/beaglebone/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
