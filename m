Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A02C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C70612A0;
	Fri, 27 Jan 2023 14:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C70612A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6icL9enSd8i; Fri, 27 Jan 2023 14:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29A5611F4;
	Fri, 27 Jan 2023 14:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29A5611F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15FA91BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D1760E5C
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D1760E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qzagyup-VqG for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F82611F1
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8F82611F1
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:06 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id n85so1949826iod.7
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcL3+dUAru4GFg2hR9B6bFAUTwF/p8KFwkFBOX9XWWI=;
 b=xUBT5pzQKkgB066AsvG+YZ+UpOdH1ZJ4eirWoo+nFBSQlWygn2KF6sapdNhzD4Fyu0
 Py5ttM4c/wa2R7k/gsfghzMvCaq3WnZd6wwpB1TsR7lVIsULWTPpjj7UhlFL8OGaUgj9
 qsZSZRTjBlkp7REPiA0TG7/oqJwPSUOaseLjpWAzHYJC548EwT9CKK6wwiOujiuiM1Wh
 WSKs37e30TIzD13hJZZlnqQjUTZgolQY0r+iOeTx2F1TiV1k7RvXuCrF4SOIDwbCXxZG
 srt7MKHO7oPWo5mmuRJXDnUIKL8cyPwI2SY22eV7c6YNxHK6cUO3wp++jTyHIGdpJRQr
 sbuw==
X-Gm-Message-State: AO0yUKUxU2ryyS63AQ9hA5ENJDl7Dh+j3WV7VF4QmabxfYDlK43VLGVV
 yJmBsJlWB0FYaQL4AvyBdGFVpwarvDkRww==
X-Google-Smtp-Source: AK7set+3JFBGJYtXucSA8r+jiFrOGsvn/yRt6F6mXE7QU+3MgCHQvzcbOw8XxqIVtiISHxsGCCs+Vg==
X-Received: by 2002:a6b:c94c:0:b0:708:8a6:991 with SMTP id
 z73-20020a6bc94c000000b0070808a60991mr5959344iof.8.1674828665712; 
 Fri, 27 Jan 2023 06:11:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:53 -0700
Message-Id: <20230127141058.2180747-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcL3+dUAru4GFg2hR9B6bFAUTwF/p8KFwkFBOX9XWWI=;
 b=bbCMlBXyz7a+RxruEOrpSzgegx/JXMnACDlm1qgf0+hiiymrg7RcDch9KYHXoEK0Ce
 joOtMIjFj6kBD5KvDz7FcWpbZ0IbMXhaMaRna+vQ+AsPhQby25QoPmqgxCEtV27xJVX6
 6nLnyClZuXl3/OqKl3OVUiJ5pBzaId9W89RZv4GisWIr/BWlMFyFf3Sqfk2mQHsQFBqY
 Cv1ZzXjKgIRVK9jkA7tZSt0o1sMbEbzxPfMHz8drCRyPyOgX6zwVToG8MheYQgu07B/X
 PpowxLQqBSBwfX3TGfxqkX9GaMjpJ4plAkA6tCslsGYzPisucnJiZVUfq3CiYX617gWg
 T2Kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bbCMlBXy
Subject: [Buildroot] [PATCH v4 08/13] package/psimd: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/psimd/Config.in
 create mode 100644 package/psimd/psimd.hash
 create mode 100644 package/psimd/psimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index de15ae1d98..501bbff35e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2706,6 +2706,7 @@ F:	package/cpuinfo/
 F:	package/fxdiv/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 426af4e143..a87f360221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2110,6 +2110,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/psimd/Config.in"
 	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
diff --git a/package/psimd/Config.in b/package/psimd/Config.in
new file mode 100644
index 0000000000..c5c51ca2ef
--- /dev/null
+++ b/package/psimd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PSIMD
+	bool "psimd"
+	help
+	  Portable 128-bit SIMD intrinsics.
+
+	  https://github.com/Maratyszcza/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
new file mode 100644
index 0000000000..5692e79bd6
--- /dev/null
+++ b/package/psimd/psimd.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+# License files, locally calculated
+sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
new file mode 100644
index 0000000000..e5785a0327
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# psimd
+#
+################################################################################
+
+PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
+PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_LICENSE = MIT
+PSIMD_LICENSE_FILES = LICENSE
+PSIMD_INSTALL_STAGING = YES
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
