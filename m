Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF0C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E642802EE;
	Tue,  5 Mar 2024 13:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvwklZ4BuNWG; Tue,  5 Mar 2024 13:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4043182325
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4043182325;
	Tue,  5 Mar 2024 13:21:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 538EF1BF8C7
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB376080E
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 13:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tetwpvAibEGa for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 13:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EFAF600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EFAF600D4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EFAF600D4
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 13:21:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412f0655d81so674655e9.2
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 05:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709644912; x=1710249712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQpbrMRzUsonJGMoHaUw6OPaidJ6A21H79h6fa6sqpU=;
 b=t0ZIbPyxjCpwgmFcCWoLhGOHeKZNCtIStqJzxutFSu+JIb1y4zo4StFzuwWCKNKcs+
 CgsgIT9rKPId7GUHqu73OUJ7eVoKzBi2wbvbEmlpUt8veV8kH9/XUSLVt0y5lnPQrpPS
 z/avBxUmr52JojAXuwqIWmdxjVSOqKeaEKp6yCqcrdej77ZDEfjfF/vGORSVZ/55Yvxh
 bKhs0Gu5aJCcOLov/0fRMLZGXuoToDH/x52JsJ2Cd2xk+Ex3sJwFtuPJ8gvTOXKjE6XY
 anZEfCAVi2YBTXTkAuzvhm6DWl6HknATy2gZ9LWQKwsgVHhlG+vaQXUfSMF1A66r/iEE
 VrBw==
X-Gm-Message-State: AOJu0YyYdEg3vjFjir9B+0aKtU9XiA1a7fxX0PJ+5QmxkBNT5XKeFxzr
 FKOF8LdF4XN6HLr/ElEL6V9+HboOQTo3oDidiXBWfOb1U8nCfUrpWIRLPMu+
X-Google-Smtp-Source: AGHT+IHgEdl41fbey/rrFNA3N65T2uJ0EWC/JHKy36V/yo9Wej6eo68sUAK2KmQFEaAt6BcwawpC1g==
X-Received: by 2002:a05:600c:3591:b0:412:ebd6:3466 with SMTP id
 p17-20020a05600c359100b00412ebd63466mr1591199wmq.13.1709644911741; 
 Tue, 05 Mar 2024 05:21:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00412cfdc41f7sm641747wmn.0.2024.03.05.05.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:21:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 14:21:48 +0100
Message-ID: <20240305132148.919233-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709644912; x=1710249712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQpbrMRzUsonJGMoHaUw6OPaidJ6A21H79h6fa6sqpU=;
 b=jH6LEk0R+AIH6cousq8UN73DQwUCMgW9oYbo0T6aLWbKGElhEu17OpgrlDRpmVu8uV
 uVZcMWu11nE4Nan3akczbObCh772z7Oi9VSn2JDBRctbxQiAKVdYUffAWLTjsmOFZx5+
 ggNkVvHH2g70OM1crKYjR64TrlvSuR+3gXvEg7LZ/hHi4QphuhcKr8qkoQrjtbKxKcRV
 whmWsEkS6tw8cxnFRu+mfjaOuGKxGSBIkS0v0AreoSos755jKewOiUuCPreXaV1ImhtY
 aqWnKefsmgOKu75SAEpNMV1YDyPkjRLn7Kj2QfQjrGMQLSp9sKGktBDKR26VXWaKV1+M
 IW5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jH6LEk0R
Subject: [Buildroot] [PATCH 1/1] package/libcgroup: fix build with
 BR2_TIME_BITS_64
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

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
following build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from ../include/libcgroup/error.h:9,
                 from ../include/libcgroup.h:21,
                 from log.c:15:
/home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround is there since the addition of the package
in commit ff7191c12e88b044848f6655f7015335235bdc7a and is only needed to
fix a build failure with the old codesourcery-arm toolchain from 2014
which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcgroup/libcgroup.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index cfe1d0f9f8..28f572d325 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -12,13 +12,6 @@ LIBCGROUP_CPE_ID_VALID = YES
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
-# for more information.
-LIBCGROUP_CONF_ENV = \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS" \
-	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
-
 LIBCGROUP_CONF_OPTS = \
 	--disable-daemon \
 	--disable-initscript-install
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
