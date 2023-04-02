Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB17C76196
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 09:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06EB781F52;
	Sun,  2 Apr 2023 09:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EB781F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPccA_nVNJei; Sun,  2 Apr 2023 09:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4053081F4E;
	Sun,  2 Apr 2023 09:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4053081F4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4161BF4E5
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 09:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F3581F4E
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 09:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F3581F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4nJkN-xeHle for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 09:05:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC74B81F46
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC74B81F46
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 09:05:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d17so26364706wrb.11
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 02:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680426309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qxdOveZ9cvmeKihjF3cu3UMq3YuImnOtT5g4LYTD2jw=;
 b=q+enDvit0NQp3dURfWxqoY33IVyzCDvihBRZFshR/xq+f1LYW+mK2OBvqlB765KHK5
 mJN4JlqbF8wbsAL8FEt0KXB/1qqIZgsqciw7QELkWYc549l05XJgMIctn4S6Yk2w9Ia0
 3hCZcrfUznuN3LXXftCTDXPkYrH2DYnavqWNn6WFUHLycfiIqxGXPmVoFM6WHwtafp/K
 p/tfWFS9Wqmyjee5agvurgKeN1MxdGecy7fP9ZLKqfq1+E4kJJ0bNuQ1H2RMs/1KOXFk
 W1W82ki5UkiSTuG9vp4EwHXdBLoJEIHq0J7zzm5pK4F1rvCtAI58NcDfW1banbN7GImv
 86ag==
X-Gm-Message-State: AAQBX9fHJYJM9EKV3WMSdErgd2TqoSjypdqqteDMBQduQQuZE3vA0eGy
 d7gCvNe7HS7iOVtecshY6+efre6wnJM=
X-Google-Smtp-Source: AKy350aHBHBkvpdhtUKVmpvh4J91OaCJsyli+PFT3TYDKYOSrBSzZygwt99KeFcH6gekKgegm2ZXjA==
X-Received: by 2002:adf:ea49:0:b0:2ce:82f8:812d with SMTP id
 j9-20020adfea49000000b002ce82f8812dmr24080540wrn.54.1680426309262; 
 Sun, 02 Apr 2023 02:05:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i16-20020adffc10000000b002c55ec7f661sm6866365wrr.5.2023.04.02.02.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 02:05:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 11:05:00 +0200
Message-Id: <20230402090500.74334-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680426309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qxdOveZ9cvmeKihjF3cu3UMq3YuImnOtT5g4LYTD2jw=;
 b=cSJdecm3lZ1ZTjDcKnMfXXlV6jEnO7eji91N2Eb1P/u08vk6NMu4p6zfpGmRgHzMuq
 opG4wMOyK7Unwv4qH79gu2q5q6zzpjwbKv1jYD07ilxbLe1kBSFMVcwuOMxOAE7ocvY1
 +fkUpCRvmZcw0z2n+UMB3WGh5QA723q0ogdEwGUA0kRiwMeR/NmQ2w47yfTKjzua41ZW
 RdxEfd1gCdLGIxyWgyFiWkMifdo7DSXFcdnOSB9Z9I8fyVV2F8+oclaquNQpGijdX6QN
 9R7vhoel3Mni3fPhldbgEfOVPXeg9FPbuUFiRke10xcSU6QKPusXoch29T+TD/ISIcwQ
 dDJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cSJdecm3
Subject: [Buildroot] [PATCH 1/1] package/zeek: disable with libressl
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

Disable building with libressl to avoid the following build failure
raised since the addition of the package in commit
ea36681572255ec906167308c07adc42ed2ac9f9:

In file included from /home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/analyzer/protocol/mime/MIME.cc:7:
/home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h: In function 'void* EVP_MD_CTX_md_data(const EVP_MD_CTX*)':
/home/thomas/autobuild/instance-2/output-1/build/zeek-4.1.1/src/zeek/digest.h:22:12: error: invalid use of incomplete type 'const EVP_MD_CTX' {aka 'const struct env_md_ctx_st'}
   22 |  return ctx->md_data;
      |            ^~

Fixes:
 - http://autobuild.buildroot.org/results/2db2988d495f9d06d058fb532a2dcfa9ef6e207c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeek/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index 114ec4235d..730388ded7 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_ZEEK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  The Zeek Network Security Monitor
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
