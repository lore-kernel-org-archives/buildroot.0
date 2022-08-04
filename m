Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA88AC00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3FA41701;
	Thu,  4 Aug 2022 05:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3FA41701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gODHwACsUNIE; Thu,  4 Aug 2022 05:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB89A408AC;
	Thu,  4 Aug 2022 05:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB89A408AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB17C1BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E3280B18
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E3280B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpJMIYKNDNX5 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1922680B10
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1922680B10
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:23:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id o22so8450622edc.10
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=pgG4YPbjK6FK4CFK7yUNACsF++qJpmxDSNfE+9qCbaY=;
 b=ua3VwIS8YtO+1tg8AsYT375TiZd5620I1V6NbZiv+1W6+JXojKCN5nJ+1mYK4aZaQ4
 +swuc4Vcoyw5mVJo5eHJdXMbaS7rgTmoXtwXVp/xyXCDJpd8aNF16UmQzsnZyWwdb7n+
 YiL4+lBhBcV+x3jOEaYe2JTJrNt3UeGZPh2W1F9cGRdMvzDqarA9egxzrDYiFkwKyOxj
 d+QjxQxYKg1tstPepJd2mX55fICWYeW/JwHqwffAmYEJw6hDOOCVH3pyT9f/oCj9V+zd
 T3CaeVQy3ntACEa0gL+qxzTihFQZu74Ai7GIIStkrEvxk9EZJrJ/KyW+wpTdPe5z36lV
 751w==
X-Gm-Message-State: ACgBeo0Ui+hIpDjqYjehejH1oYopc3WiuqUsMMiSMdME2M7+WoCUd0MK
 UoEHL3p3BEwp4Kym0VSAXIz6kNLnGOw=
X-Google-Smtp-Source: AA6agR5qE5dn2uqmDPHuYw39HT6fLoGx7g1lH21zGXADss45sfrvfkwV3wuE3hH1LD5w1tNdQPs57A==
X-Received: by 2002:a05:6402:414b:b0:43b:6b1a:c230 with SMTP id
 x11-20020a056402414b00b0043b6b1ac230mr275940eda.42.1659590625846; 
 Wed, 03 Aug 2022 22:23:45 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b00730b942f6aasm1084153ejc.81.2022.08.03.22.23.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Aug 2022 22:23:45 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 07:23:32 +0200
Message-Id: <20220804052332.19537-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220804052332.19537-1-yegorslists@googlemail.com>
References: <20220804052332.19537-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc;
 bh=pgG4YPbjK6FK4CFK7yUNACsF++qJpmxDSNfE+9qCbaY=;
 b=Y5nCi+AAeYvxUV5vQD5SoDVoL7roNlTN3TlFx+v0U3kmJ9ru3ja6RJ9RnQAP6xiG7X
 KDXHrYMRVTactZ0j4vX/FPOYmlkM1f7t+JMfGyGMdbvTIF6mlgeLbN/E/9vuJwX1Wlgw
 R62IuVmd/6MHGuet4jdASXCqnrK0RpvV1VCZMTgjaNPzfV5w1tAt0VgPGiiiRZZteYSn
 myZ6udBSwZR7rq/9swN5CcRiTzMbK1V8Btf+ULIgPGLNRKRYXkHoSK7wjcvsrSLvcI2+
 rKVGwxuVECay2cyNNCPTEerN9gUcJju+xJxeAklJOJnThSgzC/I2IgGB7VaE9tF+grHQ
 /sDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y5nCi+AA
Subject: [Buildroot] [PATCH 2/2] support/testing: add test for
 python-dtschema
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
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                                           |  1 +
 .../testing/tests/package/sample_python_dtschema.py  |  1 +
 .../testing/tests/package/test_python_dtschema.py    | 12 ++++++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_dtschema.py
 create mode 100644 support/testing/tests/package/test_python_dtschema.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 63bb80fc9d..4ca9567b46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3131,6 +3131,7 @@ F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
+F:	support/testing/tests/package/test_python_dtschema.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_dtschema.py b/support/testing/tests/package/sample_python_dtschema.py
new file mode 100644
index 0000000000..786c3d5a71
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dtschema.py
@@ -0,0 +1 @@
+import dtschema
diff --git a/support/testing/tests/package/test_python_dtschema.py b/support/testing/tests/package/test_python_dtschema.py
new file mode 100644
index 0000000000..e3a4a309c1
--- /dev/null
+++ b/support/testing/tests/package/test_python_dtschema.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Dtschema(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DTSCHEMA=y
+        """
+    sample_scripts = ["tests/package/sample_python_dtschema.py"]
+    timeout = 40
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
