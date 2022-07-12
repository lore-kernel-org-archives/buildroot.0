Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D59CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA65183E6B;
	Tue, 12 Jul 2022 16:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA65183E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Qxf6OsMXPGa; Tue, 12 Jul 2022 16:31:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C3582C18;
	Tue, 12 Jul 2022 16:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6C3582C18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124331BF3C8
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E075740CE8
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 16:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E075740CE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syZXd4Jz9CzJ for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 16:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0132401FB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0132401FB
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 16:31:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b26so11936877wrc.2
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 09:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfBZI4+UIaLRr2zM9+szC2TlWWlVzsJuL0aow1UNv5o=;
 b=TGJ9o7yJkfdAz7HB9Jl2coih/TG4JNNWS89dnMoTTp4Ux7k6ZnxbGP4WdoOrLBl2AE
 rm9SG4nLXPXWEEfOI7sNAjcKPu41QUM+kj5ZqTa/QFvhlSPg9wcFyOjFVM5sTG/7MG07
 QY1kRs997EauEbnxz4s8E8KW3fhZkCmD9GvV39/zVfcwzOEBkPW+GGfgjb57l8XCM5hB
 hztqtKu1ky+RPCXpxQEI0uyCJHwMRA3ICstO05BN9CWrWUB5vhZqZ3JhnhtQwxz+L3d1
 SPLum7lw1V62Z4z0CTl6PGf+UjEBCewSOhIW7QAKSaVu3J1FleP+zrE8mx/CHpOM3OeL
 GSRw==
X-Gm-Message-State: AJIora9pcRzHU6ZP4rXY8z9IJzxyD1tEucbxHToqBY7c5clMgPD9fsLS
 SaueLud/LNdD20A8nIEvz/kRDNd/KI0=
X-Google-Smtp-Source: AGRyM1uZjxgSkfh/ET0Zi9KIJvPXZIl9cUjT1cUpF8qiSu0Lm70RiJtR6zP5PTjwUJuKwcpKwC1RPQ==
X-Received: by 2002:a05:6000:1cc:b0:21d:a352:116b with SMTP id
 t12-20020a05600001cc00b0021da352116bmr12557199wrx.418.1657643477596; 
 Tue, 12 Jul 2022 09:31:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a5d6da3000000b0021d66cf9547sm11060982wrs.0.2022.07.12.09.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 09:31:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 18:28:16 +0200
Message-Id: <20220712162816.1583040-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gfBZI4+UIaLRr2zM9+szC2TlWWlVzsJuL0aow1UNv5o=;
 b=ml3JmLIVtnCPAGlHD1v1R+lPQ8c3wKxowOEHJajXLQfHj1ocb/0SZjp1vyM7oc/dQy
 5MmAYF2ggfaZ1p/+TulY2zCqfBaSS8MpCqUn3gMMvA92YZB+tCDlQkjLNHpiJhkc8kit
 6fFOoZjosdKCkWfNsWNMoW6XYqePofDH8QtSOmvmGuQcp4HVBoNQtW4/8nVys+mvRxIB
 ZHu5VTYSgaDCAv5o/nFMePYQB9fbORB8QAfKSoLUmJId0j5YXzpn3GAYR+Bj6ifDScbp
 nZWaCr4l4kVWmvlb2+JXBx8uxBfjywbyMH7Xhxa9q9tnVNpH85PC3Xikiwf7WKh5Iyez
 +TgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ml3JmLIV
Subject: [Buildroot] [PATCH 1/1] package/unixodbc: fix build without threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without threads raised since bump to
version 2.3.11 in commit 9b4914cc4ccdc30e239cd3e2e0e61b8ca5d24bab and
https://github.com/lurcher/unixODBC/commit/6df155fb213896b9507b421c58856e4376647ae1:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'

Fixes:
 - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ivermanager.h-fix-build-without-thre.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch

diff --git a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
new file mode 100644
index 0000000000..9d54bbf5ef
--- /dev/null
+++ b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
@@ -0,0 +1,34 @@
+From 119cab666646cd9210439d4696a4bfa18343a2c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Jul 2022 00:29:28 +0200
+Subject: [PATCH] DriverManager/drivermanager.h: fix build without threads
+
+Fix the following build failure without threads raised since version
+2.3.10 and commit 6df155fb213896b9507b421c58856e4376647ae1:
+
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/lurcher/unixODBC/commit/119cab666646cd9210439d4696a4bfa18343a2c6]
+---
+ DriverManager/drivermanager.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/DriverManager/drivermanager.h b/DriverManager/drivermanager.h
+index 9528fae..abd324b 100644
+--- a/DriverManager/drivermanager.h
++++ b/DriverManager/drivermanager.h
+@@ -808,6 +808,8 @@ void pool_signal();
+ 
+ #define thread_protect(a,b)
+ #define thread_release(a,b)
++#define pool_timedwait(a)
++#define pool_signal()
+ 
+ #endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
