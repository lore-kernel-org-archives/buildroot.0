Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D568DC004D4
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A1260B74;
	Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A1260B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNhAjHPNd1F3; Sat, 21 Jan 2023 16:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73DA60B44;
	Sat, 21 Jan 2023 16:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73DA60B44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5BB21BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A12E382400
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12E382400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZQSb4R9iKap for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943EB81D9F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 943EB81D9F
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:35:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id l8so6159233wms.3
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BV+p7A3eheC6SZZsOVhiX09309FNQN4F3OuWV2H+2ms=;
 b=kXy+5XZlEZYzTmBUuhcEC0mXIcxOjIjHcr0FoxVEBzq2HuthZ9xgXS8+8WIJT1RHmS
 t9LDd+ineSLPRoJ1PiQeYrVICoeb9wavNA4syAKp8s6mp8MIhUQ3Zm1RhYjllC+301p6
 CHKmNGt0zcZA/f7j36EI0SrnJ6xZ2NI7Gg5sfU4WerciXOsJ657/YsG1ihC84jeS+srI
 xbUwB78crh38kwSANC+9ig8G0HcyJh4T2eoZEXNwK+S5pmUuHxV+5MBrQMWzY6xOACXn
 MxinSIGtKuM029eBhr5tK6HAEXXZDiY8UZnKp89Bb4zB3yuwo2yoMhWpMfuhsfPTE4al
 fJHg==
X-Gm-Message-State: AFqh2kreKJF7d1El0jwCyd3YUiCSb6UmjQzAz2xIoyG8XhPOiBOa9Ycb
 wOBneli2LDBEG+uY7xLFkO0hYF9hBZ4=
X-Google-Smtp-Source: AMrXdXvB1bICWyem6LRf4c7aSnrRATmQaYGgSxsE4enhqojyhGppSN4dKMR+TEmmP75URVdYtNiD/A==
X-Received: by 2002:a05:600c:31a3:b0:3d6:8570:1239 with SMTP id
 s35-20020a05600c31a300b003d685701239mr19129190wmp.16.1674318956751; 
 Sat, 21 Jan 2023 08:35:56 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:35:56 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:31 +0100
Message-Id: <20230121163537.147981-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BV+p7A3eheC6SZZsOVhiX09309FNQN4F3OuWV2H+2ms=;
 b=SWIsfJAbGMFsXHJFFGAtEAYrrCEYvNffRsoOpersPDBy6RGTTqAL4+l2S7qcAdtmrb
 BSSaVt7e3DfQpye+bH6drnh8TAR3s0Y2s5cXzBuWKmotDAA07diMzWr4Zm/RdHcbWjnS
 h01WMWoLu6Qu8+3r/Ca/4vLsZNkJ1hGXm7v18M8FRhClUbpMkTptLSrPulNiMxuKwSut
 KH8kppWI+JFYgLT2BBwDEHwHqTalipTiYOKQTCi6Aji81Z0b8xV74jPW2PfkLLBZHF73
 om4QbItnLQ4Ty9fmpItD0bhC/dr0ZQVgiY3kT9/qAvDdIrZcpi4wUccq1LDIqXo6EuMZ
 tXYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SWIsfJAb
Subject: [Buildroot] [PATCH 1/7] package/perl-data-optlist: bump to version
 0.113
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
 package/perl-data-optlist/perl-data-optlist.hash | 4 ++--
 package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-data-optlist/perl-data-optlist.hash b/package/perl-data-optlist/perl-data-optlist.hash
index 1c805acef..ccc05ae4d 100644
--- a/package/perl-data-optlist/perl-data-optlist.hash
+++ b/package/perl-data-optlist/perl-data-optlist.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3b2cdb7846391f9acaf4e948a9a6b21b  Data-OptList-0.112.tar.gz
-sha256  62c60ccaae88d5339ae36bcc8940b03388cf84adbf27828b1f8b300307103bab  Data-OptList-0.112.tar.gz
+md5  cda08370c4058ba56e40c2f21d94d233  Data-OptList-0.113.tar.gz
+sha256  36aebc5817b7d4686b649434c2ee41f45c8bf97d4ca5a99f607cc40f695a4285  Data-OptList-0.113.tar.gz
 
 # computed by scancpan
 sha256  712f3e40537810ba3046533fd71d877f69ab446d5e8e8a1135771804494b8b42  LICENSE
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index 8e089245f..1a9aa05cc 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_OPTLIST_VERSION = 0.112
+PERL_DATA_OPTLIST_VERSION = 0.113
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
