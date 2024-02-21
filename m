Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D503FC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 16:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7547A60676;
	Wed, 21 Feb 2024 16:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6B8ihtwFada; Wed, 21 Feb 2024 16:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7267E60826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7267E60826;
	Wed, 21 Feb 2024 16:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 968421BF57F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 16:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8415160826
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 16:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYhFPuxMgYCU for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 16:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CF4160676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CF4160676
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CF4160676
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 16:19:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4127a0d8ae1so1704105e9.2
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 08:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708532352; x=1709137152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHS6AqVC7HEtop+Y7i9lGxRp9mAVcJoge3VSQ74w300=;
 b=RD1xSTqufrVtPAART8wxRP7G9gT3XPQvllURd8Ygv88Qtrvuc4lwsb+mxApqVEefSC
 T0cGIt7aOBC+KW+G30WBIXTdRCiNfbotrO8kZTT1psX2XUCCcj0yW7CRpJMKBcDAO698
 pRj8iJhQLtwj24yfOpr2ttx8FKj681mNjNCIB2retMJeAmTWieg2mIIOW5corB39tQ0R
 72WTm8+ouBHQ/alMgRxu4/IoW87HVdHhm+A1KeJ2gZ4aCu/EeTrrd9Z7ZjpeWgSDxN9R
 jZb44hQbnwEhiOb4G4qUi7tzk34VyFdW3BQLvUTVWddjApcYeafXXg3fZkXeWbDML9/l
 8Ttg==
X-Gm-Message-State: AOJu0YyRP/BeYY773VSSXzOwiRZ6XaWzblVY25dYT0yEHn9C+iFCAdQ5
 a9Nl5F9aYdw8ApDF1oCFOncRk/c558mXqFjjG1zIMLXdHf5P2OL5JwToWZ55vpE5uC0+BqqpUA0
 O
X-Google-Smtp-Source: AGHT+IGDw6DmpJweB+jyvp75nKka+Er54n8irZhXcEu7AmrU/w7+gsTKers90DNWJjKIzVd5eTEZSA==
X-Received: by 2002:a05:600c:3788:b0:410:c148:2a4b with SMTP id
 o8-20020a05600c378800b00410c1482a4bmr15552684wmr.37.1708532352102; 
 Wed, 21 Feb 2024 08:19:12 -0800 (PST)
Received: from P-NTS-Evian.. ([2a04:cec0:102f:f3c5:3be6:9d2b:1a77:e396])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b004122b7a680dsm18634132wmq.21.2024.02.21.08.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 08:19:11 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 17:19:09 +0100
Message-ID: <20240221161909.40317-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708532352; x=1709137152;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LHS6AqVC7HEtop+Y7i9lGxRp9mAVcJoge3VSQ74w300=;
 b=0aPRZAMS4BFJxALNqN/+AY0JYRKOuqbxVQMsJNhNTFSqcx83WAo3fyGamOX+6dbOfn
 mF+tN0ox0q+N1dtK/PIRwCxqn1ZlAU+3SUyd+h4bt4OgHyqbeAyjylDcMGLW0LwJHXX8
 MiXqV4YUYTOUeGgVtwqcu2xuY1W8PvIk5ls7VvQMcGjtQWRHkFh/oTQBixTZRgf/oBkd
 pyan+WohAvBe4BldeFXRcIrXVZIibIxShF1Gia0fUxDczaLIRkyG04xdFtvMwdZ8OVcd
 KxXXyLHXcVISGE2rgaxmDMPc3HZze342SKPwtItG6RSmAP+FD5o5h3Hf5KOIWg8Ur3qb
 iRGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0aPRZAMS
Subject: [Buildroot] [PATCH] support/testing: TestCheckPackage: update
 expected strings
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
Cc: Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit dfed5acb56 ("utils/check-package: use https for the manual URL")
replaced the default url to the Buildroot manual while it was used
by TestCheckPackage test.

Update TestCheckPackage with https url.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6224243484

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/utils/test_check_package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 9aa117d211..2125b34170 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -200,13 +200,13 @@ class TestCheckPackage(unittest.TestCase):
                            self.WITH_UTILS_IN_PATH, abs_path)
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
+        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(rel_file), w)
 
         w, m = call_script(["check-package", "-b", abs_file],
                            self.WITH_UTILS_IN_PATH, infra.basepath())
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
-        self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
+        self.assertIn("{}:1: should be 80 hashes (https://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
 
         # br2-external with ignore list
         topdir_path = infra.filepath("tests/utils/br2-external")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
