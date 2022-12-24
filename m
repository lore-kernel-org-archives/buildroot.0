Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DEC4332F
	for <buildroot@archiver.kernel.org>; Sat, 24 Dec 2022 03:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A7560AD8;
	Sat, 24 Dec 2022 03:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A7560AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TR-7imFXyEoe; Sat, 24 Dec 2022 03:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6AAA60AA5;
	Sat, 24 Dec 2022 03:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6AAA60AA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 614601BF2A0
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 03:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3734A60AA5
 for <buildroot@lists.busybox.net>; Sat, 24 Dec 2022 03:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3734A60AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbxjkoDzV9jQ for <buildroot@lists.busybox.net>;
 Sat, 24 Dec 2022 03:34:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F94560758
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F94560758
 for <buildroot@buildroot.org>; Sat, 24 Dec 2022 03:34:59 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r72so3357439iod.5
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 19:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WnclN/SdhIBp7Sbns5acIiQfjh7a6MZez2iryMqtDnc=;
 b=nz1qEa56GvBPIY+61/CFQAljgkWK0Ai+6sBLXuqKzXwKuU08Thcuq+ldmjQx4k48kU
 m0l+qx8uitTGLJ7Rw6oxG7rHfrQhVi3vAaOqrYsXwtCkh5YUzS1URzsGyuzSmHvVTbQj
 71wW6ww1f2HmTKHYul0F4X7rtgXyellqhZg+zYC28EzJmCqpgnytTKe/KAtb6ruYLRaK
 T5s62WCTl+X/JTmVE7U5q3be/BnNcsck+E207+ao9JF1WHVQNYOgvhUeszm8RjLvEgaQ
 p74nbKzQp4kVGsgeJyRWUqvxT4jyi49waUO2zBDo+FtSSpkwx9nCCS1C4lZ9HAix0law
 uLZw==
X-Gm-Message-State: AFqh2kpfIIs3Fdms1FpkmpZS1z+lojWPuFrE5XqDGzSm8e22InBDSKld
 sfLtZ1ezIYTxAkIlQv6SCmv8+5rvw1jD3g==
X-Google-Smtp-Source: AMrXdXvmHXjBQ8b9NWxmq2lPshpY5ftmgrpkrFdJhed2dpultPWxf1bA4Zi1zHVndqCn4JQU8M4LWw==
X-Received: by 2002:a6b:e813:0:b0:6e4:e13d:199c with SMTP id
 f19-20020a6be813000000b006e4e13d199cmr7169936ioh.14.1671852898149; 
 Fri, 23 Dec 2022 19:34:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f27-20020a056638329b00b003758bcba4b5sm1433934jav.153.2022.12.23.19.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 19:34:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 20:34:52 -0700
Message-Id: <20221224033452.3079697-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WnclN/SdhIBp7Sbns5acIiQfjh7a6MZez2iryMqtDnc=;
 b=DOcy41v6D+VpTtLva7xroWJChdbOh3rxa6F8ffX5xgRccH3ynTNyfR3KnmzCbKmyKj
 HVSTucMQlFmn1NeeI0vMCuTQGFidX/yx7I8xT/9bermLJczZqRxW+c6chdDH3dKl1YEy
 yTxL6Lgqc0zDFu6rY6+RXozdz57ke3gmux2+VeIUhZVg8etLmA5CthnAEDQ8MQZpq8QV
 oA+NeOWj/7ZIhHO5OqZ0+pbj11W1lENhZO+3nYVGSA7jeS8olQygIgB43dcXMvTg62a7
 +ySnXfwZG3Mz0PM2dET4MptEcgzVM1/qEm9XUnrks3BJ8W75DHagmWuTzDYvKoKgdTCA
 7M9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DOcy41v6
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.0.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 1544bb3897..6993b756ae 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.64.1/meson-0.64.1.tar.gz.asc
-sha256  3a8e030c2334f782085f81627062cc6d4a6771edf31e055ffe374f9e6b089ab9  meson-0.64.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.0.0/meson-1.0.0.tar.gz.asc
+sha256  aa50a4ba4557c25e7d48446abfde857957dcdf58385fffbe670ba0e8efacce05  meson-1.0.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 5aae95973a..e417d8d627 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.64.1
+MESON_VERSION = 1.0.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
