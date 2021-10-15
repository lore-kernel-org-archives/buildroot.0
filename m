Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1105BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:40:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A389C60FE3
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A389C60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C70360C1F;
	Fri, 15 Oct 2021 19:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJNzo5pwn3vM; Fri, 15 Oct 2021 19:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53DD60726;
	Fri, 15 Oct 2021 19:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91A571BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802DD40623
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VB9x2BRvKOeB for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84D3240581
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:40:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g2so3334206wme.4
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btxEh4OKETHLzr9xHKUOYvFSFevKah0cMlPvTjHjrpM=;
 b=LM6goTnvXWmlKXszEDM5EqEzDeA9MgMtf7CXfCbHpMCeyyx8ziVKlOprxY9xvVHK5W
 7QP0IGcOGfDAe74dTuMdMxvTZ5hAU9uhQloHNufaEY8LZLdA6E+LwXRq43wUAWjqCnMW
 caKwKqv2sfMUbkA91sK6Yd+q+Zb9rg8hN7ZztCuc89Cb2THJfb9PZXvamzDWt0jdxBcL
 9SJRImHFTdi2GYlU1bNf+Hfa0TS27SLhbM4wkDwCSbKPjjiSXbO+EYSUxIffWhHJuxk4
 tCIrQKAb4FFkrWS+dZ8AKYAXTFgQbh618fbSuxZY1wIVbrIriFAbT+6oB8mGYAA/Iyuo
 MRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btxEh4OKETHLzr9xHKUOYvFSFevKah0cMlPvTjHjrpM=;
 b=NEpKMQV9nWlbBOcjVHEZu60zeXyc/Dmc9MDUeZXGU97T2W+aoyYIfjQrloSPPDeHI1
 60MD2mZjQX/sU6nzMoNROc+YcTo8zzZnpmV40bNp1XQtZcbsLmfUSyfw3efiA+H+G6kv
 vvbe7cVhuNUZ4/bqL6nepFfs1ZuSGCF8WSvDpThtA/h8UG29VNMIEbqaCaSEHE0UVYDh
 R+cbGF0ds9yjt3RVxvza6rBDu7TPCVLnOkMmc2Ue1nOAx7VWGZz0XQ1WIVs70HyMSVMf
 u4JR4ZLZTLD5uZtedyEsTGyr5mqIoSSD9OjKd1dvM2RFy5jM8jX35I2MV18k6iv+8808
 xK3w==
X-Gm-Message-State: AOAM533bDeiWQgWIu4TzRPSK9AkEtUKf0wC+jcjONTVCtAUj29+maJ3u
 1//u6T7HBJumOKWUqED2PLZREs9xWTM=
X-Google-Smtp-Source: ABdhPJwsDvR151Ogc55flqku0E5xnBRLBymdsraYf+Q2Sh3Dhjio+m5p6wxRl2SMPU+sk3lWcHOQAA==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr5219466wmr.136.1634326832436; 
 Fri, 15 Oct 2021 12:40:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id x21sm11223829wmc.14.2021.10.15.12.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 12:40:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 21:39:00 +0200
Message-Id: <20211015193901.1543587-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
References: <20211015193901.1543587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/python-ujson: fix microblaze build
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the follownig build failure on microblaze since bump to version
4.1.0 in commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3cf5f266e0101a6c43f97801157fb6b2edce1ed0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-Add-support-for-microblaze.patch     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python-ujson/0003-Add-support-for-microblaze.patch

diff --git a/package/python-ujson/0003-Add-support-for-microblaze.patch b/package/python-ujson/0003-Add-support-for-microblaze.patch
new file mode 100644
index 0000000000..14fd52eb98
--- /dev/null
+++ b/package/python-ujson/0003-Add-support-for-microblaze.patch
@@ -0,0 +1,27 @@
+From 5cc233e98b74c5c370de888198a2b35200d55468 Mon Sep 17 00:00:00 2001
+From: Florian Loitsch <florian@toitware.com>
+Date: Sat, 12 Oct 2019 14:35:52 +0200
+Subject: [PATCH] Add support for microblaze.
+
+Really fixes #73.
+[Retrieved (and backported) from:
+https://github.com/google/double-conversion/commit/5cc233e98b74c5c370de888198a2b35200d55468]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Changelog                 | 4 ++++
+ double-conversion/utils.h | 1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/deps/idouble-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 1a71df0..221467f 100644
+--- a/deps/doyble-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -102,6 +102,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+-    defined(__or1k__) || defined(__arc__)
++    defined(__or1k__) || defined(__arc__) || \
++    defined(__microblaze__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
