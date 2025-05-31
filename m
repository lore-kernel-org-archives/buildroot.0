Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E58C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92ED606C8;
	Sat, 31 May 2025 21:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuudDMLYwl7K; Sat, 31 May 2025 21:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1193F60A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1193F60A9E;
	Sat, 31 May 2025 21:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D743117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F3184176B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60lx6eN6Bn0H for <buildroot@buildroot.org>;
 Sat, 31 May 2025 21:24:47 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=stephan@asklandd.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F0554173B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F0554173B
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F0554173B
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:46 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad89d8a270fso886465766b.1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748726685; x=1749331485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IeXTIqjcC3xgEsYbyTNXM/Qyyd71szuwHs/SNZu1bTA=;
 b=wn8z9LSWYy2PiqKuQx4umyf4hHZ+dKBMJV0agNUDocxzny8tDp0OQbgmiOJLCLr6vd
 Yc7OWq7+AHqpPwnH5YurHP86kPVzKW2KSl3nbITu/oOI/PM/SXtZDBQWfFzAwaJkDb4E
 TQ+lsTHTMrIsTtF9NmOftRO5EEEJgkAM8E++S82S8JTCAjluTdbhV4WZP6XTTrRyTO+4
 Wskq/pc3syOqmiDYW634keMPnLCHeGL31KUE3IDUpGz/v3Y82WfbVgtP9y5rv1XjJDAW
 feY+6JZRoWXChnjXjI+HW/a1oC+z2WQ1CZ/+DHQumDHaE5HcDm0cWP1eMU7ai24DYkOh
 6Ofw==
X-Gm-Message-State: AOJu0YxUlw58VTpOKIgC0QOzNNCQsz7twOHrMeHzm5UsrRjA1cIQ7brO
 fDaAgc+QxtzIqdqs5pd1BOkJzg5Iwzrthpsu4/vFzFDWzNf7fmthuSZnHEX/zH+AG8RoQ8OCQSI
 P04zWuuo=
X-Gm-Gg: ASbGncsPbtQYWnOCEvqeFTKAUVVZCZhfgF6ncI6utHT4eBaupvcQpNXRMz1du9yaeki
 XYo4BfLLYOFKhP+L6kOa4xPP6KtW/RXwJzLBvcowZOSluEF/J15ig/1ihCycQI7c/qka+7VTB0S
 6Jn9XSPS2VoFSzhkQYxsFslUszKMVedYVxuZTvuiUOaQRfJmAjwkc+E00O34xM1HzDxFjWcIRO2
 +e7LYmpqWYSN2r/Q7zgN/e35RSQXEALXX3Xs69mCGiaW3XAApWYJKYHcwxlekjW39e+qK/ccb7/
 BHFtQX9n4lBgl6Cg71ILr07NyzIZfY5xCDi2fja4HFsA+ZF/eDCtIuOpxv1aArS6bNLsJ7QdUd3
 foca5ga8V193kPSs984QJWTwv1juEwlvFtPNobgI=
X-Google-Smtp-Source: AGHT+IGq7S7BvHG5vwROp3v6rNvlXdX7wneXPeIA6SoTstHwMaZ5oTIp6NyAv0fdDxDkBmToOHL7FQ==
X-Received: by 2002:a17:906:d550:b0:ad2:e08:e9e2 with SMTP id
 a640c23a62f3a-adb32daf0bcmr642543966b.27.1748726684438; 
 Sat, 31 May 2025 14:24:44 -0700 (PDT)
Received: from localhost.localdomain (85.184.166.47.static.dhcp.aura-net.dk.
 [85.184.166.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2befdbsm552358566b.97.2025.05.31.14.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 May 2025 14:24:44 -0700 (PDT)
From: Stephan Henningsen <stephan@asklandd.dk>
To: buildroot@buildroot.org
Cc: Stephan Henningsen <stephan+buildroot@asklandd.dk>,
 Stephan Henningsen <stephan@asklandd.dk>, Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 31 May 2025 23:24:33 +0200
Message-ID: <20250531212436.2788813-1-stephan@asklandd.dk>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20230601.gappssmtp.com; s=20230601; t=1748726685; x=1749331485;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IeXTIqjcC3xgEsYbyTNXM/Qyyd71szuwHs/SNZu1bTA=;
 b=S208B+yE0ixiCrl1miAHiPJeE1gDEMX/JfcU+kRfEFgBYA0bFxptopzt5CY8v2Yf2t
 uyGWoOMSRTmCR6aDGLvRs2KjOOvpVElBFh1qRF4N4H5fqE6lXKWRdqm5QutLuWp0ywft
 m8BSOBHezAd5RldTwX0484aVRVqvm8qavO7fVDUDzNsvHQea/xCc+KniEk3xpHugqumV
 73tmeVbox31SShZnRqdfp6pMZW7Sx9NVT5P2ai7qFfZ4yrsLnGnt/tYuu3P8dVzCHr1Q
 +UNAIeruLYIpNaFf7elvFCgCqdpNXRp5440DEjmDDGWUB3zNfKZkFanzZNZk+xKSTGGj
 B+Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=asklandd.dk
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=asklandd-dk.20230601.gappssmtp.com
 header.i=@asklandd-dk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=S208B+yE
Subject: [Buildroot] [PATCH 1/2] package/busybox: fix path for crond binary
 in S50crond during stop
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Stephan Henningsen <stephan+buildroot@asklandd.dk>

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
---
 package/busybox/S50crond | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S50crond b/package/busybox/S50crond
index 74a0c0849b..7083a36cb0 100644
--- a/package/busybox/S50crond
+++ b/package/busybox/S50crond
@@ -36,7 +36,7 @@ stop() {
 		echo "FAIL"
 	fi
 	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
-		--exec "/sbin/$DAEMON"; do
+		--exec "/usr/sbin/$DAEMON"; do
 		sleep 0.1
 	done
 	rm -f "$PIDFILE"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
