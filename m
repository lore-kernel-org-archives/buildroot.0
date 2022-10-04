Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D113C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 10:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9750F40B83;
	Tue,  4 Oct 2022 10:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9750F40B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYypfjumctmZ; Tue,  4 Oct 2022 10:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC307400D8;
	Tue,  4 Oct 2022 10:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC307400D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3B891BF27A
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 10:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABE1E60D5A
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 10:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE1E60D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mE5dp8LNx2J for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 10:41:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B424060881
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B424060881
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 10:41:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j16so8729068wrh.5
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ywXJ1Kin659Ao7cPg5n6dDVTnGTigiOWK11ejNp0jwA=;
 b=7woYaY2DNVVklgi2q4m890Ie+/ir312zJAtHXKgyUJSErrID6sVCpeCZBNqqP/u14m
 dfq84AfUDS1dy5htauXpyI+7HEcuwCEOeCeSKYFs2WdrJ8ZkjgM2mGq9ffhVih6El7O7
 keKfHFJZHOA9VR+U4su6aZzQc3zG2ewv3I+iNglsehCiM8id589wrOpG5nh2QIZglh+N
 nv23Yda7moN8mBZkWrIUrpKv75gvUbCtdoqRavActEL52OzZVyh8aQKc9xuTWRvcVn3B
 nf9oUHt1SXv8PlPr6MP6p4mWO/6SLtqwKrJg4LCaO7CkyeZnKMx+1WRT1FCnlC8PC0MY
 E00g==
X-Gm-Message-State: ACrzQf3Lt00NYd8WKiYdqfd3+PyChbCLGDjAFnZUrGYFlnHsBGYJARV3
 siUk6i6VLo4Y4I19tFoQU5YWn9/T56qrJQ==
X-Google-Smtp-Source: AMsMyM4acetKnpchUJ3ZPrK70pWy1hpf0JZXZ7GpfxeHteyTcmvm3uslfSSULUOvQfFjRpyaz9jr/A==
X-Received: by 2002:a5d:65c6:0:b0:22e:36aa:65be with SMTP id
 e6-20020a5d65c6000000b0022e36aa65bemr6807500wrw.531.1664880068876; 
 Tue, 04 Oct 2022 03:41:08 -0700 (PDT)
Received: from centennial.enunes.eu.com (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 b1-20020a05600003c100b0022762b0e2a2sm12884574wrg.6.2022.10.04.03.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 03:41:08 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 12:40:56 +0200
Message-Id: <20221004104056.1429815-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ywXJ1Kin659Ao7cPg5n6dDVTnGTigiOWK11ejNp0jwA=;
 b=fBRIOl5GKozAl3we4ycYKL+lW08ZJwAxxNrXgQ354V9zj7bn8ugojmd8PBBOduWEJ9
 I0ujvAyYUbghwie/j2ak7vLnXf6ncoq0qqPzzncUjiMIWUVLpcKzADt1NTDcum3bQI2F
 3R3ZaBPn4nPETj4u8hw0NP8wqbrO8hmCglH7Kja0tMzXrdtpwOs1BR+VHNXmyn4ktODg
 NGOI32KPM/f9bbI4zAeCcEiATsnahOJzo+rHdlcwACxaxj09Q7Udgz2ZIXgLCP4k6NZB
 ygmy6XjokmYnqMRJYUaYgyes6qLYZAQT7aG1/0iimYrXYmLGBFNKhznQNL6anod3z7zt
 nXKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fBRIOl5G
Subject: [Buildroot] [PATCH] package/acpica: fix legal-info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the recent version bump, the license file is changed as it was
updated to the new release year.

Fixes:
http://autobuild.buildroot.net/results/93ad774a7f69e761952a3a6c92a24de7506e6312/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/acpica/acpica.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 4b6981c602..564e393cb4 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
 sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
-sha256  c7c5facde0edec64ce403043082a4b288543b9a120d86a23bba3be7585e021aa  source/include/acpi.h
+sha256  40d8e351f8dfdf5340ec76ac28f0c201b825077d7060bb3686ca1112cb26985d  source/include/acpi.h
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
