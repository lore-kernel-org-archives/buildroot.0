Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455A2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1CF3418EB;
	Sat, 23 Jul 2022 13:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1CF3418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vquxLFNKWVSl; Sat, 23 Jul 2022 13:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76FF4173E;
	Sat, 23 Jul 2022 13:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A76FF4173E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17BF71BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3DC3416F6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DC3416F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0YYCVzGUs1O for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:04:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E370D416FD
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E370D416FD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:04:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g2so1798658wru.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Id03wUEquZVLr1JJZ54Rs5lwaxTUhu9STm0YXieL9PM=;
 b=nvfcv5oIm9lhbZx2j0oy1NGxD77LhaQOceFapulxNrcP/BeMBKpjZp+GY7tV3cxz22
 RhFfGqc7sPNkO34Gcrqwbzdrc7qKh3cODbddYvOQbYpnngvR2WbNkO8lOyo8J6znNCa9
 XG1MgcXjfpMxyr3UK3knR54xhnutYa2HFPXetFxmy7CO5mEG8RbDpozSl2QniYgqvVO1
 IEp5uTlypUSZVnle2T/xB8xPyTqq7L8gTn3ydkq5Vc4ZejHcnaidIAy0XdMu4Ppl279q
 sJbGptzP785BEcg5MpLtTSA4Uy/PRzMLWFUoheujtQIhzZ4K/C2fBJ5B3FUHA8lK3B4z
 Gc9A==
X-Gm-Message-State: AJIora/DtcqmPRMqvphG1jv/weEvVcaE54mAI5IzivX5Cu44lHPkN4dn
 Ru4RXFlpOtwvnslq1xONMKTJs63FgrE=
X-Google-Smtp-Source: AGRyM1tWr/P0VEv8KJd5biYDKBsQFwq0AMT5tk0BTC/SlqrUAEpKD5hyQUMOOstHN+A9Zw6GTnd2gg==
X-Received: by 2002:adf:f90c:0:b0:21e:5293:4390 with SMTP id
 b12-20020adff90c000000b0021e52934390mr2730538wrr.167.1658581482059; 
 Sat, 23 Jul 2022 06:04:42 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d550c000000b0021e4fd8e10bsm512075wrv.11.2022.07.23.06.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:04:41 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:04:39 +0200
Message-Id: <63cce688a1678382e065dcd1905b7ed6a48d7ce5.1658581474.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658581474.git.yann.morin.1998@free.fr>
References: <cover.1658581474.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Id03wUEquZVLr1JJZ54Rs5lwaxTUhu9STm0YXieL9PM=;
 b=iz+9oZSLCqzJnyHM6tH8WyHiildJi0dFeHkOOTjLjHhVxh78RNeH1RAdQRmE4CiXQH
 uYN+YzK6CjMp9UfSr+OuEV6GfQM0TjoE5JWXJl+vy38s54aEnQbOd6lr7vNNX4X9oXYf
 U8ntfykLCVBfg4goNsDyrvHDdnldGAHn/ZUIt+aFYgXL6dbeSwNz78Ukq3EZB8huxL2K
 gm9PgTRtV7tiOIerrTjwe5SM7/G3YyNL+yCFwX7dWo00G73VNJzUbWRBgMf5b/LM12VV
 KhmzA3Q5YqIlHGz7JIAp6HBADuZJQkv086+4H2flCW7NzK9tgrvIyqQTkJYK7RXjCumc
 55pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iz+9oZSL
Subject: [Buildroot] [PATCH 1/3] support/testing: drop legacy python2 code
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we only have python3, we will never have to test a
python2-based build, so we can drop python2 compatibility
cruft.

In python3, print already is a function, we don't need to
import it from the future.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index f29aff6624..c4f5d66d59 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -27,7 +27,7 @@ class TestPythonBase(infra.basetest.BRTest):
         self.assertRunOk(cmd, timeout)
 
     def libc_time_test(self, timeout=-1):
-        cmd = self.interpreter + " -c 'from __future__ import print_function;"
+        cmd = self.interpreter + " -c '"
         cmd += "import ctypes;"
         cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
         cmd += "print(libc.time(None))'"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
