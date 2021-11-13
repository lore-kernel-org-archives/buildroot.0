Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61249C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 08:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C57660F21
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 08:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C57660F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12184825DC;
	Sat, 13 Nov 2021 08:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6SM-ESvcbcC; Sat, 13 Nov 2021 08:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5289B825CA;
	Sat, 13 Nov 2021 08:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 814A81BF28C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 08:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DDF240188
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 08:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PfbwUghvRZy for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 08:38:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CD8940169
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 08:38:14 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d27so19733015wrb.6
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 00:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyyUtu2L5rQV1/KTzl4tcCsh6btHyHGoS3dQW0aLpM4=;
 b=IKaIzJLSKQu4JJUlS/NUo622gWSRcqGfTvdvHXtq11B8pEn8ZrBl87KEk8nvc5MqZz
 VnNBdZrz4bjhne90GxRCG/XCU3mKp0z2TBr8UTZU7hKqUFq+rdbjtluP9t1BEbzpZN1F
 zF+z1IryO72vEbP4Me1yPTcEs8LlsTOohaWaxTe4JC/+/WAdVCBvrJIFkIyMxkihntSs
 /lkzS11UmMYRn9v6q7ovaaidaI5mgvvvWMWBP9lpV/AXzUEeT4LRiNmjU3irvqqoMDLH
 sFB3AeUVx6VogO8n3Cr+T6Rd0JTWB/nnNpQk+9QW0a/8HrVVSM0nUqP8mNNoxMrPAvEc
 bvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyyUtu2L5rQV1/KTzl4tcCsh6btHyHGoS3dQW0aLpM4=;
 b=GMaSbLzIWB5w4pd7MGyK5UsnKFaz8bv37FWaJqhZzKBqQjuNhKqOR2gyxL6OuneZI+
 XvMbVETwK1uNqHqlfHu0HkaLieZsoBAcdfymvutrEI63oYh2BrNrSyTVRxLq04BIbZVv
 o56a0aTJL05XWqP8M9vt7eTT3Ot51cEB+eVz3h1aRxGPUYPkwyWlFfZRMoQG2t96y6rU
 hVax4mnNT8+3c+zTArZfwAS5Rbyx7Xz/8pfqMB9CKBdGSbXZuSUV7HJx9o9J9z6ZCIZm
 KavUZyreLoyVBQanWlXnRu0CjEwb19m9mw61bQwGffZDf7RHDj3l+i8hxOcUnZfEeyR0
 qmdw==
X-Gm-Message-State: AOAM533+EAIxF8tnGwRbQ/ikqyY9ksHx/5ZQxPk6HkKKKZwtyZGh/UaX
 pnWjcZwj/WX2pF+LyCnmlSEAfZTGb8w=
X-Google-Smtp-Source: ABdhPJwuG1Zj3FybpMftNLt7NLky+CI1Kdjy4P5IN2nrny5IBlsoBInRcdOeL2gtwf8LBGnfrPMwJA==
X-Received: by 2002:a5d:518d:: with SMTP id k13mr26208487wrv.120.1636792691981; 
 Sat, 13 Nov 2021 00:38:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o63sm8468654wme.2.2021.11.13.00.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 00:38:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 09:35:57 +0100
Message-Id: <20211113083557.17685-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mongodb: fix build with glibc >=
 2.34
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

Fix the following build failure with glibc >= 2.34:

In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/signal.h:328,
                 from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/include/c++/11.2.0/csignal:42,
                 from src/mongo/stdx/thread.h:33,
                 from src/mongo/db/client.h:46,
                 from src/mongo/db/operation_context.h:36,
                 from src/mongo/db/pipeline/variables.h:32,
                 from src/mongo/db/pipeline/dependencies.h:37,
                 from src/mongo/db/matcher/expression.h:38,
                 from src/mongo/db/matcher/expression_parser.h:34,
                 from src/mongo/db/pipeline/document_source_list_sessions.cpp:34:
src/mongo/stdx/thread.h:107:56: error: call to non-'constexpr' function 'long int sysconf(int)'
  107 |         std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
      |

Fixes:
 - http://autobuild.buildroot.org/results/6be8efb96547f8ec6e9b776abae8c1b51501e9ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-MINSIGSTKSZ-is-no-longer-a-constant.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch

diff --git a/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
new file mode 100644
index 0000000000..02b35c6e4f
--- /dev/null
+++ b/package/mongodb/0003-SERVER-59459-With-glibc-2-34-MINSIGSTKSZ-is-no-longer-a-constant.patch
@@ -0,0 +1,49 @@
+From ef08d0dbc99db8c4620512e92bfb3154282eb5d3 Mon Sep 17 00:00:00 2001
+From: Andrew Morrow <acm@mongodb.com>
+Date: Wed, 15 Sep 2021 15:23:42 -0400
+Subject: [PATCH] SERVER-59459 With glibc-2.34, MINSIGSTKSZ is no longer a
+ constant
+
+[Retrieved (and backported) from:
+https://github.com/mongodb/mongo/commit/ef08d0dbc99db8c4620512e92bfb3154282eb5d3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mongo/stdx/thread.h | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/mongo/stdx/thread.h b/src/mongo/stdx/thread.h
+index 7b15bb561bd9..6f1e16cdeb36 100644
+--- a/src/mongo/stdx/thread.h
++++ b/src/mongo/stdx/thread.h
+@@ -76,11 +76,19 @@ class SigAltStackController {
+     }
+ 
+ private:
++    static size_t _getStackSize() {
++        // It would be nice for this to be a constexpr, but
++        // MINSIGSTKSZ became a macro that invoked `sysconf` in glibc
++        // 2.34.
++        static const std::size_t kMinSigStkSz = MINSIGSTKSZ;
++        return std::max(kMongoMinSignalStackSize, kMinSigStkSz);
++    }
++
+     void _install() const {
+         stack_t ss;
+         ss.ss_sp = _stackStorage.get();
+         ss.ss_flags = 0;
+-        ss.ss_size = kStackSize;
++        ss.ss_size = _getStackSize();
+         if (sigaltstack(&ss, nullptr)) {
+             abort();
+         }
+@@ -107,9 +115,7 @@ class SigAltStackController {
+     //   ( https://jira.mongodb.org/secure/attachment/233569/233569_stacktrace-writeup.txt )
+     static constexpr std::size_t kMongoMinSignalStackSize = std::size_t{64} << 10;
+ 
+-    static constexpr std::size_t kStackSize =
+-        std::max(kMongoMinSignalStackSize, std::size_t{MINSIGSTKSZ});
+-    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(kStackSize);
++    std::unique_ptr<std::byte[]> _stackStorage = std::make_unique<std::byte[]>(_getStackSize());
+ 
+ #else   // !MONGO_HAS_SIGALTSTACK
+     auto makeInstallGuard() const {
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
