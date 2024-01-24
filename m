Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA53BC47DDF
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48DF26146F;
	Wed, 24 Jan 2024 10:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48DF26146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02leDxwGQN7b; Wed, 24 Jan 2024 10:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9128661446;
	Wed, 24 Jan 2024 10:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9128661446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 132FC1BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F7583F28
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F7583F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IHc3NVDovhl for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:08 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58DE083EB3
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DE083EB3
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so62833835e9.1
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092506; x=1706697306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDZsOFBV0ff0anuAyl1KYg0vzM4q4+y5OxswsTitxqA=;
 b=DET2vlZQFi+5G7qwzlfvMnL59yqwAUpN820AvlRisErOsUhW0MWkvKIsHXxODP1kj7
 9Qre4WVFfvViVQxumm+J/wljAvfTztBXq2TkuOJITvKAhKOF3IX/1/UPPAQ4EXySudsd
 1xUZq0SiaE6k7BsYz1uiwl7JThCATMjzA60i78iIIgRmjm3rLP0J4V8mggvif6nhS3T8
 WNSl9p7nWg7ftxqKOgXlxPE1TGDuxJqJZJG/1LV1M28w82z7X4ra852uLIYG8Uft7jU+
 CKFo8lP41Mx23o/Rs/b4fIPnVB/EsLPmoulhAkoi954xZ+rj9YnKtFnAR8e0teq6741D
 UyhA==
X-Gm-Message-State: AOJu0Yz913LROm50VYyMWdoXHHJDK13ostA2yiBHrJFCMn2y62ryFr+k
 +V17ymSJM+kOHb8gJ4+uHqSI7e9ZH83TbVdPMlEbUoCr9u8DMc98f/hN6DCZ
X-Google-Smtp-Source: AGHT+IHNjLC5O6f/qjFzXv/isYyNgWuoaB9DKwtWCh4/HyJHG01hs89J+wzeLogsMKtjVM0Vh5qLXw==
X-Received: by 2002:a05:600c:54d1:b0:40e:81f8:2f8f with SMTP id
 iw17-20020a05600c54d100b0040e81f82f8fmr656418wmb.110.1706092506165; 
 Wed, 24 Jan 2024 02:35:06 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:05 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:45 +0100
Message-Id: <20240124103453.623733-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092506; x=1706697306; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDZsOFBV0ff0anuAyl1KYg0vzM4q4+y5OxswsTitxqA=;
 b=W00DlhmBT84jmZP6z110vMnMd724KrQatib9TOGi/li5TgLDtRmp3nw9mQ9xUM+23w
 KXKB4dYNkwH9iZsg/8ac8xbR7+LOA57Bgrw0UjYW0SMeyZDICX6uBU5ikLWCW6j6ZPxW
 t047pnA3T5SfoNJ6hI1ewhHMozf4n3r7TYf2mqyHmPRmUbAxa6KmSz2G5TBvgTdCEIKT
 GPz3oF4WtcsOnyJYGH0xkpVvO+cpjTqu8r1/Fk/L0nZh0nfKopZu1dKeEyY6M3bL4y+F
 qCLnLoOz/jXoAXar4VxxRkqfd2SQ275lT3rzYBTmN1okOpUJHsewdiNcHgi++oTd6mvW
 4PLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W00DlhmB
Subject: [Buildroot] [PATCH 02/10] package/perl-date-manip: bump to version
 6.94
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
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index 72741e413..d055cb33c 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  3ac4e55802837c396a30860492f33e67  Date-Manip-6.92.tar.gz
-sha256  ab962bd39ca09ec6fcfe7e5a6912af71b0c1f6f03e4ed2bef6e4471c9d367a13  Date-Manip-6.92.tar.gz
+md5  74f127ff4c71fa1aff54dc55818b0c2e  Date-Manip-6.94.tar.gz
+sha256  0278eb62113618c8977d3d537433d85340c487cbdfd95dd3452e4d7217f48848  Date-Manip-6.94.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index 8739caefd..55d9cff6e 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.92
+PERL_DATE_MANIP_VERSION = 6.94
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
