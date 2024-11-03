Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF611D110C1
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 14:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362AD81FC5;
	Sun,  3 Nov 2024 14:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJDsaqFHk5UF; Sun,  3 Nov 2024 14:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122BF81E55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122BF81E55;
	Sun,  3 Nov 2024 14:38:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7FE31128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 14:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B98DD607E0
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 14:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOwgK9mab2gs for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 14:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2567C607CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2567C607CE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2567C607CE
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 14:37:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso2339888f8f.0
 for <buildroot@buildroot.org>; Sun, 03 Nov 2024 06:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730644674; x=1731249474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ch9ibiI9nLYR3V7W2QlW+VnQpiW5uodzLxlQZP7qBxg=;
 b=dCcTaTZ3yM/X9fbRjqKIirg4tauVrgvkJMdIzRMpWQn3CRHH/gyd8DWln/x/Z5LeO5
 b/dUo83iG7F+m5RIphOe8tJMmJp+hvAA441qi3Kz+j8lPcH3lvOBrb+qxs0dc53XaBtz
 AR0VMPKglxNUnTzW/adnCjNUES9Z9SStn9tdG6azPXUgHfVx7v2O0z6gJMms4O91x+iw
 aK6/lhres2tBruBn0LymgdqHf7e6YMaA8+bt8mYFfYvJlobyEmOf48+yQINvM7LXlwbA
 /dnsOqY6S9ZzKVBtjeWl+XAt1Sf6Ce7JTPuu5fkmGnVJacFXVSl0Mwz2/ZJsJjC9px+Q
 exOw==
X-Gm-Message-State: AOJu0YwWoSEOPU1qIrF5B9WB+m/4ZdX1H6KucJYz9MmNO1Dn/ExGZ33s
 QRKJbn2ZGC5+Z6OOXkmFByGVRdk6GP+RCnKToXxLGJA0KFFKSI0+LcRvXzsfQHdgdIGi6WrZQYI
 X
X-Google-Smtp-Source: AGHT+IHB1dCrJvA0xlesu4Apq+86luCtxS4MgvUPbeHyh0EhuavzalKx+ZbOFDYMQFEirspLkOtxXw==
X-Received: by 2002:a05:6000:1f11:b0:37d:4389:e9de with SMTP id
 ffacd0b85a97d-380610f3011mr20083599f8f.1.1730644674282; 
 Sun, 03 Nov 2024 06:37:54 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d698144sm129179055e9.39.2024.11.03.06.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 06:37:53 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  3 Nov 2024 15:37:51 +0100
Message-ID: <20241103143751.756123-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730644674; x=1731249474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ch9ibiI9nLYR3V7W2QlW+VnQpiW5uodzLxlQZP7qBxg=;
 b=OOtoyWK6JTfqgDSOjDs+UbzgIKNVa2NJxWhS4JqzPwPXFgtu3D4V7aVQlynJMI6hg0
 d8s+TEWVncLuMKnZkJ58tp69RgjePn4wzGhM1ZFbL+vELRGCpDQdVLlNe6U5CHBRmCvg
 rX83HqBI1TEiua4d8BjlE9qkbBDTQ0w3Oh+kM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=OOtoyWK6
Subject: [Buildroot] [PATCH] board/mender/x86_64/post-image-efi.sh: use bash
 for genimage.sh
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

mender_x86_64_efi_defconfig started failing to build since 2024.08 in
our Gitlab-ci since the board/mender/x86_64/post-image-efi.sh is
calling support/scripts/genimage.sh with the host default shell.

There is no problem if the default shell is bash but our docker
image uses dash as default shell. Since support/scripts/genimage.sh
is actually a bash script it's not going to work if bashisms are used:

  support/scripts/genimage.sh: 57: Syntax error: redirection unexpected

Indeed bashisms have been added recently in
support/scripts/genimage.sh by the commit introducing bmap image
support [1].

Remove "sh" before support/scripts/genimage.sh and rely on
"/usr/bin/env bash" to find the bash interpreter.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8233226891

[1] 6889056f1eb4293de67c28b1ff6ee34be05d2ee4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
I checked if "sh support/scripts/genimage.sh" is used somewhere else.
---
 board/mender/x86_64/post-image-efi.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 073b18c972..ab12386076 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -54,7 +54,7 @@ generate_mender_image() {
 }
 
 generate_image() {
-    sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
+    support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
 }
 
 # Main function.
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
