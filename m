Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454EDC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 17:37:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06A560230
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 17:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D06A560230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EF87605F4;
	Sat, 14 Aug 2021 17:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9wH0JQoXoLZ; Sat, 14 Aug 2021 17:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8903D6061C;
	Sat, 14 Aug 2021 17:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758E01BF36A
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 17:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F1680F2B
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 17:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXPyeMaVm_5Q for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 17:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 184B480EA4
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 17:37:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r6so17695605wrt.4
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 10:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HMRZ5sDiNzqUeFQsvBuZPK0xryphamKZCC3ylO9VRc=;
 b=dfa2TjS2u36NllnlDplawHQHAVM0s9OqwerFW8/NqX2MFl02ghJDHu6GbrHOt5W4fi
 cSF7C1faxeV6m4Vx2dt+hIpbdCwzn2jAfq+F4BK/k5x6R9CnyWE1mU56ktozzA+0Cq3y
 ovcsTDz7Uv45L5efRSa5yeIC17gc88r+1iWbLkEZ59vmQ2v4oEYDkxoeoWL9aJJNk15b
 gyt/N6QtXExS7PGjix6hD48RNIj9qABvw7lD5a3tYQGg5sVvv9UWZdAUEzeIlE87pCTy
 H+rrV/hahWt/2anvtiS1ACYzfSlT1BwlhvslIWX6KacZpRy+PRS+Inn1sHeGmHhvsNa+
 2L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0HMRZ5sDiNzqUeFQsvBuZPK0xryphamKZCC3ylO9VRc=;
 b=E/vWdN/bEb7NuURqvKGv8rT5aYlsWb0yB2ccY3b9rGR6go0L/uNHXK5SuxHVAsnyVJ
 GCaDc7wnR0QvAw0BBi60yLxA5Tqpj6EiPEoAUuzTIh12HQKl3oyZHAq6U1hl3f42BYnI
 FoQtfQSEjeK9bw6MUDXSIfBmSzatYN83VucQA5JyqOXrcGYhb9WQeWRlJuXotdKN8QVb
 TepviPvVR8K65k/oP/E+zB+PeSFg4CExKVP6veeeLVYu/WL6xSQUmyMtsn58O6EEQUNz
 ONVy74yZQ18ZWh9dm8kSQpCJnb8QnkWX1HWZhv6UG6ZUEGCZlMPee5vOd7N7Yc+NZ+1C
 B2jg==
X-Gm-Message-State: AOAM530NnMYdMYZbYwudGEUgDsUD5aE7huNpIjExmow0ya3Ut8rP7dEr
 L66OWRbMuzJRbKcxjLxZyp4NJ/whZLCVm2ZD
X-Google-Smtp-Source: ABdhPJweZ4Ht9cjSCd8N2+I+nkGENFJqIfqBG/jHuS5iuA1V7wxro6e3pVaObe0h9lZixThvPkZ3Fw==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr9143186wrm.378.1628962650568; 
 Sat, 14 Aug 2021 10:37:30 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:3890:80a2:97ac:519b])
 by smtp.gmail.com with ESMTPSA id d8sm5793242wrv.20.2021.08.14.10.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 10:37:30 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 20:37:24 +0300
Message-Id: <20210814173724.1252447-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-txtorcon: depend comment on
 BR2_PACKAGE_PYTHON3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The user shouldn't view the comment on the python2 menu.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-txtorcon/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index 9677eb4da8..e8a1a233db 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -16,4 +16,5 @@ config BR2_PACKAGE_PYTHON_TXTORCON
 	  https://github.com/meejah/txtorcon
 
 comment "python-txtorcon needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
