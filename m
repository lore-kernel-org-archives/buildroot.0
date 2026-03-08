Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77D5F55102
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CEE40D46;
	Sun,  8 Mar 2026 10:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpCU_ddbFkGL; Sun,  8 Mar 2026 10:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C28540D47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772965955;
	bh=Kcc6EG76I6VLb3LuP5h2IeMUFc2ETrbIgky12/XcJpk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jo4hAvmqxb55q/jl2Bk+j31xJ4/6bDndaHWhuBhbWcur6iCBmDP0LX5NJGxWj9boz
	 WohEJabxHkixU7OE2l1asCsEjJMvi7nrTD0S9GRAQf8/TEIhV3FxgSoZi/z6VENN8H
	 VxKF4HrNhGEYKwobic+aSLEZgTaONVjQZOF0bpcXp+D/QPCMB8Y3eIShIS95j3Jlqg
	 Nw4S4Wok4C3F9cThSG800XEEuKWYmmL9xriChAlljXNwrk0SQOetdImktihcmcBtsa
	 3y+bJ+TKP0tV7f9ZjbgJDODvsmJQ+E0E7Tulzfw5BkQ6fBs6Qnk8NgV0Tn7K4novZ/
	 ItsO2wtPZOyGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C28540D47;
	Sun,  8 Mar 2026 10:32:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C71223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BA4D4060E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xDpxSaK83FW for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 800FA40515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 800FA40515
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 800FA40515
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:32:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso5756491b3a.1
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 03:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772965952; x=1773570752;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NRQ6YRZ5VRmEMIVXx6o87NdE4cXysFYKUzkJHRtilg=;
 b=GXzCzdaR/uww8x1ON28Ysoac3THWGKhybgYbvaK0KvNWx8Hp1a1fqA6EChoHHctSFm
 6pvhnWp2qHOXsCtIwSSwb6VnBemYpKF8ND5QSWJZgyN4+r1jQW2LP4yBD4lRVhivpK7I
 EWW3ABeFuBukg1enacQ626UTIznK0MK0V5gjTCnmd3YKpl7Verdx4cSX76KvK/pYYkv2
 fG5UrzDohTPWeLB3cdgI6VteyG8BX5r/fgeZzAvZYN2iicuXpJ9/wVPjkeE2h+6mtU6t
 N4KNcAiOVa+/uffhRWCcuq33Sl7oDEpBjoHijdJ/uZbo2u+AzblRCQYzprSpZyTdPC7g
 HqXw==
X-Gm-Message-State: AOJu0Yxm1wXSzZLTgNTBSPj1WRbGjPtVrGDDPiA3XdGmk4yXyFc7kOa2
 ofM5oyPlzXvP5M70gEUAIPUsH7JqpdHY3/FMfvH5KOnCXQTTQK1QlCTABh5KPw==
X-Gm-Gg: ATEYQzzqCixoLvd6lfHRYufRYA7K6Qxpf/KGtAomyjGlwFT5le/Kz54O+jGTkzBRJyP
 iLZwmLyrGcTv6eseOX6VEmsTIypkgIcV1R+O/wCpid2Othu33/B1du8YD6obum3lLmDnVLYJ/b3
 KR5SQsjzLQ/NB2lNUYyRiY1VUrt1FAHMpzA5VGoKRHg5u6JXNTMNwU1kNNRnVrRJiuvSvR+wtkQ
 pkb2BbC0lDKvfosgWqWHHQYVWLkzas/0cmY6nBhQei7Uh3TpMKQMdC5iha+ujIIIDZ5wgstDPXt
 MUHLW5E5n1dgQQ0Om1dCqi08y7zmAbomNCiL2lQmb5kdAbfcyXablMUJ3WQXwvrhErr431YrEAp
 T0FZ/ibJRXQxyQ6IW60/EmmdUtkLrLJ2laPcAmWdrBP+6JAlWdCKq48AcE3aXRQgb1IAbL+fjS2
 AQ06j1/6U4vqK0YaOrdAENYQeUvUXy3zCVBUE=
X-Received: by 2002:a05:6a00:4b0b:b0:823:16b2:2498 with SMTP id
 d2e1a72fcca58-829a2f4a145mr7433420b3a.36.1772965951870; 
 Sun, 08 Mar 2026 03:32:31 -0700 (PDT)
Received: from fedora ([2409:40e5:116b:3332:bcdc:5bdf:dbca:b2ec])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48a3b74sm8750504b3a.45.2026.03.08.03.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 03:32:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  8 Mar 2026 16:02:12 +0530
Message-ID: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772965952; x=1773570752; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3NRQ6YRZ5VRmEMIVXx6o87NdE4cXysFYKUzkJHRtilg=;
 b=nLpr7S2MQqHVVbeG38rCdyazh69b/j0VQ+gjXx28MvkrCzDLMIPFB+NIKT32bBFKQT
 HMSFLeg58juhO0zyxKPkcq+i3E83WBjcDEDKHdFcVVvVxmkb3yiRZ0HwXlsXdZBcULfV
 rO2lBeR0pkXOhLynJqw81IhWu5L+qYTabB5ab1obd7keYOV840qLIS9fJ0QPOxN/WIIn
 PPvGWMXrqA5ccf4N6DvsBkpMjzKMJlI21y2If+E2Eol1rhdmuE1efD+fKnZhKGli9pQn
 tFCSIRr1qCuap+Vq7dNEUGbD+f9JgokEpUg47zpR9HRih09iVeHWSOf3bXCrI4bzD15V
 EilA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nLpr7S2M
Subject: [Buildroot] [PATCH 1/2] package/which: fix build with musl
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/which/0001-fix-getopt-prototype.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/which/0001-fix-getopt-prototype.patch

diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
new file mode 100644
index 0000000000..29401b0f53
--- /dev/null
+++ b/package/which/0001-fix-getopt-prototype.patch
@@ -0,0 +1,11 @@
+--- a/getopt.h
++++ b/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
++extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
