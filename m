Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B5C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4BF640FDA;
	Tue, 21 Feb 2023 14:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BF640FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wbLwDxPSjFe; Tue, 21 Feb 2023 14:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E97FA40FDC;
	Tue, 21 Feb 2023 14:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E97FA40FDC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D41A51BF977
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD48442B20
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD48442B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qS-AQDM0KvzF for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:35:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D26142AA5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D26142AA5
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:35:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so3709379wms.1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 06:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ky/ei/jtvtFt7NUP1GwJgElGeUxNcwHlxT0lDFWsJY=;
 b=PseNHqUaFzTU1C/46U/FsauhcYwwj9aSEnQjLCwQfb1AGsp0mUZVWV19vm7o0H7Pte
 ykrtIwc+onq9I0KgCL5VJMzeNk357WihVXeG+MIQe2pZ+p9f+votkS1aYq091dJ690A6
 fIBmNuKDFwO1W9BqDnq1hoTXAE6Ut69lIXmfF6DCMtKFkvO2BUMvvqvkJMP18zP+0o2M
 Yi+BMqTVdpxcm397yFOt9rvCBxg0bMvCm1D7M8998eDnhZWPPy/Uiymcxb7J2VpFmkAH
 cp72Lc4v4abT8vfuBuj6lT5LpgkWpJYVz22SE6NWvX9QB2MHMMQGx5ZkevMYYzoNiF2u
 NuTA==
X-Gm-Message-State: AO0yUKXO0+wdwxNQwayZRNXuXeg14cW6CBG5aQKFEp+MnbBQUn3BoNRR
 ohLtL2enaMefLms3zp/S0q65Bi07Xgw=
X-Google-Smtp-Source: AK7set/XCWwz8m/H4lKWfF+YUELnxcVpiC7K2CMckGbuLbmHyDx9V3hFoKU5peSUP+S4VYH3JBn+zg==
X-Received: by 2002:a05:600c:511b:b0:3da:2ba4:b97 with SMTP id
 o27-20020a05600c511b00b003da2ba40b97mr4141820wms.19.1676990138240; 
 Tue, 21 Feb 2023 06:35:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c379100b003e70a7c1b73sm3198929wmr.16.2023.02.21.06.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 06:35:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 15:35:33 +0100
Message-Id: <20230221143533.1510153-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ky/ei/jtvtFt7NUP1GwJgElGeUxNcwHlxT0lDFWsJY=;
 b=JgWkD8M64S9MesT5/XeSEhpxdm5h4O8kaEJkd2+Im+gI8OMD47LwiPmgiXqWyAblfU
 aCSaSqwpwG4pXuONXmi9IXfhGR/fWy0AsicFEoWxr42qAFxJEs/JwE4q0Vtc2evlbpE7
 2uKo7pWFPm8Udt/C5LxaXYmSvGAtcqS7xOT3Zw48ISwck0qR+UguudggKarz9eEuEs2o
 oFexkXjn7zWAOsJpxQvgq/YixOS43RTcOjSbzvi4z6Fdd/axoaYHR4L59ld/dmRd1OWi
 FbM5LjP6FWVV6kHY5BuVhXayOEEAys4Uo6T4nzwD4nObT1TSoweo+mrnMqb8hscnARnx
 m0fA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JgWkD8M6
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix uclibc locale
 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

locale_t is defined by uclibc in xlocale.h:
https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/include/xlocale.h#L46

As a result, without xlocale, locale is not fully enabled which will
result in the following build failure with
toolchain-external-synopsys-arc and libcpprestsdk:

In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
                 from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
/home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
  317 |     typedef locale_t xplat_locale;
      |             ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f8fc933914..601a64f191 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -307,7 +307,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_XLOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
 	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support) ;\
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
