Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2616BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB356139F
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CB356139F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 267B5605D8;
	Thu, 18 Nov 2021 21:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBKpWQ182mV9; Thu, 18 Nov 2021 21:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690CB61BB6;
	Thu, 18 Nov 2021 21:03:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41F121BF417
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D3E161BA8
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfW1E0VdFR27 for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 21:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 447D4605BC
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 21:03:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u1so14031204wru.13
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 13:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1mjNEdo5H+KK6fYyKLl6OdJIFcrBaSE+0+V7Cmb8r4=;
 b=M+O55YN8qro9xDWhtvGtT7sie5tJaMj8uy/N0MPRPxZEmV/sjfhwY6RzmYtHSoClkg
 Mh895la1fGZjsnIfiPyN+akj7U6csTDJE5/FN2FMJ1/Q6QlkNtdLaczS4QASKDcyPkUV
 fAliqyDFV7z2BYFLoOSURkPMgzoIQ85exbfo5HJJba7Op72B0cKUMTY52Rpc25w3WJr2
 JeOti6FkOeZIPzerMhoLWuTmVoiat9EQyVJQlS+11U+M46JnQPthTK0Ap1mKfzAkd/RE
 lS8GyB/fg7WOJPirGWfxr1jc7Dbci0HOob/rzmJQD7rFihg/2TLjZLadxfq5GGQ0+DEv
 WBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1mjNEdo5H+KK6fYyKLl6OdJIFcrBaSE+0+V7Cmb8r4=;
 b=DDWfONUQInhg4FQyIHz7qqmHiGzRtlra8/4GZ0/G8TQFAPRNqdw4DZZW/cLaXNVCYq
 q+Om7l2Mz9CV5FqxWfZ117iB/NWG2XqBVDdW0W6Y/Aytbj/2o2jNgOyTFZCWDTjPY6Ch
 OiCBUPJddJXgj9k7T9j9IJZePwftyxy7JOmZ68SCcoTbbun2LoeRMegJpZiJxn8huZZ2
 VthXXI64YftZLuT6BwMTEM7YIuYETBEN9pGi1PQuo1e4Wk67CksKMYI5gd2Aurz/6tKG
 4mJtfG5uNhjo79LvxujhFgBs2XSdsCz6T2okoPEIt6VmNAJfad2FROXqWhNq8O+TT19m
 UDdg==
X-Gm-Message-State: AOAM530P3qZJgr/XRpLh995FmK5Ik32XKoYZn/PXqvVugcqzeY1wxCMD
 HS6MOchysFelgWNW0ruYmgHBkblJgaA=
X-Google-Smtp-Source: ABdhPJzpN771UTUJtiR5fyokwcChY1ESH11nyKpjGwFo+tqu6yyuSdGmlYRtE6B7xO7FiaoHcyE8wg==
X-Received: by 2002:a05:6000:4b:: with SMTP id k11mr612154wrx.86.1637269390280; 
 Thu, 18 Nov 2021 13:03:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m22sm1029724wmq.38.2021.11.18.13.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 13:03:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Nov 2021 22:00:49 +0100
Message-Id: <20211118210049.1598576-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118210049.1598576-1-fontaine.fabrice@gmail.com>
References: <20211118210049.1598576-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to version
 6.0.4
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

Various security, performance, accuracy and stability issues have been
fixed, including two TCP evasion issues. CVE 2021-37592 was assigned.

https://forum.suricata.io/t/suricata-6-0-4-and-5-0-8-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 74cc7435cb..098740e769 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  daf134bb2d7c980035e9ae60f7aaf313323a809340009f26e48110ccde81f602  suricata-6.0.3.tar.gz
+sha256  a8f197e33d1678689ebbf7bc1abe84934c465d22c504c47c2c7e9b74aa042d0d  suricata-6.0.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e7067acdc1..3255fd35a1 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.3
+SURICATA_VERSION = 6.0.4
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
