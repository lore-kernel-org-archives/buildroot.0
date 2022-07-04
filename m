Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BED6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 09:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F23760B96;
	Mon,  4 Jul 2022 09:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F23760B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rboPw5RM4c2S; Mon,  4 Jul 2022 09:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BEE60AC2;
	Mon,  4 Jul 2022 09:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BEE60AC2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD90C1BF2A5
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 09:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A40560AC2
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 09:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A40560AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fny43m-Id6yC for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 09:39:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4086260A9C
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4086260A9C
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 09:39:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id o25so15736547ejm.3
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 02:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=15q04+bBSlFH2EqepZun68D05cnsvkCQaV0QYc9+jDY=;
 b=dRydCgmvp5K8R3RV3egPCnpwIFY2JT/m74Rr20/WuoZEOa317GuT+vAWCkRtMGfTvf
 zkPyLASZ8vVS6iD8D8WUBIs1l+Nt9LcEsKu05KAn8x9nJALpvV6QgVRuzKb7IMqtzlRy
 /TXuE36aiD77X7VBpNmzPZIsq1IRwUygJfxWTYoXb0KhAQ6/b5A2Syfkx8aQs1WEC5Md
 7q7XOTwM4/w6EZbq+twem4ILqU1J5QcKwdtipmHrxVuuzlRbwaC4BGxrRNUxbvE9v1ZR
 xARIcRPHonEb+8xo8cQJGla7+X7kXIPz/sjm3smfGlql3dOFOd1mGCwulzIbroxMSVnH
 +haA==
X-Gm-Message-State: AJIora+W2zKncuTmi9z4wzWolPrwW2SoHH6mGZuh9RU8t1fyQgjEGHrN
 p0pC0GMz/uoscDf+AQgjUjfMkrm/iPc33Q==
X-Google-Smtp-Source: AGRyM1tLjb+hF3XuUVWMhvk20SlAi32OOmZ4hll9vB9evnlD6fgQy8/dKL8aCw8KGUo+mOdJIj9ZSw==
X-Received: by 2002:a17:907:3e82:b0:6ff:1e04:a365 with SMTP id
 hs2-20020a1709073e8200b006ff1e04a365mr26603478ejc.617.1656927569111; 
 Mon, 04 Jul 2022 02:39:29 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a9-20020aa7d909000000b0043a706d3a48sm58751edr.76.2022.07.04.02.39.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:39:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 11:39:22 +0200
Message-Id: <20220704093922.4195-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=15q04+bBSlFH2EqepZun68D05cnsvkCQaV0QYc9+jDY=;
 b=X90cEgnlhVCD+bEnG7SrXbdVJLGj6IlzhowNWqI/+lnqYMVaM6VCrLmQ8c/FDjhTVW
 pomwO/lLO6DYp2Rj8OC0+Kw/wV7DieVN6HxRb/La15Gf97dANHdZCM3eMSxCfkodfbPu
 3T3BlEGp7gllycItYBTeZ9LM1d8hugJumUPXY+YIT5Ryr32h3CuCLe7WqiQsMxfWnvNP
 rE0xxmQA4M+iwMgzfHsT7MytKlXkFCC+ViPUgXGqN/x+bQXWq+SHPS41w7cVrePxp74a
 ++X4PiY5LrbPkIK0RtNBGFITxWqPhYwP5KK6dxK0I5bZXU7rIdld1J0PPRPDaSRS/42s
 HHdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X90cEgnl
Subject: [Buildroot] [PATCH] package/python-automat: add missing build-time
 dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-automat needs host-python-typing-extensions.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-automat/python-automat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
index b94fd2e1c4..03d6759718 100644
--- a/package/python-automat/python-automat.mk
+++ b/package/python-automat/python-automat.mk
@@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f
 PYTHON_AUTOMAT_SETUP_TYPE = setuptools
 PYTHON_AUTOMAT_LICENSE = MIT
 PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
-PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
+PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm host-python-typing-extensions
 
 $(eval $(python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
