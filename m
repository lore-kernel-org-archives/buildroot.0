Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4896C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 23:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CCD40486;
	Wed, 19 Oct 2022 23:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CCD40486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqpNpYV2l0NC; Wed, 19 Oct 2022 23:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C8AF40390;
	Wed, 19 Oct 2022 23:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C8AF40390
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE0331BF419
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C973184058
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 23:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C973184058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uuYTnFV1t4eu for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 23:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF73984007
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF73984007
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 23:46:58 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p16so15886008iod.6
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4g9hL5J9BnP9HYXUU+wPJIyyksZxT9R90vaH3JkGRa4=;
 b=4n2Hehzi8LwbDCFtgYGR7/pMG6K431DSi1Jp9OBWfJc55aarkKVuAwjTNkTNxT5HK1
 h0QaUfWqpSyPXO6TcD1mcOoCs8I/XC17xigK0MQ96qWyU/5Oc6aPouL19wwdwPZFMqT7
 ZbO/YyYq3OMuheyJ67fkO8TSV6v1pp2bdTVqOJsSy+VXvf2McUHkxGoGF0qxG1TzvqkP
 5MVJnwPO4mNoDKChJ6HsIrX+YoKuyf8w8C0jswYbMHMwh3Sl7WyA1fnaBIoCDZsPOzvC
 mAKEGP/nrnUJC9xaGjcVLNoMjFux81l5QqyOKjlNRydU5u+BTm1kWgLAM4Lfgi56G9by
 7Rmg==
X-Gm-Message-State: ACrzQf0DaYSUk/yQQbk4BVRVytVhFt8BjSEmgDAOetqtA/6GjBxV6j9X
 c4AMkEqwaSvpMfcj/CoH/BEnmxnz6QZmBA==
X-Google-Smtp-Source: AMsMyM7NILPftQeaGJhv1XF+9oaPBeSKT4zDhfQh/AGyECYDDk8jjHXtKepfDBRfg2EuOoRfguAMvw==
X-Received: by 2002:a6b:f605:0:b0:6bb:cafc:ec27 with SMTP id
 n5-20020a6bf605000000b006bbcafcec27mr7941578ioh.194.1666223217757; 
 Wed, 19 Oct 2022 16:46:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t1-20020a02cca1000000b00363e76105c8sm2605713jap.92.2022.10.19.16.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 16:46:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 17:46:55 -0600
Message-Id: <20221019234655.1097686-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4g9hL5J9BnP9HYXUU+wPJIyyksZxT9R90vaH3JkGRa4=;
 b=HQJDh70eHlnGks6ebivWEiRHkbKJBxULnbCf51BOxWA1A6A+z1aVhorDQdzIqcod1Y
 VI/PiYH5MFyL+5c6DCYoHmBel6B+SjPrBOQ8lS3ti2Ur0PhdpbY+DwAUACK8UzaVp8s6
 I02hoLBLieeQNEjG08YWB0CiUJlsYoDEqoAEVEGux5IygMWZIq9GS3BoDfG4nr15i0v3
 03qSydD2cvS+VMQFmB8OPth6kIfZh6biTlxAHa9OGabj3PwpYn9QYdGFwD+E+op5MqLy
 YgYiaoMYp3oLl4kTpkOZhPIqdAp97RezrVKA9NgLeLaWMrw8aVcl/E9lmeLdx9SZEGTM
 08hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HQJDh70e
Subject: [Buildroot] [PATCH 1/1] package/localedef: add MAKEFLAGS fix to
 localedef as well
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was fixed in glibc but also needs to be fixed in localedef.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...03-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 package/localedef/0003-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch

diff --git a/package/localedef/0003-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/localedef/0003-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
new file mode 120000
index 0000000000..1e41bc4e12
--- /dev/null
+++ b/package/localedef/0003-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
@@ -0,0 +1 @@
+../glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
\ No newline at end of file
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
