Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11643C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 18:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC3C3606C0;
	Tue,  2 Jul 2024 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdkKk8IRENrR; Tue,  2 Jul 2024 18:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B530C60BD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B530C60BD1;
	Tue,  2 Jul 2024 18:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACCC81BF304
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 18:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97657810F8
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 18:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwgG_n7joafd for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 18:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 979A7810DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 979A7810DF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 979A7810DF
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 18:59:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so283799f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 11:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719946785; x=1720551585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8OzTToN74kmVhdiZ5r8t1MmEOI5HIPw6C5QUkAvKPk=;
 b=uV9/MPsBcYnQQnkCeR4IO1OdtcJuihtxoAlh++6ntnxczT10lCWtmMB2lnrQJUXz+6
 xzPo5I58wGvj4KCF0dg0NjwxbjxKFALkBReiitUywmIQew0Xh7JVK3s8K7C7mqemqOrK
 atk3rXHhLWrdd+K4sXO2O2H6Qo59TZEuXlQ/xuXljg2VzY5TvqmnEvG1Xl/H7vYbT29t
 4sB0hRWMy6MMAVSYEY0dYf3hdvOw/2KLPFJwmb68CyFFkXbsvcg848Tn4Sb4p2P7S6T8
 Tc5zN/r4Befm5tGKINf0ORMyitICyllJvf5xQq34CndWLDpei43r3nrxgyXBDvWCpyk/
 bZ5g==
X-Gm-Message-State: AOJu0YxMvhSW9dDzzdQJ30Zkz1daPza61n/LQMtYGcY67t78cGojPzk+
 lKrzBE6/igFPnuZKqUMYfVKEQ4k+9N8Dgssp02gy1S6H0+4RoSuvXql7aA==
X-Google-Smtp-Source: AGHT+IFoWOwZrREuT0cr/MXBVgV9wV7QncAjNYw95uoopjVY4efUfPoHkisglUYGHIFDBI7Zh0JCuw==
X-Received: by 2002:a05:6000:1fae:b0:360:7c4b:58c3 with SMTP id
 ffacd0b85a97d-3677572154amr7393454f8f.54.1719946784373; 
 Tue, 02 Jul 2024 11:59:44 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd784sm14085377f8f.7.2024.07.02.11.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 11:59:44 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 20:59:43 +0200
Message-ID: <20240702185943.2035638-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719946785; x=1720551585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=o8OzTToN74kmVhdiZ5r8t1MmEOI5HIPw6C5QUkAvKPk=;
 b=XZHE2mA/4uMDT1/UE0EmAaWIo0v75ZPNNMcWM5H23aIiWzstRVSgW8Jwr37DdAPPPR
 xDUeG9kbfmIobUgC2lazfPXNxmG725LOmU5Aaum9SmNkwEHzSc9ks5xEnoLXqXyv+kxQ
 UWN9EJGgI6hy8LDBVbV3rCZWSqbuq2quT/9vfZqHwPl7wRU7VK1NEh9d1d/FnbH6pXj4
 7ofYfTt+RMOQUFZat5zprOEjteyz42M9Qf9r6LDQiF5TaW/MGhmzr9oZBkCtV4fcZMgF
 FgXLriww1crp86ph0oG6Gr1CbTyXGyosXqjYd9830tcaugBN2z4ejsjV7LeJJjVwaA/9
 ZTBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XZHE2mA/
Subject: [Buildroot] [PATCH v2] package/daq: workaround for upstream
 changing the archive
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
Cc: Yoann Congal <yoann.congal@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
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
reveals the archive is dated 2022-06-08T13:51:59. So, for more than two
years now, we've been relying on the archive we cached on s.b.o.

So, we can't just change the hashes to the new ones, nor can we replace
the archive on s.b.o.

Instead, we use the same trick as was used in c617ebbc977d
(package/python-*: fix hashes for cargo-vendored python packages): we
use the actual, real URL with a query parameter as the _SITE, and we set
_SOURCE to a different name so as not to conflict with the previous
archive.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yoann Congal <yoann.congal@smile.fr>

---
Changes v1 -> v2;
  - fix typoes
  - add Yoann in Cc
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
