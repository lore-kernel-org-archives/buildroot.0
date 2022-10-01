Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFB2C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 22:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6E460F47;
	Sat,  1 Oct 2022 22:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6E460F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEiB3ZZRKans; Sat,  1 Oct 2022 22:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F1560B25;
	Sat,  1 Oct 2022 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F1560B25
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 920FE1BF2C7
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 22:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A56560B25
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 22:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A56560B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6O3lJ1Khy_m for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 22:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482F460ADB
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482F460ADB
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 22:22:58 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 138so5779977iou.9
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 15:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Cpa66e+fz2bqcgWQnRvVAyIpw7OhHI5v1t7LYZZ88Xs=;
 b=uwE+LlqqSm4eUDDBeuCrGmeHiWy0XNVjHCMcUmZFhBTFctH3TZ2FRLuvHtlcDd3vMm
 mLwfyAu8cNigToobLFqItBe21W6QMLKL2Mpt9xJPKDWn3K0ooqKlB14PIFWTDg9zuXDZ
 NOoSA71aL2vKjjwyG+C9HEgHN0+U9Qa6/EC6E3nyI2GJTVHPFxUK1g4nNhGyseGHvgBT
 Xz9oqk+VrRnU6Bthlve3VL4mlLOx1E5Z72trxDaywEqYYEFoPHLu9usFcd+AM7Xeeu7B
 V2lU0NnkQW0sRto2glj8nHBZmcgzvrIuH3bKqzf4uFHc+bVOq2hIgCtQ7Yh/ZjIrbSu0
 7XkQ==
X-Gm-Message-State: ACrzQf1zDxpcJFV+bucwByBF54fTkAcpDSDGLJg+4JT7n9oS6ynUafyk
 wQc6zXsVGY70RgXcd0BQ9DqQAm4ZR3g=
X-Google-Smtp-Source: AMsMyM6Ty1eXt/cOUokpGpAWA8c6lLsx5Lv42n0zDrMSV+YN/gy/gw+LcAFgts7XjIPNYLUGOnGSXw==
X-Received: by 2002:a05:6638:2191:b0:35a:3730:8893 with SMTP id
 s17-20020a056638219100b0035a37308893mr7561300jaj.231.1664662976922; 
 Sat, 01 Oct 2022 15:22:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05660215cd00b006a1fed36549sm2635831iow.10.2022.10.01.15.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 15:22:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Oct 2022 16:22:54 -0600
Message-Id: <20221001222254.142279-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Cpa66e+fz2bqcgWQnRvVAyIpw7OhHI5v1t7LYZZ88Xs=;
 b=Bk4YPHmmFJCUZQm3G6KerDNlnulrnOk3b6l+OJ6JX1by5//kaDlNsk+JBkZhP/gFfU
 /HqSngGfivbEQYtVVUzEncmanZ9F8YKUODiEvo2qf1l3m37P9UFD0ZQiZ4Fy8q07o4hb
 1sRnJnc6kCetH9uFVEXULIogxybJ1GAlZLbvDoHY1j38Tb97WzDGp1k7qKlcrc4FqUDF
 OyY/EotTalgvYw9JJoal6+SKfAs9fbsjhDN+H23qOJ1Kemhpui29HIpzoCbzBsTzagLG
 DZ4o1/Y+F+AMzOxN2y9v36G+Cj+QwQNYhIH4h0/jks8PLfnFPqx0v2JyCG70nNBapKdS
 6uTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bk4YPHmm
Subject: [Buildroot] [PATCH 1/1] package/volk: fix Config.in syntax error
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
package/volk/Config.in:4: syntax error
package/volk/Config.in:3: invalid option

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/volk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/volk/Config.in b/package/volk/Config.in
index 83d58d64ab..6a343e0751 100644
--- a/package/volk/Config.in
+++ b/package/volk/Config.in
@@ -1,6 +1,6 @@
 comment "volk needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_VOLK
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
