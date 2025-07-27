Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8921BC87FCC
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ADE341BF8;
	Sun, 27 Jul 2025 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3ifmZT17GOR; Sun, 27 Jul 2025 19:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860D5416BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860D5416BA;
	Sun, 27 Jul 2025 19:59:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FFF8231
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1240660C0D
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyE2fdanAqiE for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 19:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D64C607AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D64C607AB
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D64C607AB
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 19:59:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g7WUuGwGNtr9dg7WUuzDPy; Sun, 27 Jul 2025 21:59:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 27 Jul 2025 21:59:04 +0200
Message-Id: <20250727195904.4022529-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLVde9yH86w0rHCCBY1IGq0d+Jrw+Dr7WtvA50/ffa0NvsS11mZdEK0mzTjq1+mSWFUcTZGvGDCkWr4VzkJoHZaKqFjwcjGRFakgT3xsTLdhPbn6X5nk
 0Mk8gxbXkh6oee512wLzvuFZ1ILTn3KQProND8pQukxdNK9482BAYU5/259Om/NQAeOdjtFd9TnY//ICAA8/+RZD1844rxIxPBliwtYXg8Yzgkv1UU9OwlpT
 X4BkbgQqz5Bhfo1TRiR1QX71YAWYWctSXR4uiWP4lsU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753646346; bh=tiglT50CaWeFZzde6/gPT/mdWuWwd1/oC3t1Lv9FJlI=;
 h=From:To:Subject:Date:MIME-Version;
 b=RbYMbF08TuM7Gu2dBLYaO0Uw/DmV6Nuk57IbXNbupseHaMd9vOY2uyB+K6o8JZjAV
 bBlNoqRS2/g5GsiyRdD3Lb5IDBUDHckGvO+tV9Z52naZ0/eg1wOzXajq5ztxq8B2Oh
 hU3ysd8dvneA3PlNyWp0i3SxsGDxjM2sAU2MmC7W1s4z9PbRo2pbgFXWGU612UJBYy
 3IMaN/QNr+CrrywtOQSC5InHtL8wc5Rs6aYBp2UVy4fqW/0b2KvoAp34WduXDWvnaW
 qR7twKy7sk9hsPPZyyRDukPRY3DQJ/Y+sv9eGDehJc+xRiPqUrScQIkx26FLZiyzd8
 WUqhSz5cfbg8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RbYMbF08
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.3.3
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/11.3.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 4cb7da9318..91fd8afe6f 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d58ada9b2d28821245e8bdb8b94a4e2dad01a08c50d57feb027b32e84c9abfb1  harfbuzz-11.3.2.tar.xz
+sha256  e1fbca6b32a91ae91ecd9eb2ca8d47a5bfe2b1cb2e54855ab7a0b464919ef358  harfbuzz-11.3.3.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 219564b487..d8a20bcb09 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 11.3.2
+HARFBUZZ_VERSION = 11.3.3
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
