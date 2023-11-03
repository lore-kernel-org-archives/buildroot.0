Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFD7C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 17:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9086841876;
	Fri,  3 Nov 2023 17:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9086841876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vN2xD5ghMRb; Fri,  3 Nov 2023 17:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E259441869;
	Fri,  3 Nov 2023 17:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E259441869
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 734A11BF21A
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 17:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49F134015F
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 17:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F134015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3204g8FwGTXg for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 17:48:02 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D89340124
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 17:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D89340124
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso14778955e9.1
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 10:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699033680; x=1699638480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LCxpAnxZfMzbqjor21ywZPES4N+KbmZ5BP+WewT6SvE=;
 b=LCDJLdMKE1QgSVuQSJO655q/mAqmJ6SWOssPtL5M81vQG1TP+AcRJBFZtuLZ5t/5Cw
 AmWopRf5jBNKtAZWsaEtjp1SBhZp6Z7iVVzCOM7r9z+5U9+/IxigOJ/xn2pVdaTfUHLj
 cZKfYTpIonQOGDUGYdWEYYWIV5MqGinRV5eZkITQo71iBrJoZ8nfiNgUWnGcUxxShE2K
 IKBDMXS8ADLOPor172zCNdVbNWpstkG76YcyyVVhJNVAmd1pdPId3+QLTsZDyGS6aadx
 7L+95hbip+lCSTB/MHWPzwbYsUDo+jvQEo3FFOZ59YZ6Zu7+pj0PCFLIg9w3z9KjWdsI
 U+Vg==
X-Gm-Message-State: AOJu0Yx1SwbL4ScATljesruH1j1kmULJtaFkWXu4TYAacCZTiXmiV5Ms
 4kgE32Hg+N/woef9TzqxdS4kFiOM00M=
X-Google-Smtp-Source: AGHT+IEQVy7lLZGbgd05pHg+VTWia8beVSq2gLA2qa0qb0zBY94v9Hu0XXctdcc3P5AzG0JZgfJfKg==
X-Received: by 2002:a05:600c:3103:b0:407:3e94:bcca with SMTP id
 g3-20020a05600c310300b004073e94bccamr4336658wmo.1.1699033679449; 
 Fri, 03 Nov 2023 10:47:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f10-20020a5d58ea000000b00327bf4f2f14sm2375099wrd.88.2023.11.03.10.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 10:47:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 18:47:55 +0100
Message-ID: <20231103174755.2118753-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699033680; x=1699638480; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LCxpAnxZfMzbqjor21ywZPES4N+KbmZ5BP+WewT6SvE=;
 b=kFSDGKCrS99meYKqjANNBDDYWXCPrwuPyzLoxlx1/SVeAj2uE+OGrtNyq7zDz0oDu2
 xJJb4Hrxx9CR7CHL8bo9B+pox5kaMhf46oZkf7R/2OKFWM47tlNrARwc/HHrDNS15KjR
 2pnm0BMhKCI4YjFZk5W3kLhV9jSrqWsqyCU/KENZW//IlMFrPya70DHMPbUbTf+Y8YQI
 8GTY5tDjJw3gZyZGzXEsXgRBu6U3t7S4FDTcMwFZV6zVrnWoTmoMTzIDaV+QGDMcEsLT
 c3TAtgImoyhpEqTauos/sFnsVNkPVQjJcFfJbY42glK4+xKOlN0xxTcG3xdDXpuUo0Yv
 2R7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kFSDGKCr
Subject: [Buildroot] [PATCH 1/1] package/apache: add host-pkgconf dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

apache uses pkgconfig to find dependencies such as lua, nhgttp2, openssl
and systemd.
For openssl, pkgconfig is used since version 2.1.1 and
https://github.com/apache/httpd/commit/0d4387dedc4ad83460bf52fc326c475c64133634
resulting in the following build failure since at least bump to version
2.4.54 in commit 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48:

ac_cv_path_PKGCONFIG=/usr/bin/pkg-config
[...]
configure:28669: checking for SSL_CTX_new
configure:28669: /home/buildroot/autobuild/instance-1/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -L/home/buildroot/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../../../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/usr/lib conftest.c -lssl -lcrypto   -lpthread >&5
armeb-buildroot-linux-uclibcgnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

Fixes:
 - http://autobuild.buildroot.org/results/d85c86ee1070582014c7b29b39f9a9f356988220
 - http://autobuild.buildroot.org/results/55d6bad8572138e200730d3a9f2dd1b9048fd95d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/apache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index cac62134ed..3efa6b0ac1 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -17,7 +17,7 @@ APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
-APACHE_DEPENDENCIES = apr apr-util pcre2
+APACHE_DEPENDENCIES = host-pkgconf apr apr-util pcre2
 
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
