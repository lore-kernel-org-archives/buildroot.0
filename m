Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CAAECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A525C83F02;
	Fri, 26 Aug 2022 12:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A525C83F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBR3i5ayLRx2; Fri, 26 Aug 2022 12:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B917183EF4;
	Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B917183EF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A70C41BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E0D40515
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E0D40515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oR4K-Jb4taoo for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:52:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8325A40192
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8325A40192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:52:59 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d21so3003336eje.3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Xx4kvnnbEUGesnupoTu80viu9ga6D31KQ5I5mDpLpYM=;
 b=xiTmd3fUX4nBp28UtwssH7A82eW6cnetHrB/VR00JWdzC5YscRJYkStNWwbO6zfkqw
 xeUwwytLxbinQJjdyBU3sIr3JKU66EOMpbRl0D+JYyZOuYkSx6yyUIoXUu3v4YJfMkFd
 ctQaRowdqWTSLeNqP98AayygouGHLxcryaq1oSpPDK9OLzD1bc/WccSDiUg9ioPeDW5X
 mVQu0myVws9SOKGK9kp8a4A6rgbU0fOagDhhcsxsTPnOPWG9guI9cdPXv1pFMWuy+SL5
 ovOUqlS0MjCEF/GTQAG68sPrupOmJvmFWskThZ+ITi6h89sGkCu4GvzkzvdrZL2NiKLi
 FhTA==
X-Gm-Message-State: ACgBeo3HXoPx1RjHQg2OSGH0BQ79En4vvDeghpAI+Z8lYfv+50XHZtWN
 HSzkLZmnGImXh4k1tQ+orxaq4eaO4Rh0wAHV
X-Google-Smtp-Source: AA6agR7QbIepL8q0zhSesV4Dp11V0gNv7T6UqFZFUfES/vS7CbCfImjpm+1Zptdf8L4Jh+nBIoI77w==
X-Received: by 2002:a17:907:60c7:b0:731:2be4:f72d with SMTP id
 hv7-20020a17090760c700b007312be4f72dmr5475159ejc.639.1661518377332; 
 Fri, 26 Aug 2022 05:52:57 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:52:56 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:24 +0200
Message-Id: <20220826125252.16782-2-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Xx4kvnnbEUGesnupoTu80viu9ga6D31KQ5I5mDpLpYM=;
 b=W87Mvz0Vdaxvkn0V3RxkrB9Xc+apTSfWt5uj9bkkQa2EH846PrWzKK+UNUbx5iHNh6
 TlDO2msHWRa7nn3r0U91g9/KTOo9/wopQqhIeSkvFW4gkZRlyudyvXTSysB38OpGTzAx
 195xVidSwL0SRS5uI2NhxTLDGmU+Zjy3kBE9T3grePTdRqehTJu23wCrIvnRJNIf0Yya
 +IxJ80Wu12FXm+s6R5Qz7hF6X2vFBr+FmpuXmVVivc+lGOLW0VN1OgW8lSziOD5x1Dz3
 EUCC1U+9luSl8jfaz/+LdRoe8QbqMrI4jd7qr35PAg7csZcyeCahvYnpdNN7tMSQJzMB
 K/6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W87Mvz0V
Subject: [Buildroot] [PATCH v3 01/29] package/qt6/qt6base: Add qt6base hash
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hash file with just the qt6base tarball hash

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
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
