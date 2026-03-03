Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75557EC1430
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 11:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321F261020;
	Tue,  3 Mar 2026 11:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiNohN38zWI4; Tue,  3 Mar 2026 11:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F6D660F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772537738;
	bh=NpjJPeOFm54Ozm7KdHGaNtvTXYIZEipvCTSq7LZe550=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SN1Uwmui1YLNY5EUSPtsP8RIzaJGlC3XvA6JBdde0gdAdCJi2L+UgX0QBmFasNt5T
	 tRPtxYoIG0atuPdzBLiAiSq+Gm5br4DlJ+kKmRin2IbU2ihWF4z/fgnWj86wWBnp79
	 ETRPjwPlN/X+H7Evx9lsQYuvHGGoqDYDOnvWbcRlUr4LdN4M+djXdkwZhvZi2KBkGW
	 GM95kseKlXRVXMJhrLmWacbmoAvNagxYpYo/uZ7olcWHE5sCJOZYjbNmEGFnSKMB33
	 yz1J3t61P6jxCHQ8jlPpNrX1BKn5MhG21CLN3TyCvw9Jl6mvKlhtLGi1LVjQ2KJnOe
	 rWhyOjkZRJE4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6D660F11;
	Tue,  3 Mar 2026 11:35:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 074C1231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F844063F
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXExKmr8Rv14 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 11:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.164;
 helo=smtpdh20-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10E804013E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E804013E
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10E804013E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 11:35:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id xO2EvMtrkgZB2xO2Fvverl; Tue, 03 Mar 2026 12:35:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  3 Mar 2026 12:35:30 +0100
Message-ID: <20260303113530.472413-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIFoU5YajwHdsduW1HI0QCrSA7e4dnOQSHblrdcY2wWFf4aXlDVAV9Lwgfk/Dv5dNsvdHFvfeJfWoV5ttUndgoZFMIxkKlXdPhn/jMnbad/tvE2tpEET
 7YxKFN6+uCEamr3yLxZsXtGCihSmKoPCE2iYsvxACMLSF0JWdYklvjDbTXn6AG1OM6pkPYRr33ekXisVQTTCVAczEAONeJ4HSwlzDM5hO9i7mPs+CqrteAGr
 qlLDxrbU9CWDx+s4PEdThLWbj8f8ZXceWBkjyuDwLb3XNdnk7sDTmydwyuFN7OiTyrT1Yu8mnww2FwegbTuBzg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772537731; bh=S2qnyhRAlo6Xxe93tZZ87s6NMuQGQl4zDgvoV+ZUplA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Fq9IYoMXNFXN00JXChqz+pRbSea4D9XRLgmP/FYbrC5LmmX9nQRIQLShSIyf4W/OD
 suPVsu9AVvGyQ0dqhAUnuwN9jRtWJrX0qSS084pAxSsoNqLwN13deicEyVPpYWh+/O
 wRcj7LXt7H4BJx5k9/vpYzndzgu3ftHscv57SfufeKQycinrUWpA5OCM0PCakGGRX2
 ZbWN54Mc0tRgEXRk25vSOQQgXqtk3IHXvbhq8F/ktqzQaONialRj8XOI6lXyk5tLQt
 TeywJ9VKqdg/gGRZWhY4TuyOExO+etZgADcouHKtpJHAaodTZAXjukMbjhRPiBtOV8
 WlAOXyh5vBRbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Fq9IYoMX
Subject: [Buildroot] [PATCH] package/erlang-jiffy: bump to version 1.1.3
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
https://github.com/davisp/jiffy/releases/tag/1.1.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 7c314694e7..b5cbb99f0e 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f43bafc1ae5c9c1a7843a4c6b2d0b7ef57188e567381bf734035ef9701a7458f  erlang-jiffy-1.1.2.tar.gz
+sha256  44b93897b0ca4f085b9424d8673b3a78ff85daaaca4d055a40e2a03a8cf4587a  erlang-jiffy-1.1.3.tar.gz
 sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index b3f7cf82c7..b0839210d6 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 1.1.2
+ERLANG_JIFFY_VERSION = 1.1.3
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
