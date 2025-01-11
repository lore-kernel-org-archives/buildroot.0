Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E943E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1850880B5F;
	Sat, 11 Jan 2025 18:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9Ky-6nGfe-b; Sat, 11 Jan 2025 18:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F9980BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F9980BA9;
	Sat, 11 Jan 2025 18:30:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6285C940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 438B36079A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLTFyEwuH6_8 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3642C60779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3642C60779
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3642C60779
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:30:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a9cdcec53fso21483715ab.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620256; x=1737225056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CDyFZZoXTuwRcMR1sdOXqW+nMvh9RRsgVaieWIvbzb4=;
 b=tR3yOxOG1vb3RiiN2mGZb1l//o5hdfFxdGNtWU/MnO2OP4uNtmq3HIEYWeB9F/y8Ww
 BJ5ilA3kxUwHgqvVG1xFu627rzyCNcJbBInf3RG04aEEsSac2VG6DdItW0FwPHHtq4FW
 ZCb9GLEZbQ0sZ2AGFwym48IquiTMAa2rxcGRNWUhuO9qm5oODpeL6I/l0GIVZhGPB71J
 raYJaLEFQSk/Fmj9KDZxlX8RMaOYrixa72crjgexmEQMjQ9tZT54qEcexQgG9GepvXcg
 DZ4LIqa7c0cnwHbQbu8MeGUzcu/UlWdDVO0QVujOeaB5ZEhI8U3ntDuRhXRw2odL85DY
 4ReA==
X-Gm-Message-State: AOJu0Yz7QxJGtJ6E2rlwe0qj0NunQ4TH7BzSaceKyaKcZVXbtIjsHjJV
 mdxmU+VuMoM8YQCyKzqvn42rvY0RHr5H1qCA3avQoyT7JjAP2RH+p/nO3DtsaRQ=
X-Gm-Gg: ASbGncuyi5GHQVec7F4ey69Cw2ogUSkeqBMDP8S0dGnVF2GpK3I/K/rFOSpYv3o0Pfi
 eJwVthTueSKFodKKUX1fO2hFxg8eMmNZYqjNuNfQm2rDq4VZ0TIdpgE/3DJ6RHBZaPhOxEpruNW
 Ajplkd9UMTbLpcZTcp5VCY9/16KHo8YyPN1gmxvCyhuTIViFvMCt2DmwZenhoOpe9YIXIok421U
 6ainikZYBCMt4iODtlLLsYj/Iz2XHhyRwtwTmwk1e+r05vkU8L1w75at9kVaGbh24JxZnThEkLQ
 Xmu08FOws4g0K4Dz3qHgr2dqUEoQqH4=
X-Google-Smtp-Source: AGHT+IGxCWXdp1HxPZ+cCWNES3hw0dGE/skmvb0pKy2kFoWW5n6fVXHqJ/mo8H6GMDXZ1W24iH8HFQ==
X-Received: by 2002:a05:6e02:1f8a:b0:3a7:e528:6f1e with SMTP id
 e9e14a558f8ab-3ce3a8880c6mr113786895ab.11.1736620255949; 
 Sat, 11 Jan 2025 10:30:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b611829sm1659107173.33.2025.01.11.10.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:30:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:30:53 -0700
Message-Id: <20250111183053.2936427-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620256; x=1737225056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CDyFZZoXTuwRcMR1sdOXqW+nMvh9RRsgVaieWIvbzb4=;
 b=boelo0+cBd82iXSm9q3mUPKLiDEPz1jvFi70KOHMh3FXYta4oxU2GYRNzjMrqW7ct4
 cPmGbFKGK2YmksNItuf9OLYVLsJu4ol4wplw9kEln9Pw9NFm3O4DA1kt/7GkGxx/ySQv
 s8ih/t0261zqougF8Qy/qWUU+PTyEJkKPh6YNAbvwA0/e+N9ebUdjpsiYaQp1kX1sBqM
 P8QTWGfAZgGh7+opzMaRPdUyI6QJSBpvLPA3KyjikkEiR+6osYWZwxG6FIP+NB3U0GEC
 0az5AkTHpXTiLlaAYteCpZXZ4+0z1QUxC77u6V7vROdulPJatQVREjSQvsT2Bibqpsvb
 ddzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=boelo0+c
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.67.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 7bbb37e5ba..1395fa2e99 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  3495f2a40a26a4f1caea279630f13521  tqdm-4.67.0.tar.gz
-sha256  fe5a6f95e6fe0b9755e9469b77b9c3cf850048224ecaa8293d7d2d31f97d869a  tqdm-4.67.0.tar.gz
+md5  aca803dd7ac5c4ae233977aff41b7f7c  tqdm-4.67.1.tar.gz
+sha256  f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2  tqdm-4.67.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 4c2db7f249..b03e19ccda 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.67.0
+PYTHON_TQDM_VERSION = 4.67.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/e8/4f/0153c21dc5779a49a0598c445b1978126b1344bab9ee71e53e44877e14e0
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
