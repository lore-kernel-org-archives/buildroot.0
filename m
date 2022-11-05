Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E72FC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 08:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09FB640D74;
	Sat,  5 Nov 2022 08:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09FB640D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbNslFN00d0e; Sat,  5 Nov 2022 08:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18B7C40C9D;
	Sat,  5 Nov 2022 08:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18B7C40C9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9EF01BF28E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85CFE82114
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CFE82114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5OFyHIz1VN3 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 08:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F498141D
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84F498141D
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 08:04:16 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v27so10622266eda.1
 for <buildroot@busybox.net>; Sat, 05 Nov 2022 01:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ay4ipHgeYQPMQUBNVLhVB2ocIx2Z6FzfadsYLotd8X4=;
 b=HuCx1+89nM1IZVFlweiNPXrG5hLk/ekWVr4qFfh2ZGU+dfMoVaAJ7wW7wE/F5XWsNl
 q1GOCm9GyvhkKMVmaRcKcUba7sWQ8iWnKKLNLH0iafUBe9sa5eJHIkThiktkxZAPi2R8
 U4McFqy0ZdKtUjCTskNjSrfzGyZd2oAzhdnYXlzMKxIlcIIIXVg+ErLDPaUzwZi5bNJj
 ISG+qLAiht2AN8DhTGOeoDOJkbxXm7w8gQ5hI4RODOpOJPsaPF83CxJZnJFFFqwOBB6K
 KZAMXpq4v9mfha1IanbX0TWMw9CstwvXbrHAaPkE3KXoZs73PkDCAlzi6pR5+ygleq1M
 8LnQ==
X-Gm-Message-State: ACrzQf0FhcxC4ktQOa4ozg1f15ZkoRWFby72a7eahJ2N+3R4MMTmE4r+
 KWvBAB8VGZyoh7G/X17D/C0ZZiZRTFI=
X-Google-Smtp-Source: AMsMyM7FhAMbmOfSjGdQYGb3lCIeCw7ia4n+p5rT4mkV9dAViq1cA54YFoT08/fHjtxfC1zyjCNnKQ==
X-Received: by 2002:aa7:d791:0:b0:463:7478:c54c with SMTP id
 s17-20020aa7d791000000b004637478c54cmr29262561edq.140.1667635454832; 
 Sat, 05 Nov 2022 01:04:14 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b0077016f4c6d4sm600449ejb.55.2022.11.05.01.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 01:04:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  5 Nov 2022 09:04:06 +0100
Message-Id: <20221105080407.1228468-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ay4ipHgeYQPMQUBNVLhVB2ocIx2Z6FzfadsYLotd8X4=;
 b=kD5jr/4TJ89rvRnzLQMWW3XgriUQtDjtLhUQ3Lo3gcQl2fcSeLBoXhM+Jh2jjj4Qyf
 hK5aDj4iIv6+N+UsV8tSZ/x96b1avY6cg038INfJOZlJ1j2YRoSQcn3iEpHSXDECM1gG
 BjeW3ujGhSmBe13dSrbVarmNepR0mdgETv0YJ1UDSeE12KKuJt0RDxl9se46ZFxD5JhL
 FzgorhVdlbAwq1oLjMru531OZFXP+S77rmsXYEYmpKZ42ZgEgUqD96QJfKfytSIhqkzd
 F6PQ8dHWOw9XT6l9787ET2rDYyp4y8Bq6oJ11kA7l13I3OX0Uqz/ZZuSQIMn1HSOp53+
 WWqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kD5jr/4T
Subject: [Buildroot] [PATCH 1/2] package/zic: bump to version 2022f
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
 .../zic/0001-remove-dependency-check-on-version-file.patch    | 2 +-
 package/zic/zic.hash                                          | 4 ++--
 package/zic/zic.mk                                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zic/0001-remove-dependency-check-on-version-file.patch b/package/zic/0001-remove-dependency-check-on-version-file.patch
index 64587bc0d..cba7ed679 100644
--- a/package/zic/0001-remove-dependency-check-on-version-file.patch
+++ b/package/zic/0001-remove-dependency-check-on-version-file.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile b/Makefile
 index 1b714a8..00d2c09 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -609,7 +609,7 @@ INSTALL:	ALL install date.1
+@@ -615,7 +615,7 @@ INSTALL:	ALL install date.1
  # Otherwise, use $(VERSION) unless it is "unknown" and there is already
  # a 'version' file, in which case reuse the existing 'version' contents
  # and append "-dirty" if the contents do not already end in "-dirty".
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index c9c749194..40f68f029 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2022-August/000072.html
-sha512  3373fa16a12007415c3dc3a75c4a0d61d6ae54968eeecedcdf4bcfd7f554020a15c4687dde107b90462b75d848eebe1e200c33322ebe0d3f1ad11bc769cade06  tzcode2022c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
+sha512  3e2ef91b972f1872e3e8da9eae9d1c4638bfdb32600f164484edd7147be45a116db80443cd5ae61b5c34f8b841e4362f4beefd957633f6cc9b7def543ed6752b  tzcode2022f.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index bb5cd3c91..229afaadc 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2022c
+ZIC_VERSION = 2022f
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
