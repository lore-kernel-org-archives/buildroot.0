Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E21EC6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC18F81312;
	Sun, 26 Feb 2023 13:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC18F81312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFMvqHBlgu3k; Sun, 26 Feb 2023 13:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9B581306;
	Sun, 26 Feb 2023 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9B581306
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44E7F1BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C6FA40550
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6FA40550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_MNs-2ws3Hh for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E96D640547
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E96D640547
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:34:10 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so5387580wmb.3
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pddMFwCCD2M2OyMdjw5rcXlgRELmZ9gXqn4zmr7mHZ4=;
 b=KDxjRgRl3asYHIvSuMzhzupZBHKbiqtvKkS7n/+na6jc01SwTFoDqufWrfdtEOAThF
 nEZ9tmWpZRRhNNtpwklAtq1kwSRT7bShLLQM/sS0BlKKYl/7NTnWF0jU7WS3uAP9uHgQ
 Z4SHMu8c7GwLKWIGPtgU039NEhyp532N8Tv/AsexFTzlcsJqRMr/5uYhtr38wmcji/ho
 U+pyEFVh3dafPbqZf5q0FxHyQsI4kk2kc1v69Y8rgseEjrIJi1XvAjBmsKCwSj0Hs5gy
 e0hoTkTKcYjRbT4KHeb1OFuOt2RgRPbmLtC2fJbq4bGGC6uDkve86x6mi4wDIGL9xoFl
 y/Tg==
X-Gm-Message-State: AO0yUKVRPNNXrgDZ08HFavMrETOPzNU+gr6V2ApYHvssuNwHq9YbkEL3
 t6u/NCmXkuerhLlEH1cVQE82LVDFs8M=
X-Google-Smtp-Source: AK7set+b0KULF+KC9Og8zSYBm88ps0bG1qrHPQvkVPtZ6dgx782KhF9uCOj1IISORRzLxdHGTIzYKA==
X-Received: by 2002:a05:600c:3197:b0:3dd:af7a:53db with SMTP id
 s23-20020a05600c319700b003ddaf7a53dbmr16824039wmp.11.1677418448711; 
 Sun, 26 Feb 2023 05:34:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003e0015c8618sm9551985wmb.6.2023.02.26.05.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:34:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:33:57 +0100
Message-Id: <20230226133357.97330-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pddMFwCCD2M2OyMdjw5rcXlgRELmZ9gXqn4zmr7mHZ4=;
 b=YoMoXF1QKRfg491UEf96jO61QlCeWwBYeK+UseQSE3NtShGx4+KIiBoi3LOpd3zf0K
 1Y/elUdccSuWYeSBA5OLButNKe2e2+MTh29uVKiEPiHzCaXJJee05pciRxN/44v0wc6j
 bG8Z5oh0RCp8erhmqd3KPeBoSIsmE+XpXb44jeBYi70NZUSUVJECEAtGWORHHwI65oyv
 MMwPcibzgR35Ji1a6QJjhG7mfFuOv4NcBvB21zcuu6sxHCMERHqgSD+bx/qMHNK0jeje
 hIsY6AWEALJjelp9VO+LPtnjqsdwaeulhGRs/4cTLbxqxYnFj/nP3q94a8nsPtQzwGL+
 n6Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YoMoXF1Q
Subject: [Buildroot] [PATCH 1/1] package/haproxy: security bump to version
 2.6.9
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

Fix CVE-2023-25725

https://www.mail-archive.com/haproxy@formilux.org/msg43229.html
https://www.mail-archive.com/haproxy@formilux.org/msg43224.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 2cd8ff1806..f5540ee44a 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.5.tar.gz.sha256
-sha256  ce9e19ebfcdd43e51af8a6090f1df8d512d972ddf742fa648a643bbb19056605  haproxy-2.6.5.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.9.tar.gz.sha256
+sha256  f01a1c5f465dc1b5cd175d0b28b98beb4dfe82b5b5b63ddcc68d1df433641701  haproxy-2.6.9.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 35b1770d38..2c54e1c2c3 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).9
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
