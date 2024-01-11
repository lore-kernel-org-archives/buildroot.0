Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94285C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D91A6143E;
	Thu, 11 Jan 2024 05:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D91A6143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nts8B-EqLQXk; Thu, 11 Jan 2024 05:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684E1613D7;
	Thu, 11 Jan 2024 05:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684E1613D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5421BF8B4
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6309A83E4B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6309A83E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZVDhW1ozlTE for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:00:57 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66ED883E4A
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66ED883E4A
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7ba9c26e14aso125972339f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704949256; x=1705554056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmsckA99ILksfLRxHiWS2+J7TUKe0dkBYeq4TqKNr2U=;
 b=PVvjb7G7MWGxO7+66OygKI8fDK0ow0FZ99Woou76yV/dqDdqRd3hFJkT2pLWmiAzER
 9CwTBbfQVMngzhqBpOJkfQa52VQwM7ms5Gsj0sxR8hCyDj3QVuGEg6WKol6O1a9xxzjR
 uADLBeJeYgEUnk8oszwUTzJHVuscyEm98WxTxMyiANrfsoDsBVen5TA66Qu2cp++lKgZ
 y3SxRdKUDPeHhtY2Szbk1UCxHGOen2wmWPZjFhIJxzwvyjyVMaN1A+sWRoqZNOBHqnhG
 hBZfbf/5HyfCx27TdrrnIpZeeJmU901sGCrhzIh1JOipRE/9oT1WPnl4RI/8qpz1JTMe
 12lQ==
X-Gm-Message-State: AOJu0Yw9z0Pba4V90cq28ISIKkM6IBB9kc+Tf+tAGjHgzWDw3Bwu2MLm
 PB8Va1ujz7JpBIegB/GJ4lTQoo65UMGmow==
X-Google-Smtp-Source: AGHT+IFCx7HW7tBHpi/95zeQkRiyQn0lguSookvq4UZsbcM8eIxOZSHiyL5jkhJRnB7Xs8v72ePusQ==
X-Received: by 2002:a05:6602:4883:b0:7bb:dd24:3f42 with SMTP id
 ee3-20020a056602488300b007bbdd243f42mr207142iob.11.1704949256005; 
 Wed, 10 Jan 2024 21:00:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a17-20020a056638005100b0046df6e19b9csm104291jap.34.2024.01.10.21.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:00:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:00:53 -0700
Message-Id: <20240111050053.2897660-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704949256; x=1705554056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FmsckA99ILksfLRxHiWS2+J7TUKe0dkBYeq4TqKNr2U=;
 b=B3HV3SxhJYKxhPLe+XU6hGDLcXYMQEuB8DmqyJqgIE2fBRi1RcPfuIE7sg8/7Bi/Ob
 ZSOIysXiuQMlTxemcL5LJFPTzo+UfWfV2wgzFqsblxTIjvM+o7bvkElQt37P2VaiuFn/
 ONl4Dm6QmaOTyqMjoLkjV1FlxOwd6X2TOwfVu2OqlU9beAf/k47pxvrMCeyRdzrmYp0D
 jS43qpwwt78n8tUOT4RRaEAxzSVlUwK0dGmW7sebND60ShmBeEalj8XrmZis0okKr0my
 T6NFn5pYZr2QjIFaPmMCQpBtdG1eyz4V0RG1+4WxZK9hc4lKg1LlzQEKRCdTs/xOoODk
 IoXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B3HV3Sxh
Subject: [Buildroot] [PATCH 1/1] package/python-reedsolo: bump to version
 1.7.0
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

License changed to Unlicense/MIT-0:
https://github.com/tomerfiliba-org/reedsolomon/commit/7b97461684701cf19451db1fd348d831dc526dc2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-reedsolo/python-reedsolo.hash | 6 +++---
 package/python-reedsolo/python-reedsolo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
index fdafc89f49..c1729f0aeb 100644
--- a/package/python-reedsolo/python-reedsolo.hash
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reedsolo/json
-md5  b67a04027a1825c63a63b6793ec660a3  reedsolo-1.6.0.tar.gz
-sha256  4e290d3b0a7207ac7aac186790766c752b5fcdf5e0b04dfd260349579052bbac  reedsolo-1.6.0.tar.gz
+md5  5bbd7741f915ad67b6d425f93ab9d103  reedsolo-1.7.0.tar.gz
+sha256  c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732  reedsolo-1.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0babd7b573efc3dcf5bb3c28b583150726f775d3dd8d54d6cd062834735b3d73  LICENSE
+sha256  2da9536c23b72bac15603bb1f8dbf269dc68ecfbc35a75f8d0aa9cb209ba0934  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
index 2a7fd42a05..66e85fb40a 100644
--- a/package/python-reedsolo/python-reedsolo.mk
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_REEDSOLO_VERSION = 1.6.0
+PYTHON_REEDSOLO_VERSION = 1.7.0
 PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
-PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/9b/10/28d1492cc82a103bc06f18cb9a9dbb3a9168ab2e4068801fa0aa0c76b231
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/f7/61/a67338cbecf370d464e71b10e9a31355f909d6937c3a8d6b17dd5d5beb5e
 PYTHON_REEDSOLO_SETUP_TYPE = setuptools
-PYTHON_REEDSOLO_LICENSE = Public Domain
+PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
 PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
