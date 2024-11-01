Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CBFE6F070
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA5842493;
	Fri,  1 Nov 2024 17:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNYgUBxFHA6V; Fri,  1 Nov 2024 17:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C00423A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C00423A0;
	Fri,  1 Nov 2024 17:10:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B21614D1C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9479E82064
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjvNi2wmuEbg for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 17:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 817E282062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 817E282062
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 817E282062
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:10:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso23549125e9.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 10:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730481048; x=1731085848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jToBjef3dANQ6uuHypn27fsL3Y+TmEN5wXjn235bCsA=;
 b=OZvqZF1EGQR4VnknvM8yGxHURE71a66yeBGUXBaLFrve9zzRMhkSq8vlWQzv97cZjj
 18AL+VemrnBbFGBRZqxvNzFada7wVOxKE+8iJEl5fC0hUWNP8EsMnzEWmQ0Se0reiPl/
 oAGOWxeHcIV4QHyLl1H+ZzUBpKLuf/j13wu74dBnkWI3pdGW7z1IlWiB7GLjAsj/oF6F
 xghCtnoxo3RyATBm1Q+g1XWajrx8JTxnM/pEH1VgMx8mEWzruLtvMWRPzt2OL8HLiBgK
 LZ5pZZMYebjxFtKYPZ8A1inrnU0lOdamTDY4UhEZ0AZ4UPFZjgFA6nOhYkjmOUkN4LDU
 rwgQ==
X-Gm-Message-State: AOJu0Yz6/rrNAwyl3CztR5NBKEgIf1vBNKiHwsivizQpiw0tfLVXPTQB
 v/sXFDrcTd2bsnI9KB425pqXkiLQ2rGw9RlaXNXpq1b0BcncidEYiVgLQEPb8NtNLD+FnSsX8WD
 d
X-Google-Smtp-Source: AGHT+IF0GDB15dmx8vnwwpYorOBPupvpm6wBAfaxOtSlsNQVV8yfpoKu9kf+ywIF+WtbjNECoplacQ==
X-Received: by 2002:a05:600c:5250:b0:431:5465:8072 with SMTP id
 5b1f17b1804b1-43283294a9emr45606125e9.31.1730481048061; 
 Fri, 01 Nov 2024 10:10:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9fb9sm101489355e9.33.2024.11.01.10.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 10:10:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  1 Nov 2024 18:10:44 +0100
Message-ID: <20241101171044.3320155-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241101171044.3320155-1-romain.naour@smile.fr>
References: <20241101171044.3320155-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730481048; x=1731085848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jToBjef3dANQ6uuHypn27fsL3Y+TmEN5wXjn235bCsA=;
 b=vpF1WNqFGI8KsLBvo77KtmteiZM2dhCPzG1oaJJ7y/yacz5eXiQbEcMaViDKpBaV20
 GQJoydigaSk0SkSBf1vBX3N4o1Xpj5b/KOzOnsTyEQolxQrZoAqbdm++SsEnYJHSS90X
 PZTXWqFj5CgDGw1FPRABBcTQRLiyX4ksFqctQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vpF1WNqF
Subject: [Buildroot] [PATCHv2 3/3]
 package/python-magic-wormhole-mailbox-server: add missing python-setuptools
 dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestPythonPy3MagicWormhole runtime test is currently broken due to
missing python-setuptools dependency.

wormhole-mailbox server fail to start with:

    File "/usr/lib/python3.12/site-packages/wormhole_mailbox_server/server_tap.py", line 11, in <module>
    File "/usr/lib/python3.12/site-packages/wormhole_mailbox_server/database.py", line 5, in <module>
  ModuleNotFoundError: No module named 'pkg_resources'

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-magic-wormhole-mailbox-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index a0721e866f..a4f4c5ced5 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	help
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
