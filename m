Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B12C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B5581F7E;
	Thu,  3 Nov 2022 19:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B5581F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJOtwJVPTXQZ; Thu,  3 Nov 2022 19:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFD881F7B;
	Thu,  3 Nov 2022 19:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FFD881F7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 963EF1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714ED404EC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714ED404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLtFkR1BTSgr for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE46404C9
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BE46404C9
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:43:04 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id r81so2257215iod.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Dc7jPvBI7CSKBOjXzGSdlhnJH+o91RR5ZjXDPkIz0w=;
 b=G9LOEQtzsdbTvmuGBfZPI+udbbJFb5JUnY8+KIyf6xLcHbjUQd/v3+UqU1CnV8tCRO
 uJKv02uDhruAJabm1EKP181wUbEzwZVZso2dyfmpUd/NvnZcBkbfdRB09pF/ls/JfzPx
 fQuzUPWkpI+phuWcHT8VWOcH5wH4n5C4HM44PZO3EprkXm5l5UCnk6UguLkjs6VDiXos
 FtF7JU7u9aLc+WE5uMmZWE5DkjJdyAUEV82x0d3u/4ETepWDvnmLNrPQiK3jnsafNvUs
 JuV5p656hGNgZqWREgjyTTfl1J9/1gS2Df8PXTCV1pCszPw2ElaOorHgWasrxL+hLjqS
 6iNg==
X-Gm-Message-State: ACrzQf13R+7IWOyxXNO6Sw2EWT32zSDgaV/2JIZs1H99LfD2bH642bb1
 Vx23KqiVa8UB1VPcB7hquiWjQ9bqw14M0D0Z
X-Google-Smtp-Source: AMsMyM4aZ8XejrcY60LLOgP/4lnfMuD+wIzfLLatJ9NkDGMXArSdSWxWMCYq36PFAndM9tfzN/09qw==
X-Received: by 2002:a6b:d112:0:b0:6c0:27e5:9edd with SMTP id
 l18-20020a6bd112000000b006c027e59eddmr20352020iob.213.1667504583243; 
 Thu, 03 Nov 2022 12:43:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m1-20020a0566022ac100b006ce94d987a3sm660036iov.30.2022.11.03.12.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:43:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:43:01 -0600
Message-Id: <20221103194301.1051181-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Dc7jPvBI7CSKBOjXzGSdlhnJH+o91RR5ZjXDPkIz0w=;
 b=mNGKr0yUL1HkGVz6AZPGqGp9mSv/vwEr9glsbfKyQlxl0lD/U8WNWMq0Nfb75wYA82
 BqWpTctoo0mhKfabBGT/+9VR9XobH9kcF5CLXXTOvAhVRQ5wFH0g5wEpYbHJ+ceKai47
 e6yniVtZwkg62Vw6MXrskdILhcBpaacZtnr2EAdr++RIVf7K67w0rWL6aC0OT+bJXqfE
 18y2WocWYuonFTPqwkGwcB5zUYSuUImpFZz61fk5LmpKONMqPFFBXSoN+3mkmLYtAV0Q
 l6XXZx1Dm7DGbfpOkNIPiyk/FLuFq+cQqU60I2YZZ6H+3CZ34G3WLLItipnz4oess9FZ
 5Eng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mNGKr0yU
Subject: [Buildroot] [PATCH 1/1] package/python-sqliteschema: bump to
 version 1.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index e60bd64325..d5fe6e7af1 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5  4fb0130e7cc60d92be468091fbfc3d51  sqliteschema-1.2.1.tar.gz
-sha256  dde195bd7bc70d5841bc01dff20ec23bd43be87d760d2dfc7c7f2e5fd3808ef3  sqliteschema-1.2.1.tar.gz
+md5  46da4f7575a0cc6c1d92377a279e5188  sqliteschema-1.3.0.tar.gz
+sha256  1acdd5087cab54a099135a5623bb1960019816e2e3042b889c637901a832d3c3  sqliteschema-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 5c52e35111..c399ebd6f6 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 1.2.1
+PYTHON_SQLITESCHEMA_VERSION = 1.3.0
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/85/f8/be54d4bebf551cb533d1dea11c3bf165a1a408c2a1cceb1f9724aadd9967
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/3d/ff/91cfff0c96f9ba2bddc27d6855db4907af77551a267b86740c8842beeb78
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
