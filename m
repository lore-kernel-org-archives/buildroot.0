Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B7EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 12:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94BF410C7;
	Mon,  3 Oct 2022 12:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94BF410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9UtxXVt08pF; Mon,  3 Oct 2022 12:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752D3410C2;
	Mon,  3 Oct 2022 12:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752D3410C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 008BC1BF29A
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 12:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C80D0410C2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 12:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80D0410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvRRQ_3cGU0R for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 12:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617FB410BE
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 617FB410BE
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 12:04:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lc7so21675239ejb.0
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 05:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5NS1Y2297I6w+dMEHcdMwNG8uFGNbv6sYr6Ug/Uo8mA=;
 b=VyFJ3AFuAFZcl9xCrA1S3Pj7UQa1nqpYcQ2w4SpCLrEqJbmDLWlsUiV8F8dCDpR0WK
 /tBdj5qcIiFFbduVT+v46i+mYYEfqzHyCq4I0nI6fKT0tpiZmt7DFGah9FLDZ4HAgAFV
 t3GP2Hj2OKABniYLF0AxAb0c7A2iHiqH5ow/k+a0CSBVDzf2iaSV063zQcIvJTLoRnsW
 pbZYs4b55nwClf0bB/09OI5Tld0amMjHgD3gNYpbshnKqfDH+5Xin6WEdfqqN+kJE5L5
 Yb0rucCdpLs3AqoU9qb+RPDMT4cFSIiIr2vwsgDrrPZdacPHSTeBVQvU6IYAO+0D6cEf
 mzFw==
X-Gm-Message-State: ACrzQf0QMrEEPe44+/j9pMpfhpofyZAZrWuBYP+aWoVaK4c0Ehbe3cPH
 66bmUzQfIWGijaUSBfugGI564jPDkRZOlA==
X-Google-Smtp-Source: AMsMyM7dxp7fQdVEDS84tu/sVp/WJdeSXI+xct/w744Kcgfwobs4npql2wYi0eGiSCcIi8d16uQbuA==
X-Received: by 2002:a17:907:7629:b0:776:a147:8524 with SMTP id
 jy9-20020a170907762900b00776a1478524mr14932923ejc.632.1664798647414; 
 Mon, 03 Oct 2022 05:04:07 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 ku8-20020a170907788800b0078bfe57fc7bsm1190010ejc.47.2022.10.03.05.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 05:04:06 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 14:04:02 +0200
Message-Id: <20221003120402.2503418-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=5NS1Y2297I6w+dMEHcdMwNG8uFGNbv6sYr6Ug/Uo8mA=;
 b=r2avI0RzAuGKIC8u6kaR4SRx0M9LS3FXp2ocPsv+uN/A3/9zDpsV2LQ8BBs/YmTegp
 Y9ecOQJefsMs5cwToEVx/+wfZwQFJk8QXZfdUmrEytluxbB65gRZV34tc9TDghzkIZ4p
 UC0fwHJYIOHhAB//A2M291k9UpnVB9AFZImdo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r2avI0Rz
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 3.1.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump also the corresponding library. Updating the hash location because
the sha256 sum was not updated anymore on the wiki and there is an
available md5 on the project page.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/apparmor.hash       | 6 ++++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 497491b6c9..1cc531a8a4 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,7 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# locally computed
+sha256  cd52a5643c115b223c199e96ab03d6d5d7d72c266ac23cf74a08f32f003af9d7  apparmor-3.1.1.tar.gz
+# From: https://launchpad.net/apparmor/3.1/3.1.1/+download/apparmor-3.1.1.tar.gz/+md5
+md5  28e438d2ca947260ccbb50f7ecb47cfe  apparmor-3.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 76c9f2cafe..cf7be888f8 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
+APPARMOR_VERSION_MAJOR = 3.1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 9fbfe3b92e..a411d53eb4 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,7 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# locally computed
+sha256  cd52a5643c115b223c199e96ab03d6d5d7d72c266ac23cf74a08f32f003af9d7  apparmor-3.1.1.tar.gz
+# From: https://launchpad.net/apparmor/3.1/3.1.1/+download/apparmor-3.1.1.tar.gz/+md5
+md5  28e438d2ca947260ccbb50f7ecb47cfe  apparmor-3.1.1.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
