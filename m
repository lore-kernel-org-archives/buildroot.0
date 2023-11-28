Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BC3C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB6B81E92;
	Tue, 28 Nov 2023 20:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB6B81E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdEbpRKd-iBj; Tue, 28 Nov 2023 20:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2DF81E8F;
	Tue, 28 Nov 2023 20:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2DF81E8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04CCA1BF371
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFBA84048E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFBA84048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prvLjUwPF0_N for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:12:56 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE3B40297
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE3B40297
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b3e7f2fd9so30581665e9.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 12:12:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701202374; x=1701807174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQMsjHXvA0jNosUThieZO5TRA24uLA3zwXLvRz8FLY4=;
 b=jWWKq1o4Uvr7oulsiPVCkctm24mEnoLZf7PZKvb3f+8/oafds82TM1Fg8VWoCoA+l+
 2D6lrQ3NbcBwJkioKVU6ZLfpqu8Yt7OjUHaV//ZLGAq/yrmvTn1enggvSAhjRqzZniFC
 oMW8HWN4MXjiu61KACyC/6GWNAOo4dVRZRHBMpNQGdVAtOkvmVdTPGjqgX8hSFcZT7oo
 rYLcn6YDP/PgZlx2mteE4LZlVNHtav4Dq8OYX0VST/ciX9B9P7hidAksNNY5VqPDYrc6
 pQX3pA/n32agyKHoWnnniF//V8C2zK+l+qYZkKoUEeti2bTD6A6KOnK2yv9I1lTkyHcN
 RU/g==
X-Gm-Message-State: AOJu0YwYkhWokhPU/9RGwjBzGhju5oeb1eHCTcu7r85m0fWzPCd649Li
 7CVle1ffxCSIjVE2HBcY0iIrwkh4n2k=
X-Google-Smtp-Source: AGHT+IH468jBzqr5GGlxtEyqBIJZhkiqIjUGbAw+CNkggf7T5TMYfsDv4b4PiP4w8aDyUM4H81Epdw==
X-Received: by 2002:a05:600c:1f93:b0:40b:3dc0:1ff with SMTP id
 je19-20020a05600c1f9300b0040b3dc001ffmr8979879wmb.6.1701202373444; 
 Tue, 28 Nov 2023 12:12:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b00332fda15055sm7905939wri.111.2023.11.28.12.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 12:12:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 21:12:50 +0100
Message-ID: <20231128201250.396808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701202374; x=1701807174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RQMsjHXvA0jNosUThieZO5TRA24uLA3zwXLvRz8FLY4=;
 b=PGV1x6bNZ3ZAv2+Jng2xndb9GixZVot9kByeczKtD6awibOSqpJKEiPZkEXmwunJXf
 B/z1s+eL0MAGZSQ9DjsYKkozZdvI9BpvHhmw7NRCsBxO/m7KG0PEvKr6G7NPYjUNTu+6
 61PzkunE+OyOq/va1sHihW885JTjkCeZT+1CQuuKm2tXO53HVWC3TR+MqNEq+l81Q8HS
 E+jK3Tk4NDUk222tLhRKH59+saAiVR2xsPbS6zDKuVALYEgfCOIja9p7QtG9s7NNrQ8N
 6MRLd5ke0EDax2v2tgs+HOi2pgCSPa/cu9tvzsLZpHhi23CKM0Vw+sWPl9/yH+ALGxyf
 nmWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PGV1x6bN
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump to version 3.0.20
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-47359: Videolan VLC prior to version 3.0.20 contains an
incorrect offset read that leads to a Heap-Based Buffer Overflow in
function GetPacket() and results in a memory corruption.

Fix CVE-2023-47360: Videolan VLC prior to version 3.0.20 contains an
Integer underflow that leads to an incorrect packet length.

https://code.videolan.org/videolan/vlc/-/blob/3.0.20/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index ef381e5934..40529bd664 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha256
-sha256  643e3294bafe922324663ca499515b7564f2794575fd7d2b7992d20896381745  vlc-3.0.19.tar.xz
-# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha1
-sha1  6d162248a26fdd76a9d4e7e3d52f40d4326f72c1  vlc-3.0.19.tar.xz
+# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha256
+sha256  adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5  vlc-3.0.20.tar.xz
+# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha1
+sha1  b834516ab701bf6311980ed5d67b77c834fdebe7  vlc-3.0.20.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 729e928b4d..d0fc1744c0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.19
+VLC_VERSION = 3.0.20
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
