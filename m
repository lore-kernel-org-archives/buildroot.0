Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10698C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C14EF6136A
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 19:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C14EF6136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9381D4035B;
	Sun, 15 Aug 2021 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XlOqVkXS6shI; Sun, 15 Aug 2021 19:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFD84015C;
	Sun, 15 Aug 2021 19:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3E31BF28D
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46D7140383
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-KE3WwU7H5l for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 19:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4B194034B
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 19:53:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q6so9210830wrv.6
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4/Ukdb41DidEqsi91xy10cP+3fzUtLQ8QW/x1PT1sg=;
 b=HZ9O1f74dwPDxr0WtdBH2xOs8PbXRXEbNcITmGn/IFJHYPJZYem43ivgTpwP3+nsZ8
 jP9aSOunsG462r7Fy8IejriURjrrPguRTPniQrgdvCppQ3WEzTpQ3M1NPg1RAIt2H9z1
 Jv7EUBMU5Tz0ymL5yGYlyTN5fOKLqlFW4P5yRivg93SZIX8bg917IsvMI+Q92iBuXMV7
 i/qIxU68KfxbNRuNVpxqMSfofutf5csOj/h0+qX1FGaxPbMmaeUM37PY5Efdmxar7wc1
 l/TNUmjj3tK6sFCb8ge7tLnxC5K/wHR6DHND6PEI2hPqVkUDjGTC29k0BlUFSA5Zoz6Z
 rQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4/Ukdb41DidEqsi91xy10cP+3fzUtLQ8QW/x1PT1sg=;
 b=lJPu4f6VLjhjz4zgJY5SWX/Ppq77zMUyjl+7bKElleNkF22sH3pZ3BiO9KIOyOF8fM
 J6SstAbPsY9b4bwnPizNP6Akp6g1tiilZn086Cy6wOEFALP32Q28rF7JCPd0g/Zj4rzE
 //rs6TUmje9dFZ4N2TwZD2faXH51GDVPq6q8NTV0hwu/6jLmkbiCR3kRJE6lU1FifLcs
 Ek0NP9UWCF5VtWWjkrnfzw0ECWXenILdyljI4QFpHJyub+NGDKDmmAT1RGSLhvjkTq0/
 ONIJFjvOanEqbPVuWsPaGpaSNJQNW/Q7eY3YGY2YWnRQuXZN+NxniH8qIHQcc3Qs5L3v
 f2Pg==
X-Gm-Message-State: AOAM530EQEtRzicJRVwLM3CAxJH3XzYU247rbep79Vb2C9cmCyt2gpuf
 /tX2JkC0CD0IU85H8OwjV6+GnyWoYGY0udA3
X-Google-Smtp-Source: ABdhPJwtUPgbr2CrsWvR4An7+Es7KewzskyWG619vtcI4zhr2ppXSHesmiFv4NhTH3veOCGFryD/mA==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr13184675wrs.216.1629057232017; 
 Sun, 15 Aug 2021 12:53:52 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:1cf4:dfbd:c158:8c1c])
 by smtp.gmail.com with ESMTPSA id a11sm9431169wrq.6.2021.08.15.12.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 12:53:51 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 22:53:38 +0300
Message-Id: <20210815195340.12027-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-secretstorage: depend
 comment on BR2_PACKAGE_PYTHON3
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
 package/python-secretstorage/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-secretstorage/Config.in b/package/python-secretstorage/Config.in
index 78a0a2ae15..8ae8c2d598 100644
--- a/package/python-secretstorage/Config.in
+++ b/package/python-secretstorage/Config.in
@@ -9,4 +9,5 @@ config BR2_PACKAGE_PYTHON_SECRETSTORAGE
 	  https://github.com/mitya57/secretstorage
 
 comment "python-secretstorage needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
