Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F33C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4989760F55
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4989760F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1916E607B4;
	Fri, 12 Nov 2021 11:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftNpxigs8K_B; Fri, 12 Nov 2021 11:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E31260655;
	Fri, 12 Nov 2021 11:00:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A22611BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912C281CC3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8FUDY0Xgzcx for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CCAB81BC6
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y196so7345678wmc.3
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FtIdz9G6L9+SnDcOG8GlBosEUYFr1f6Sl9tvJv02Io=;
 b=HftZzrFysF7E8DxfLc52eAWGFPPZfBMz8cyNcyeah5UZz51QBmvnTgoO6sry34P+Da
 jwiZl3SdTOo84Ot82V6tDbXFF3YF0SZ13frey+pTozEQFAX8U1BH2osllvgdG1hpO/L+
 kq11w1wuFCvwbukWG2eBJc7DGFE3TR6qKjgvj3y75hpKQg18MxuZl/Og4qlbEdv7zEiH
 qEasT4tDCdTmpofYy314GQUot83hyk6g0JS3lJOhDIlFJGzpwBMYtapBOyuMFKVuTGjY
 jipYpbFfQ40WVMEq5DYcYzEhVOvJjbBM5JHx+WEBs82qe380UXC782XXgTFkieW8W5zy
 ts8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3FtIdz9G6L9+SnDcOG8GlBosEUYFr1f6Sl9tvJv02Io=;
 b=AgaqNRfebjwnMDEosyYtrpaa8pPn8M8v5V6TBFJ6pZDAvXQ0FWZaaverJdki9tDh+S
 dI+erJXfu0Gun9EQ3UZG2UCCVrU55Ec6TZJZiN+2aj+/JOwJhvizOdvWIUNKMPy4m3As
 wLPs5tXHUQ64IHmbmWy1Kh8EZARz8UB3LLQ5JWmGUlwN6cbHabokCPegeo67DieAqTPe
 Af1uKhNHJ9Lb14edhNZcsOx5OgSFGGIgIHukq2rRb9ItIshnD4HEJRxmUPIfG03sWOKR
 GahpRqtYyu8CSLx6t4SLLVDHlFbD8IObfFPnL8ViQq9ju9W8wFzhWUqe3TZ4Faqbiro6
 9tNw==
X-Gm-Message-State: AOAM530cCmJjSep4CTQJYTqKkNg8+w4+mqHobXfKSEG6vocbWyQQGuc6
 4QnudkfZPCVLv+NUfbyRPzVy5hS9cZo=
X-Google-Smtp-Source: ABdhPJw51eYYteVwwKpL0YwNXpg6zfDmmOW5ZWaYYfOe1DHRgdj5bhLnsJNf5ln0yxzLLSPr+82Z2Q==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr32487549wmf.73.1636714810492; 
 Fri, 12 Nov 2021 03:00:10 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:10 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:01 +0100
Message-Id: <20211112110007.787836-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/6] rework luvi test in gitlab after luajit
 version bump.
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luajit package has been recently updated to the latest commit in the
master branch [1]. But we discovered several problems:

 - LUAJIT_VERSION doesn't contain the luajit version anymore but a commit hash
 - With Luajit, luvi doesn't work without rng support enabled.
 - Building for 64-bit target requires a 64-bit host for all target platform
 - luajit and host-luajit needs to be built with the same option, so the
   bytecode generated by host-luajit is valid on luajit.
 - iteration with pairs() does not result in the same order since luajit 2.1.

[1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605

Best regards,
Romain

Francois Perrad (1):
  package/luajit: disable 64 bit GC objects

Romain Naour (5):
  package/luvi: don't use LUAJIT_VERSION for the luajit installation
    path
  support/testing: test_luvi: switch to armv5 to boot with rng support
    enabled
  package/luajit: rework BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
  package/luajit: building for 64-bit target requires a 64-bit host for
    all platform
  support/testing: test_luvi: make luvi test reproducible

 package/luajit/Config.in                   | 12 +++++++-----
 package/luajit/luajit.mk                   |  2 ++
 package/luvi/luvi.mk                       |  8 ++++++--
 support/testing/tests/package/test_luvi.py | 12 ++++++------
 4 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
