Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD614CE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 19:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762C641E70;
	Tue, 19 Sep 2023 19:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762C641E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NC6N6y7Kbmav; Tue, 19 Sep 2023 19:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44E0241EAA;
	Tue, 19 Sep 2023 19:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E0241EAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E36CA1BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C87BB41795
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 19:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87BB41795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg2U5LChb9aw for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 19:52:24 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C95D7400AB
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 19:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C95D7400AB
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32001d16a14so3201660f8f.1
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 12:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695153141; x=1695757941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXpHTgs6Fpws3IGqIVjnlr42PbYpcxXDC9V4JeNgl90=;
 b=IT60Hyz73itrtRaBhKKv+I/STUd3WalCET0OEsneORLilAWkxY3bFAfJjn5jKJ9Q7O
 +hy5A5DMDKsQ7+vYCZTQ2s72cT+6u+NuHVWz12Jrnr8GQ4snI5JwCXV/9CkwCUymfofe
 0K1vQm5KWlEw+8O0smzHJj9bjMIxlylE19q9urLTqbVqa5Dl+iWww/lbsy3MDmyCXfAQ
 IG9dKaBKmdxbphJMA+if3ZUAO6qBk5v2ivU0VwnsWP16lKXp6buL29qk/U2h6N05l/jS
 tVcVHmONG4/Rw026GPLPPI+LcrsJE7GFo/OfioJkTN/mbHw9k93d6AbXQEPITv6EZ0HV
 SZvA==
X-Gm-Message-State: AOJu0YwkChjEmulcwTFvply63eLXJLnpSVJa9EipwRxb5N0I0LISxRWE
 ks9Fav5cJFzb3d5TIMnoDcbYepJrOeI=
X-Google-Smtp-Source: AGHT+IFSDRO7aU0O21utzPNBkemz7Q2+ibSOqjAVetuF8kQlmv43pliY8pQzhVORhPvhN2AC7o67KA==
X-Received: by 2002:a5d:4537:0:b0:31f:f2d4:a71a with SMTP id
 j23-20020a5d4537000000b0031ff2d4a71amr580638wra.8.1695153141186; 
 Tue, 19 Sep 2023 12:52:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o16-20020a5d4a90000000b0031ffb51f6f9sm11910883wrq.30.2023.09.19.12.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:52:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 21:52:16 +0200
Message-Id: <20230919195216.136460-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695153141; x=1695757941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qXpHTgs6Fpws3IGqIVjnlr42PbYpcxXDC9V4JeNgl90=;
 b=aHadZ76PL82wFnKgyufru5kSoOFahcUIRgO7tk2R/ghm0chQytPuR8mey2NGeSgnFM
 VPyLqdx3KITtpEG+V39SdSiQaSm7u40oA8nQSg5UFJInhT7acRllOAD7T3wSgB3OTRRU
 /iTB5ooVoZPZRnOwQrxa5QqR/6iZdUkJqmgmh0/v+1CvM5/0yZmQ8IHap6+tThwPyTzK
 TO0kVHMSztTfAm//lU/mjzSrbynJpOT3A0ab21lEDWp2LkO+HvqvKSzGHTm/FLq5/WSA
 soOUuckN545IIGmHuODS2mALybM8D39G5xRnGuOUYH1Jutf1d3jaWHV+u3S7mMmgwWPa
 +4zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aHadZ76P
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: fix python build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failures raised since bump to version 1.4.0 in
commit 456a7398316655ad0b669635f580e4887c24a700:

-- Found PythonInterp: /usr/bin/python3.6 (found suitable version "3.6.9", minimum required is "3.6")
CMake Error at /home/buildroot/autobuild/run/instance-3/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/share/cmake/pybind11/FindPythonLibsNew.cmake:147 (message):
  Python config failure:

  Traceback (most recent call last):

    File "<string>", line 6, in <module>

  ImportError: cannot import name 'sysconfig'

and

In file included from /home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/Python.h:38,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
                 from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/numpy.h:12,
                 from /home/buildroot/autobuild/instance-1/output-1/build/zxing-cpp-2.1.0/wrappers/python/zxing.cpp:18:
/home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/665b246a4bb14480152ee59050672a7469148a5b
 - http://autobuild.buildroot.org/results/0502b05020de57e4910125c699c4264047187c51
 - http://autobuild.buildroot.org/results/c5e7fe83d46c704e05800e3ae62bf476458c7b71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zxing-cpp/zxing-cpp.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 8256b1a254..b0cadf1b1f 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -33,7 +33,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
 ZXING_CPP_DEPENDENCIES += python3 python-pybind
-ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
+ZXING_CPP_CONF_OPTS += \
+	-DBUILD_PYTHON_MODULE=ON \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
+	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
