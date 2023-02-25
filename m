Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C6C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 11:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD5781E9C;
	Sat, 25 Feb 2023 11:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD5781E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkmtXglpNMHH; Sat, 25 Feb 2023 11:13:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092CA81E37;
	Sat, 25 Feb 2023 11:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 092CA81E37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 664F21BF5EA
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 11:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4015560B9C
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 11:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4015560B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewHo3VR3ARxg for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 11:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 700ED60B53
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 700ED60B53
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 11:12:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5033041wms.1
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 03:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A4EOOEAV6ImWzSXYkPgKPFU7vQo89utD3NQ1WaFTkbY=;
 b=bXCHq2xhuV5TzWQUgfWQxPIvHoVJAOBS/ZMiU9NyI7z0h0MyMQEp4AEEVmK8sxMiqH
 c1TdVis35spb55bS9a3EFIpYO5OR3afU3ure5Z8bMh+hJnzkv8iz085KbNR3ay0VeWLv
 lQkor9J7fL08NZgqm24SkUHtEh5rExPZxVvRs8oZnOZmQM/giTQxBo5UJjIiGY1JrVh5
 lU6Z/Wt1YIL0xQpGX5yIliNryn4qaEOv7Q2XO4IxBnLqK5GrEVEeyaNLL+UjueJ1/9t6
 5vlN8DndMXi75Qv1P06lgDyjkkAP7mH0OjKyGJoG4XqseThdkC2zOFAOFP1F0XlUayHv
 W6Bw==
X-Gm-Message-State: AO0yUKWRAiHkI4Zpq7R6RlxjPauABvTN0SZ9XsDTvsl0MroqFklFPCu2
 5QEjJHRFSs9Q4+0ynQhOTUI/0ZjqSTI=
X-Google-Smtp-Source: AK7set9oIe5QBnP6Wtblluj1KJhfi6kN2OTSbGn7mdQk+if6NsFy34oBcSih/IuBDLUGy17fdLNHoQ==
X-Received: by 2002:a05:600c:331b:b0:3e9:200:1f28 with SMTP id
 q27-20020a05600c331b00b003e902001f28mr9897451wmp.12.1677323575155; 
 Sat, 25 Feb 2023 03:12:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay31-20020a05600c1e1f00b003e209186c07sm5659151wmb.19.2023.02.25.03.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 03:12:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 12:12:52 +0100
Message-Id: <20230225111252.1658233-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A4EOOEAV6ImWzSXYkPgKPFU7vQo89utD3NQ1WaFTkbY=;
 b=bCnWpt5sRmjBNAClwg8iejtgA5KOKxAU1VUjrW5QHa2JYYrSX6h8ROTymfFKSLbm7W
 IoE2bDqAbAFkMGhxgebrDwFyF23d9N18lXcc5JZG0It/FsNK9g/W2/wrCMQVsAmX/G4u
 XMq/nEA5YtQvEXYE1cPgYMYbxu8vZ8hAJd7R5dtrZcJUV3hw5/BCH6dkJbRTOMemdC20
 ylureuXny3QdLVBySvxejoOj+iiKUX02Nys6O6wf4w0PCpxIg+7sx0F/3H+3hIXB+nTK
 drl9NTayqZmozO4WrJA9CL6gGm1jkReYO65Ws9/lA9HqK/elNCdqq3+SOeIwzQ+s6ae3
 Ux0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bCnWpt5s
Subject: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python > 3.10
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

Fix the following build failure with sigrok-cli and python > 3.10:

/home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/mips64-buildroot-linux-gnu/11.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/bin/../mips64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'

Fixes:
 - http://autobuild.buildroot.org/results/435ad19597a1e216a7974bc9ccaf17064d1eccea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-Use-python3-embed-pc-as-a-fallback.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch

diff --git a/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch b/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch
new file mode 100644
index 0000000000..8e9c6f0063
--- /dev/null
+++ b/package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch
@@ -0,0 +1,30 @@
+From a6a5e2c8b0e9ecf5d69d0c237c8e8b717b82b36f Mon Sep 17 00:00:00 2001
+From: Evangelos Foutras <evangelos@foutrelis.com>
+Date: Thu, 3 Dec 2020 19:17:00 +0200
+Subject: [PATCH] configure.ac: Use python3-embed.pc as a fallback
+
+This provides some future-proofing against newer Python versions.
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=a6a5e2c8b0e9ecf5d69d0c237c8e8b717b82b36f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b8841f8..c1314bb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
+ # first, since usually only that variant will add "-lpython3.8".
+ # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
+ SR_PKG_CHECK([python3], [SRD_PKGLIBS],
+-	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python3-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
+ AS_IF([test "x$sr_have_python3" = xno],
+ 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
+ 
+-- 
+2.30.2
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
