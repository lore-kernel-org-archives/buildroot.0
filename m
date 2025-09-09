Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841FECA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4973483E52;
	Tue,  9 Sep 2025 16:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIU48My9bLIi; Tue,  9 Sep 2025 16:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9E983E6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9E983E6A;
	Tue,  9 Sep 2025 16:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC627186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E39940066
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASB6wd8V-8K4 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 936D740022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936D740022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 936D740022
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:11:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8029AA4C0ED2
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 18:11:00 +0200 (CEST)
Received: from [192.168.1.144] (port=40652 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uw0vr-00000000093-3xIB
 for buildroot@buildroot.org; Tue, 09 Sep 2025 16:11:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 18:10:59 +0200
Message-ID: <20250909161100.59508-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757434260;
 bh=5PNZ4KHd0v1w6ZEbzlZylQWmnK/7zhyJbMZri4jrvhw=;
 h=From:To:Subject:Date:From;
 b=Cr+9UUUDa7mnIXNgVZhVWkBLnHOrv4Eqr1W/avQUMUydIsPglgYS2U1MpDkpxoSU1
 DWMUvitnO1nC7EiumNTkBpYMF+KbD+OpoXW1+Hofo6qrDuKhGdF/M3vwK3aFWAHK6+
 qgaJ3WqpXIptLJrxSHZtPJwyfZt0nrBW+BOdkjt3DC9TVmoFoN/8lHmsdPaFRHTtPS
 4XmP0dRZE1wbstFI53ev/GbEih/nBjx/FhNgAQGE9E5MsKG4MpsUMvK7wLhd5quOWE
 d6QADsw7InMhA9RX/LkVV2o+hzhXypxdfhfsi6zYwBkNIOwqem3aopAUW+6M0CiYkX
 mlk8alDmYJGeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Cr+9UUUD
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 9e6b14fb0f..5a8f5a9309 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ea515121a4c758373aa4641cafef91ebd5efa947cfb7a284544263ab7e90d6df  intel-media-25.3.1.tar.gz
+sha256  fc8d552e47c32e2a636d394e8f0118e145ae34374d08a6b124957be02c46a9dc  intel-media-25.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 73f804c94c..0ca7e10c44 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.3.1
+INTEL_MEDIADRIVER_VERSION = 25.3.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
