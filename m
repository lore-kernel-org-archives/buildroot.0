Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC875C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64B9B41853;
	Thu,  3 Nov 2022 19:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B9B41853
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5R91eMNyG3Mh; Thu,  3 Nov 2022 19:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A5F41850;
	Thu,  3 Nov 2022 19:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A5F41850
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1E71BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 630A6404C9
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 630A6404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUBGCj-e6fbP for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:58:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65CC0404EC
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65CC0404EC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:58:29 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id z9so1618057ilu.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjINVe5qod8cun+I353zHjQnoXrZmAdFya+s2XFlr9M=;
 b=riHhpo89YRzuu0QaCAOWYYZXwZe1sCiA0TwKQ3kaTJCTxQebFh9Ufyio3iIZ0jrOcq
 VvrAkdqn5cSop6600qzWGhi7m0O5wD9E9+2+JBdCpaVLl0Hd90nN1TPK+UKVlq+VHoGM
 qHuhvq34Dke4FQyMLCvdJMXYEA4VFKOPUolMp3CrHjGXzsQFBX9kdTT2GUoZLmCJ0ME2
 AHkKGXkg1bQrJtbNpczz1a6wO9gQ9kW5m11oVrf3yQEBMxAuMhIqJXJWwspmsr45i5Jy
 PddvqYe5uGWR6f2jCZcN+zzeJbGsaZn99Vg6n8g0I2oY9TvxP6Bo33fV+aB0uMMqEzUP
 DJpA==
X-Gm-Message-State: ACrzQf07ajR9heEQbBdp5236r2JlBETd7pu5TTSAWLpT4+VTugJUyOAQ
 zA2f5g1mPWFsAkLrJ+YJN9COGFggoCKIahpU
X-Google-Smtp-Source: AMsMyM54vfnWJUwSjIQ8k67hlPueSq/rRRhMi9FuQAldcnNaTQ91YhG/5wvPkur+MQQr4pAFEpB9bg==
X-Received: by 2002:a92:d341:0:b0:300:906a:2180 with SMTP id
 a1-20020a92d341000000b00300906a2180mr19012140ilh.95.1667505508075; 
 Thu, 03 Nov 2022 12:58:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a9-20020a923309000000b00300b9b7d594sm605040ilf.20.2022.11.03.12.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:58:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:58:26 -0600
Message-Id: <20221103195826.2241166-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjINVe5qod8cun+I353zHjQnoXrZmAdFya+s2XFlr9M=;
 b=GDFJsf0fmfcnQH04YVLVTPPR5/LzEbD9XHqGBjUToPlYX5lk6uRVW5kzYzY5xFb746
 OphyCq8R6RsVldZMY3+WNskd9QaaypViV+3Yl8KB9Mat9lR9t+uqkzYlBmTJMsEmL/Ej
 U2RWOrWexxGfa4gm0RADwFeG7BM+RyK6ckfYjhQmCB6SgrCq7bgLmUeaA7u8JGQT7kFb
 u/fu0mvBZyvxN/ss7R130sNGXi3qG7NehTM9GkZTCNvnqVeLwX0UqI50DKhqKFTEjlSC
 bqEeC5+rV+3dRt0laLOhAdhNtwbNxLOxBGqHiZ2Q0s7GGky1slzcEGfHSe61ChfmJBn2
 LeBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GDFJsf0f
Subject: [Buildroot] [PATCH 1/1] package/python-termcolor: bump to version
 2.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from distutils to hatchling pep517 build backend.

License hash changed due to whitespace changes:
https://github.com/termcolor/termcolor/commit/36a56764b2c37e9099a54a690efd65a0e68b6e44

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-termcolor/python-termcolor.hash | 6 +++---
 package/python-termcolor/python-termcolor.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-termcolor/python-termcolor.hash b/package/python-termcolor/python-termcolor.hash
index 36365cc3d3..9e0324ed64 100644
--- a/package/python-termcolor/python-termcolor.hash
+++ b/package/python-termcolor/python-termcolor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/termcolor/json
-md5  043e89644f8909d462fbbfa511c768df  termcolor-1.1.0.tar.gz
-sha256  1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b  termcolor-1.1.0.tar.gz
+md5  04e4981838535169d19d26a14a76af17  termcolor-2.1.0.tar.gz
+sha256  b80df54667ce4f48c03fe35df194f052dc27a541ebbf2544e4d6b47b5d6949c4  termcolor-2.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  497b3272b67b94a7aa58fa3748d21b62b29ccb783b1cda816f594e3932590bbf  COPYING.txt
+sha256  e79b6bd82962c1330caaa7c42278567b08667777673f8e2371a624d5715d4c0e  COPYING.txt
diff --git a/package/python-termcolor/python-termcolor.mk b/package/python-termcolor/python-termcolor.mk
index ccdff4c0d7..8731032fec 100644
--- a/package/python-termcolor/python-termcolor.mk
+++ b/package/python-termcolor/python-termcolor.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TERMCOLOR_VERSION = 1.1.0
+PYTHON_TERMCOLOR_VERSION = 2.1.0
 PYTHON_TERMCOLOR_SOURCE = termcolor-$(PYTHON_TERMCOLOR_VERSION).tar.gz
-PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981
-PYTHON_TERMCOLOR_SETUP_TYPE = distutils
+PYTHON_TERMCOLOR_SITE = https://files.pythonhosted.org/packages/62/1a/e78a930f70dd576f2a7250a98263ac973a80d6f1a395d89328844881a0c0
+PYTHON_TERMCOLOR_SETUP_TYPE = pep517
 PYTHON_TERMCOLOR_LICENSE = MIT
 PYTHON_TERMCOLOR_LICENSE_FILES = COPYING.txt
+PYTHON_TERMCOLOR_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
