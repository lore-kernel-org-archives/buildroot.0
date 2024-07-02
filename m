Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A25C3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 18:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FEC560BE7;
	Tue,  2 Jul 2024 18:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YBNGtQU9vm5; Tue,  2 Jul 2024 18:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D28460BD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D28460BD1;
	Tue,  2 Jul 2024 18:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 009521BF304
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 18:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFADB83EF1
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 18:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktxAFo0sYErR for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 18:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8829383EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8829383EEF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8829383EEF
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 18:57:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-36785e72a48so660156f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719946664; x=1720551464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+tzGR1FctZmtDYLKSuTT5/gK56xnTgjcpWLfRFInC8=;
 b=QYp7HzFi/RpFss0i/Y562qpzVSZjWGq93+bH3B+y/V12BSZumjkZbKZ5TNppujb9Yc
 WMp17kaQ7cs070noYfXoAwf0qJNYxNwb4MzZxCTe89x9CIMqLhYeIWsnjgaIQ2k9MjQw
 u6GfRvNN9Nq4MTSvSMhkaUJdTN7HeqD3M1BcGAYi6JkeVHbZWSE9NgjMT393XSNHwDUV
 92o1TjHN6cJoD65JoigPceBrymyYGBWpaUu7BTRzgmpmXY/EpIIC1D4aireBUd9eO/b2
 UxcknZYrbmJsZkr/7lSwFInkabMp1ca5+pKDRWrL5N/0DlOhKqEy7XSy6zGDrYLeXio7
 33Uw==
X-Gm-Message-State: AOJu0YwB3jGtGLVbUJc0WsdOTA6z4SqsEG2krX+C1oWBhK2ZvjUKDyxz
 C4kZsYUpGrRxr0aoxm5+bildvOmXNfambW6J8HhCTiUa+o+IrPX4lB59mQ==
X-Google-Smtp-Source: AGHT+IEg1ZAlYwaKFzd3+53SDXS8AqUefBIgtOCrD4ZzbHLl+YTNONG1kpKo1MsLOiXd/MfylMuAUQ==
X-Received: by 2002:a05:6000:c0c:b0:35e:6472:4390 with SMTP id
 ffacd0b85a97d-367756ab133mr6930280f8f.27.1719946664192; 
 Tue, 02 Jul 2024 11:57:44 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36790a40391sm431260f8f.54.2024.07.02.11.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 11:57:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 20:57:43 +0200
Message-ID: <20240702185743.2034330-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719946664; x=1720551464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=8+tzGR1FctZmtDYLKSuTT5/gK56xnTgjcpWLfRFInC8=;
 b=Oa2U1yw1lq3Y9X+6ZLcxXoZBDmp66v8HobHaKNrJ2hCjqCsl7ZM1/MtwKXQzt1LPDa
 ZFzmdAgakcnmQuawurhK99ev+8GCl4aKNvwRZGe/uq5gPbCsLeJsSJwAkgCemRGroKfh
 RtOzoJYIaXehG14srM1755X1JXfySgInfQNdEhFcbzb+NSmwnYgAqP6DRt2VUIIUoD19
 HdJADYUcLHh8fjqr4GzH2km1jXFBVKvlKAswmi8nnCwbQivE3FFHrKq4Z/mUcVtGXWsN
 tWCBJbrDEdHQ9YOt/YZVL/aTxCRUf1Y8zbB6ylIzv5Z03W8QYTVK46GP5aM98ekux2zn
 fYJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oa2U1yw1
Subject: [Buildroot] [PATCH] package/daq: workaround for upstream changing
 the archive
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream has changed the archive for hte 2.0.7 release since we bumped
in c1f820bd88a5 (package/daq: bump version to 2.0.7). Comparing the old
archive as it is on s.b.o. with the one currently available on upstream,
gives a few deltas, mostly;
  - (C) years changed in comments
  - version string changed from 2.0.6 to 2.0.7
  - changes (that look legit) to autostuff
  - a file dropped (Visual Studio related)

Of course, that means the hashes changed, and no longer match what we
have.

Downloading the file manually and letting wget set the timestamp on it,
revealsthe arcive is dated 2022-06-08T13:51:59. So, for mor ethan two
years now, we've been relying on the archive we cached on s.b.o.

So, we can't just change the hashes to the new ones, nor can we replace
the archive on s.b.o.

Instead, we use the same trick as was used in c617ebbc977d
(package/python-*: fix hashes for cargo-vendored python packages): se
use the acutal, real URL with a query parameter as the _SITE, and we set
_SOURCE to a different name so as not to conflict with the previous
archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/daq/daq.hash | 4 ++--
 package/daq/daq.mk   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/daq/daq.hash b/package/daq/daq.hash
index 0fa1edecc2..82323ed404 100644
--- a/package/daq/daq.hash
+++ b/package/daq/daq.hash
@@ -1,7 +1,7 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  ea796f001d1b00302e4e69e337ab2460  daq-2.0.7.tar.gz
+md5  60e5ddcafb985fac7374884d28f299d1  daq-2.0.7-modified.tar.gz
 # Locally computed:
-sha256  bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
+sha256  d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279  daq-2.0.7-modified.tar.gz
 
 # Hash for license files:
 sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index 8a5394a63c..27abd4d2f5 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -5,7 +5,11 @@
 ################################################################################
 
 DAQ_VERSION = 2.0.7
-DAQ_SITE = https://www.snort.org/downloads/snort
+# Upstream re-published a modified archive for the same 2.0.7 version, so change
+# its name locally, to avoid conflict with older BR versions which had a hash
+# for the previous archive.
+DAQ_SOURCE = daq-2.0.7-modified.tar.gz
+DAQ_SITE = https://www.snort.org/downloads/snort/daq-$(DAQ_VERSION).tar.gz?buildroot-path=filename
 DAQ_LICENSE = GPL-2.0
 DAQ_LICENSE_FILES = COPYING
 DAQ_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
