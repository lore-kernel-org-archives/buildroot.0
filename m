Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BD8CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA87F81A23;
	Sun, 15 Oct 2023 20:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA87F81A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEqEnWLmHgmH; Sun, 15 Oct 2023 20:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66F881911;
	Sun, 15 Oct 2023 20:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66F881911
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F10E61BF83B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7435611A3
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7435611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWPqjNdMhFgB for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:14:59 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEBE860F44
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBE860F44
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32c9f2ce71aso3172066f8f.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697400896; x=1698005696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OH9K53RQOgd4rBh2cVSiCeF50eLZNtGcytE+BHz1EYQ=;
 b=Jqq7GvR1wXtTomPXt57rjYVks7vmx7/TQhHphm1mxlpnkcXo85iUeDdQBjV/NU/3i/
 ASqcFA0HcreWvoauQWQYxMYsyw5MsPx7gENTuiOkQYx9r923ErNwtzIPxDVmeYG+B/zK
 hckVSmHNVKPzln/WqJ0IIl6AsqnFRl7wMCLTAve7Bvs40FQpC7gzD5imt65nO1d0cUWL
 B+noaGjZ3y89JBNaI84WWOrflAqReooWwEplFI5o93+arwYWCx101/QOPe0938Nzu7A2
 BzRDHJAm9GIITrjnygdFWhEosTUj+m7jIIGsZvhPu/ypzD7/fLIMYkikrKM8iwuE78Ex
 H1bA==
X-Gm-Message-State: AOJu0YxurgrKEZubSbgyuYRSqzqYe2Wbm9z7Wzh3WAINBINcSQL7Y+/Y
 lIRWlN8Fm1si5+9fYePZY2WAWBjgV9g=
X-Google-Smtp-Source: AGHT+IHpI3kHCRfF+4Wjpdc73q7fZM89TofnE9ckDDxAZDuocyNONh1W0bQQoCkXfLpV5FKzGN6/RA==
X-Received: by 2002:a05:6000:144a:b0:32d:82f7:e79 with SMTP id
 v10-20020a056000144a00b0032d82f70e79mr14991543wrx.15.1697400896480; 
 Sun, 15 Oct 2023 13:14:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d438e000000b0031fd849e797sm438247wrq.105.2023.10.15.13.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 13:14:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:14:49 +0200
Message-ID: <20231015201449.1279312-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697400896; x=1698005696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OH9K53RQOgd4rBh2cVSiCeF50eLZNtGcytE+BHz1EYQ=;
 b=AJRbdnQzvp/cFdszPhcc5snfhQlPmuMTWN/6C5HWtoyI0sCYyKyH7nKYi8GX9S+//B
 HJ+Ge3pi3lebIx9K5vZPjVC8CW0ZNa6Yg5fXQmOGRSmt6ccaakHMKfoyjC1eFywsr1eG
 OVdU0pxMpvnf+1PWTf4DAX3YzqZ2xQTyfs5eJ97/6scdKbH0EEyiGeRPEGj/GhuSvbqS
 urIjAmKfsZAuxM3SlNVzrYSFwYNtfllrnYCLiGdbBIuDvvV0L4+rbujWqP+zEA7bBtqg
 ksuzzVjAPGrZ5arnrjEidxAzoIJz56sgMrokx3aQFnFHrJTCTnF/5Ao3MJ1HDr/Tnc0x
 Junw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AJRbdnQz
Subject: [Buildroot] [PATCH 1/1] package/libgeos: needs gcc >= 4.9
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgeos needs gcc >= 4.9 since bump to version 3.12.0 in commit
16727d4595dd1972a46e92bbd2260a896cc19b60 and
https://github.com/libgeos/geos/commit/289ed4efb26a9944f4385381e1574184b1e7448e:

In file included from /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/src/algorithm/ConvexHull.cpp:30:0:
/home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/include/geos/util.h:38:12: error: 'std::make_unique' has not been declared
 using std::make_unique;
            ^

Fixes:
 - http://autobuild.buildroot.org/results/56bb572fb1d56d45dbb950a73b9b888239fa6968

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeos/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 8411627d43..2a27c6f2a4 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +14,8 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, threads not binutils bug 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
