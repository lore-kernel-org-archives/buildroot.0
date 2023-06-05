Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C3CC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C435C4182C;
	Mon,  5 Jun 2023 07:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C435C4182C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdDlMIJmJEdb; Mon,  5 Jun 2023 07:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C8D41802;
	Mon,  5 Jun 2023 07:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C8D41802
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 389401BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1268560C03
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1268560C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqznMM2NuLCt for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD5460864
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CD5460864
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:20:26 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-774924b7c4dso178478739f.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685949626; x=1688541626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P6SPeGx97zrZmnMrKt7TxVsgFwaUA1WZlnpO83chAlk=;
 b=M6De9h1iiCIVc+TbmhHvoP/AtgMX+5mAEm3Ua2FtVIWWUsyuEfGifHw0/I5TyfBeZT
 dIVM36n9ZPWxXFdQufz1HcIUN2xjo75DIeSxu6b7EYEUiYwBZWq5C53v8xdFhNuMIOie
 6/DKVEsCqSA6eCA4ENVKZvkYovUlsfqkRgA8xy5B0K3ouSTDGgx43AgOd4KpQrjIIpMI
 XhIX+lcVpI9LyD/xIrbV3GQHjARhjP9XAbYKxbAqdfSYmt/cZcLUsay8HpYa+4ljA6aY
 cZYTPlT5SbKe4TsTWdEjLgAfT3PredU93R3TlFIsh3+YK9xP08mX9Ryed92O19U7f47c
 RueA==
X-Gm-Message-State: AC+VfDwCSWu2S6Y7nTeeFAx3rBsMViR23Z/u/TlFm9GAQ8oHBge4M0sA
 NsD3OONPmSo/DNSQaBjYk+kIRr2RIrlHDw==
X-Google-Smtp-Source: ACHHUZ6dZgEFoMVwA+amUP3CKCccU1no3vHxu0jLeRTPqOqQPV5wS/aUXx3KANF44zQouLxSkz9fRQ==
X-Received: by 2002:a6b:6f13:0:b0:76c:898c:9b10 with SMTP id
 k19-20020a6b6f13000000b0076c898c9b10mr12700107ioc.0.1685949626052; 
 Mon, 05 Jun 2023 00:20:26 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 p20-20020a02c814000000b004065707eb2bsm2066746jao.42.2023.06.05.00.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:20:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:20:21 -0600
Message-Id: <20230605072021.1882516-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685949626; x=1688541626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P6SPeGx97zrZmnMrKt7TxVsgFwaUA1WZlnpO83chAlk=;
 b=QPPBVKtmPLdws7zSZt6alxCCLFbd95/beicislSF9m/2oMbghzNOezu2QggDz20tX5
 SQTZ6BiheE2qLcIZXwQjxMRzHbzXRS39yz2WPyuK6YCXqdPKGwEkUCpHAh0eNW9p20u2
 Z7yDV9VVmU3stcN0YCiJ1EfIO/CyCbPjEE3xd1N8M3nvO1Eulz4eV5G7tn2WMrq0B55S
 0H7OJUBHTmBpkyzksFcEeXJbGKvypuYlVT4qPLBQ2N4xaV3Ai6LQB5TFkjZu8AlH4a9J
 /YqQOFEH+sGyXeE5JygMNtSRhPgZf/Qm+13y522qpiDYGc0rkY5BmuOtEAPnCljvqcHi
 oZ7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QPPBVKtm
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 59.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index d6026cf034..c22677cad0 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  497030cecafffca06bae2b161846b461  weasyprint-57.2.tar.gz
-sha256  b8e9ef2dcbcfbc82e99215acfd68f947b2b5f1999b5b156db75fabe380ba7e9a  weasyprint-57.2.tar.gz
+md5  2cb135e7c5318bb1652205035f083922  weasyprint-59.0.tar.gz
+sha256  223a76636b3744eaa4ab8a2885f50cf46cf8ebb1acb99b5276d02feccf507492  weasyprint-59.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 27b07226d9..a1e3d23b75 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 57.2
+PYTHON_WEASYPRINT_VERSION = 59.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b1/88/335dd6cb71a9d58584c975bf1db0ab9a3a9f15f9bffef1cbfac0fb1ee72e
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/1d/69/11343bbb46d4f2a311677058e19cc2f7bc55a769b64c547a64ea1e2b6045
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
