Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8383DC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C5640584;
	Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C5640584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpM26j7bKTz5; Wed,  1 Feb 2023 05:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33ECB405BB;
	Wed,  1 Feb 2023 05:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33ECB405BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CEFD1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E709D40A02
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E709D40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpJtSjvcjrgL for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE50A409EB
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE50A409EB
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:10 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id l128so2523939iof.2
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7AqKaAF/i5kWZmEIrKkp9DIy5P3ZxtcGKLYsOMd4Ms=;
 b=5arhWXFP/ApTlesQ4IoFtoQBFz3Lwa9UBZsjWjkgg8Y5neXrLukXELs6akmj5p6Hsg
 YCGlhaMvo0nuGFKQJw1SugVcuavRKHFhZt53SUOCORtpNDzZz3pOaHal1z0HT1nzyaA7
 mY5PDNQEMhCsHv521cGJiryfaPaN4YJURgylB8Zad3YAt7C5K2RnDQ0v3f70FzrQba9H
 z0Mvc305slNrgVxftGhdPUhE3i9jNCMsTcmFJrffb8ICLAi8FDwZ8MJ1hu7bY8xpDR5y
 WDr4weaiW/9yzuFkEcIARGHSOi20VYPzDE9NNwKdbEG6uwkt6uSc8HYJ+rec2lZE4YNY
 nQ5Q==
X-Gm-Message-State: AO0yUKXf9hF7W8tdcVzEKw7JaSDs/MtYw0sA6GG8ZgYxWV17dvAXLei0
 24QB9ZGqwb2NQ4G5Ii7HFLUnD/ds8kCOfA==
X-Google-Smtp-Source: AK7set+IXVbUwlVDWPyjDd4nQUxmqdUIXxiB8bkLpGi0JZzxKAEboS7Weq3KI50j6EpS+vPmerDSmw==
X-Received: by 2002:a05:6602:2195:b0:722:de:1afa with SMTP id
 b21-20020a056602219500b0072200de1afamr786878iob.3.1675228629593; 
 Tue, 31 Jan 2023 21:17:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:46 -0700
Message-Id: <20230201051658.383420-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7AqKaAF/i5kWZmEIrKkp9DIy5P3ZxtcGKLYsOMd4Ms=;
 b=PRx38459rPI2V9yEYmRCt3me0bSC0e+HTbzHmqQJJqQOmCigjk2HWdFNYgHIKQJQnc
 d+wB3lxSn+GJpklHuxOk97Xj33EsNs8nhVmR6PYgpD6tPIpePrRShccylplQW+0WzXh3
 SbH3v8h7KFNjnVAT2ffDADR8pp7Pz9vgkYvXS4QQMpLz/Ak5AOuw7MgWGmaq2yJhil8l
 5sPmQAEu2S41o+DFtNQeTajAOpu7Va+L6Dlv01ehvpHgxXd60aZE4XhpTD7zrWdrDOxX
 YTXf3QZZEjPD/2OIiDBfgT7je9wKO+yamEK5mBcOzU64tAnTk5YU/JjwH4lJI6KaMimq
 KJTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PRx38459
Subject: [Buildroot] [PATCH 01/13] package/libnice: bump to version 0.1.21
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libnice/libnice.hash | 2 +-
 package/libnice/libnice.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 83b28a9ad9..cf6d825f83 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-sha256  6747af710998cf708a2e8ceef51cccd181373d94201dd4b8d40797a070ed47cc  libnice-0.1.19.tar.gz
+sha256  72e73a2acf20f59093e21d5601606e405873503eb35f346fa621de23e99b3b39  libnice-0.1.21.tar.gz
 
 # Hash for license files:
 sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 2b223bedd3..56ee35e452 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.19
-LIBNICE_SITE = http://nice.freedesktop.org/releases
+LIBNICE_VERSION = 0.1.21
+LIBNICE_SITE = https://libnice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
