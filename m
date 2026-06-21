Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8069CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 16:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC726FD8F;
	Sun, 21 Jun 2026 16:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8bAXVnWiEZC; Sun, 21 Jun 2026 16:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40506F516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782060823;
	bh=ss4Pm+/USpIp+0NsSmy9l2X9cjaqxtnn6mFv3UAALJY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZsZ1Nk8Vfo6mbgfhcWJYYM3q/0JnXI4Q8HQW1sZgzYsSqXNmfe4WQKaMs0O48KAK6
	 J3WMmUDwbgRIJSP1n75D9jsfS9kIQbLvWrDHXT4GCvCnEHWTxcSB/VvVgtG4P57pzB
	 7fxQO8Ornvw5wgEB0sDmvUqFga1p8c/Ul2Wc5Vk2XuZibi7lbcdu85dxfM47BvouPP
	 E81XgPktf/YdBj/SJiyEEAlgg8iGpzaZ3EnCTuU2SjkEATr5N8f7HLrJCnyGjYavTs
	 1+/Qx4RIqKjKi2v3gbPtu4zKFym5rQfqjjFDElcnnWdnYawc1TeEZ9DP5Da3AsZ30U
	 9VJYTCENHyFyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40506F516;
	Sun, 21 Jun 2026 16:53:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81CD724D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A1C86649
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6kWILCwPKvR for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 16:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C2F786646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2F786646
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C2F786646
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:53:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4921e4dd62dso26937625e9.0
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 09:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782060819; x=1782665619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VtH38AG4yv4MwkCLI6JNNNi3k8NjAErmKxgVXRTn1k8=;
 b=W10qXfZJadJBF91fH2zm+F2EyeARy/V2HLbmuhisRfGHUYF+CnibjRPdDwc0I8t7bH
 m7SlVxcSgvyGorrcvPfm/aTGtmQpuAd35SAvB/RfOaL71xSHH0ruxzafpIp17M5GY2gE
 q398Rs0p1YD8fh9Re+ZQ+3P6Ebimz86MoKtpyiFQAhDfPENj1sLG+JCVmlOL5BaIGX0I
 9996SGC6CdD3KDBb/y7MprpepQP/HCdqUB9lgkbZb6fya7NAu7Bt/LgQtYxRxOqKw+Hx
 zTKBRYK/yZQkC/xJ5G2wqikxGhn2SHPV3Afyx9qsZuF3GBCwIcisKswDZnf7SSbxtkiH
 2teA==
X-Gm-Message-State: AOJu0YxL5hz1jmD8dYZcOi8Fx2ZcuqR+yi8TlkIqpsvVw3XmU5zMPrb+
 fMOGtA8MeqGOvxv9G7l3EZJWTnQ/DnkOilZdoe0plZrjyA4zldhUFDQcv9OfEiw6Q+MnwvoIMv9
 GcN9w
X-Gm-Gg: AfdE7cluO4BEWCg2uLl8MqPOFIV1xWrNz2UKc+WqP8cc5dFfIzwMM6LZu1M5P9a4dzJ
 ODdavQYafR/rJFJR+bbZNUFXUgLTthzAtK43d9s83M/Hh/6iWYIKqrYbLLIKF/scIw+BGkm6PUv
 Qct4l+aBsmPC8oSDskP0n3YAWUu+KAEs/i3oudB53xDuLRcPEycm0gndkBf0y9uuXxTPcCIyWlN
 2ug83EtHOohhJUtpqkeP9MsxEDBV4bH5zagle3NTaOEpOQ2IfrhLmkLwUoLZmyAp/EvrICtVwWU
 RxnrTmTqFPVOE1TO+LyxnO+GrhqUbcAXh2MxotJDKYhDo++sv6VPFiUELiglafesDMixPrqHPtJ
 SPeWX5MbbbSFdcysDJeG6Eqtzqt937hAQnHMDOIHSlaFlbFv2+/zfmcaA0kTEJnk/OfTij3/vJ+
 L8dh4kFsG01c28rtT/tdIp65huOhnFCuQp0zGeXZJ6msFyv0aDwVlHAt7qN0C56I+7h1RTneu/9
 GhIZMIBL9gtRdMy+lelQTlQyg==
X-Received: by 2002:a05:600c:63d6:b0:490:ae36:4835 with SMTP id
 5b1f17b1804b1-49240a5e099mr119802355e9.17.1782060819433; 
 Sun, 21 Jun 2026 09:53:39 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e3esm17656798f8f.8.2026.06.21.09.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 09:53:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 21 Jun 2026 18:53:36 +0200
Message-ID: <20260621165336.2426158-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782060819; x=1782665619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VtH38AG4yv4MwkCLI6JNNNi3k8NjAErmKxgVXRTn1k8=;
 b=FYNqdpRxWyfBh8zkBC6LXld1uFbGmT0TMW8qklM/cKD19idGmnAPI4vVaaWFVmQsmM
 vtQDjYOC3veuBXiepC3OLc1FrQ7PA9+fvPNUIdP5J/uMvTZMM15HRya5Oop8yucVj/4b
 NA+XFvY3PvocvrItGf1jp9ciKCYYBTUHTcP5o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=FYNqdpRx
Subject: [Buildroot] [PATCH] support/testing: TestUsbIp: wait for the
 keyboard be detected
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

Running TestUsbIp may fail when checking if two QEMU USB Keyboards are
reported by lsusb. On fast host, the second QEMU USB keyboard may not
aleady detected when lsusb is executed. So wait a bit, to let the new
keyboard be detected.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_usbip.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index 2fae8f7f6a..62c7b59814 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 import infra.basetest
 
@@ -91,6 +92,9 @@ class TestUsbIp(infra.basetest.BRTest):
         # keyboard.
         self.assertRunOk("usbip attach --remote=127.0.0.1 --busid=1-1")
 
+        # Wait a bit, to let the new keyboard be detected.
+        time.sleep(1)
+
         # We check "lsusb" now sees exactly two QEMU USB Keyboards
         # (the original one, and a second one created by usbip).
         out, ret = self.emulator.run("lsusb")
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
