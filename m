Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1950CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 10:09:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A7F60F91
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 10:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87A7F60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3063E4011B;
	Sat,  4 Sep 2021 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_qbZwdhL-k6; Sat,  4 Sep 2021 10:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38337400D4;
	Sat,  4 Sep 2021 10:09:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C42F1BF5AD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEC860613
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 10:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hBrF5eFXP-v for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 10:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53AB860071
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 10:08:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b6so2143824wrh.10
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTjqCbGoklA4D+izhfoGPm6x6h2zD5OXsYWzc8cC5+I=;
 b=S/61fTUVL6EnLh0I9FGqlzL5oqe2ZIvykBAZDCnyR3grqfZUpdEblG3FGqlXGQG5j9
 u6HQGqtqEyTPg5zHuV8gPmXYmIRxj/y3RrhWEwVG3MLxezZU7/qGvHQETHzrud/KXyGS
 V0nAmdtPIX0v8gix/zXkjPr1mF44kigtbd7WXAcwukNh/A8BDlCj+xLcE0c5v/RWtBOh
 qBO8x7slMvII/BtKHVHma2ooel8dJhXzWgc7M2PgjB3bgp+X/r+Yne9EGHgSo0uoD3zC
 zM6aGaSSBZf2i1Ob+JjA6anHexTQi/dWSiy3F87aVf5QZ4CxxZu901tJqxPeThr070BR
 YZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTjqCbGoklA4D+izhfoGPm6x6h2zD5OXsYWzc8cC5+I=;
 b=hZCuuklctd55GW6K5Jj71DJxXpxhKjrE5jhKKmI8YBlHfSajRPUPq9cunoQD/4mjaH
 ntI4VhdCuez/UYz0Chc2EjJ1qICd0qPACD+/gNBpX1i79yIguQiFmAbsLnVjHn+itZU8
 TXZ/IieJhg3dv+prlRmvaALr+nxgKQVli9i4puKjttOoElDT6RHiRwg4SiRJmVunqUFA
 RbRitrf0SbkLb4sEHwwknPLTZBsNSXe6c2kNYn2awBtrsCu4qHr/oW+em83LCv0TKJ4e
 1g+M+0HbTSv8Yyb5yNpZNliFJodqa5yikMQ+AE9ako83uvyxrED8mqca040PNB5ETfUY
 Z5mQ==
X-Gm-Message-State: AOAM533NhRKVJWgLUiDXKqJOISO4N06GhAiS1XhaPLnOkN4BvsFM7Ia1
 h6zjDSfZ9zD8ZmYhMzkerpT9OJYX4WI=
X-Google-Smtp-Source: ABdhPJwUFjJu3MZ10PHJfvbvXT7tH2lN+hPY7vjZ6DQd0DI3KoS4QtuGNvjYU6f8z7t28SgEXvnHtA==
X-Received: by 2002:adf:db83:: with SMTP id u3mr3388728wri.363.1630750124493; 
 Sat, 04 Sep 2021 03:08:44 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o2sm1794172wrh.13.2021.09.04.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 03:08:44 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 12:08:37 +0200
Message-Id: <20210904100837.1785198-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904100837.1785198-1-romain.naour@gmail.com>
References: <20210904100837.1785198-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC 2/2] support/testing: test_ubi: reduce the
 rootfs.ubi size to 64M to match the Qemu emulated flash device
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The size of the cfi flash device emulated by Qemu is 64M not 128M [1].
Since Qemu >= 4.0, the size of the device must match the size of the block backend [2].

Fixes:

  qemu-system-arm: device requires 67108864 bytes, block backend provides 134217728 bytes

[1] https://git.qemu.org/?p=qemu.git;a=blob;f=hw/arm/vexpress.c;h=58481c07629aedb09864dcc72757ff7947e733bb;hb=f9baca549e44791be0dd98de15add3d8452a8af0#l50
[2] https://git.qemu.org/?p=qemu.git;a=commitdiff;h=06f1521795207359a395996c253c306f4ab7586e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/fs/test_ubi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 9cacf3b4b7..92cd5cfd3b 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -25,7 +25,7 @@ class TestUbi(infra.basetest.BRTest):
         out = out.splitlines()
         self.assertIn("UBI image, version 1", out[0])
 
-        subprocess.call(["truncate", "-s 128M", img])
+        subprocess.call(["truncate", "-s 64M", img])
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
