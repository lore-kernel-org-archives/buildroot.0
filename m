Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2992CC43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 20:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0A382376;
	Thu,  2 Jul 2026 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfuPTbyQ6aTr; Thu,  2 Jul 2026 20:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BDE82377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783024426;
	bh=IcGbmUmkDAQbtDJONKrHNJA/cBey3jR+EnRK7YLLvDU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QyScMI35W+2H1J0P5ohCFiCvphbw9IIEwFD0yzlXDyWtdW+PWRGDTSan5iwPx8iIi
	 oH/3nSrn0ThqqIlC+sQQLmU/nWUC13w23HvNJYuyJEva+6Hi9mwN+MLkkflw7flBui
	 U+o2x9YRkXGQYn8Kj6JOWSPYxZA1gC5+qA78+wBOEtXyUKNPSSwBPPpf5+dywTzCyu
	 KElS6P6VG7rrM7Qjx2ZIn8gnkTkRq69bAunl29AsFIq+Ram/uMDXpnGXhyS2DKD84+
	 DHF4Q6wjU5I8DAkNVQECO8wzvbctUhud6cjvphRJnLFpnWtVkhO+5HuIbIFlnFM6XJ
	 t3rw1C2KusjYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06BDE82377;
	Thu,  2 Jul 2026 20:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0334363
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1DA160E10
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJGW3dImhDRo for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 20:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E86260870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E86260870
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E86260870
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 20:33:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id fO6LwQmr25gYjfO6MwtS6h; Thu, 02 Jul 2026 22:33:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu,  2 Jul 2026 22:33:37 +0200
Message-ID: <20260702203337.350118-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKbW49QRTnJIOwwI0Up60AwmQS5nK4Nzt/7JcUQCBGOkmQ+wIFZrdugbIUa2ZYRjrMGGvKlwlOS/Z5tLwYN8XRhQsNDv1fLnUZKvDtAbGL4ZgnxGQnoD
 FAJtSK4YnQ3cc9VusuC3gpBgETGw8Ov0fGYj5toxtIcOLepxDs39JXYqi/2FuqF+YRs9nG/s8AyK8J3IKLEsAP0rewdQjTeFCxSO3l+Qs3ZcxDQ5CR28XwMc
 x7+tbVwWWb72vg7fD0jYnBXQb7I26ljFfvDbdZAR2ogiYOHUPuYRRBXCprrMW9QkjfqC/6E7BchvV49XLHr8SQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1783024418; bh=l5Payt9i4QB5Vsu7RkAtFxnSOCrA2SMt6t/hVxeA59o=;
 h=From:To:Subject:Date:MIME-Version;
 b=SLKR65RB1dQyQ5WPzrH14MoafE0Q+jr8MmHVHAv3Lri4cIi+k6HGxjhnbvCf07oqH
 ITwUehDTvHkHE9X5L9ki3LUsCnjRN8MvfG0a43ayN8coDldQehpJHX8BU7pXz3SaW1
 tml1bSX02/VTW4rP6J6hBDmVj5Ftx75CQ2aJpop+1+P4yBOD1r0s8vGO/CEB1RjF9U
 MmvYrBOPLe0PDaIaA1ZinYd0hzdfPC1uASlT8BIJz3BwsJpF59TiHOJ4RA2usac5ft
 HZuRPhd7GLw0DZQsDX8Sm1ONDUUF2UA0QCv7vo7AoOgNS6ZmEWtwfo7n2rbzfQ0O3g
 wZkDd2zAUAnxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SLKR65RB
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 2.0.2
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
https://github.com/davisp/jiffy/releases/tag/2.0.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 73e4200b5f..454e08961c 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5c1951f819f553a34f61f33124b4c8dba1d665d9bba422e15752fe4fb52337d  erlang-jiffy-2.0.1.tar.gz
+sha256  f0accdb3ec1b651afdacc92e72a99fa2fdb4f8bcd21a05ee845071ddaa263949  erlang-jiffy-2.0.2.tar.gz
 sha256  2d1a98e412143fbcdfdaed110614017b267b007252e1b4e121f9fc921edf9ec7  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index ae1ae0004f..9b6a38112d 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 2.0.1
+ERLANG_JIFFY_VERSION = 2.0.2
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = Apache-2.0, \
 	MIT (core), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
