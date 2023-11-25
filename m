Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B2C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7D660E47;
	Sat, 25 Nov 2023 06:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF7D660E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXQkYaNewEj2; Sat, 25 Nov 2023 06:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CDD560AF6;
	Sat, 25 Nov 2023 06:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CDD560AF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABC2E1BF861
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8479460AF6
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8479460AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL6CbvUYzzFb for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:51:32 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC43760AB0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC43760AB0
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35c63f4b1f9so4675465ab.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 22:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700895091; x=1701499891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+JETYsKBallygLQBx7rSOpgXTeHNb0bj/kwDr92HOUg=;
 b=fkeBq7nqa4NR17XFnYXSyO+Zhxn94rL3PTHNmtSmPpd9BIbMbx35KQJ8almJjxwcGs
 fXGMFzlg1IUxF3lI6ggbiXYvh1/lrmCoNPf7Ma9Ge/6fPz3xlmjzF6kiaKRTlcgf2USk
 Rn1O6oqRjeD1buo5oUWnOJo4OXxhDpx2cYYDcr3v4KfFAdvJK5+11WQVj5uAz1X9gsn4
 z+1qmtuDBAQ2FthHQAfVl/uKd/YEnLL8E9Y5X9n3ixbJ0REbr7Dl0rrRzByqte7r6SYM
 MQflko0Tw23ug8stfVr0fu2Q9zn8z46X6GVt9xynu4fEcNpAK+Afoz1IUn2BmdFctPRv
 Ez0A==
X-Gm-Message-State: AOJu0Yze4hxQQlCWKp5kcPXE0U2gCLYCbRuh2CdQ3uIKvW4KvL4tGOdF
 Z/HoiEgR0K9ZEruz2OimlKrRU8pqSxQ=
X-Google-Smtp-Source: AGHT+IGyRcTjSFPbkU5aMv+wR3UnF1sQmoNzTyTpkzgIKMrPXQXRiAb7qFe0koU09l4WV/8Mb2t2HQ==
X-Received: by 2002:a6b:ea0c:0:b0:7b3:7caf:4645 with SMTP id
 m12-20020a6bea0c000000b007b37caf4645mr527728ioc.5.1700895091399; 
 Fri, 24 Nov 2023 22:51:31 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 dj1-20020a056602256100b007b369c7e2b6sm1236997iob.52.2023.11.24.22.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:51:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 23:51:29 -0700
Message-Id: <20231125065129.830071-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700895091; x=1701499891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+JETYsKBallygLQBx7rSOpgXTeHNb0bj/kwDr92HOUg=;
 b=fR0fnksdAcNiUqiF9wXOdQOj3EHGffN4cViJDF0aFGu9f6FMDoT7ZzdUhFnbH3/Zcx
 +65dLPzATaC2a4sfrloBu8XuQODehXSY8TRImtcL/dBiBJ0z4ofoBhcu3QIU6xSW9O5g
 ogGWVA49+lFZVuN6IRPp28PbSj081doUOqTOmITmYKvwSJPeZ3ViLUzmJ+5jdQGbBuwp
 VqqNyfb4EnvoBpQNt+3viRgVsJt0fw/yrLCCLD//MOL/SgrLXQ7DP2UKDxYQOEQmQk+R
 VbcLTS2rpvcOVjg7l1vuOCp9uVvpP8921gdNAACM/vnGNb9s/lvNC523Ok8HpVNS6vak
 59zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fR0fnksd
Subject: [Buildroot] [PATCH 1/1] package/python-pycrate: bump to version
 0.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index fd41274369..94ec99b738 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  d51fd27d99481990ff85a1e418b1c938  pycrate-0.6.0.tar.gz
-sha256  b49738c02a3f93ba9f76c0dac82b689a5341882814b36c714e9600e9f560daf7  pycrate-0.6.0.tar.gz
+md5  bd21fa697ecff7ad93bec4943230d281  pycrate-0.7.0.tar.gz
+sha256  c83232f522b5bbc3b3eeaca2cf38ee63cd3c25d0c15f3ba221e6dafa89b9a763  pycrate-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 2f947ab807..1645eaf52c 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.6.0
+PYTHON_PYCRATE_VERSION = 0.7.0
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/fb/7f/5f354100270a5d41350e9806dc9950a33e00a30eb3a7ab5fc9db86326856
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/a6/a5/aab94e6bb8b3281cc450dde3961b417bd56abde2401955a9a4904df44c68
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
