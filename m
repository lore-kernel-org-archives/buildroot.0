Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3350C25B08
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 08:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4163F60B55;
	Sat, 13 Aug 2022 08:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4163F60B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RhiYTGBMKCW3; Sat, 13 Aug 2022 08:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 808DB60AA3;
	Sat, 13 Aug 2022 08:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808DB60AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CDAA1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2E2183E19
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2E2183E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhFgoErudFRn for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 08:47:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10A383E14
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F10A383E14
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 08:47:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b4so327416wrn.4
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 01:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=23+5m84vPQ3GD1/D6YsojIuEQWdcfhwskTD5gCwtnXg=;
 b=k0QB6txbJ7dUIbHUBTRwVtNXV2mEv3mAFkQg3+ESC7e9xafqRe7zDA+yRmZF+HM04J
 meIeq/kJ6tpkSZ+Jb+5Izj75mjVzhu3n/mxmEGNcXyY3r8wzAvILwxbmwEYn/q5+V9pr
 icjVZxD/1OS9yAtcLW3Hgq9x34URr0+VYUK+J+vRpxwnbirb5yIIxqUBI+87cX7CeNpN
 djbwDqhWkYRjGg2GiFNNDvbDhabeZyqfCW9FQ9qfW4d7ozCYWPJZCSeJFNmheW+YMFIN
 H3lGeynLux8HL8g7hGb2QloMYk6fur/aO0zl7Pl4YDKf8FJb3oQcMfNFUpztf1scruRk
 v1hw==
X-Gm-Message-State: ACgBeo0aOon58L//xr9xTZOtLCc6jK7KLd01/6lqZekSAUs8g2I7ECjI
 LMQ181QU5I8pMLIFgEvt2WY1ldq2Gzc=
X-Google-Smtp-Source: AA6agR64TsV89ZXL7zsuAUsAGWzfpJQV36XsEXbeXrSbBKc0xnWcsPxiSu3LLxQo6oeLhE2WkCsyFQ==
X-Received: by 2002:a05:6000:1a89:b0:222:c186:ca8a with SMTP id
 f9-20020a0560001a8900b00222c186ca8amr3986305wry.333.1660380421914; 
 Sat, 13 Aug 2022 01:47:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00fce1651edf2c89c7.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:fce1:651e:df2c:89c7])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600010c800b0022062459ce5sm1509052wrx.30.2022.08.13.01.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 01:47:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 10:46:59 +0200
Message-Id: <20220813084659.696492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=23+5m84vPQ3GD1/D6YsojIuEQWdcfhwskTD5gCwtnXg=;
 b=o2/oZOBJ0BAXheEp/Hy0U2D47RcNB3wJ4J0Z7zdlzRRTH0e6XpOdxtjDuo0+eZyC45
 ixDqtN3YY9hienzIuGeJeb/JYpWOZbtjaTDaGzCn5/RdXq9Bg2LT5RubKwHiyQ85+95W
 ihM2tf97cC2ET0cZvrqTCnimRwwMfcuL3pb7N/59SJrOG36ZaUFtuEkOxgBSFddMKBdG
 dXdLvsMNYmCk8wWDsYE8//6g0v6ABOSPJ18Td1wMe0UQHfD/qvu6JsSYRdryUnRbvOjX
 /h1e5+NxdrbtAUUJaiC7d1ljCwo1rq0OwX/5OYazt74iyxHCahyev4cSU2/VHPY+k6pf
 UJxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o2/oZOBJ
Subject: [Buildroot] [PATCH 1/1] package/ola: ftdidmx needs gcc >= 4.9
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since re-introduction of the
package in commit 16ff948444c3978d63f483344a3d92d994c64312:

Makefile:575: *** libusb is in the dependency chain of libftdi1 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/f65baf4dd4c9a313745cdb9aefad2eae7a295469

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index cfca09a936..701083b5d3 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -86,10 +86,14 @@ config BR2_PACKAGE_OLA_PLUGIN_ESPNET
 
 config BR2_PACKAGE_OLA_PLUGIN_FTDIDMX
 	bool "ftdidmx"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Build FTDI USB DMX plugin for OLA.
 
+comment "ftdidmx needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_OLA_PLUGIN_GPIO
 	bool "GPIO"
 	help
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
