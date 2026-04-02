Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD946D6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD6D80682;
	Thu,  2 Apr 2026 17:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWm92ly8tp60; Thu,  2 Apr 2026 17:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5FF8069C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775152793;
	bh=zRRILSYnZ2RuMZ/+GRBnAGMiJTsT+1wRrE6vQkcG8mE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0ThlHRbX1FGk3gFDbi85BdxlPVtsmxEczYUB7pswjMnHtaMvjI7+yPeWF9Il6ZL3
	 kLE1Wj18Hf40GWathmJtK40xrxv+c+Cb3QPVZHqaaXrTAvZbd+Vkt8MPQ71+6XRNAJ
	 iTxJmzeKcShZxRssdAcfBYmKAiJ8HQLW5tVeAbPJqmhr4g9WNYjOqmxTfZOXf7XtRE
	 t0il0q5+0Of+uoUwiDega4LxRiXcGzwzrnLDnqkxN01CjzoMePgPEXxjxR+rqZYys8
	 RD3CtkdrkbiHEXu17QIwU4VoRvbf6odFUPAlkDJ2CrOfcDRx5VKqL2QCtAJVLNPOLT
	 nCc5Bf605nlkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E5FF8069C;
	Thu,  2 Apr 2026 17:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE8B2CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A31607FE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SS7Sg512jhhG for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 17:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D227607B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D227607B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D227607B5
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 17:59:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEC58A4C1889;
 Thu,  2 Apr 2026 19:59:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MKa-000000007m1-1QF9;
 Thu, 02 Apr 2026 17:59:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Thu,  2 Apr 2026 19:59:48 +0200
Message-ID: <20260402175948.2779682-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775152788;
 bh=pyhNFVdwjkSL0gakvDEhPoFCZBcM/sBWXuV95OiX0tQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Y11ZAQCcqdOHezqX9GTmduHIxqqxPtWUm+HtHZC2yPUf6xuOPczLqk+DJfdSQbLMQ
 4BC2O67sGGKkW5Bpyd6wqa61nEHrWUGWPQQC2y1uwxbGPpjQFlfL170tgBPpSDaQ7Y
 7ZBjDjvy1vd0dpHbm0It00VaRdg/6rUJpyODbglpUAgO1K8TkL8P7XHlkoSjbb8pxo
 jaR4ooP/oiRojvPJg/lWb45NSzciWajUNwglWgf7xGA2c+a6Uqmrq3uAtwFeSM9hCV
 YinoK/t1LIEQsLklTbi8UNcAweV8rwOZkOSOzDfr1LiLq+EsNbiWMv2RZ7WH8koMJV
 00gu/UW71XTXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y11ZAQCc
Subject: [Buildroot] [PATCH 1/1] package/jansson: bump to version 2.15.0
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

https://github.com/akheron/jansson/blob/v2.15.0/CHANGES

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit:
https://github.com/akheron/jansson/commit/2297a2e320ebecc6dc98f7034a2f38509ad1d7f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jansson/jansson.hash | 6 +++---
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 0d9dc7b5a5..747f9e4420 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9  jansson-2.14.tar.bz2
-sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
+# From https://github.com/akheron/jansson/releases/tag/v2.15.0
+sha256  a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954  jansson-2.15.0.tar.bz2
+sha256  150d90904cd8de73609bb177b42edd3867b07b4b7b786dbba319f30de39fcda2  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 8efe28bf4a..e60bb1aab6 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.14
+JANSSON_VERSION = 2.15.0
 JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
 JANSSON_SITE = \
 	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
