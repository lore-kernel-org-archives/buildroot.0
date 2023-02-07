Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E149C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 19:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC87540352;
	Tue,  7 Feb 2023 19:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC87540352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HckYYvyu6qp; Tue,  7 Feb 2023 19:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA5C40357;
	Tue,  7 Feb 2023 19:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCA5C40357
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8288B1BF40B
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 19:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552E661043
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 19:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552E661043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmnhQI7LlPop for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 19:58:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31AF460AB3
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31AF460AB3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 19:58:27 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pPU6g-00024m-KS;
 Tue, 07 Feb 2023 19:58:22 +0000
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 19:58:10 +0000
Message-Id: <20230207195810.2016594-1-john@metanate.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=9gZkSlk84Pj9QH81H8sGpKFmxfak+NpYgb2BF2B3IVQ=; b=VL
 cyOtc3udLYjR7nV0HBnyV27jJPYER0RPR9hmLM/+dTr+BbQWnWeT0bznZY1wmMvWyG8ZzYPYSgm2j
 3u5O62orkiZSgiIuypWffoR6aE1qZOu1429GSUMcmVtd9F0jTU0o0h6PfJP/gjLmnzog8DUcydwJ4
 5E22MFfHgDUtvHBkQyI29UybcKudeBTGqctHyKFdmWCzm4y6WoyC5hN8drm77l/Zy8e0MI7TYmGT0
 6X7EJLfCOsTHiONwKX+rCxccNCmcKqX/yNqK2LmzNtDvfU2h+Ne1tM376D37XYeKkvimL8B89aeYa
 eld2PB6nwTbDg6AljkuI7wnba8KQ47xQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=VLcyOtc3
Subject: [Buildroot] [PATCH v2] package/gcc: map debug prefix when
 reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>, John Keeping <john@metanate.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with BR2_REPRODUCIBLE the toolchain wrapper passes
-fdebug-prefix-map for all packages that are built.  But this doesn't
affect the target libraries (like libgcc) built by GCC's build system.

GCC 4.3 added a configure option to set the debug prefix map for these
libraries, which is used here to avoid encoding potentially
non-reproducible build paths into the debug data.

Signed-off-by: John Keeping <john@metanate.com>
---
Changes since v1:
- Add the option to GCC common config, not just gcc-final

 package/gcc/gcc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ec6f3b550a..6dfd93f2a4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -84,6 +84,10 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-bugurl="http://bugs.buildroot.net/" \
 	--without-zstd
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
+endif
+
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
 HOST_GCC_COMMON_CONF_ENV = \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
