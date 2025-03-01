Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D5FC282C6
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8323960017;
	Sat,  1 Mar 2025 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gP-ty-oS1O0Z; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BB93607CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB93607CD;
	Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 73911181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 570E140177
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKkG14HOAy5A for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34D3E40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D3E40104
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34D3E40104
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so29174935e9.3
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841545; x=1741446345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cCGA/MBEJuPF8THUIpnmbuUT27T5TfurEiykUM2BDSo=;
 b=F59yYlEkziV8Xvwnf+ORldfFrQ78o1IQ7oOsFB7msurXIKllzLQxTTccbdeAHkcfwI
 VOBQungWNMlzsFonbzZpzPvoxVwzpkHZeru0NcHdK1ktw2yRZNm0iCQrpFUAmACifmPl
 yBt5yGRB3roBwABTeubl1v+vqbI4zGokuzWdzI/Stp/14FUOXi2Mj845UJiEUhj2yfHM
 0lyt85pCUvmZKuqjP53qY/0P9cenGupl5RIu396n2GA8b5E6KPnWz8iYEtzk8Xnw6U+Y
 MZdVeBkAy4pObRrxtTE6UOx/tzj2KQtDWkaXapATmztVGw0XGfgLfjUSB75AdVpo/id9
 muFA==
X-Gm-Message-State: AOJu0YxYc6da03rY44iwCER5Gch0NpvU0azeQEpv4bXqK9OqeZTtBxR2
 eC7mvr4E9n4MKYlLp5fneVe6/VIlNUxs3II2O4rOLm9iEhsInw0eY/dTEA==
X-Gm-Gg: ASbGncsVTfafQNQzoxykMMGnD2e9SA9wjngyGExQisp34giZZqEmz0XbXym7RT0mP/s
 U1wOvsjuCuPs8D6Mo9kGyNP/Nmy5UHCenCajlK1ad/pYIJcwkvpml3agjgVeWjVw/eUg6wpX4tY
 M4Qeo8tCSyzE7GC/daRQl2RPd0BtW9iSfHRHqLACegbPGKMRcekOAIe+PIDrqbIKb04Ex0KTp4L
 GQPL31lDeiUHSR7dwGnwSQ8yvAI/FC4oNRAYdpXgGJQFV8cZ28F01JpHFrDDfONZB+2N4kcaPHb
 iLU+xPSeuQ7BSe0FyM+nPVKA57ZZ4iu9eW+fan5cbEY23YkpuZepi58=
X-Google-Smtp-Source: AGHT+IEMFHu09/63cSDX/7hZnjdEMqKF3uFQCaYijQRNM9hbViBin1HPMrfoJKx6Cha1U9g4TKJAuQ==
X-Received: by 2002:a05:600c:4f89:b0:439:88bb:d013 with SMTP id
 5b1f17b1804b1-43ba66f96b4mr63550095e9.7.1740841544923; 
 Sat, 01 Mar 2025 07:05:44 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Mar 2025 16:05:36 +0100
Message-ID: <745bdcacbdff342d7e37dd1003a03923dc03b935.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841545; x=1741446345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCGA/MBEJuPF8THUIpnmbuUT27T5TfurEiykUM2BDSo=;
 b=YyFpDXbEDbPx3BYfsPYbgLtjNQMX6k8/a/S6rYUItXFCMApycCHJk7cMIebzMIpmLQ
 /K/84GH1qTZHy2lES26l9XwVMnwKXA4+nNxDsl8rmZSPIdLwY/nyGvnw+wGC5PaV9ES4
 qPQHMwJxunOudyR9xAqtpzDz0Fecwl+sRQT9Z14ZfjOVYqlhjeor5LgTPyTfQCZyTk4X
 XqWecoSmXE7nxeRZ/lR54x4tBoTM4NSFUraWLk6xrhmhyJIlL71IYuOS9zmaP8czuP6K
 j6Tkb1xcXbhD/J8qZsAcEUD1PsxEQoJS/0s9cA72XKNuuM9i0ijt/MYUkM78vXyBwtPF
 kqvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YyFpDXbE
Subject: [Buildroot] [PATCH 1/9 v3] support/testing: set date in emulated
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
