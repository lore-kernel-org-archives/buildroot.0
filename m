Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA6BECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C74A610B0;
	Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C74A610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjKoolo9TzLv; Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8047C610AD;
	Fri, 26 Aug 2022 06:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8047C610AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD501BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6935D41983
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6935D41983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaiNMGdLN57o for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E154197D
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32E154197D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u6so933464eda.12
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KXtJjVJahjtMbXmXWxhAsDJuAtpcg2vmhl3jEYnQSpg=;
 b=4CrYf0RxkCGbUhC/GikA7BhOnjbjOl5A82rZRxGUw68wLgskP+S7WJVsG4+ukIv077
 ovqPbaY2NS45yGPynPaZigqFb9XFV5YTXX1iXqI2YXaBsGDaEs4NPOE1gEwoeKUH5gV5
 H3tf17ldNNNnvs8P/aasASvwOtUQ7gNLBuTMBV6XU3K955o/AYbklcSfNiHxv8Pkhd0g
 BLe2ViqtiZ5TzGVGI4353GEQOGbs0CTnk3s2y0JAlmd+fsuPfM2icye7ZJn5LqLLsy8q
 ekbhTHDSxQIy61wzFzG99vYZG0BiHirfjhE9hQ5hHThhLbR06+Hk/Vpi/AJvzLQSsBs4
 X6ew==
X-Gm-Message-State: ACgBeo04x0ckVMKAtFuLrm7RnHSLYywMWdBBYYc/UlI+OhZNBgP3EaZa
 K7/TehLkzGuPem0ttjS6T/+Av5uwqHMjPEMn
X-Google-Smtp-Source: AA6agR5ooX7frGtDcEe+ACk2bARHsf38E0R6XIp2835ev62gV1FjaGe9OiM/E9wdKsEm0tORXZ2gLw==
X-Received: by 2002:a05:6402:d0b:b0:443:df38:9df with SMTP id
 eb11-20020a0564020d0b00b00443df3809dfmr5591291edb.9.1661496482869; 
 Thu, 25 Aug 2022 23:48:02 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:02 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:30 +0200
Message-Id: <20220826064758.3968647-2-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KXtJjVJahjtMbXmXWxhAsDJuAtpcg2vmhl3jEYnQSpg=;
 b=EiA4YIy+ngy+4fnuJ0GCxur3+lIYOAQaeZB8E5ms+go0/NeHxcBJSyRwnhDS3z2cEV
 xjxqtg6VcpH6zpRsT4wYvQ9glOYkOmkKy3Tu8meIj+c4uiPTrtxbBTmrpH8isOlee+up
 5AdFKY1tdn+9v/bjzvbX+7bIX1ZK0XSbMn8ofln5ZJQvjwJYhiyngnU+PzEiB/wpi2XJ
 TvmBq82QMLoRIfbW+01QRwMrkCK+hTrvBuzE2bUVoHZcObDfdkLHr5orHbSEAJVU+If/
 wKJUEADbTuWkmji3igsl0hTFUIUjnxhDuiFP6ePdDNcvxOxnZoA3ePZjB0QtyRwv1nS5
 70OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EiA4YIy+
Subject: [Buildroot] [PATCH v2 01/29] package/qt6/qt6base: Add qt6base hash
 file
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hash file with only the qt6base tarball hash
---
 package/qt6/qt6base/qt6base.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qt6/qt6base/qt6base.hash

diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
new file mode 100644
index 0000000000..31ed2494af
--- /dev/null
+++ b/package/qt6/qt6base/qt6base.hash
@@ -0,0 +1,2 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.3/6.3.1/submodules/qtbase-everywhere-src-6.3.1.tar.xz.sha256
+sha256  0a64421d9c2469c2c48490a032ab91d547017c9cc171f3f8070bc31888f24e03  qtbase-everywhere-src-6.3.1.tar.xz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
