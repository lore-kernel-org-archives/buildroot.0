Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D813C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04CA81E61;
	Tue,  6 Feb 2024 12:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTj1dyh50FaO; Tue,  6 Feb 2024 12:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D9581E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D9581E65;
	Tue,  6 Feb 2024 12:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBAB1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9CB860B9F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9CB860B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOlaM9kKKSeu for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:50:01 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5380A60AEB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5380A60AEB
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40ff2838851so1358035e9.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 04:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707223799; x=1707828599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=znN1KqNsi29H/u/cq+5Adwebc2fc3SohGkylF6tYkiE=;
 b=tze1IK5hq82pJnRA+VX4WPQmQ8MsRiq7iKgu+dD0ynEDv7PkE2vOSF837HUqlIbsuU
 P3gIA7ui3MbbhA5IJ4vdXqZzk3w+SULDfAETppYgWe55y+y+OkiUvdT4pBNVzCcba4Gs
 B/4snZLvZDZE+uwepvqhBbscUCvW7Yvz4rMEOlFcBy9CI9gsjszi7dJrQbcEmWQAFZES
 3t7bDucxRwqvDYl3c2s6xy9hPt5VzWwYbTQkQ4u9zZHNc4jBX13obdOzi53QNkXd8S2y
 s1AYcmF2KzTJvDdzAp8YEjHoLs4IAhaDSRfFLZBbctSBTwgy5qVt2FwmU69cnbdkuoST
 3Gwg==
X-Gm-Message-State: AOJu0Yxgb6VK+FFXaWKzuqy+FWT2ZJhUvmU7xejhjMlnCRod4rmQY2x+
 ATpDL9vXtDsa+SovV4UZw4XWsISgpN0sfHPz8TcrOLe/9knGakgI70BaWjxbSRnKGg+BF8SEGXG
 Nie8=
X-Google-Smtp-Source: AGHT+IF74/3FwW/i0m534ZJ5vzJPYVdZEPHh3z8YHLA4cMXaePWDivBUkQ3NJbXNKPdON2qLDE9m3A==
X-Received: by 2002:a05:600c:1909:b0:40f:ddce:cac4 with SMTP id
 j9-20020a05600c190900b0040fddcecac4mr1558944wmq.17.1707223799330; 
 Tue, 06 Feb 2024 04:49:59 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b0040fde0ec31esm1887265wmn.31.2024.02.06.04.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 04:49:59 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 13:49:45 +0100
Message-ID: <20240206124947.1617078-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707223799; x=1707828599;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=znN1KqNsi29H/u/cq+5Adwebc2fc3SohGkylF6tYkiE=;
 b=ekrcwId1HOGrySQqHl+PtvOL8Py5/DzuuJax/8SH1uFIoZAJeFAcQJ14mUlmpDZ/Gh
 9NzMhR64swtCwib89wdDOWNhwxpHYOZ891RhFMOmuqxfrExoNfyqHcGSi21EMGq0QCQU
 vn7X7ONsZRNKQBEmEj1LCOAdTi0RZIkRDqrhysyzHQt6Fcb4MLftpkEgzU5zaEHT47Xh
 Szk7sC/IOF6dPurnF5IeOIPlNDjosZpHlA0Up81ud2JRtEs/yJugxrrlz/Et6IzEGah4
 392xK9AURTDIduNy2ze1CM7WuGlHTiahpgnTPTQ0EG3Nmdg4uasdfx8PGl0S8wkOiEun
 lzdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ekrcwId1
Subject: [Buildroot] [PATCH 0/2] TestGlxinfo fixes
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I initially started looking at TestGlxinfo some weeks ago fixing two issues
at that time but patches requires some improvement before submitting them
upstream. In the mean time a new runtime issue appear due to x86 optimization.

Romain Naour (2):
  package/mesa3d: fix drisw build without dri3
  support/testing: use core2duo cpu emulation for TestGlxinfo

 .../0006-drisw-fix-build-without-dri3.patch   | 58 +++++++++++++++++++
 ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 ++++++++++++++
 support/testing/tests/package/test_glxinfo.py |  3 +-
 3 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 package/mesa3d/0006-drisw-fix-build-without-dri3.patch
 create mode 100644 package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
