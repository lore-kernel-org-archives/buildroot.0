Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A74CECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 10:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE80160A9F;
	Thu,  1 Sep 2022 10:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE80160A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6ClJTRYyBC7; Thu,  1 Sep 2022 10:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E2261154;
	Thu,  1 Sep 2022 10:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E2261154
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDA3D1BF3FB
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 10:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B5D82D07
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 10:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5B5D82D07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QL0ptgERYJ5K for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 10:58:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B5A782D04
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B5A782D04
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 10:58:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so9155703wrq.10
 for <buildroot@busybox.net>; Thu, 01 Sep 2022 03:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bO5NJBNQLdKsDYd/PM8iN+qDNJqTLUpZgLBXEBuxPIc=;
 b=eSbEuZe0zInzwQ5p5jDWdJoTNfr1/4/W58Rguj6Q/RKACvbStZ9GbBmQBmS0X4cONU
 d7+3zw27mXcVfG7EO4mJY2FkgwpTNMewrib/PzROz+fdXmclCrBAAZSFXwfAYrd8GhKF
 XSyiFwT7OWmBj/sbrltKicC1EIy0NnMEAVVvW2/pZ+nxiiNdVpfrzZl6nwqQ1zZ0Y+fw
 0VSjpTPuNZNwQlNyK4Q59f3yveKgTqrkuwQbARLNxyEISAWnvUwnhu6coJ6iyDpuFqoV
 0nI7KSvYjEtwgTV15oH5HwjKxcglinhYyVhXFSVV630NgWG+1xUxOGOJkXpu++FQ9Odt
 1W4A==
X-Gm-Message-State: ACgBeo30BzOWU72IM/2Zz44NJRVZV9HU3WBlZRcCnLHT7x9mm82k4KxF
 bvjz4SzJ1n8OMlpekKUXlUpxBBRzSz4=
X-Google-Smtp-Source: AA6agR4l0ruPZdRW4cB2enIqCqLaLGf8VbZEP8PQNJ1ycfOoUNU+TOBVN0YqutO+9Z66g2aEt/NuSQ==
X-Received: by 2002:a05:6000:1866:b0:226:e864:571e with SMTP id
 d6-20020a056000186600b00226e864571emr5207181wri.147.1662029916307; 
 Thu, 01 Sep 2022 03:58:36 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056000408c00b0021ee65426a2sm15556023wrb.65.2022.09.01.03.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:58:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu,  1 Sep 2022 12:58:31 +0200
Message-Id: <20220901105831.1825819-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=bO5NJBNQLdKsDYd/PM8iN+qDNJqTLUpZgLBXEBuxPIc=;
 b=mUDUyCqw8EfBIzLlFc0JDrVV9Xmj80q19P91Vvo8efTHIyd/aUJaSzMPibkNyl5eZl
 /R4qC0ucHCJ3Ymx+KrC/0efbFBMES6QFNp70YDRqVQZGoDmwAtylR9PqelQAUWdLBTPv
 ESdqib3ATGK+G/MFE91apW8PFXTHkTl8Bq7HE7OaO8aFvB7oExcSF3ltFsZF/xKvfUW/
 7lBdxCiMBQKu9IlvUlgih/R+jApHMQaiTlp0NtYombagncjLzZS5dYFeWGK/7HdrJ8Rm
 vfbJdw+ur8A6kSIslw7RfF24U7uEDvcdKt/+bQXzv5nnsWQDB2E775328R5UFI700hfB
 1HQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mUDUyCqw
Subject: [Buildroot] [PATCH] package/luasocket: bump to version 3.1.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasocket/luasocket.hash | 2 +-
 package/luasocket/luasocket.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
index b66ae57b9..bfbc06f3e 100644
--- a/package/luasocket/luasocket.hash
+++ b/package/luasocket/luasocket.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  63fd2dd18dfe242ca5bcc1203839e86a9c8936261a9ca9f3200f2deab431da88  luasocket-3.0.0-1.src.rock
+sha256  f4a207f50a3f99ad65def8e29c54ac9aac668b216476f7fae3fae92413398ed2  luasocket-3.1.0-1.src.rock
 sha256  224afe42d0738eaaeb57ab289466a1c4e77091591e69dbcef2dbb385589f2f41  luasocket/LICENSE
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index eeece26fd..be360a337 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASOCKET_VERSION = 3.0.0-1
+LUASOCKET_VERSION = 3.1.0-1
 LUASOCKET_SUBDIR = luasocket
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
