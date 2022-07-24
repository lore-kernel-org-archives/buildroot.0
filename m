Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86B5C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53876400AC;
	Sun, 24 Jul 2022 05:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53876400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEneWagzuVpA; Sun, 24 Jul 2022 05:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D35400F1;
	Sun, 24 Jul 2022 05:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55D35400F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67F221BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51041408E3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51041408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7P3EYdrY1Fcv for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4693400AC
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4693400AC
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:42 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so5849922fac.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/BXAs8W7DqEYwpL1321ASYu+zhhBoZSUqrTTIlQs5V4=;
 b=nbj7vnPkvApAyHw7GbyqWZP1h3YaZValvm9OWCv9pIhPXTv/6m+gXq25HGHzZKhV5q
 CiCo1pccLIDJhZF51+zoauoU+ZctgOFcGOocrO1izCmBidhivvEn2qUn3PnchmsTBh8V
 UACIF0XOGA4ryBeQ5cOBvmBoJeFrP8gTb8iGhzFEERO2SD+Jd2rfMQqSIvNNag9fEV0r
 Uk2rM/sgQHULxZQpKoRaFjHfzjOa1rpZLpHd7keIievaXLYd3ZLR62Ns/rPuV7AuWBqE
 vtGX6avgKYk2CP83UuSlO++sZlvIPJlG2+TLVZOQ5r8t/AUXJM6DLvQrJHodX16SLz3s
 5arg==
X-Gm-Message-State: AJIora8o2fyPQNYTg8qH7xfvNhOfjfNLZHDFU5nqKbNBnCL1erpBpciM
 g5LqHVRtQGvpTauffUGq98Hh/6JvezY=
X-Google-Smtp-Source: AGRyM1tcmOea9jgUOK8sDiZhDvAYzWNqAjqZw5mgS8Vw6vjx7oynrd+VHbL0MrRhLrd7rrz1L+EaXg==
X-Received: by 2002:a05:6870:7387:b0:10d:c24b:1962 with SMTP id
 z7-20020a056870738700b0010dc24b1962mr3412218oam.284.1658641841671; 
 Sat, 23 Jul 2022 22:50:41 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:40 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:04 -0300
Message-Id: <20220724054912.2354219-9-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/BXAs8W7DqEYwpL1321ASYu+zhhBoZSUqrTTIlQs5V4=;
 b=C1nWQiNH2XQ73Sw6M8K+SLk2YA+iNVmxcH0EjFEZG4LfNQiguMsP7w0jmtPpl73EK1
 P+L4nLnEVCZ2J8Yn8JwN2OVxcReFobEUNDggfoDo6wsIPWoqfX0O6JQ0aYOfCcLMnQQH
 SYVCGsbEeUuijBRfCGa1gnrOFs2YHljxFWsQmapf5dV/IXvESKr4cZ25+mSDc5LJHM5e
 W1TzYfX3dcMtRX76LcUtpLpl32uFCvB1Iph1N8BUyMFyX23E2fSM79wRfKCMOM17wwMT
 uBpj4J4uMfF5iTTrxizTAV9IXOkQTcAyR0HK12ahTfMfCeK4JxopS/0ixx7x6IqoehcV
 QycA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C1nWQiNH
Subject: [Buildroot] [PATCH 08/16] docs/manual: check-package before
 submitting patch
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'make check-package' to the default workflow of submitting patches,
just after the rebase and before using format-patch.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 docs/manual/contribute.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index e588c69be6..c5652af7a0 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -294,6 +294,12 @@ $ git fetch --all --tags
 $ git rebase origin/master
 ---------------------
 
+Now run some basic checks for the changes you committed:
+
+---------------------
+$ make check-package
+---------------------
+
 Now, you are ready to generate then submit your patch set.
 
 To generate it, run:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
