Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF9C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC7E81EE9;
	Tue,  6 Feb 2024 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhBvWx0uXdcE; Tue,  6 Feb 2024 12:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5B0C81FBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B0C81FBF;
	Tue,  6 Feb 2024 12:50:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC39D1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A382141F46
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A382141F46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pU3GEC6dO_ci for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:50:02 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78DB541E8C
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DB541E8C
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3610827f8f.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707223800; x=1707828600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4pn70R7kjFhFeHz867GVfJq35mpyZwUrp6ACKcON84=;
 b=cTrK3fvSZ7e04v/DbFyJRN5hB0Y7SUi8dgKewrCj9EaMqYpNzP88ngjynEASclEWZC
 14CDJPqoj0yC07VXiXBh3N3H71lJRW1dtyLHvAxhSxkhj7AHT850CSNfCHmyVAKlWfko
 qCz3xCeKl47YZ5tHb9hRJy1zHLjMALpOYJHzKSigUrFZwidqiEM5KFz92eTFlvZYLvwp
 lFxmm6tlYss3j+c5vvNBX+VtsuEQF1kUqjev1iJbVaYjwayoh0RLpC5fygXF78FP3W1O
 htsenPlfP4m2elZ0UwGUWJXRqQdQrF5GEjcEcHCLNqsBzd+0TvkQvj6a0PG2I7IkCeOZ
 Fwnw==
X-Gm-Message-State: AOJu0YzgrE6nh65ZxR22MxCQKY7jvIBGj83vMxS5TDQ9NE0PCuw/M6P0
 eFzl9exsyE6V9keko3zh6O892ytJtKTg2ba78Dg75yZzO7vdZawfya5xrPnDUEKzXcUZ1gI1vXR
 lplg=
X-Google-Smtp-Source: AGHT+IHUA+icOhmeEvpa4Xk0Qn1bxRJJuX6u2lKEBlhEpzoZnzLlF4/6sdJQjZEh83RzeyittoLbUw==
X-Received: by 2002:adf:f803:0:b0:33a:e950:58fb with SMTP id
 s3-20020adff803000000b0033ae95058fbmr1285153wrp.57.1707223800562; 
 Tue, 06 Feb 2024 04:50:00 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b0040fde0ec31esm1887265wmn.31.2024.02.06.04.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 04:50:00 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 13:49:47 +0100
Message-ID: <20240206124947.1617078-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206124947.1617078-1-romain.naour@smile.fr>
References: <20240206124947.1617078-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707223800; x=1707828600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4pn70R7kjFhFeHz867GVfJq35mpyZwUrp6ACKcON84=;
 b=poZ9Mp5vvQUR/oeqbfNvLKc0RNMsq7cpnwbFtN2qad4xe7mHe0dJGV6VTDKJrYEM7v
 lTQoxvwqpzbO+j07GCuUXp3Z4VQzjAXHU49YP0mAIlle61YDjDzhzDHDGSw+7todL/Cc
 wTwtlGynYbSha3UsXEqdW5sPhpWGllaYOjeiM/7htSUnLeACK3O9vRgbO0hPgcZjhTYp
 ANEwflFMuMqlVa9xSVZKppf8qPx0MtFir5P1Pj/LS7hA61ejCRRR0+fnV8EK+s1zHCLb
 HWiKS61NbT7rYHvn+6lFOP2DoDTp0BWHMye+w1ZQ4Y58mo5xGxBtBF7+IZUnq6SV4HBq
 hNuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=poZ9Mp5v
Subject: [Buildroot] [PATCH 2/2] support/testing: use core2duo cpu emulation
 for TestGlxinfo
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestGlxinfo fail with a new runtime error:

  # glxinfo -B -display :0
  name of display: :0
  traps: glxinfo[84] trap invalid opcode ip:b73c7027 sp:bf8433c0 error:0 in swrast_dri.so[b6e4c000+64f000]
  Illegal instruction

The x86-core2 Bootlin toolchains are built for a core2 CPU [0],
this means that the Bootlin toolchains may use core2-specific
instructions.

The TestGlxinfo test is setup for BR2_x86_core2, so our
executables will also contain core2 instructions.

However, the default Qemu x86 is not guaranteed to emulate all the
instructions specific to core2, causing runtime issues as reported
above.

A similar issue has been fixed by adding Nehalem cpu emulation on
the qemu command line. See 4f565b5222 ("support/testing: use Nehalem
cpu emulation for TestGrubX8664EFI").

Set core2duo cpu emulation for TestGlxinfo on the qemu command line.

[0] https://gitlab.com/buildroot.org/toolchains-builder/-/blob/kubu/toolchain-builder-2023.08/configs/arch/x86-core2.config?ref_type=heads

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_glxinfo.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 6bedee5298..3ccbdca8d9 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -42,7 +42,8 @@ class TestGlxinfo(infra.basetest.BRTest):
         self.emulator.boot(arch="i386",
                            kernel=kern,
                            kernel_cmdline=["root=/dev/vda console=ttyS0"],
-                           options=["-M", "pc", "-m", "512", "-drive", "file={},if=virtio,format=raw".format(img)])
+                           options=["-M", "pc", "-cpu", "core2duo", "-m", "512",
+                                    "-drive", "file={},if=virtio,format=raw".format(img)])
         self.emulator.login()
 
     def test_run(self):
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
