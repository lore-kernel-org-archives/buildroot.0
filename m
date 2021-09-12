Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99674C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C1661050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58C1661050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7826075B;
	Sun, 12 Sep 2021 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jv50nhHGJz61; Sun, 12 Sep 2021 14:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E86C605FF;
	Sun, 12 Sep 2021 14:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE9DD1BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE12D4014E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXnsAvS91k3c for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE8624013A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g16so10437195wrb.3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbrMuwyooZ5bh7+x/0ZA0hsDVq+84YD9v62/JspZElA=;
 b=kxgrHQH0rArxnDPCt5JYH0T4wElyO1wmgk0bS878t4AXSUunDyL7gLni/8kYlPwDoD
 4vwgDzqMixWR3RZYQwq+Yut/7KatBIhZrGjwTpk7rjBszqGrf2VYnfRFOljX9Yrr9nF4
 JHolwZoeAq1ecCx20TcuAb3h2Y8igHDPsH7xltGv2YXpEKpRPnJQUzYD0PvqIUmKzWXc
 lTKS80Ct9sJ6zojdhEv+nvrrYZiFFCFUe4DB696r0w3uTo72WW6XI7Yt2u5HXXPkBDgE
 jj++QDTN1A3vqmfTrAygu7JqBpM9eKfgeHeSIv7XePJadqNlOLh8bQupP0eA8ZfSUowB
 PK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbrMuwyooZ5bh7+x/0ZA0hsDVq+84YD9v62/JspZElA=;
 b=q5GVHmOD4K+hjj9XngAIlDi9uPEMApOEu8jz29UgxMAbEaxzQRSv/z2/7tqqiDnqku
 6OL/uinOKnPW+yurOroIQbzWurWpMNS+fspJ4W+b/EYI1XKbXSviEY6tCetnWjS/UfQZ
 wgMgSEAhZnmvUJ2Yt2XuTDcMrGK16oaqoemEAmq7lLsCC7Oyy+Z2sl3uEK7//5zimpN2
 Rt2+dwE3c0FJ6BSmNbu3NJuhlcY/2yV3DqBtzyfqG+MOPoCG+eK414sMQjNZOn9lbyKo
 CZxMGJnLeCs+vpFClhwyUTfW5GEJnzRJhxXsfOTX3m53BH3+mO67+IjQqOYYpL0Kmhnt
 eVWg==
X-Gm-Message-State: AOAM532MlRTPbnhuiJohD+rHkitiCqKhH9THVWlgY0obzfK6SE2TDjc/
 mRIkezUACqyEtHKm5CTKmiZnXzJKWS0=
X-Google-Smtp-Source: ABdhPJwm/WZbsPAFxxXO+TSf+j3OAN1jAWHMlOyISbrgquxK8WOK1LR4d7hzZw++A0GFudJ5wssxdQ==
X-Received: by 2002:adf:90cc:: with SMTP id i70mr7699451wri.408.1631455915142; 
 Sun, 12 Sep 2021 07:11:55 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:54 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:37 +0200
Message-Id: <20210912141140.253778-11-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/16] support/testing: test_ubi: reduce the
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
index 7321f83da9..8148e5f336 100644
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
