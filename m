Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB0FC021B8
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 261C340BFE;
	Mon, 24 Feb 2025 21:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXTGd5Lyolze; Mon, 24 Feb 2025 21:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A1140BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A1140BEE;
	Mon, 24 Feb 2025 21:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4C194E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB7C60E2E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLrXRfEFo814 for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CC4C60E2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC4C60E2C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CC4C60E2C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4398738217aso42847435e9.3
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432143; x=1741036943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0FjAyyoLKpS9EwrjSFnbtkXk/U5NDNhmBvm7avGI+lk=;
 b=YcM9HfQVUaQCGC0pvoA6pGpWwl+Ui/HwrhwGjJNMde1EeWpZhgcvw0vWty2Cv3Nn02
 KVInaxpMVjtnk341tBnXEjHgwEzBXIrPduHvDe0M32IYdU8tCz/Rg9cvneD15G8MusEb
 LiDo85mY64SryVRArpnX5v/rka5MUlk0VVqPkIm/k/rpVEM3woZUtTlPzHaTAbEfKgpj
 yTMUU01tvXwhbe2RgPvSJz/W8wJonW827cAIjDVEdQJeid8sKP+eQWRPHh3LitAbP9IC
 rTW6HpwiRcAwEwQP5Erx59R5z2Fsc76JW58MPFdwC862k5Al5q6ejwjazzBXxLn/1Ztr
 GnyA==
X-Gm-Message-State: AOJu0YyKFltqO2P6kKV4cCY7qj+lhO67uHeuRX1yuABaKzIlY4IIvvd3
 /+6/bTOwHBXFBmq8PLfVFuaqnqq0pKF6pNpiiTom7y0bibEsdDqPdM09KQ==
X-Gm-Gg: ASbGnct3Rtr3SBGcFprJF5g2TS3To6ShE77DWOB3bol70matAqWzerXeXglgbMJXMig
 /IfXnhrVH+7wlQUUK/aGo5sul0F1pUeMFufxgfB6UvCzon4f16NPBiclhPUgJoR1cH3yuC4R7tU
 yWBJPQ2ouHlv8wVReaFzUP0ZGVjtkuepj+egn2x45sze5yroQSWOykI6Lo75zWQUpQbMSxO/HYu
 d0bYxktR+UyLWD5cSRHvj4YvG0fVlGppkNKA/ck8ad64NxkbWF8JZ5g962MCP/mGyiKm/4zygxb
 7fccn8TMhUwt3/XMArRpRXOz/nq9ah5hXudw
X-Google-Smtp-Source: AGHT+IETfApZHylVZH/SW2QEqXw/D64SpVaFiC3m5aKZ9M3dyou02NRreABKf9naYGfTsYsH4PS6SQ==
X-Received: by 2002:a05:600c:4451:b0:439:8e3d:fb58 with SMTP id
 5b1f17b1804b1-439ae1e6dcemr134683895e9.11.1740432142873; 
 Mon, 24 Feb 2025 13:22:22 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:22 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2025 22:22:14 +0100
Message-ID: <f8e1301454a3af4a89528af42bc62d54b23b532d.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432143; x=1741036943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FjAyyoLKpS9EwrjSFnbtkXk/U5NDNhmBvm7avGI+lk=;
 b=DQuF4G9ytEK5WCSh25BN3tcfqpudlxCapCjyKD/wytxqHB8igk1OeJF9s4divshBSB
 GBmVXje6mYqdSWrTx31xE2/ZgOQmueHkJ1E3NlflDp+r+UYY4Q8GBnSLAr0eDKFoQMPQ
 MAV/d6NO8LSRIkLEAlXV00rGHLZ8s5DHyHZZpDUGGC+X3uS1GBuCTKtDDHKynfPB6n4R
 /GQTtD1RUTSjaICydrV5BoIw0po5CJAeefrrppr4rLGrzGJY4grf4Ot5FL4bkEVTkbBU
 Ou9qn92WvmltOBrBwQjF+ShuGi52H2onXDhHYXNzIUlrlIEytIC5f+DFAUKNh8eQAB3U
 8jeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DQuF4G9y
Subject: [Buildroot] [PATCH 1/8 v2] support/testing: set date in emulated
 machine
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

When time comes to check certificates, the date and time in the emulated
machine should be close enough to the actual values, so that certificate
validity can be checked.

Set the date to the date of the system. This is going to be accurate to
the second, which is, by far, enough for our purpose.

The Emulator() class does inherit from unittest.TestCase, so we can't
call any of the usual self.assertXXX() methods; instead, we just raise
a standard exception, like is done a few lines above to detect the login
prompt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2:
  - catch failure to set the date
---
 support/testing/infra/emulator.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index ef5be2a19e..9be1143944 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -5,6 +5,7 @@ import os
 
 import pexpect
 import pexpect.replwrap
+import time
 
 import infra
 
@@ -152,6 +153,10 @@ class Emulator(object):
 
         self.connect_shell()
 
+        output, exit_code = self.run(f"date @{int(time.time())}")
+        if exit_code:
+            raise SystemError("Cannot set date in virtual machine")
+
     def connect_shell(self):
         extra_init_cmd = " && ".join([
             'export PAGER=cat',
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
