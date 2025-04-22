Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7B5C369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AF140B5D;
	Tue, 22 Apr 2025 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk0misnvugjv; Tue, 22 Apr 2025 10:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A87B40A03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A87B40A03;
	Tue, 22 Apr 2025 10:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF081A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0032981DF4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fibC7VVcOT4x for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3522480E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3522480E03
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3522480E03
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so2954700f8f.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745316025; x=1745920825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TAyuQOVjFKFBLkLCHRXhUJ3mXNo/6xIseFFuiPWmIPA=;
 b=HCo/oI2SqT/PUhHYxrCsHADv9z7ItGc+8iwT4zZEHFJS5rzitr5vlLX7WGdutFe/qv
 oEpdvMMexCT+CcbOT38vtNDlnYqjru2+wrjJf6rwHPkgPMfDcsLSEh4CjZdDe1mnHbtv
 3KP+quxtJu+YjkcEDGOwflaO7HsQgVafPcEAcpmZsmiBuaseYRd/NQ0pwrNPx8NjLyNY
 oH6W+GJoKlfEaWYdiXS2xKD+BwQmPgVhq6ASEFcGF4A2VaMWU2fFejC8BypYSvDthfbB
 nhaIvAY+gFxg5jJASTxYfo+4NHKTZd5sWLnmyOahVNwsmoRoHDHKx8tJ3E1jxMMj/S6z
 oFjA==
X-Gm-Message-State: AOJu0Yzm4tr3waCGtlryfUD9D+nD0ZxhxX+F8a4QpuhPtiVYvk585kmE
 gjE+z4TS1PH7urGvdmYMLPlQK1TLh5IfC6ml0yjAIxaJZ4+dDD1AdRlKOKYstdIMu3JjWMyvY9s
 2fTA=
X-Gm-Gg: ASbGncvO4Tq5U6sk638Ue+vE8BP928BUBQ00KQz2MGmt3emURy8HW8YXczYtv/ihhqN
 ki3y/SzAll2eZ59NdImvCzSngCap+jekpHYVA6blLSS48kI1Cl7qTOyuirkQqNfOglxSVkNFnPs
 3QYSvt2jUIl7enwJgIaQL44HJPb2nMLZua18duwl3nM6/zLfmdV/RkyjD2c8PcbPD6cRmqwo6Sj
 rAccdRAfi0SPjCwdgdG+8QibPrlvcBgkA8VcMYCFBxnrnbGlkZpLOCl7ihhTxhusDAqCMxJpm8Y
 VeeyeBATA+mZy5Wux5LyiSCHHQpASa94RvTnSzTit3enfS4J65kpAsd/aLCy/gx7RHUyKKtYDVE
 agy125P7vX9Rz/kboTEAt19n8WRVzXhPZ98M=
X-Google-Smtp-Source: AGHT+IGXO0jqVEcwKujT9jb4Sx+1N36qmW03M2IocWaDH1V73PXrKc0YddZcbYKP8onN8mJ9cwvSmw==
X-Received: by 2002:a05:6000:4313:b0:391:ab2:9e71 with SMTP id
 ffacd0b85a97d-39efba3c6d9mr11797028f8f.20.1745316024997; 
 Tue, 22 Apr 2025 03:00:24 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493145sm14549768f8f.71.2025.04.22.03.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 03:00:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sam Voss <sam.voss@gmail.com>,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 12:00:09 +0200
Message-ID: <20250422100011.962097-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745316025; x=1745920825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TAyuQOVjFKFBLkLCHRXhUJ3mXNo/6xIseFFuiPWmIPA=;
 b=p8jBjlvtkRaRAQiJ0kAcsgy/rz1idK9XkoQ3QaQdhkvMptLpwAhagTNUsArJNRRdKj
 dq/J80SMZ7bv6iGJc1r1oMA0Htz0o1oSsTDx5a9cmKLGD/EEcM+vvlqg0JgNvHvt6WAL
 nNUYEzAbQmrcCLSLN3/nnbWc8PDL6AK9Pvvl8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=p8jBjlvt
Subject: [Buildroot] [PATCH 0/2] package/ripgrep: ripgrep upgrade to version
 14.1.1
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates ripgrep to version 14.1.1.

Note: This patch will conflict with my ongoing rust 1.86.0 and
cargo3-related series.
I'm aware of the possible hash and version conflicts, and I will
fix as needed after review.  

El Mehdi YOUNES (2):
  package/ripgrep: update jemalloc patch for 14.1.1
  package/ripgrep: bump to version 14.1.1

 ...llocator-behind-a-cargo-feature-flag.patch | 29 ++++++++++---------
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/ripgrep/ripgrep.mk                    |  2 +-
 3 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
