Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5864C48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 17:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A8B840272;
	Mon, 12 Feb 2024 17:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bsyhf2fNF69; Mon, 12 Feb 2024 17:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1F8402F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A1F8402F3;
	Mon, 12 Feb 2024 17:53:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA961BF39C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 17:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05EAF405CE
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 17:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuneD3_efULx for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 17:52:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D83D9405CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83D9405CD
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D83D9405CD
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 17:52:56 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3394b892691so2319873f8f.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 09:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707760374; x=1708365174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XT1PeMU/PwrmbrQ63n9x8Iw9PznpZpw5gzaYVL9HVds=;
 b=bS4isy8HmHHFXGRoAFz5OPsyDL9mRtuSHAQhxFov099QEjT3Wjpn4AgHnkWhTIgG/v
 78X2CYwyaXAA5fXiUdrrsVZCKlMSYKH7uMwfshnE3UZjHq3ozY6KrvS/Q1IdvMbZNGck
 c2L1xxbIsUlXvt12gnWBKJeLHCDPOeGz8VtzEplH+esbLt9YolvL/uIQ2S/0sDOqco9c
 KmwnAstW7UA+8vqGtiIqaIehxZ+mH4Els12XxS2Ag9/PbNvWwwZyXOdnr7mPKd94hYly
 ebq01KhzY0ta6twktslAX+GAxgEPpj+832vh7NNXreow3E8SavTHMsIp3RCvmISRGcEi
 CuQQ==
X-Gm-Message-State: AOJu0Yx0pw3842JwPTlV/44MQ0KAzxnnxrNbmmqH93rMJ/lgiY1mBXn7
 GcGUaW4tyasdkqDysoJ7BB3IBEqOMXW+cXB+ila8TsCmLzZyZcJoOHoNgK42wDM=
X-Google-Smtp-Source: AGHT+IFz8gAe1nVs38howAWB7ca+ThjnbUp4Kw1hBgVF1m4g2T3Okqpzz/5rpjrojcJ8gpWCpdq+dQ==
X-Received: by 2002:a5d:680a:0:b0:33b:58c7:8281 with SMTP id
 w10-20020a5d680a000000b0033b58c78281mr177151wru.10.1707760373701; 
 Mon, 12 Feb 2024 09:52:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXb1UAwfQj4IOxhunD4Abljmzh23YjZaJQxeGDK18av+0NX3cUd8K0yPKWj3t3jyziAL9oEko6t67t08HGfmxtlxAHIJeqPDX9Yog==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056000108c00b0033b40a3f92asm7414362wrw.25.2024.02.12.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 09:52:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 18:52:51 +0100
Message-ID: <20240212175251.721803-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707760374; x=1708365174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XT1PeMU/PwrmbrQ63n9x8Iw9PznpZpw5gzaYVL9HVds=;
 b=WaGhS+hAqDfesDb23PYUAOKML5nfvFFJ8VxzMs3UlVPBoYLTrouquJd9eZuOYTv8Zr
 iLZG/NG2sRFdJKkwR9vI2Ce7qFzV1NDzCY9iSgMkBOsrvnsm1HzcAyHihHIqLMWkf4JN
 pFl8olBD3NMXHUUz1TS4yvp3MuhCZykWVSIUe0Bn2Q6yo/ivuUI1yUI9ZvoQ/70hQGhW
 3qcuRygMDuoyXypX6ardrdhlgF2Q5MjlZcUBoLt+O4OViojxF/06mBaqTV12iGAXzrJZ
 Eyx9V0aGAlwOP3RPzPCHVefEFCo1cjLmEnJEj68vYG9oXPvBSvAL11o6chT3nUTlGFoY
 ky6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WaGhS+hA
Subject: [Buildroot] [PATCH v2,
 1/1] package/cracklib: python needs autoreconf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set CRACKLIB_AUTORECONF when building python to regenerate py-compile
and avoid the following build failure with python 3.12 (which removed
imp module) raised since commit
36e635d2d5c0166476858aa239ccbe78e8f2af14:

Traceback (most recent call last):
  File "<string>", line 2, in <module>
ModuleNotFoundError: No module named 'imp'
make[3]: *** [Makefile:485: install-pythonPYTHON] Error 1

Indeed, after autoreconf, py-compile will contain:

if test "$python_major" -le 2; then
  import_lib=imp
  import_test="hasattr(imp, 'get_tag')"
  import_call=imp.cache_from_source
  import_arg2=', False' # needed in one call and not the other
else
  import_lib=importlib
  import_test="hasattr(sys.implementation, 'cache_tag')"
  import_call=importlib.util.cache_from_source
  import_arg2=
fi

$PYTHON -c "
import sys, os, py_compile, $import_lib

instead of:

import sys, os, py_compile, imp

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 - http://autobuild.buildroot.org/results/aec4c19fdf8087c76c1d5f472e855e0f84fcf7fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Give more details in commit message

 package/cracklib/cracklib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index c5226b3326..9f5f32c87a 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -22,6 +22,8 @@ CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
+# py-compile must be rebuilt because python 3.12 removed imp module
+CRACKLIB_AUTORECONF = YES
 CRACKLIB_CONF_OPTS += --with-python
 CRACKLIB_CONF_ENV += \
 	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3 \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
