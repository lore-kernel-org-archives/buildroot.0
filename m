Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84013C77B7E
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 03:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C788C614B8;
	Wed, 24 May 2023 03:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C788C614B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtdLkzPmMmIP; Wed, 24 May 2023 03:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F420B61501;
	Wed, 24 May 2023 03:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F420B61501
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 816611BF3C5
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 03:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A46741DEB
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 03:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A46741DEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_UEd2GP_fKZ for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 03:16:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C0E4038B
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22C0E4038B
 for <buildroot@buildroot.org>; Wed, 24 May 2023 03:16:08 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso251721b3a.2
 for <buildroot@buildroot.org>; Tue, 23 May 2023 20:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684898168; x=1687490168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bX3DY14RJsI8Ll0SjPcZuXUgpssyCV51BSwDuG/BQ48=;
 b=hI47WSGPIWA3DHx+1fNNzfD3ZH84dmETuO88Vg9Di3smxdK1ZS4XJgCfbxA2Jq6nnb
 A3KyWZ0VV2KCMZ8eetFhLGnqx+ZgPhEi2vTcPScXCAgGnsXNMzYqvmSlTjsljeT+R7AR
 vNF8JdEgbsrcNrpggYQFUlIyzCXg1YR9luEKeXpQOrdm5oLxwctj+R3GR9pSzLuzJVDZ
 szkWQP2o8mwGk6nhEZFZSZolfDNLkxq4uUsrvgXoflyQBZyDdX156D6mK0+iSA4ZMtgz
 CUg4znRxpLahdiOPyr0dx0wo7Uh1lrJr9za6LsTiGgNHdBxQreZsHhTttB5rLwGp0Tg2
 vG8Q==
X-Gm-Message-State: AC+VfDxZM4loCGFCJT8atXpjIvWErJlbipblx+NpRoRyxdrVGLLFCKZy
 fKJQ8cT6+jDtT3xV53WbCjg=
X-Google-Smtp-Source: ACHHUZ7YrbHZlX4dXegigu2lkjGrtpbzT+LVI9uZKwGc2h86c+rrIRk3aZbwKtitioIF21sadRxHsA==
X-Received: by 2002:a05:6a00:2386:b0:641:3ca2:1aec with SMTP id
 f6-20020a056a00238600b006413ca21aecmr1577939pfc.27.1684898168345; 
 Tue, 23 May 2023 20:16:08 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a62b413000000b006439ad979cbsm1349988pfn.152.2023.05.23.20.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 20:16:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E38001069A9; Wed, 24 May 2023 10:16:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Wed, 24 May 2023 10:16:01 +0700
Message-Id: <20230524031601.19938-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; i=bagasdotme@gmail.com;
 h=from:subject; bh=o7IogMvY43ISWaChvhSpeCKGCpbyUt9wuEZSx79hwcE=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhpTcxoIbM98V2Wblh9yUsmpLOvhfYXv77HYt4yhRo/mld
 //eYrnSUcrCIMbFICumyBK9VnaXMe/eS2YxCUUwc1iZQIYwcHEKwEQm/WH4Z/fq5O9Erf7p+o+t
 i47bPE0zTrw04cg6PkPd+/XzPih7fWRk2MG17Jejb9Y3oYx6zRuHDrrt/Fu66M3e+xeuTs9be+d
 9LR8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684898168; x=1687490168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bX3DY14RJsI8Ll0SjPcZuXUgpssyCV51BSwDuG/BQ48=;
 b=SXxmCNLl2/IWeOFLakGvyGnhx4bO1klh/tlDVUtEn9gD7WPoYd84c+ea+ICEnOfNeS
 7KKeD/BBhaPzbWpGoG9ULJOvoAFBpqQeF/qhWR0K6wtM3PEGiANPfSWyNAjbvTFHIlnM
 MDJ971yiZ13f72g/Q9vkybFM3W34spLqLNkINj50bjd8OJ4WeGfQ+g9RJhT+r9UH9NAL
 on880FhUBczGae8g11nrfxZOUqRU1aWCioa9MGOtExkJWCGL2hEDf9nabYG9rtgxs1jA
 nuIJEcAayyqKUNirBcH1JBf5LcEtY3lYTC+64MVUReYc5i3JSNWf60jNFK4Z568oqHv6
 JgqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SXxmCNLl
Subject: [Buildroot] [PATCH] toolchain-external-custom: Describe
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"Toolchain prefix" option apparently doesn't have any help describing
it, which causes confusion when using external toolchain. Leaving this
option at default prefix name ("$(ARCH)-linux") when external toolchain
components are called with different prefix (e.g.
"$(ARCH)-unknown-linux-gnu") may cause build failure unless the prefix
symlink is already in place (e.g. when using Buildroot-generated
toolchain as external toolchain).

Describe the option to clarify.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../toolchain-external-custom/Config.in.options       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0fd8841e5b..ed62bad990 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -24,6 +24,17 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	default "$(ARCH)-linux"
+	help
+	  Component name prefix used by your external toolchain.
+	  Typically, this is target tuple (e.g. "$(ARCH)-unknown-linux-gnu").
+	  If unsure, look at "bin" directory of your toolchain and
+	  note the part of component name before the last dash (i.e. if
+	  you call the toolchain's gcc as "$(ARCH)-unknown-linux-gnu-gcc",
+	  the prefix is "$(ARCH)-unknown-linux-gnu").
+
+	  Note that Buildroot toolchains have "$(ARCH)-linux" symlink alias
+	  to the full tuple-named components, so you can leave this option at
+	  default value if you use them as external toolchain.
 
 choice
 	bool "External toolchain gcc version"

base-commit: 603df32a0cd416caa2d2688008cb87f14ad68ef3
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
