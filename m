Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4AEECDFA1
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 20:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC89C405F3;
	Wed, 26 Oct 2022 20:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC89C405F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nteQ--Xu6kLh; Wed, 26 Oct 2022 20:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D44405F4;
	Wed, 26 Oct 2022 20:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D44405F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D152D1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD1060D89
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 20:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD1060D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOoHz8URZ-Fs for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 20:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4E360B99
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B4E360B99
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 20:17:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so2532747wmb.3
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fbJVK6fVOmH4mQPAyKFHZ0skCRuISd/SZNngHqhaTlg=;
 b=iSylrOzc1INxinWTIY0IJn4du1YmnMButlKdClNdzTq1Wv+orOahF+Kt3wj4TTg3sA
 SGguXEVUtOzE8saR5Wcv7WosBSOFVbaT1dOqgDGPqeeR37aOrs4TJu9T0C0rrKLoX7ml
 z8tcIBgrgiNsn1P+S3/t5mI3d8O2ChaHiAr2UNDukAo00OXbTeuU4dk8oI//azfGPkUZ
 uWQQ4u4AT8K/N/sr2hk6FfeHonN/gVSIxxGFtRdZVl4Tr4xZ0v4N7reEwSZvKFVdqahd
 349MjX3H3dj0f+zcpryynGaKqm0fTKUTzEgifmLx6+8mngsZbEH2ylv4n7JW18w0URAY
 VeCg==
X-Gm-Message-State: ACrzQf0E7l3ZBFy3tJDYlAXmhoyFNIlDlnQ3hq+rooO3lWqPzK3LykyR
 7pjYzyhuSDiTCzpZAR0FZI7Zx/XXhkw=
X-Google-Smtp-Source: AMsMyM5ezELyYVxDwKqutC5Sd9f4+AZF7GsPaDM9ylI06nCC1H/KjHqAwbpX9nsX+ExBTck9M+M8UQ==
X-Received: by 2002:a05:600c:5398:b0:3c3:dccf:2362 with SMTP id
 hg24-20020a05600c539800b003c3dccf2362mr3775867wmb.89.1666815460262; 
 Wed, 26 Oct 2022 13:17:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b0022e6178bd84sm6317188wrm.8.2022.10.26.13.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:17:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 22:17:36 +0200
Message-Id: <20221026201736.327835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fbJVK6fVOmH4mQPAyKFHZ0skCRuISd/SZNngHqhaTlg=;
 b=BPDamTzIHBlHap6DtJvxaWBlIqNR1xpc4q5AUNbGBp0T2JJ4S6uL5sOetlk2ko+ZGe
 rBvYOnmvUSyPSartTfl0UHNOSPdD3zL9q5sLTfqyvG01MmOzJE3J9dvyV6Hwki1Zr24E
 C+glKO9cBY8nb8FnwN7xOzStYNfSc4OvK9OkmK01rKisoQ/I2Pw3cRp/0HaXHxCmneA+
 BgDDZmogj/4+NPE3Ar3pBfRrljtnSeN+jY1RNERRWIdCKwwG/OMEpm4gSLyYsEqDuDyr
 TxSc2+m/iih3fE73AfUTKrxCgSs57o7sbySom2gkIM6uhtsi3Djn9jr7Jsr7ZlrxBXtN
 xEcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BPDamTzI
Subject: [Buildroot] [PATCH 1/1] package/usbguard: fix build without asciidoc
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set ac_cv_prog_A2X to disable build of documentation and avoid the
following build failure without a working a2x raised since at least bump
to version 1.1.1 in commit ad21d84a589458fd4542993912891daa503d72dd:

a2x -v -f manpage doc/man/usbguard.1.adoc -D ./$(dirname doc/man/usbguard.1.roff)
a2x -v -f manpage doc/man/usbguard-dbus.8.adoc -D ./$(dirname doc/man/usbguard-dbus.8.roff)
/nvmedata/autobuild/instance-5/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')

Fixes:
 - http://autobuild.buildroot.org/results/e41950f3cd4bd83d9b067af498757cb9d2f207ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index ca539a55f5..4e906e8b87 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -10,6 +10,7 @@ USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
 USBGUARD_CPE_ID_VENDOR = usbguard_project
 USBGUARD_SELINUX_MODULES = usbguard
+USBGUARD_CONF_ENV = ac_cv_prog_A2X=""
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
 	--with-bundled-pegtl \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
