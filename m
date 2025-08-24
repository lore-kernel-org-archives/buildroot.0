Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB04CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 17:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FFD60B65;
	Sun, 24 Aug 2025 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzNSyFYtDBLZ; Sun, 24 Aug 2025 17:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0DE260B20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DE260B20;
	Sun, 24 Aug 2025 17:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13521CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C8540784
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlItafnZCfkr for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 17:18:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C48BC40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C48BC40027
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C48BC40027
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b05a49cso28472515e9.1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756055906; x=1756660706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18YC5QBl5ZnnEw89fWOHoGSdyreAEBtXqwYkDnmqp0I=;
 b=jkrnukarEZCPNiUJZypXrW5Ni/FIJQxYPzFEPUyb6OrxTlbK0U+wHtKXUKoVt9bST2
 XvfztfClNiMOIJ6K9LuJID7hs5oOkQnBg1Np1YTjAiNYAbNZGewLrd/MT1r/BG3TB8fC
 Ccl/3GWANgVjyxCNR0EnYRYDJdZJxsnAQ/oOd3FvPZjSKZXdLHCYKkc7701tP3qWHEXR
 P9F4X8kCYzlzMsQzM0vPZWYyrmD/7XxoHRONjg50nlsRJdIUXmUYpFYc30DdyFUAjkOT
 Q5ilVI7MVRmzRG3BhufIw5+IjBk4AEyjopUiW1ngKc/LU+6f38wtiYOvHBYFT51PgZs9
 g+9w==
X-Gm-Message-State: AOJu0YyzN7HBrMFB5QzJR+DhWNO9aWuIlf0AwiX5RB5TIk19ZJWBgR70
 c0QLEYF1oZDwSQePNcOMJm2+WhXAU3PhCYlXgmAgB7k7pizEZuDhYI9bfwYj3rJrwzehodmLHO7
 XO6P9
X-Gm-Gg: ASbGncviry0But3vQYK108KcqES421b7zwqps7IH1a8Wp1pHFA1by+u8fVMme1HDWJu
 Ze0nEOxT+4HEjcg/g4M/RiuhGRsPdHBAHNY91mUQ8yKJ33ZC+UMdxKQvlR8wSKMC7WhMVtQdVoM
 NiTh00VJ/dprC2ilFrkxReF3sN5sTkEvznp9XTpzBiZ9zDLFYl6DuJQIEMt7bgCuvsjSZLns4XH
 967CtZHG5zA9Gt1DjwAoiDA+0RGkXaEKpohq2ynK1a8ftyomIakTuFlq7LsYuYUcU9GFZDiSkMi
 w2D0jfSJaGn3Cxi90rD/TiNR/D6PwdMd7iAIBM4y31V0tAikZIVGjnfuOQN3FKg3PgbJesBV8Dq
 tx1mHr5hZX9hqhvf2wUVJ0XvmzWRxy4xNrdnu3ZaZsXA8pJinCraLad+KCp19222f/qmXqZ0xbm
 Do+JIKEyKAcM1iOqzie4gAmCmzgCX2KF4=
X-Google-Smtp-Source: AGHT+IE7OQXe7mUse1zNd/8up7NlGyM0cE3B8KDBJMB1x+lCPWT42rNF2gd2cakgXWoCxyVg+TWOWQ==
X-Received: by 2002:a05:600c:1c20:b0:458:c059:7d9c with SMTP id
 5b1f17b1804b1-45b5d48ea24mr24976195e9.6.1756055905593; 
 Sun, 24 Aug 2025 10:18:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57492459sm77972095e9.18.2025.08.24.10.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 10:18:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Aug 2025 19:18:22 +0200
Message-ID: <20250824171822.4123094-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824171822.4123094-1-romain.naour@smile.fr>
References: <20250824171822.4123094-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756055906; x=1756660706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18YC5QBl5ZnnEw89fWOHoGSdyreAEBtXqwYkDnmqp0I=;
 b=yHkd6GfG61TPBbVGpl/y+1tTzhMz2BJ7VCpWNHmDwuAmF1LShQpbf8GGZhjlw1eBNG
 PzjH6TLyxPVE442Z9ydOmkFthgXp7E1/mbYGVib0sPN8kGwsxXW2DHVO/br5aTQTXyfD
 uT+C/aII34/XaCmGYGfWYDtBQhKW5sdXHwZd0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yHkd6GfG
Subject: [Buildroot] [PATCH 2/2] support/testing: TestXvisor: bump custom
 opensbi version to 1.6
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

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestXvisor fails when building xvisor with gcc 15.1.0.

Since xvisor is now fixed, opensbi 1.5 fail to build with gcc-15 for
the same reasons.

opensbi 1.6 include a fix for C23 enabled compilers [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://github.com/riscv-software-src/opensbi/commit/d539d64a23bbd64ba324eed595449bcc9c7be0cb

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_xvisor.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xvisor.py b/support/testing/tests/package/test_xvisor.py
index b1b7d1a5e0..6872e22db9 100644
--- a/support/testing/tests/package/test_xvisor.py
+++ b/support/testing/tests/package/test_xvisor.py
@@ -16,7 +16,7 @@ class TestXvisor(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_TARGET_OPENSBI=y
         BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"
+        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
         BR2_TARGET_OPENSBI_PLAT="generic"
         BR2_PACKAGE_HOST_QEMU=y
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
