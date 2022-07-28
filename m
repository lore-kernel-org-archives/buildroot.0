Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BC8C19F29
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 11:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4D841954;
	Thu, 28 Jul 2022 11:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4D841954
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuiZi5snkSdV; Thu, 28 Jul 2022 11:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60B74193E;
	Thu, 28 Jul 2022 11:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B60B74193E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F17A41BF359
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D915460A68
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D915460A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COvzKSoVtSGZ for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 11:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAEFA6080B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAEFA6080B
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 11:28:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 2-20020a1c0202000000b003a3a22178beso796436wmc.3
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 04:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BjZ5IXtHiRJ+jVeSdaHshtHE3QVGUbv93hCP9g9gIA=;
 b=maTOBmEbsURlIKmUAWjg6GzAeTjYjWJ9ZnyBbA4wdzxA2oe59LOGj/qVICGhshVN+c
 W6wUz4g/9+XX/EBglcofNTozggaTMtSJgV5S8lZlh+EyJ+ytj2qhHf+RguLibFpqXg2d
 8uMSYIyoMCzqJ4uZ+E+rQzKZrQBmSv3Xxl8Nd9Xkkw9iPOC4AF7ybuj6Hbe1dNS7XYy0
 6MrS2v4qH4wAtFQnvxCCDKpytDC66Ce0EiLUK67jMQklfIXQfIjfMxi7giejj5JY/qcT
 FFC20SXOKyZhJ8kC19DLtTOoZNhWN++KdgE9zrT72JPRsosc6aT43VA92La3Ax787M6l
 TOhQ==
X-Gm-Message-State: AJIora8mtZPSCOQObhZjQpmdzRUC76Kov+CwM2tQD4kBClbB58u0GafK
 eT/llEJsfXLADIeK73vzQfS6JIR0vmZvsg==
X-Google-Smtp-Source: AGRyM1tRi8pLmfQyfgWsMR0d4ubZeLNWS3mWEJCQSHOeh29RhHhXiQ15cLOAnrO3+KpcjsCW1xM2kQ==
X-Received: by 2002:a05:600c:1da1:b0:3a3:1a45:5158 with SMTP id
 p33-20020a05600c1da100b003a31a455158mr6280434wms.87.1659007735639; 
 Thu, 28 Jul 2022 04:28:55 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003a2f96935c0sm6169107wmi.9.2022.07.28.04.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:28:54 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 13:28:40 +0200
Message-Id: <20220728112840.5143-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BjZ5IXtHiRJ+jVeSdaHshtHE3QVGUbv93hCP9g9gIA=;
 b=JtFe4byuSwKejEQ63VDe5oslXSpbVJZeMFUrZkNHldQ6AGmvWK84b9qKC1EdrsnE+w
 U5OYBMAW3CbbbK71K88nnu9Q3uDiVt/uI8qZ8h3Hm9L5s0selslCr/rB7oBKNG/KNlfP
 uZDZF8ZnJaRjdPoz5KH2VTOWn3YPZHw2SVntmzu968Sipat8DtMZDRMyc4c2nCHxVFEF
 6Xk3X9xKPw1GMd0iEVeykFiJCJV9OBkQzxyo4iA6bfZbfvnwvmV0GoydEN75a1AAN9Ov
 pm6876J1iCMBFc8GzjAGb7qotvJMBupruhqAsv/gPZGGvmIvH7QcXEBVmJtt2bro5Igs
 nNLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JtFe4byu
Subject: [Buildroot] [PATCH v2] package/mbw: new package
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
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
changes v1 -> v2
 - applied Romain's review
 - update mbw to v1.5 latest
 - update legal info
 - mbw is now a cmake package, simplifies installation process
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mbw/Config.in |  8 ++++++++
 package/mbw/mbw.hash  |  3 +++
 package/mbw/mbw.mk    | 12 ++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/mbw/Config.in
 create mode 100644 package/mbw/mbw.hash
 create mode 100644 package/mbw/mbw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb98c38..754f8c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1179,6 +1179,7 @@ N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
+F:	package/mbw/
 F:	package/pixiewps/
 F:	package/python-pybind/
 F:	package/reaver/
diff --git a/package/Config.in b/package/Config.in
index 4ff1fb2..fe68d32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -122,6 +122,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mbw/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
diff --git a/package/mbw/Config.in b/package/mbw/Config.in
new file mode 100644
index 0000000..e4f56c8
--- /dev/null
+++ b/package/mbw/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MBW
+	bool "mbw"
+	help
+	  MBW is a memory bandwidth benchmarking tool.
+	  MBW determines the "copy" memory bandwidth available
+	  to userspace programs.
+
+	  https://github.com/raas/mbw
diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
new file mode 100644
index 0000000..74e3899
--- /dev/null
+++ b/package/mbw/mbw.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3c396ce09bb78c895e4d45e99b1ae07f80e3ea5eee59d78ed2048a7f2ae591ae  mbw-1.5.tar.gz
+sha256  1afb2b8258506742238b9ceb8a865d7030c5889c56ba2911a0c0c042aa1335d1  mbw.spec
diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
new file mode 100644
index 0000000..755a9f5
--- /dev/null
+++ b/package/mbw/mbw.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# mbw
+#
+################################################################################
+
+MBW_VERSION = 1.5
+MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
+MBW_LICENSE = LGPL-2.1
+MBW_LICENSE_FILES = mbw.spec
+
+$(eval $(cmake-package))
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
