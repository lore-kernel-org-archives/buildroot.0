Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7502C05027
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408A4817C0;
	Mon, 30 Jan 2023 00:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408A4817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHxL7d1oz6So; Mon, 30 Jan 2023 00:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8BE817C3;
	Mon, 30 Jan 2023 00:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8BE817C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E291BF8B4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C3640567
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71C3640567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woeOtSy-qDPw for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC0F40220
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CC0F40220
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:05 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i17so4421156ils.11
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXrrO+WPs2iOey7/MvMp8Jhojtit395NKbZmvFZc4vk=;
 b=E808MMqgoSiS5OYP6iHSEPltpYmIfkBBlGZzOANMqVa7PZezer1Xi/XiDt97ucjaV0
 xoeaVdH5/RebM4E8Kwn89dV21Cc3GgILOfE8goa0/pj8NVcpkCKaTn1plEkKER9TvjWq
 Oz9a0y3m/4CUMqlyZPqp9pmk+ac4S1dRhi2lvgCuzgzk1bYz0jABmK0JmJMaHCq0QdJT
 1NsIi2qssifISd51Uhf164tv72905MkimMhMWJg5r2dzEJvAZx8+AsNlejo+gsJj2jjN
 Ni3cyOYxHABFEPa9sTlnc7clJ+ONjVNY232d1X5QoTVesw7+Tge8IEWeJpMFXXoiH47A
 spMw==
X-Gm-Message-State: AO0yUKWAxRaGbAQGujPffNiTTL32wcQ5+45gtEXUXTpr6HnMjtxrrtqV
 cSG9sn001OZEAhlAht8uoHQMKyv81PS0mg==
X-Google-Smtp-Source: AK7set/EecL4+gyqa3PkqefslhHYpdmPVSS8Bx1iS+GVGP80lttL04owOO80ifr757Vr97vxtYVE+A==
X-Received: by 2002:a92:2906:0:b0:310:adfe:bfa9 with SMTP id
 l6-20020a922906000000b00310adfebfa9mr4443317ilg.11.1675038543984; 
 Sun, 29 Jan 2023 16:29:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:49 -0700
Message-Id: <20230130002854.2300661-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tXrrO+WPs2iOey7/MvMp8Jhojtit395NKbZmvFZc4vk=;
 b=pzDjAUfV76+L/81tlenGP6B/JqwA90oNgEKBwU+f2ZMhGiSD8PdN8teXd+XHy4q2+k
 vZ9/0ZsGHHz5zDdfKhynzGSH3GVJO5Ch94y25vREg+M+4+FNwlrDg1RgYYCkTMXJ1JUH
 JTQsciMbNjIoVRYjYW7e0WOoNSaodyEjN7GygJuO1cN4W23TfZ/kSgmt8uV3RoXDIws6
 fcLaEyjkVmW4TsxK9mmvTdsrEqno0A8bA1USCsPELiVhito78g/ZcyZ0Uipvb0DCWdJT
 BfHxDy9ckorI0DHJIbpLC/XACuNGZFPhraYz+295rHQIYK0kIZvARqMOoaLmYHEYU8kU
 zp5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pzDjAUfV
Subject: [Buildroot] [PATCH v5 05/10] package/psimd: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/psimd/Config.in
 create mode 100644 package/psimd/psimd.hash
 create mode 100644 package/psimd/psimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d25f44dcd..67187f29ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2726,6 +2726,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 873aade1a6..186c7403ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2118,6 +2118,7 @@ endif
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
index 0000000000..be0090a32f
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,15 @@
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
+# Only installs a header
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
