Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21477D10C16
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 10:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F31403D9;
	Sun, 27 Oct 2024 10:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFmr6AK1M8Ik; Sun, 27 Oct 2024 10:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA554403C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA554403C4;
	Sun, 27 Oct 2024 10:29:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6FB971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8061B80B6E
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 10:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNY0VrCj61Rn for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 10:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EA2580591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA2580591
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EA2580591
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 10:29:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so32907895e9.2
 for <buildroot@busybox.net>; Sun, 27 Oct 2024 03:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730024939; x=1730629739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6I4lBtZhERIZLFOffdO0oJg1dHw3loXOKtTkDLDsxio=;
 b=wXJ0RynYmswoCi/FMK/4b38biE80F0tE8Jz5WyAT35BDFxzAxWqyy5yUA6MPGxm04B
 XaEzz11y0Un2jSKuncpQdUD1mXKKlaZYYP8BOR763fBY5tz2PFokYJjW37KrPVZrRl5l
 613SBUBp+zhVCpl+r/+TgSIFcUX54PS3A3eUhML5aUo2mvYAgHMKrfAWW5Nj6snAtE3D
 h5CKnbsF1cHImvnhrrPxr58UrO2U1mpX7woOkpvNr4cZurNVSIWv5bhyMHZNKZIvjsqC
 rlX61UK8yEgOEh4U6Fm/ip0ctUvwRubshvljWjCteAhg3fYTfoW2GtOHCM6bWs/ScLds
 SRfQ==
X-Gm-Message-State: AOJu0Yz4R3w56KZ4IITMPUOG+JBLrvgoWQW6yNzC8V7gF2Fgl8e6GCQC
 jaCdYeZ0wmSlodvCy1fK3tKry75NDqiIvE0v2AsoGdz36NQhGKh4o934pqz1FFIcN3j+lDWP8pb
 RIA==
X-Google-Smtp-Source: AGHT+IEzXPmcMCEUDBpIB4FUrtB2kPXROybKXS/+pn2N6sMTFQcMRsd+qLBUg7VPG1La4t+q2SMI0w==
X-Received: by 2002:a05:600c:4fce:b0:431:58cd:b260 with SMTP id
 5b1f17b1804b1-4319ad041a0mr41976205e9.25.1730024939167; 
 Sun, 27 Oct 2024 03:28:59 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b1c645sm6455691f8f.17.2024.10.27.03.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 03:28:58 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Oct 2024 11:28:24 +0100
Message-ID: <20241027102827.899852-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730024939; x=1730629739; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6I4lBtZhERIZLFOffdO0oJg1dHw3loXOKtTkDLDsxio=;
 b=aap5ZHs91G2yhUvkxQQsHsYLgt5CBrOUKVX+dvBF7GbhJuGVaLfdLFnMs0QQ3zwvWJ
 A22lf4RI3IJEJAMjeF8v4AAw9wbYR3rDzq4qPFxSkAy/Qq2AzbNtfgvVvQsY6w5UZrcJ
 3g92muccHaPz8LWt9FCGZjj5hzZ6cRy4FpTedmmPUftLmTyd4N2TXdUnTgmtT+LINarN
 ehC2ZISHBHMLSE0lBS/twfbfJB/0sIWsrr1J7ey+fwlEjaXM9koha3eEutUdusNB3ILq
 /MU41bTA4Gft4OD//SIx/PYULzpE4QQCa05iM+UmJyMSuZOEVT6vtfGqb/wI6Ve+nuUr
 m62Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=aap5ZHs9
Subject: [Buildroot] [PATCH v3 0/2] lynis
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

v2 --> v3:
- allow `stat` from Busybox or coreutils
- improve runtime test
- bump to version 3.1.2

v1 --> v2:
- refactor with LYNIS_BUSYBOX_CONFIG_FIXUPS

note: the patch "package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS"
was previously submitted in another serie,
see https://patchwork.ozlabs.org/project/buildroot/patch/20240313091412.20865-2-francois.perrad@gadz.org/

note2: at this time, Buildroot is unknown to lynis, see https://github.com/CISOfy/lynis/pull/1551

Francois Perrad (2):
  package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS
  package/lynis: new package

 DEVELOPERS                                  |  1 +
 docs/manual/adding-packages-generic.adoc    |  6 +++
 package/Config.in                           |  1 +
 package/busybox/busybox.mk                  |  1 +
 package/lynis/Config.in                     | 10 +++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 48 +++++++++++++++++++++
 package/pkg-generic.mk                      |  3 ++
 support/testing/tests/package/test_lynis.py | 26 +++++++++++
 9 files changed, 99 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
