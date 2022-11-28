Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83C4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 17:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECFB3400DB;
	Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECFB3400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0-vwAK_8-vQ; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 334F64025D;
	Mon, 28 Nov 2022 17:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334F64025D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 951461BF335
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FBD381241
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FBD381241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQkMxbg1p9Lb for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:58:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C65580FB9
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C65580FB9
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:58:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id e189so8200262iof.1
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=0LaxCpKfMo4ObH2gbAKyZ2pUVbjVMf+iDmC4V6PC0qZ2i/wmB9fBrk3FiI5A+GMERk
 jOilG1LiM9sWC0paFMRt2xJhTf+i1VX1N6NubO9CJ/Z/rd5ydKnWYIaLwmyNnrduEaZz
 W+9Qx1UZvceH2dr6CHl9xSuL9vVkzUup7b8SluU2HNf925Wz74iK5h/rr1AgxRViSMsw
 19fgQPtijNaWjdfoasrsWN5pzdkH6MN0GCgCI8YnYXWUl2I6U6UY/qhya+PgHjxHPSVo
 bI58PPQHZlP+8haHhuaRLugvt+dzhl61pO2KnWPY6RHjQTOKz9omUDVcvY86OcsNaFf1
 VSaA==
X-Gm-Message-State: ANoB5pk4XkI+gE/NtXukQQ+LDjEuPCvC/LOoPn3lCsiOtTpwnufaTqLg
 iSbxP1eM8Lepk0EHQ4rTQpFcGQbQqkHewg==
X-Google-Smtp-Source: AA0mqf6gCYb3c7K3Rm2tLB1cfC8MhTwgN1uOOHfNHBLw5YJPldRlVCEf7TLmEEaYx5GdCvUWcIHeDg==
X-Received: by 2002:a02:782e:0:b0:375:afff:bc23 with SMTP id
 p46-20020a02782e000000b00375afffbc23mr15640020jac.221.1669658335239; 
 Mon, 28 Nov 2022 09:58:55 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:44 -0700
Message-Id: <20221128175851.1913859-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOl1SFancUWBmaUskg9qalpFSV6K1zn9VYSj3ymI/84=;
 b=MSWSh6WcemZpsaXT/YJM2dg7QxsEZBH0nxzzBYxVZ5h4JGRAEzLqXQaSnSwqZFD3K6
 to8xS+Im+K37EXAviS1nkJYQtVsfmb3DIPexky7Wlzk13SA3NMOuVilkSQcPSsxV2SPE
 +1Hy/RUSZ56VDdhidNlPokPvaPqYF8Z021YP9x0iSLDogb3XFypPRaSixUC7dEtkD1PX
 /1LTaOUx9XoXckmaIE0MM7gR9gM+EM7jCH1yc3VcFtoZSeapEmnPiUCzM+Eg63mVAtUy
 D1yOtMhEQwS2nw+xF3MRzU7wPkdgYJg0J7fjJfpZ5lUopiH1H7UOTRlRkdwF9bo7j7Yb
 0ahA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MSWSh6Wc
Subject: [Buildroot] [PATCH v2 1/8] package/flatbuffers: build position
 independent code
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upcoming tensorflow-lite package requires flatbuffers to be
built with position independent code.

Fixes:
/home/buildroot/buildroot/output/per-package/tensorflow-lite/host/bin/../lib/gcc/aarch64-buildroot-linux-gnu/11.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/buildroot/buildroot/output/per-package/tensorflow-lite/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libflatbuffers.a(util.cpp.o): relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZN11flatbuffers11CharToUpperEc' which may bind externally can not be used when making a shared object; recompile with -fPIC

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/flatbuffers/flatbuffers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 9d286bf9e1..487d85ee1f 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -14,6 +14,7 @@ FLATBUFFERS_DEPENDENCIES = host-flatbuffers
 
 FLATBUFFERS_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
 	-DFLATBUFFERS_BUILD_TESTS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
