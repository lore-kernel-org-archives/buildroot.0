Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99AFD715EE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8590981C19;
	Sat, 24 Jan 2026 15:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-6Aj0MHcj04; Sat, 24 Jan 2026 15:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8196824B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769269313;
	bh=3i03L/tue8k8Bodfv+TAbDEl4jbGx2v4bTvBc19yGQ0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwCytTzPSpeplGtmTAnd2/V8PiHTrhE4hXstNySr+yEIwEMWv/vezV0ABj37mSagE
	 4zOM7bSbkSyrsyU4Ayd55Pl5Oh8xiVL4UorO+LxNbvQVL7MxUnQiU/beBJvKvuIDZs
	 fXAWwinwjF2Q5S3/+Y0em6zZeFtj5mk2ZV2ePBS2Bc8ejhCcumhuthJtRdUN8ApZ10
	 Zh684I0bPD+OaZkBxl97t1SsILyF/9o95M0NhLc5B6/AAw8NV6Zuua55ZCEvaaABVi
	 7SZhcScUVZxFAQLVLkeUz/9+ul8Jjei5b+CcOqKSKW1EdV8Jo7STSJnK5rICICTP+1
	 ImbNVQoiVxRoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8196824B4;
	Sat, 24 Jan 2026 15:41:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC24071F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC379409DF
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWOeWa_fi49W for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3D9F409CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D9F409CB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3D9F409CB
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:41:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso25369805e9.0
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769269308; x=1769874108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfVJxT8k0kI1Iskk/CCYhRtGKWDMjVBPCW2ICzhBHik=;
 b=XFQwHsk34Cnaj7hjUrcVX77IHiYwYxUST4kopTSaAmQAXOrILQle8Hbme47QcLl8UO
 wEFXBSPmSVXX3ytitgLGvIu7nObqyId2HV0xnb526IjIpmBpyBy/9gF4B0PQA5tCsOZv
 YeRkXnh80VY8dW+ATls2UXpqiU9hNfm3gnPtOKx0Da0QwcaYA8RmIyqxBd80Uz8b379P
 /TEUExtdE1rWx4zPespNrO8csmT3C0s2edQoHAgzaEM+tMHCtHFQRZlb5Z6lO7lpC5sT
 Orsv3yUUOxvaSDBwcLZnLjDtTUB+CJ1B+UW+wKmE8tNJ+rS9jdQpRzg8O0ZgcylinpAs
 Pa9A==
X-Gm-Message-State: AOJu0YzGw+KWWBgdQYxZzD1a/5uHayKNCTjVE8lTH+YGcFQWme8xZP7J
 5F8vdKSv6j8OPF03BbrHJkQTZfZtC0c3vPfVSj+kVhRHXbVwv4N/kQeXStCENZG4h0Cqvi+Vw2k
 0qGoI
X-Gm-Gg: AZuq6aJ9hWoJd1tVXKDTbzDJhER/p0/zUT1569EwMx4jK5uHuXbycmb9rm9PwZLUTyv
 +uiy4L8I3BJwV6vCA7sf7pNEItcC+4qqfC0Y6HlQYMbIWcCV/7j1ayNEdiaLNxs31596i8sWe7w
 1x/RwWPKA16D/GN/NkCkYz4SG9q6PSPRoAaMNaf9S1sicrC4qtVxNeYRNNbF9f8a/NmJwS1lhMh
 nKeOWydeu73WW1U7fRdfVBDOQ6hum2kdLYCsviLVWgHGZoN0tykLlI5YbPSUb1/t/7e73Dm+4cI
 bwOA8l7cAgJGneK+c10RaC88Wur547G5c2d/Zxia5SJsYcdrVnj8/7Omqhtdi4NfAoyzercKkSZ
 nw/iS/7+GKMB619//6KwA6CwT5CGHBnvhCjpH580uJN/u+tZ52pCxsekLupLv+LCzHrXHTh8S1M
 quMeXLV25tgmeN1L3ZeRbA/gfcI7Lj425kyn7UqKxG4j2sEE8BTI2X22qqbydERjolnifcHKfHV
 oRbTtZScDsUhrfj06BOOdJDu6tP9SXewTGGTeFpB93b5eAwUiZTE2y6z4183DzlqIZKNTeb6/KT
 hm9f8n3MIM1Ckul0XUxOyA==
X-Received: by 2002:a05:600c:608e:b0:480:3ad0:93bf with SMTP id
 5b1f17b1804b1-48051249c8dmr87308935e9.24.1769269308459; 
 Sat, 24 Jan 2026 07:41:48 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804702876asm239897255e9.1.2026.01.24.07.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:41:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 24 Jan 2026 16:41:45 +0100
Message-ID: <20260124154145.1085049-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769269308; x=1769874108;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OfVJxT8k0kI1Iskk/CCYhRtGKWDMjVBPCW2ICzhBHik=;
 b=N9h6jrZuXFsP0VrgsWZotyamCbPNlaudsnCBhd7vtvtd1Fh6WszqzlJ3cehY4pn5yo
 AnPC8gGGevCIGHknvsZCSpJed8G11Hd3pwKjAcRIyLMmcdl3aeoixPt9UNT7rrwCUvJo
 zGNVxAWAU39I/GZDiC857sUZaUvZhrnGGYrPU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=N9h6jrZu
Subject: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2-pro: exit
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
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
index bf8861f6a914..9306df3f3ffd 100755
--- a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname $0)"
 PARTUUID="$($HOST_DIR/bin/uuidgen)"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
