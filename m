Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CEDC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 05:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30F07403AC;
	Sat, 12 Aug 2023 05:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30F07403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsRkrNsrKA0O; Sat, 12 Aug 2023 05:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 651E3403A5;
	Sat, 12 Aug 2023 05:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 651E3403A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0DFC1BF42D
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 05:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A11F403CC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 05:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A11F403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDUcruhPvRMW for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 05:08:55 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEA814035D
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 05:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA814035D
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-583d63ca1e9so29373407b3.1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691816934; x=1692421734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FgHgXbcSs8Kf+JXq7xQ9a5O2y4smVnuhCulFpnxIbg=;
 b=YUf/pLwLDd+BTRWf7+FKN5L9j8edEVOUc6ZM1lk/e0zrIEr29W4kSlSm2wz2BPM9ET
 6yFLUf8Ea2OS1fLFPWVlO/7PXKbua/07O/VS2/rwvfdWkuvkMqNoJImW3G8Y4i3m2VJk
 HmaILFZr/Nrb2pe5vJjgNtl8I8awDvG19Jg/e6pl9/CyBLob9Y7F2+4Hm5dggjYgERkd
 bq+futDJqVwIbs/nF2RvlB9OnETEs6XwroFnTpluB1RVdyAhT1/y2UyFzfJVSL/layY1
 hy5nEvXSLJ3o+d/aIPk0otVXpkHTe9rYiX4BYQrr870Y/v12DroRiAfKKmeqapAaHJCu
 DgaA==
X-Gm-Message-State: AOJu0YyX/UqUwwHVV1RIxrKg966Exs6kQ5MynQ+zThMvF8mkajCNZLYS
 uD5Tv/WyPfS7SS/Kj8JLK+v6QhM89zc=
X-Google-Smtp-Source: AGHT+IHkrXT2hVpSln5SxqrI6B2UqLEPVl0J9EbEATlJSmEtKHjYGsEPTinqOPbLWtub7U8gUiBTjQ==
X-Received: by 2002:a81:490c:0:b0:561:d1b0:3f7e with SMTP id
 w12-20020a81490c000000b00561d1b03f7emr4187220ywa.44.1691816933703; 
 Fri, 11 Aug 2023 22:08:53 -0700 (PDT)
Received: from localhost.localdomain ([180.195.203.96])
 by smtp.gmail.com with ESMTPSA id
 u191-20020a6379c8000000b0053051d50a48sm4294393pgc.79.2023.08.11.22.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 22:08:53 -0700 (PDT)
From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 13:08:45 +0800
Message-ID: <20230812050845.1551717-1-alexey.roslyakov@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691816934; x=1692421734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4FgHgXbcSs8Kf+JXq7xQ9a5O2y4smVnuhCulFpnxIbg=;
 b=Efx9f5+w6YE64rTaUHdCvkdmFIuuwTbVa8tb32zIiI50a1m4oEOt3/Ne/Qdm2GP7mP
 IOF6Le4IhG3rOefnVSqAUZsHMeiqdgcJl7L1I5Mp/gojVeFClIbfNC0Um2Gd5ooSTDL3
 zUtc82yVrrl07jMGKv1rweazolkV80fWKNS0jZ2g8TZHO/oz6CpuElePIJ9f4RJGF0GW
 2LlmdqiyxbYngZZXgNUONlirYa3SJDlzBvjgiYofqIJ2sh+pkZjvhTyG4fZ5u4TeL8FU
 uOW5G1CKy+rWoPJplSs1KTvwKnT4JfMKpEeYLHcsxem5H6jTDUqVA7bOb9CiEar0A/Xp
 rvoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Efx9f5+w
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi: enable hdmi console for
 systemd
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
Cc: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most of the users use HDMI console on RPi and with increasing popularity
of systemd they face a trouble.
systemd doesn't use /etc/inittab, enable getty@tty1.service instead.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
---
 board/raspberrypi/post-build.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index b24256fcea..5da989f37c 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -8,6 +8,12 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
     grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
 	sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
+else
+	# systemd doesn't use /etc/inittab, enable getty.tty1.service instead
+	if [ -d ${TARGET_DIR}/etc/systemd ]; then
+		mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"
+		ln -sf "/lib/systemd/system/getty@.service" "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
+	fi
 fi
 
 # exnsure overlays exists for genimage
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
