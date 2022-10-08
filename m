Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D15C433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 17:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F33410BC;
	Sat,  8 Oct 2022 17:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F33410BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BMU-0g-2FKT; Sat,  8 Oct 2022 17:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997AC410A5;
	Sat,  8 Oct 2022 17:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997AC410A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E84951BF2EB
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 17:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE5DD410A5
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 17:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5DD410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMs_znLqne2z for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 17:05:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BDC8410A2
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BDC8410A2
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 17:05:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b4so11399952wrs.1
 for <buildroot@buildroot.org>; Sat, 08 Oct 2022 10:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pAQN+5XMtKkakA4QVhbwfXEiuEuL3j216qZpKiVDOZE=;
 b=F+CzWMDEerxGJdWwlMEnJ503Gpc6BETvax6CpiVlQOg9imxQnSjb2OKkvYtOPawzea
 hhN921QyhLi8Wzqg2MupiYJ9Tvb719VuM5q44L5+iv0U4Xtyej3p85JBfhndRYQ/2uSF
 j6O4QN/fGY+FL/MvHSNmZX1Y5muqIuL7pgccpPlzaqVXnGQWQUA8pyTq+pJYslZPDzzv
 TeF9QCxfVMxJMKD4lywLXfV6y0VxaG4P+Hv+6yJmSrsf1sbQrYImCH3A34KjZd3GKdV6
 r5VS3O3GEGc/ru7bAgS1/Wgi+5bw6bCzzOyaxYnOhn6JnhlLwPbQZKP3QowclVOLumVy
 fefQ==
X-Gm-Message-State: ACrzQf27Rzg+uVntrp5dTdvvAtDsJof9gcpnNIdAn6e8owvEnWQOYdGP
 E/HI0ARr2pzcve+OD3UyXs4dGY4No6A=
X-Google-Smtp-Source: AMsMyM4gtXxlJEpCllCZ3Url4sodECm3MMS/UcJB2eBdKkycTmtySs4NxZwQeDDLv7PGc9JBvFp2Vg==
X-Received: by 2002:a5d:688d:0:b0:22e:5fe2:35da with SMTP id
 h13-20020a5d688d000000b0022e5fe235damr6369078wru.660.1665248716767; 
 Sat, 08 Oct 2022 10:05:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47e8a5d22sm7821172wmc.23.2022.10.08.10.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 10:05:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Oct 2022 19:05:08 +0200
Message-Id: <20221008170508.62837-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pAQN+5XMtKkakA4QVhbwfXEiuEuL3j216qZpKiVDOZE=;
 b=Hcf4x17oJNqPjj637uC+GptytnOHdmzTDz1JZmYnOHExE5aqf9AKHyyZGCGEVwyCc0
 v0BaV7q98gAlc69BWvKsqtKMvv7u+5GKcd4PRbUMd2MSPY9zR40mRkx1Ie7pmAOpp3Yz
 +8UCojvNZjweWOARKWDJl0tFNPHFaXKt9uZCPbEKNbV6PgYiRsRyV2/9MrWiW+yQ6HYh
 Xg5mtyubjwHcjYr01twgm8VWGTFbMO2/NrQPyWlX2KZEpfvWaDp78rdcQp6p0OWVXmwA
 Gft+2vx3ofDtet9JShbNhQtcOkmX14daysIZO9sGGIcM9jr8RYDvq+5jQ82pL6LFondz
 fbWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hcf4x17o
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: add QDECODER_CPE_ID_VENDOR
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

cpe:2.3:a:qdecoder_project:qdecoder is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aqdecoder_project%3Aqdecoder

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qdecoder/qdecoder.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 05ee657131..c465617e26 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -8,6 +8,7 @@ QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
+QDECODER_CPE_ID_VENDOR = qdecoder_project
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
