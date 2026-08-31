Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83774C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4710F60645;
	Mon, 31 Aug 2026 20:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysk4I8uKc-Y4; Mon, 31 Aug 2026 20:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788209832;
	bh=s8sdywftf+/VjZ6qJnxlh8RaPwyUPTbYvMjoNE4/Rh4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=h3cpEFvgUh1H3cZUBo50Ijxs0LHJyEFPidY6CF7WqGuaWnVe1gyKQouc4t64DVMs7
	 XF43rBXClZoM+v/BA8HuyZLpes6WTMGmPzYP4mNTPaGgFDM6UBQNvLnLha71PwR98g
	 QJ/Lhi2fYQtleHtAgwpZfvg1XuGwEQKna3YLIJw1ISTMGSINw3EuMMD723UatpuP0n
	 IQMO6LbI+NKr0C7E3tstHL6wlMTkluBCwIUfvWpVHWNqtR7hPoULtWMpXxtT2Jb86P
	 EZFloCfDCFCZjPQI92ecuN6MAkLMOwfpaUmjtNDNmmWicoZKrzaDXdPIMINvcCIH0a
	 7f0Xs9PBXBJgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12F0605C7;
	Mon, 31 Aug 2026 20:57:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3473265
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0BEE80AAA
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20YnGcTFf34v for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 20:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 904A880AA9
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so1506715e9.2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 13:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788209826; x=1788814626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3DVu1GspBI7cl3cAYh9YCgOvHiViFL9aJsQh3BRIn4c=;
 b=L65VTFVWLWD4IYQEt0Ok8qBhK5X9WWuvoaSSW8umcVmGvqxPCcACawD6wuLzK9c601
 0Dt8WtBQHgN/mBbOQFTZA1NYT4Z+Oj6lRf5j1sxs2jXxfqAG8FmFxkVfGKxPV7gNz5Oy
 wI8LeFGTglIPN6aP62fe8l3x5Bq8K0TVDFjaC9j+jamiQA0xAYsHrzuc52+eYZgOvaZw
 bbUrzrreD0PlwepCVTwJ7HEldENQag1okScg12rgPlK/NBZqqsym0rdEE8XIfyNuod4H
 3uHbQ0aOrXmxG9FIcyT/VYXRIbV+C/V9vYpcSblzhudx1C9pIoLgT5MKEOd0NUBZqqP0
 ThmA==
X-Gm-Message-State: AFuF++lx8WsCrR+GLGeSIgn2covrA0l1KLpu4hS7WsCvaA4bz+FO0dR/
 skvBZ506LOIRBt3yOAsM4Yf582qqKFAGpB7eGiMTaqUmIOsSQXJdheP3UdnBbUza0+MlR+P1T0q
 R5jwwrQs=
X-Gm-Gg: AR+sD13ldByVnQlveJrc+zWEfZHHx4YNAjdcmVmh8VJkyz/DVgW0uk84/vp2sErgl46
 6iNkCBRE+LOlwKYgcV22PctRayns95aqxpxcyKANMqoqJFL0ier82CSRQM7f3WVPjwckoAcSivF
 KXI4bJkhD4/kvysmH0OKC2yQUwuJS5DQE3/sbp5jxJM/Ii7tI5xm4IocBXyw15QYsItbQyENzf9
 2ptn4W6o6+REhmgO/Nt17jvNyJWkEYh9hwvmGGDsq+4bpdcXFKKDoE6BaUq/CfTvn1S0qtAaWp7
 jL/+4Tt2GLG78Lg79uK7By9tkeQrofhXHewSQNooFBt9/7U0vXKTQBHQ81KTvg2susiHIrdCNKV
 0GFjIpumNB6wknwiLfvDbea5pEE7aMWaeZWSX3PbOgQc/JZpoD30jOnVFWoiuXEp29ACoKkB3kT
 5+wydx0mF/zFccXNYW82vd8b+NDVKCQtbVZ5EJUm/18zTBlZXjol3ZEFqtblGg67ES5f2DYFWMF
 AJESlXgRiCcUNIbvE10sSjMPNxBGqjMyDaFLFvy80PR5/9r/Xchoc3on5GIDQc=
X-Received: by 2002:a05:600c:1f8f:b0:495:48d7:f178 with SMTP id
 5b1f17b1804b1-49b91c44ec6mr404248015e9.11.1788209825686; 
 Mon, 31 Aug 2026 13:57:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccd1e19desm274116265e9.1.2026.08.31.13.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 13:57:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 31 Aug 2026 22:57:02 +0200
Message-ID: <20260831205703.3909457-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] Revert "support/testing: TestMdnsd: improve
 test reliability"
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

The issue was reproduced in 2026.08-rc3 Gitlab-CI pipeline [1] despite
the fix applied.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555

This reverts commit b4b1de1f7f1865af25f5dc47beac06a37b929c4a.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 2637af7c12..214eea7dd9 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -1,5 +1,4 @@
 import os
-import time
 
 import infra.basetest
 
@@ -31,9 +30,6 @@ class TestMdnsd(infra.basetest.BRTest):
         # advertises the bundled _http._tcp service from /etc/mdns.d/.
         self.assertRunOk("pidof mdnsd")
 
-        # We wait for mdnsd to be ready...
-        time.sleep(1)
-
         # mdnsd only answers on multicast capable interfaces that are
         # up, so wait for eth0 to get its DHCP address before querying.
         cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
