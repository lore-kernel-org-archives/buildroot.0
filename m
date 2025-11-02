Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FFCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7445A8473E;
	Sun,  2 Nov 2025 11:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmJWI7b6gZ96; Sun,  2 Nov 2025 11:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1B8A846BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B8A846BC;
	Sun,  2 Nov 2025 11:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D231222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A10C846BB
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_CtMWmn5ruP for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 849A8846BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 849A8846BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 849A8846BA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:10:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E0B6A4C5EDC
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:10:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39428)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFVyN-000000001XO-2Vke
 for buildroot@buildroot.org; Sun, 02 Nov 2025 11:10:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 12:10:08 +0100
Message-ID: <20251102111011.1390948-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762081811;
 bh=gWREiXOXeH1K5J1gn0gvFbgAFmzB05C6WQZ8oGu7K2s=;
 h=From:To:Subject:Date:From;
 b=fOWghq46gYh24cseZMzvSsSW4DXNmigLdDjG062y9TTjeXtfSuWaxRjf/8LOHhcTh
 wYUK+Ipww/L4K5ZaswMl1UDn3EaxLgTRzG+n97rHzy7s6peUPn/EDGYefN7SXjkjO2
 pT5Smpm6SD+37PstsCiW/uzAOdWUjL4FONzSbL3SQPz6om6CSEtZnIlTduU8GfdvvZ
 m+6Pg+BPQGT9eKFp7KiCRaQiHT7iTDzzyGMGMd1zQbSnFSKVatp/gjJ70BTGj+1OKN
 vJzgZywjwqxeLoZRLnhhVwXtHZSUw/yhgTq0bA1caqpyYNB/CMiRgnxk7zyF/e22DS
 cu58p8fwL8khw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=fOWghq46
Subject: [Buildroot] [PATCH 1/2] package/live555: switch _SITE to
 videolan.org
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

Upstream site http://www.live555.com/liveMedia/public/ removes older
versions, use videolan.org instead.

Fixes:
https://autobuild.buildroot.net/results/7af/7af41a2774ba3ed7049e06fe290d3233e772ab19/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/live555/live555.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 56ed705783..1e1531ee53 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -6,7 +6,8 @@
 
 LIVE555_VERSION = 2021.05.03
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
-LIVE555_SITE = http://www.live555.com/liveMedia/public
+# upstream site removes older versions, use videolan.org instead
+LIVE555_SITE = https://download.videolan.org/contrib/live555
 # There is a COPYING file with the GPL-3.0 license text, but none of
 # the source files appear to be released under GPL-3.0, and the
 # project web site says it's licensed under the LGPL:
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
