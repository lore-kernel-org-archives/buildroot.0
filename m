Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A220C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0971D415FE;
	Sat, 23 Apr 2022 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x81d2hTRsGbO; Sat, 23 Apr 2022 17:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3973441523;
	Sat, 23 Apr 2022 17:21:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 565D11BF5A1
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5258B60A9E
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 17:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpuvTDGbV_xa for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 17:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B6DD60A97
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 17:21:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so9933944wma.3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yionz4uup8oZ3m/k8qaem3I4ZME4JjuiO9/bs6DpRNA=;
 b=UPOpsRQZJMadKcLUN5nTYbc9g24Kt6bggxp7B8PxPgzwbysZAE0f9OGJdLnv55ClME
 8D88bcxaPJto0RfuCaXHyHg0z/eh1cAmxGrxUpGOHHKwPoi11wvXlnyP/E+Z10Gpxdwx
 0Bk61FZRZp0PjmoFR4ajd0fCRFneWC4UvRf22ELVC07yv9f1FiuR86rRcQj9H9Qbnb5s
 8BxyB2X9tyZlR55LiXmCHRYtGporXKwm+oll75d6nbVlDUbAgtlVUv8P2oGPJlUymcre
 zaSuVVTaz5mOje1UuU5qrdud3KNHlYJSDukYd762EUjzGZedvxsKF8DKPUm4qyHdRAio
 ljWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yionz4uup8oZ3m/k8qaem3I4ZME4JjuiO9/bs6DpRNA=;
 b=R9Mwe3rVLkvjslwx3cRIoW4jcApPCL5/rpqpSDV9mnbzFaG0wZl7rTYDqylHFf9EPW
 wi37eOim7Lszot74b9Jhtc7sKnk4hQY2ZUjIrNCmH/I3d16HRu7787zj0ISjr5O6V/fn
 DbclTtgN9zF54IPcIFEJUqR5Cyye63EelYZKcAF1GUnuFimRKXK0nz71LfouqqEKsBPA
 OX6CjcBRg3sIFuBKrcUkCYwRk9mCN3Ye3ViahxB7fEVMYvdP3C6kW0AcErVOYUfEC+H2
 BlDTR6Nr+gyUzH7W9eaTeK9gBdeVvKVzsaDnYinIdPB0BmA7ocHdvf1zajNDZFeI7O0i
 lmCA==
X-Gm-Message-State: AOAM530oYh2Zt9NG4yOl/DQtMB6X+ISHZrMAfdJNSEfOhMDds8AnQMuG
 hhBDaNkgMX0aKoiCxjsyMD1jBQhN1Vo=
X-Google-Smtp-Source: ABdhPJypUHtD0x3QsoNvis92MM6k4bNcg0cFhCe1vQvCNDy5wcPthlBx6ZlAxZ5eb01dEZ77pi9OTA==
X-Received: by 2002:a05:600c:3d18:b0:38e:bf5f:1957 with SMTP id
 bh24-20020a05600c3d1800b0038ebf5f1957mr18532119wmb.181.1650734473124; 
 Sat, 23 Apr 2022 10:21:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0038ecb2d2feasm4434716wms.4.2022.04.23.10.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 10:21:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 19:19:15 +0200
Message-Id: <20220423171915.2459029-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/clamav: doesn't build with zlib-ng
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

clamav doesn't build with zlib-ng since bump to version 1.9.9-b1 in
commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of FAR:
https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:

In file included from nsis/nsis_zlib.h:32,
                 from nsis/nulsft.c:38:
nsis/nsis_zutil.h:36:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
   36 | typedef uch FAR uchf;
      |                 ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/524ee31face8be6a813829b036c4d6134ee5ca98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clamav/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 990a818b5c..1f796e8b91 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
+	depends on BR2_PACKAGE_LIBZLIB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -9,7 +10,6 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_LIBMSPACK
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_ZLIB
 	help
 	  ClamAV is an open source antivirus engine for detecting
 	  trojans, viruses, malware & other malicious threats.
@@ -20,3 +20,6 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+
+comment "clamav needs libzlib"
+	depends on !BR2_PACKAGE_LIBZLIB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
