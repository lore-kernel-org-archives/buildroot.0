Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72E2D12663
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 17:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A8A44121B;
	Tue,  2 Dec 2025 17:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5FmG36eQiOX; Tue,  2 Dec 2025 17:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B1874122F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764697973;
	bh=WlvIHeYSUSg0bw3e7KmyEvwfpHxb/zmAI9Xm8tXu7GE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YViH3GDKuUjNdXfucweEH8UkCWC3afh+djnk5vR8f1HvR+2i/F5uboIAi8C0UAHm3
	 mx8ptvrtHavL6EWHRPweHsP/g0saBu/4ZUTic7x3Ui1/Ed6L2Tbs8gsJFFx3rddGgo
	 7xZxDAj15QWLP8yzFlgMl9keAcClPN4n+wzGpTUdnWKuknMfhQ+KISaZxjV0HcZZMK
	 p2zb1dJkPVY+ruP4Bj8B935WEGBtsuPpPuSUldJIorTaI2HWUZe6/nVloMTyjq7+Jn
	 dGn/n42SRkX+xz6oh9Y3qaPISacj7NWWGdLsPUL+TLN9aWCQhJkvIccjDFvn+ugx+J
	 6sDch5mAt76PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1874122F;
	Tue,  2 Dec 2025 17:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C0FA1BD
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0AE83EBF
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14GkVqqUbEU4 for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84FFA83EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84FFA83EBE
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84FFA83EBE
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 17:52:49 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-3e8317b1262so6307694fac.3
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 09:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764697968; x=1765302768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C42KO0mnew4oxnVWUZBqrBAZxL+n4Za76zs2AiNjon4=;
 b=tyJFcPpeQf/xRGSxRc/6J25GhpP41PrAdGOnWogCD6iP5cByMilx7vone9J9PkpMRM
 m830XzI0TvTbcjeWICjeWfVwUB48EfnMPNkzZuGnq8/C39Ptk7tJeuZO437M/EvvuLB4
 MuOr89KiMfmw5d2J7f/XUhggC+FVBq4R9qcKVjrnyWwT9XHhUNPyXGY9OIapjEZvPEJO
 qt/txOmaVGgXi6OiHqkEAAO45HpGbINqd+EuJWxm3UNuzUBdVDKdWqVBm/oAwRowwant
 0q8tTBaneIGjHyom5ZMHb1atcQ6ud28UOiTjJPgG6yANde7Tm5nCVHbrpQr1Gl0tpJc8
 bbjg==
X-Gm-Message-State: AOJu0YwR1VICp2AZdhJuT/7YKyz1XohrGuyQlz5ad5AAwi7TzyATHPbL
 6w1XMR2uJWYOtdK6OF7C9kQmEO/tTDz9voEWbgkH++XAE0It9h4vQ7Yeg07rZHQe
X-Gm-Gg: ASbGncvkyfwgc8NxGErh8CVDh7BsDM0/6bsys7ea2suihOMteUc5hBwFLkDiLAXyFEA
 QufTlvUu0fw+jCHNA6Fo3hkPs35nYzs0W0w3F0if4yoTxin6GO6bzf5LAScsppu3LmfIRx4R8Kr
 rJ6WEkCnE75yPaaXTyFGjBXuniUSKoFNfrTxQ6SyZtCErm81wi+L2iKCi9qDj/M4BeHQGklhQt2
 6cP1rc03fLRgoGZu6Qe/YyOotOeiFy2Vn8OPuu1qdNVsofLEZ9FJib9ZedCYSYLoBPh9dJEXi0r
 nfvYBM1tUJZztyf/TKRQ5JXeMYBvMQf1q9xuK8wAZ2n/QNw3QNPQsPA3AFS7PTMme49LfZSiG3x
 7YKg/MMN7dtmQBhIN/zxrHYQun5JzgMTXsmb+rc1dS3bZ7fsrKGsalKjZp3oARlhSCY5iX2o1Go
 xXU79ETdTkDEsdrYBcsglbFJTi2cMvej3avSTIlL/hTiZgY73wbTAFwoBCQVA=
X-Google-Smtp-Source: AGHT+IH1Xtm5Ib66PQ0kc1zQRJXvlU4xcV6Nc0TOlMPae3KblcxRW2Bjrvx47gBcvo0hUs+z7zIgmw==
X-Received: by 2002:a05:6870:1f06:b0:3e8:8e57:a7a8 with SMTP id
 586e51a60fabf-3f1631f7d74mr303180fac.55.1764697968058; 
 Tue, 02 Dec 2025 09:52:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3f0dd021aa4sm8081759fac.15.2025.12.02.09.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 09:52:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  2 Dec 2025 10:52:39 -0700
Message-ID: <20251202175240.1270265-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202175240.1270265-1-james.hilliard1@gmail.com>
References: <20251202175240.1270265-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764697968; x=1765302768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C42KO0mnew4oxnVWUZBqrBAZxL+n4Za76zs2AiNjon4=;
 b=ikIZGujyhjn8TdUXAW9c1YP4uC7E1S4iMUHdiF5xhy39Aapp0NwiddHU3jhHV3AnOV
 qEI+1Dyuz/RbILbaNzsFf8io/Ke7KbWTNlN+Zaq/wuD6VvhImkFhSe5OqTFQzm5HbwNZ
 GS5g3z6UNhEtyVqHpuiUz+jvCdDrAnhbXK3hnHvB1cuGDRP7uut2iY/iJVxwGM4yEITi
 xewXsLrsKA8GAuUgOO3BtYkVPo4ljyGUt4n29zqGq+ZKTwYr4LwkihjcSM661XKyEnux
 gA9RgAcqrmyS0T8xV6jRfiZNL7BaKfo6wGCXAUqm6npRTE/jZObNw87P+ochwnGK0r+w
 FluA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ikIZGujy
Subject: [Buildroot] [PATCH v5 3/3] package/tailscale: bump to version 1.90.9
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

Fixes:
https://tailscale.com/security-bulletins#ts-2025-008

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - update tailscale to 1.90.9 fixing security vulnerability
Changes v3 -> v4:
  - update tailscale to 1.90.6
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..0971bd5451 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  d83f70dbcf86e3a7374e7b28ecbcabb5d6090ed7cfa29006e17d7e9e4a52c922  tailscale-1.90.9-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 86039fd4b1..c710f3ced9 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.90.9
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
