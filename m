Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563A3CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 09:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98708470F;
	Sun,  7 Sep 2025 09:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLeTAEGgXnFK; Sun,  7 Sep 2025 09:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0343B84710
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0343B84710;
	Sun,  7 Sep 2025 09:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 015BF273
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E607B4021F
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CTGYdQvK4gY for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 09:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C639540C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C639540C60
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C639540C60
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 09:57:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so9109485e9.1
 for <buildroot@buildroot.org>; Sun, 07 Sep 2025 02:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757239040; x=1757843840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqTWw7ovFgGl+m0o3EqPNMvUYdH7K7taC042z19ZmBk=;
 b=NT34O2ldOgZpYURQ6H6tylvl+TyCkVU52xzrbLSemkj8TziyxbpsAYqhZxik0kXbXw
 Y3UFk9iCtcNQL+5q+aYKHgbUHR+Vf1LwQ7LNZZ9x9+wb7r880Pr4HiFXU7lUL173hMRE
 Cy7GwiAbfKG7MeC0QLq3NSZAS50n2LUPaKAC0RNsAA4x0dsS7BByuf6IuDlI7wtyaH1q
 4NzNr7nZyy0fdvuqT670XRPePqdXDhL7zp29ePVlKCe1cc0KNp2dmvCIKSnjISeJIAkV
 u84T5oygzC4DH8jxktcpND6lBNVD/qACCeLxs+ItUeH3MwIIvQFgIbp4yodWBR5nY3R7
 Vw0w==
X-Gm-Message-State: AOJu0Yw+hbUU5lN5t2UP9rNhWcakrH8Eh0FkSmLFCo1rPtCPWjZLO8/l
 l5pLFhGWlhukCI5nEeuoHNVMm1CueO5JsE3aFIIc6tQcx3mHYu8soPdxH0K2S6G3htxX/jwM5Hl
 uJBSZSA8Uog==
X-Gm-Gg: ASbGncv8M6ixn4ALuYDK/TLHlPuoml+u/MOm2CIaSuCREDuvvKNA7xWkMIhglYJ9D1w
 BZDSBoY9HPmUbCxS5ZBMUKnUHRzYzirNvOo5B31Vh4WfiCiv0fRxWXAGdK+fN/jAfdgKCuT8KR5
 OvPoCcDt5Uwpc08s+MJu4kUIreNTfA08Re5fpr9ljpCvgm/VR178tBdllPrM9eBhvgWv7aCHA54
 NAqytAD5WiQ2Md/v16sA9yGqTem/AkRSOdp9wOFhbvSwi2uVHUUsM8rusmtlp8HRiIzYDCxgzkf
 DUrb7K9r+ffpYxC2H2Mw+vzdpDKOYE0psdRz3+2uMbt02Mhgm60srqS9MYXqBe9R7tLX9gE1/gu
 +s7AZkw1ncj419m0qccSaZHTllSLfpRG3oaXqO+3TKh6zcAiT5nSI1JVA748mYXpGLnIG7HEoVr
 6k826D9azTqnDaXsOn5Nib
X-Google-Smtp-Source: AGHT+IEvKMXxTLBVycI+e2jKAYekt8ZFKVefOody7jd433D0IyHPmo3dCV0pEo8uPoR4xXvyqEIWTg==
X-Received: by 2002:a05:600c:8a0c:10b0:45c:b574:b264 with SMTP id
 5b1f17b1804b1-45de0060ba6mr24390095e9.0.1757239040473; 
 Sun, 07 Sep 2025 02:57:20 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dcfcacd2csm70835105e9.1.2025.09.07.02.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 02:57:20 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Sep 2025 11:57:17 +0200
Message-ID: <20250907095717.2202752-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757239040; x=1757843840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kqTWw7ovFgGl+m0o3EqPNMvUYdH7K7taC042z19ZmBk=;
 b=pHAE9rc3pUYnoTlFafIldrvd3LXqtBSzoR9ApNRzIZ6tPDt3aF9d1GuyB8CiCidvvi
 KhWFdm+hyPOK0EQcf62gH14ZrHNbGO/wuXpLs5XXmfWB5rBuyZecs5tJaPsoitaX6ZM2
 azfnkUf70fsRoDHRfTmZk9QqKvBZTbN/KCIjI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=pHAE9rc3
Subject: [Buildroot] [PATCH] package/micropython: fix segfault at exit()
 with gcc >= 14
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

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestMicroPython segfault when testing if micropython can return a
non-zero exit code.

   micropython -c "import sys ; sys.exit(123)"

This issue is related to the gcc version used to build micropython
(gcc 14 or newer). Using gcc 13 (like Bootlin toolchain 2024.05-1
previously used) micropython run without issue.

The issue has been reported upstream [2] and fixed in newer micropython
releases [3]. For now, apply a temporary workaround (suggested in the
bug report) using -DMICROPY_NLR_SETJMP=1 only for gcc 14 or newer.
MICROPY_NLR_SETJMP avoid the architecture specific implementation of
nlr_push.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774762 (TestMicroPython)

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://github.com/micropython/micropython/issues/14115
[3] https://github.com/micropython/micropython/commit/35f3f0a87db2580041dd0f7dfd4361df48887796

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/micropython/micropython.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 949abe3b0b..32b361db16 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -29,6 +29,13 @@ ifeq ($(BR2_xtensa),y)
 MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
 endif
 
+# https://github.com/micropython/micropython/issues/14115
+# Temporary fix for GCC 14 compatibility, should be removed after updating to
+# 1.23.0 or later.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
+MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
+endif
+
 # When building from a tarball we don't have some of the dependencies that are in
 # the git repository as submodules
 MICROPYTHON_MAKE_OPTS += \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
