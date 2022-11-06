Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A77C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 16:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92D9840132;
	Sun,  6 Nov 2022 16:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D9840132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xFHbQ5ql_vp; Sun,  6 Nov 2022 16:07:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9779440150;
	Sun,  6 Nov 2022 16:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9779440150
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE6781BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A05628142B
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 16:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A05628142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vt-34mCi6u5F for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 16:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCE978142A
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCE978142A
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 16:06:54 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id o13so4791186ilq.6
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 08:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9VOqTXJGEG6GbOwiXKi6EUsONeZ+hDeww9P0SAvzMos=;
 b=YAXvN0mSk05DYKFQXlfgXEYxxenZjTRfm2TXFTWd1sMgHP+0fFKz5HQYRBmF8sJWf2
 TrgtV3MadCXGvtXTNBYIo2qYUyjhpozDbfyaWEIUJ70jQDRx0WBb3nPBw3mgmJ8ru+8s
 xqR38XLDVAGQi71A0wu3gawDsVwXffzY47vVdHcaxowgRJP0EDXaLeMJDUcR1pTK+omy
 ECaOnSDd/KkjMHp08gCJ40M0RNqHkC14KvEofYPj8mPWupOfnUbjzbsq8C4yIxSj0mL5
 K0h4lWs8gbOAmID6TbzEndk06qs61kYEgvBpuNMyLeFw2fTgBZLKBetOaJ/mvhHAIMFk
 O7Xw==
X-Gm-Message-State: ACrzQf10WIf5IpmGX4G8j5NLyrikcPCjT+YNjqfSbClbNDNxn7DYWwC9
 KBKF5sLysZ7Da5V/p+smNvA4l+mZpnJ1eg==
X-Google-Smtp-Source: AMsMyM5hc3ycyXiWrjboQzVedkK7MAyboW07rr+ROQ74sAELAoh0HJVkWlUm/0ZDk9BGducWZAZSng==
X-Received: by 2002:a92:7d0a:0:b0:300:b187:cac7 with SMTP id
 y10-20020a927d0a000000b00300b187cac7mr20215216ilc.178.1667750813536; 
 Sun, 06 Nov 2022 08:06:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f28-20020a02a11c000000b003753a8178ccsm1759045jag.160.2022.11.06.08.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 08:06:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 09:06:51 -0700
Message-Id: <20221106160651.316930-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9VOqTXJGEG6GbOwiXKi6EUsONeZ+hDeww9P0SAvzMos=;
 b=Iu9KVJ46L3UsepcUuj9W/ylBjoYTyWKrZnZyRS+r0fR3m5qIdvM6o0UWDV3yEiQy9c
 cbAZNejgvG3t44NfxSU+KVMOoSAxg6Y4ZXOIYMzaIuObOMKwUG9VdBll5j5hWndH1agq
 /hRCoTdFF1GcD0krO67yT/XvvGbrPK9fl7hSGH6vPClY/SETqRYssmb1e88qwNjrsSGW
 ow5a5cCO6TEbyDv9xll7CsfEa51f/kYKwRH53aVH8V5GaHH0G7BVHjnxZt/FACJUX3/3
 Y1aA3ngnUY4uWBRvaf//Jb8M+ZKELKD/uuzc0oGVjlXGU9lAepnT2Sd3DstgH0X881JN
 vjew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Iu9KVJ46
Subject: [Buildroot] [PATCH 1/1] package/python-unittest-xml-reporting: bump
 to version 3.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer needed missing license file workaround:
https://github.com/xmlrunner/unittest-xml-reporting/commit/c43427611390fba83ca13fbb5311bd8fece5048f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-unittest-xml-reporting.hash              |  6 +++---
 .../python-unittest-xml-reporting.mk                | 13 ++-----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
index 9db3a09d38..674a533e6a 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/unittest-xml-reporting/json
-md5  474cd89f9609828ef6039a0f00afd9db  unittest-xml-reporting-3.0.4.tar.gz
-sha256  984cebba69e889401bfe3adb9088ca376b3a1f923f0590d005126c1bffd1a695  unittest-xml-reporting-3.0.4.tar.gz
-# Locally calculated
+md5  f12aeab63ff44e295526e103313d66c8  unittest-xml-reporting-3.2.0.tar.gz
+sha256  edd8d3170b40c3a81b8cf910f46c6a304ae2847ec01036d02e9c0f9b85762d28  unittest-xml-reporting-3.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0596648105bee470f9cafd62753b931efe52392096439d88e2564cf7d7cf0e68  LICENSE
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
index 5744c50a7c..05bbed79a8 100644
--- a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -4,20 +4,11 @@
 #
 ################################################################################
 
-PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.0.4
+PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.2.0
 PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest-xml-reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
-PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/bc/09/677086169c8e302b614de7d4a97c45c4446a382f31cc010fb31177258508
-# License file missing in Pypi tarball, download separately. Issue
-# reported at
-# https://github.com/xmlrunner/unittest-xml-reporting/issues/259
-PYTHON_UNITTEST_XML_REPORTING_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xmlrunner/unittest-xml-reporting/$(PYTHON_UNITTEST_XML_REPORTING_VERSION)/LICENSE
+PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/ed/40/3bf1afc96e93c7322520981ac4593cbb29daa21b48d32746f05ab5563dca
 PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
 PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
 PYTHON_UNITTEST_XML_REPORTING_LICENSE_FILES = LICENSE
 
-define PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
-	$(INSTALL) -D -m 0644 $(PYTHON_UNITTEST_XML_REPORTING_DL_DIR)/LICENSE $(@D)/LICENSE
-endef
-PYTHON_UNITTEST_XML_REPORTING_POST_EXTRACT_HOOKS += PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
