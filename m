Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAC0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF98841555;
	Tue, 25 Jan 2022 17:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDwgHb4cxMON; Tue, 25 Jan 2022 17:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47B441560;
	Tue, 25 Jan 2022 17:36:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789211BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 660C1401C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6E03qLFrgy-v for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:36:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03901400D9
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:36:05 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso1018511wms.0
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZ9xxkzXaQlent22GWv75FDOwfxgb2S3WBeN3yCtOQA=;
 b=QIWOQPFCHoVqcbs3N28JBW5q167LBynRHc91aUAryhYT8Km68TCh7SgsutHBHvMyRd
 CrD3aNjok13Ue6pGR4cT2ZaQuF4otFrHRCtN4loDn/1t5tDRt1QBGXZZrBVop0hCGjJ5
 8XV73xgfO9Gx49FaKBLCPAR36j9H0bTs58kgn/qFDddj2Gr09ZAr1OQt1uDU3vDDPYjY
 1JQAOxgEVpZTyzKUarKosAcfAA/0KQuHYVAiNgHmi7wM16esFwP4B8/tOawLsFe68o8c
 htXQF4XTj0KMmGiXKNYBeBudh+tnXGcjuh01QmSm032YFsusPGpVFdUun7VlusQ2i+Fn
 HH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZ9xxkzXaQlent22GWv75FDOwfxgb2S3WBeN3yCtOQA=;
 b=YJevmi1b60JZK6vb4aXIbwLwrYXL/OXFJKgOAoVAddF6J2/5GRdavNFixDcitxubjx
 UBEaOSFtjd4D+DjXZAhxGBscCb3rdCN46A+nLigBWvfmJrK1A9eeb0M3OCLhP47GKJ0d
 HZ5YcyTQVAMpRbZ/7ts94Dwgbifs4cmA6F/BPkldpd5W7e8crXWlqal9cHFUA/WDyZV4
 1hc8h0sq4gzy0yS6zxI8dl3qqCZMMoJ6OKQdli4we1pWh0kvkMkNSKmaSQhycgVqWRol
 g6GBqByIAvZmRCoHhHLZJ5CT3eq86DqMwrELCw5CF9LTmPyAL/SPLcPBZpyPvv7iu4RJ
 bDAA==
X-Gm-Message-State: AOAM530L76w+akToRIBKpHb6C6eKiT3m+7ef4VJtQX3ZBA9A4XWU9EV5
 ENZQOsEiiseofOfRKI3+o80eJR4Dlqw=
X-Google-Smtp-Source: ABdhPJwsiuOV6nIFpJCZK703L8f3Uq9pJcU1zqRKoU8K+g7jdrIkUp9VsRk61wBZ7qmSLWiwIxr8Ew==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr3918986wmp.59.1643132163975; 
 Tue, 25 Jan 2022 09:36:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n15sm969968wmr.26.2022.01.25.09.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:36:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:34:22 +0100
Message-Id: <20220125173422.3476090-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mongodb: security bump to version
 4.2.18
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-20330: An attacker with basic CRUD permissions on a
replicated collection can run the applyOps command with specially
malformed oplog entries, resulting in a potential denial of service on
secondaries. This issue affects MongoDB Server v4.0 versions prior to
4.0.25; MongoDB Server v4.2 versions prior to 4.2.14; MongoDB Server
v4.4 versions prior to 4.4.6.

Drop third patch (already in version)

https://docs.mongodb.com/master/release-notes/4.2/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 -------------------
 package/mongodb/mongodb.hash                  |  2 +-
 package/mongodb/mongodb.mk                    |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch

diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
deleted file mode 100644
index 02b35c6e4f..0000000000
--- a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
-From: Andrew Morrow <acm@mongodb.com>
-Date: Wed, 15 Sep 2021 15:23:42 -0400
-Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
- constant
-
-[Retrieved (and backported) from:
-https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mongo/stdx/thread.h | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
-index 7b15bb561bd9..6f1e16cdeb36 100644
---- a/src/mongo/stdx/thread.h
-+++ b/src/mongo/stdx/thread.h
-@@ -76,11 +76,19 @@ class SigAltStackController {
-     }
- 
- private:
-+    static size_t _getStackSize() {
-+        // It would be nice for this to be a constexpr, but
-+        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
-+        // 2.34.
-+        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
-+        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
-+    }
-+
-     void _install() const {
-         stack_t ss;
-         ss.ss_sp = _stackStorage.get();
-         ss.ss_flags = 0;
--        ss.ss_size = kStackSize;
-+        ss.ss_size = _getStackSize();
-         if (sigaltstack(&ss, nullptr)) {
-             abort();
-         }
-@@ -107,9 +115,7 @@ class SigAltStackController {
-     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
-     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
- 
--    static constexpr std::size_t kStackSize =
--        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
--    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
-+    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
- 
- #else   // !MONGO_HAS_SIGALTSTACK
-     auto makeInstallGuard() const {
diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 3b2580cc43..02da8ad452 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  ab5a8b6e967614a8ad67c0ca87124c4f380d4a476508973a7995d54ed902b02e  mongodb-src-r4.2.11.tar.gz
+sha256  5bbb9567cc1f358ac7d9f37d9fe749862728bdf9f742d1dfc5e35a8b6c2985ba  mongodb-src-r4.2.18.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index c33c3c2eb7..f666e83a03 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION = 4.2.11
+MONGODB_VERSION = 4.2.18
 MONGODB_SITE = https://fastdl.mongodb.org/src
 MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
