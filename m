Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A8CC4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F155381EC5;
	Tue, 23 Apr 2024 17:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opSxlOTptNJl; Tue, 23 Apr 2024 17:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E109281ECC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E109281ECC;
	Tue, 23 Apr 2024 17:27:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E00DA1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 17:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCF75403C7
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 17:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6u5UidJQ4B7e for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 17:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BF7240109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF7240109
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BF7240109
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 17:26:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e78970853so146934a12.0
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 10:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713893217; x=1714498017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ogwtRag5shtAXYWwunMT2ECxFXaxI74G/uGBMP5nwg=;
 b=lYPBI4DleqqyfkXa3Ju/beAJvXT3eTpq7RWwJ/uh5b08xzNsL+hG98n0WP+5kZjImK
 qoa5soxqANAxDo08ROYSvwlI3wDgpYCcRB64bVnfzskfhGPyRnqbRA8SJn9QVcAGCjer
 vmczvkgTXF6Hxie0dbH9ZSqE4G7wBH0oAF6gX+3mNZZdYKxFky8QZ23r8fbw/fi9qL9c
 IxSpqt8fL6sWECe7l9rCEYZB+bh7kcfYZWJGPZPPz5xA4EufRRPjsHqzX0US+e52UjKn
 87tcg++7v2wBI6gXKHdkCALRl4cM4xM01lEE+G4OIsId6wLFyctn/VE1IOEdDTriCxK3
 DX4w==
X-Gm-Message-State: AOJu0YzTFpHeP4eib1e8F6H2B/UVIy9cYbMitG0jAd8QPPS36nTZNNhT
 WuwYQn+Qr9lpA2Ja8XaHZJYWSU1B5OyKg2H8iW157XB2pjmQb7L8VZ72IQ==
X-Google-Smtp-Source: AGHT+IGhmcmhHyoSPiyhzV8oXMdi39E2vXepgER2LfKib2g4fIHffLvb7y3ZYOKIBTB4yEpZ2uQAFg==
X-Received: by 2002:a17:906:349a:b0:a55:af31:bed7 with SMTP id
 g26-20020a170906349a00b00a55af31bed7mr143518ejb.9.1713893216614; 
 Tue, 23 Apr 2024 10:26:56 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 bv9-20020a170906b1c900b00a51c5940247sm7223518ejb.213.2024.04.23.10.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 10:26:56 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 19:26:53 +0200
Message-Id: <20240423172653.349839-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713893217; x=1714498017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ogwtRag5shtAXYWwunMT2ECxFXaxI74G/uGBMP5nwg=;
 b=FWlDH0zzlbVjscjAf8ZCo5v3oQRFPJaxNEiDwME1KVBwx+JmhpwWoUX17E0v39QOXl
 qLc7uiFKQVNSzr99rLfSa2HcK3SDaCI09dQvu9/FYNFBC89NaD+dosWrhSRzT5S9YfPm
 DCu39fIwy5CnAiEwUc6BBkPPYh/tbgpZVBTvn81eIrKrv2iUQJ6lF6aKDZsNiew76L7H
 ghgsTlFu0YUj8MSftWeoef+wLNlnhNZXKEr+LVDKyxbwLCpx3aeN9BneSo3TaQYZQmBH
 B4yknb4Q80G4aqDYHBfipICdEltyRFMI9wYAsKqJ+gC6vS2xehnPI4m+SbJq1zHphwp1
 cLbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FWlDH0zz
Subject: [Buildroot] [PATCH] package/libapparmor: bump to version 3.1.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump also apparmor relative package.
Change also the download URL to gitlab where the development
activities were moved.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 5 +++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 6 +++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 22037e3e11..190045cd65 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
-sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
+sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index eeedd805e6..61e62c7515 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,8 +6,9 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).2
-APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
+APPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 574ff95b60..68b0468ae3 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
-sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
+sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 7f3cfcab2f..fa59ff2924 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,9 +6,9 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 3.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).2
-LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
-LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).7
+LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
