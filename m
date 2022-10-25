Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5ADFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 19:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83BC40263;
	Tue, 25 Oct 2022 19:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A83BC40263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0u6aDTCXiVSY; Tue, 25 Oct 2022 19:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925BE40259;
	Tue, 25 Oct 2022 19:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925BE40259
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9342C1BF36B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE7E605E9
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 19:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE7E605E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ddVM4Paen1u for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 19:22:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B78605C9
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87B78605C9
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 19:22:23 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id h203so11351372iof.1
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 12:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaMwEOIssfapLzXAEq8Ez2thYf22HI6hJ/SKpxaMnF8=;
 b=gKt/atnL9w4x7eA9EadzA6TFhSS4dt7lWLoGiB2rJoSzDDA2Fa6QSzmCxmm/yrsR45
 hxDSmF1fgwhuKzChFOWwTuSuuDQS7vncqN/xzcaVe+rVcRCNLQsO3hojbjkjIz5LEYfG
 eIkFwgaKtu4gN77Og3HMXVGyn8dCBuE9xkb0tbofXzzNto5/ola7alV7/+vo+9Zz/NQy
 YsQaCSindpBK8iKNa9MU5Sy31nB5/b2ZlgZteeIFTMEZV77EX4Q/UKWEk45TdPaM5ZsD
 QxI6z1AV7FdEKG1NSn6XtiBkRV/FLnFAVs47Xyfqlg2p4bnoWOTeDW9ySEmaEflziQyM
 W3PA==
X-Gm-Message-State: ACrzQf3Nv0+iBuat/uzQRLiMi6PE3IgmiEd17XRYIYAONn8l3d8gQlWG
 xBQTP6uiOW/ckjUopyLezoS5P2uX//kGZg==
X-Google-Smtp-Source: AMsMyM5RxC7tUyZr9JsLeX31zFdkRp3lk1lqcHwdEmfqR/WodlFWKZoh7a38y69U3A8Qr06UGrcNCA==
X-Received: by 2002:a05:6638:2195:b0:365:d82c:8c4e with SMTP id
 s21-20020a056638219500b00365d82c8c4emr20897017jaj.85.1666725742315; 
 Tue, 25 Oct 2022 12:22:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t6-20020a92d146000000b002fc323a2902sm1274295ilg.62.2022.10.25.12.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 12:22:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 13:22:19 -0600
Message-Id: <20221025192219.1296974-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kaMwEOIssfapLzXAEq8Ez2thYf22HI6hJ/SKpxaMnF8=;
 b=EwbOzl8JnE/8wouS28I4GyaiBBg0TcfOctNydvw7vALJ8ep6YZSQOx8CdIKG0jEvzy
 4L/YxWfFVqW1OpYoEJPTHTPeGGgPC0Z8nao4tr2wV2Cf7odKXTTVjGzHWDDJYQOLCLf3
 +I6krywObhTDWo2PYaWil5F04niMhLmJVpEL1XsW/LpSkKiZKMBji3owOzaw+8BVu0gG
 HZISfl+q+M9EB2vziQQjCc8z7QjMwKiOvP/0p32kNqh1TxneyAfAf/wkEZDo0TlOqEbA
 2B2eXRdTosZoVD69XyPxyUoNoAE+hpFEBpI0q8jVUtVhJj/1jqhEpgWvaIiwPrt8oNaw
 QQkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EwbOzl8J
Subject: [Buildroot] [PATCH 1/1] package/python-cchardet: fix python 3.11
 compatibility
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-python-cython so that cython will generate python 3.11
compatible sources instead of using the python 3.11 incompatible
pre-built sources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cchardet/python-cchardet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 396e9d6c53..53a17f6732 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -10,5 +10,6 @@ PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
+PYTHON_CCHARDET_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
