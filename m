Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F81C25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4B78120C;
	Wed, 22 May 2024 07:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJk-Qc72zMZf; Wed, 22 May 2024 07:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A62C81323
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A62C81323;
	Wed, 22 May 2024 07:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB3801C5869
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8CC140181
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9xnY8QwwN6k for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A555D40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A555D40347
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A555D40347
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-574b3d6c0f3so10569082a12.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361390; x=1716966190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YtlGqCkSErYYPEtJoO6dOo1np4fXZEwijJdOwwF6QEY=;
 b=kP0GzzDKsdUaGioa9LOM/hyTHetNdpHABvU0PFe4HOfjEE+YqDnxYUnI5ufSniS9ym
 uSag2oUbKUeh3MFhyUJYFDa/eBnJUAErkbHeMUvipa58xtSPTQD/eX6mAN0Ad6Janu+x
 Nwtg0boeGDtt9eaR4lI99wPbd99LJRudTlIkcvx1Hz/ZOFGK5r9WY5f7hrjaqLu96TZV
 W1AsvRGrBslsXDzmNvcSixa62jIrZYMkPwLBMUnQtYBLpnz0XR0COiZvJIFfYGun72AS
 3aut9u1HcqWaAY/KT2dJepNrGqySzqyUtE3UMAhQ9dVV+oXZCM35X9phAcyXQtg1MMqP
 A6JQ==
X-Gm-Message-State: AOJu0Yz2uhKP5P1ssewmcwUzZ8u/1/A4NxylO8xE0itFCRV7l5PcSmkS
 uWH+yV9fExOlQt42RwceVjUbP8z90csRfrhBEWMdo0+28Ub0h4tc64Mtt838Eyu+uLbFBr0RctD
 dUUE=
X-Google-Smtp-Source: AGHT+IGRl2dU3Y7L6hXHbIeHBIFcSVGMApIz+HnAftK/w41GZe0uHB57BHrqTlCM6CuC1MptoGxQJw==
X-Received: by 2002:a50:c310:0:b0:572:7b08:d49d with SMTP id
 4fb4d7f45d1cf-57832c5890amr526072a12.41.1716361389854; 
 Wed, 22 May 2024 00:03:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:34 +0200
Message-ID: <20240522070238.3282121-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361390; x=1716966190;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtlGqCkSErYYPEtJoO6dOo1np4fXZEwijJdOwwF6QEY=;
 b=gso7iiHtPG0NdTjTD2882z1joGULAXJJZ6x5eOBgh86/Hl3/4+frgJw5TJBL5f6Zxf
 8fyEHU3zSL/2/0mlczdPq8uujlhB3Hcx7MdhJK5ZgC8NDWigZxc0gWlrMAbgtkXY8I3g
 c0ZdGuWzmdWjGY7WOXfyPsnbHqu8DiDzoKIFQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gso7iiHt
Subject: [Buildroot] [PATCH v2 15/18] package/qemu: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
index b7e41d6f232c..f9e523a62786 100644
--- a/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
+++ b/package/qemu/0001-tests-fp-meson-don-t-build-fp-bench-test-if-fenv.h-i.patch
@@ -1,4 +1,4 @@
-From b4a692f46135af1011bf0adbfeb19abf354ca191 Mon Sep 17 00:00:00 2001
+From d6fea3c321c7eb18e6dd151f5d4b0cc46b77bcc0 Mon Sep 17 00:00:00 2001
 From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Date: Tue, 30 Apr 2024 09:40:55 +0200
 Subject: [PATCH] tests/fp/meson: don't build fp-bench test if fenv.h is
@@ -14,18 +14,19 @@ find at the following link.
 Link: https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg00492.html
 Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Dario: make the patch to be applied with fuzz factor 0]
 Upstream: https://patchwork.ozlabs.org/project/qemu-devel/patch/20240430164752.645521-1-dario.binacchi@amarulasolutions.com/
 ---
  tests/fp/meson.build | 14 ++++++++------
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/tests/fp/meson.build b/tests/fp/meson.build
-index cbc17392d678..cd052667e940 100644
+index 114b4b483ea7..0e1237be54ed 100644
 --- a/tests/fp/meson.build
 +++ b/tests/fp/meson.build
 @@ -126,12 +126,14 @@ test('fp-test-mulAdd', fptest,
             ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
-      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
+      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 180)
  
 -executable(
 -  'fp-bench',
@@ -45,5 +46,5 @@ index cbc17392d678..cd052667e940 100644
  fptestlog2 = executable(
    'fp-test-log2',
 -- 
-2.43.0
+2.34.1
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
