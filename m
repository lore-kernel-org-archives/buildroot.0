Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC72DD0D16F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CED88220A;
	Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SM267XU-YPr; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC8582219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816026;
	bh=90ScsUu0oe5tzOwGL+QHvPQBDWt2Z9qYrLeYi0iSzdA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=K6QBlGEMZ7f4q+dDt7gE/ePZIkJ/rNUpfXvJZiqX3MuYfim1pU0PyC3Ta959sNkLW
	 T0oU6v6FE2hJviwVJMOBCwRXoEcaNNsmlPvV0YyIagPs8UrDcQp0HzBa+RzwSvdc6p
	 f73418PC8DKviRsQOoAhqExQIHhQ1Fpljm5qdMgFXrsiREXsPkDMxXYXFoAI/mcTIl
	 S9FD8P7/BEl812cZzjmxoGpF+wIS7wX4dzelZe/llrklxrPTymktCM+5I2zyFB49/2
	 mOPDr/YzmgNSSjP/Nhzv+E/VFy2yCibNlLXWE5nvFbfODtR/KiK0DE4ziphsIqygIc
	 TVMe1kRRHl/tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC8582219;
	Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B83E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95D8C8226E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMxCzdK5zgeW for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 886938220A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886938220A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 886938220A
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso6129345e9.1
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816020; x=1768420820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7/H24iuMZtYpNjf4m/jNiRIFtYRX2G+AsEdMg+2jGf4=;
 b=fTOfmRWBl+ScLyRU04QoB1PduVgg49d8ANG8v5Xl8RAB4jvx/KbDhLvTMXSezZDKjj
 WQ3oLkrDqOtBCAjFMgD77nVlmZpqF124mjK9uwrmDsqNmfF6oTVcc9dMCTUxnQRl29Px
 KckPPhrAETyFeGyDGdaDqLDBQ2HAEv5HHFDb2wC7CpJNAcD6+ydKPnCX5+W9s1u5d24Y
 9VeoXC2LrWrycGAbAqnCVRGaSdYoT9En1MYXjaRj5JmsJkOQmvLxqTeVVFDuoUlDol+m
 sQFL/V2lCXA4ujZ2Stm/kEKgPFKCtaymw7r/ct35R8A0HOPUx9Mkn9U1APQ2kmDxCd0R
 po4w==
X-Gm-Message-State: AOJu0Yx6pTXKwcVWHUWaFuxbDY6eQxDDBw1Cs68f70JMeya2hsuU3e0f
 1yxWeIQko6IflWWPbYk2c2/RXHi9fVQcppjCz/u8XFDRN9MIb78sQslXV6kWUFhfm3vwvQ/0Jo4
 qsoV1ZA==
X-Gm-Gg: AY/fxX4RlNTUcXd/GRuYxAefQV4FfHSbes+nBLBVovqWl/+TJi9vmo//VShMPsn5bPu
 J/PQpMDdqZ7O0koxd3diA4yf8Y7Kw8SaCLxRK6rqlJaMYhFLQvzXkNpoyQGUcBsNQCgYN+jGZ98
 lv2fEuVQ7pn9Vjed+4sV8wKCp44tFbjKoNNc7TN8ki440tGU3Og5lDib3J3jXRU4ltS5Jy0MS1O
 kgvxylhJtCWGEobQeuGa2cMEmzEMsnOooq7UixZf7sOZtIrdZF3EL/Sw1/onTH0cgu0U9bLhW7w
 Mdvq1MQ0LsmUY1IIdczKlSuKdFsGiHE1qQiwqcf/lrJM5I9Jcunl22nBEKUb86Pflgijfr5dBaM
 E/oYbPRT0pxLwI0B3uJrAIMiiPu/TmW4ZDMkQZjLObHvc93FTgXGGLiWX7m/EsjemsdKX6bfhTY
 nl5NU3Pr+I4MWmT7JaVwXmtiMttEAn9nkTmug=
X-Google-Smtp-Source: AGHT+IHhykf7LEadUAJ95ZB/ua/mzw6z3Tjh11e6vF/0EAawPUZQc3PIQ2ddeoZE66nPTA2DmklOpA==
X-Received: by 2002:a05:600c:4685:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-47d848787d4mr45276475e9.16.1767816019960; 
 Wed, 07 Jan 2026 12:00:19 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:19 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:50 +0100
Message-ID: <20260107200004.665611-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816020; x=1768420820; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/H24iuMZtYpNjf4m/jNiRIFtYRX2G+AsEdMg+2jGf4=;
 b=MgOQ+7fjtEedRBFzThfxck/PffjGp/ijzJ0OdzitdL9ZPGz/Bc/cTBUCqsLQr9Ciof
 JLseh7fsHoAk7vVWmn9K44u5a+pQiYcwcyE3fq0ReDiXoKqu5vxFg9Qz0j+1HNZO5Vrj
 cdRyqyVurkleOhP3AUqNXjjxxY94J84FsFkRhl8434n0DUBzKzOoaexiLC2y7P+coS45
 rF8v+5nnXGM7/F/VBgYjph3z/me/5AYiyVO92mnA+20F6Nfrfe5fw4ix3WeTz75sWnoA
 zaw/g2L2XTVVLY5R/r5N4uqyeo6uAlGc0+MmD1BfIDUY6OxQZWGBug/gVeyEpJNzoS39
 7nlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MgOQ+7fj
Subject: [Buildroot] [PATCH 03/16] package/perl-module-build-tiny: bump to
 version 0.052
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build-tiny/perl-module-build-tiny.hash | 4 ++--
 package/perl-module-build-tiny/perl-module-build-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.hash b/package/perl-module-build-tiny/perl-module-build-tiny.hash
index 6b467c3ec..9f173d3f1 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.hash
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  15b4434617b61e70315c0838c020a48e  Module-Build-Tiny-0.051.tar.gz
-sha256  74fdce35e8cd4d787bc2d4fc1d43a291b7bbced4e94dc5fc592bd81ca93a98e9  Module-Build-Tiny-0.051.tar.gz
+md5  91e56a426d82dbf33761984e26ed8acb  Module-Build-Tiny-0.052.tar.gz
+sha256  bd10452c9f24d4b4fe594126e3ad231bab6cebf16acda40a4e8dc784907eb87f  Module-Build-Tiny-0.052.tar.gz
 
 # computed by scancpan
 sha256  1ce3282467869416f29b0c5f7773d1b80181fb9e08bef64e3829e8c53e19b64e  LICENSE
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index ca2fddeeb..cbb2dfc54 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MODULE_BUILD_TINY_VERSION = 0.051
+PERL_MODULE_BUILD_TINY_VERSION = 0.052
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
