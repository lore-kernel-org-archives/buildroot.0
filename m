Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496CFC28B30
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F372E83B10;
	Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQlkQspNGBJV; Sat, 15 Mar 2025 19:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F336183B2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F336183B2B;
	Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B118C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FC20607B8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m27tSQeXdh4 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76EF0607BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EF0607BE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76EF0607BE
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so5974385e9.2
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068633; x=1742673433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eArgoGYc+k25UfZAFVe8aZVUze37bxpFAbuvDy6tv7Y=;
 b=JLf+xAVPeeIcxrH6zE3cX+jabvG1dzF2lpmrE4EVuIIh5+1530S9pM0tUbjz10OlNH
 Sxj5AQmbf6+ZzYCZIfmUMgVm+R+4bN+bQxCfQSaJh88PFnJcL7ZxBT5YrYKONIO2Fc88
 jGJxKERVBHDQXdzm1D9pX5YfJT4VXGZqWAVZbbOSma1t4IChkxsmI/9nBsSJ0n+HOp66
 AByoyX4Xt9+G39ubQSQezHrNck1VzKcjw25hvg1/71UyEbfkUyZdTiEw3X7UPrC8fN73
 SCfBBMIv5jHnFC9Hun5vn2cvS1NvfSGlIp0y1uLekkf5o5cZ6nd54G1N03rML3mvaqcH
 Enag==
X-Gm-Message-State: AOJu0YxV5eQrlBHTvoOeuySCxkNMvlRjdfchZWQvqmrLh1eNHTK3PB9n
 SbAQlMOhM3f8fabujEkF6BJ2mG9izOEq5J0LWGuaxl35JJG34muBzRFziA==
X-Gm-Gg: ASbGnctfMo7v8piO4gZkLKHfnNj0VrjJ4ygeNku82xMx+H9xr8GpYoqe6mRCo6XDRV9
 OITEaL9b/CN0uUg0DfqNLxBaHpuFeEyuE4faq5/ivtxM6nEsZ+8g17UNiHDVAWO5NIrUKSgwl2O
 GwnyGU5d9NqsgoJvC9Yos2DAlOeMfCeErLaobhZFV3kWaOVhKdjgrX4VLO7akkTEBf8H2zPjtZs
 8ZQYTAwoJlqH2XGiEDvfzkQhVYBvHbNedBaS9hliCXRQphoJ+u7yZ4gmG8sC2ooCezpniBR3b5y
 u3ocEpgeFx4J7zC3qiWBaGdh6GmvwBenVYT8L7D0BGa2nKRyZLD1ZgE=
X-Google-Smtp-Source: AGHT+IEd6BmhRf6KMS4oASi+QUapU8ebesyrC1Mz3Ui75BpdCLT77f81fI+jsEA/r5L6Hq8JgSpPrA==
X-Received: by 2002:a05:600c:314b:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-43d1ecd894fmr92718585e9.30.1742068633069; 
 Sat, 15 Mar 2025 12:57:13 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:12 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Mar 2025 20:56:59 +0100
Message-ID: <d16d5f276345efd9a9abf3d177da8bd7341bd5e6.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068633; x=1742673433; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eArgoGYc+k25UfZAFVe8aZVUze37bxpFAbuvDy6tv7Y=;
 b=JJftxxUwrdcodnBlnysLkIWroYZhGpELi4oLISmJiZtVQtQlHpUr881MEXkYVCw8Hc
 UFTea/E35ZA/VNB70OmUFjghgHHrBw0QV0+neMrpafDY7fMDAWnLrxQJbGHn3B5t/f3l
 ZjG0aScxXGHUFstW0Tetl69PCAtlLE3DjNHOQ0zEbEn056Ol4+isLiCg4s+s73db4Uqt
 v9Uuh+GApVeYrMYyHHRVh624kI5En4yU05XFiY8CAHB21NTV9ZAoWeJzupYmxCa8BfUN
 MKs9tbc5pkgxlRyRWRuPXiL7/+SUOxb1m+VhlUzCnHdwewMNNaOuLfQ/lOU0QmCc5glW
 xlYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JJftxxUw
Subject: [Buildroot] [PATCH 01/14 v4] support/testing: set date in emulated
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

Some Qemu machines have an RTC (e.g. arm vexpress-a9 has a pl031), and
the kernel needs a driver for those RTC. It is not guaranteed that the
machine used for a test meets those two conditions; in such a case, the
time in the machine starts way back in the past (1970-01-01T00:00:00Z on
sysv, or the release date of systemd). This is the case with the default
kernel, so such tests do not have the proper time.

Set the date to the date of the host system. This is going to be accurate
to the second, which is, by far, enough for our purpose.

To avoid having to consider what combination of emulated machine and kernel
configuration are being used, we always set the date, as this is a
generic step that should be done by the infra (like login in as root is).

The Emulator() class doesn't inherit from unittest.TestCase, so we can't
call any of the usual self.assertXXX() methods; instead, we just raise
a standard exception, like is done a few lines above to detect the login
prompt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2:
  - catch failure to set the date

Changes v3 -> v4:
  - extend the rationale in the commit log  (Julien)
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
