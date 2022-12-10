Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3449C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3512B409B3;
	Sat, 10 Dec 2022 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3512B409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-p9kJcJYYYj; Sat, 10 Dec 2022 20:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05CC3410A0;
	Sat, 10 Dec 2022 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05CC3410A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 108A21BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA068818A2
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA068818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ce8Ebe2TNK6 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:37:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A516B8188B
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A516B8188B
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:37:43 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id s16so1590424iln.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oa5oSFffMTH58MwsZib+ew26hn4k+G1fdZm7dXehExs=;
 b=CZNJzqfCExZMHmB7cXfcyqXBV3YK8qE1W8D0r6mkeTww3ggwBswWPwrGavXr6xc3sc
 K4MPPTIOrlNChXP5L+lUS09QiA0c5Q8uZrdODAsSzxXexZcU4DohXwEdKfumxG2v1Lv+
 2CaWxk9G6YnjA1oCL+fYAu1GLtYgu9knNaCWCg84w+wK7kMhdY2vAUc6LB+k9Hva91Xb
 A0dO8wYFqFWW1ND06rZZ7BapRKpaBC3jnayjZY8cvFyLKBy76kFuWnSDmqL2gliloC9x
 GgKKmgODTevcLWtyq901hw2vKPtcoWDEyQQ+6TOwzO5ETrbV4tVz7hvwkSQmuj2eDQSw
 crIw==
X-Gm-Message-State: ANoB5pmBJwFcBb3U7iFdYooMnz3XFXAmcjUSjuin+1mZSyyJWcPS/BPU
 mkc0eWIpwo64xPyVAedxl2Qr0sOBWMLpNyih
X-Google-Smtp-Source: AA0mqf7OQJOmT8+sYEeYeSXHdzoKepjR/nmcK5nxLPzy6XQtAj2gvsaJTUBKFPl/im9Q76O5m/qlHQ==
X-Received: by 2002:a92:c911:0:b0:303:9265:a73c with SMTP id
 t17-20020a92c911000000b003039265a73cmr5812994ilp.22.1670704662529; 
 Sat, 10 Dec 2022 12:37:42 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 cx27-20020a056638491b00b00386dde027e7sm1628266jab.73.2022.12.10.12.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:37:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:37:40 -0700
Message-Id: <20221210203740.3580538-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oa5oSFffMTH58MwsZib+ew26hn4k+G1fdZm7dXehExs=;
 b=j/KdSLL3gTJxMJ2E3i7G1E1vae8E+oE7Ej4wnSBUiW7EI6vFr8XN4Soz341o9gCDG0
 t9Dhj/9uOdMC+KsMWMGE4QoNZyvsAF5D8EwkV0eg7Qg7rNJlVmaE874TdIsRLw5u9NZ5
 FE6XyfOURtjHxoxJuHxREcETeEtNzYfC/Wlx3cnV4FHZucMdnS67P4fQKc38Tvoby3Sp
 JOfXbNJtHaArTxDw/jdfoyJBARGE71lqn8mmSvnj7GiImMi7PVUN+WhNtvsexJpLqrcC
 u5sG/qf6EBhdHnnMwGvjS6gwden44wDEzeely5EakWkXRhEU3/w8MHnmK3ROmn2UG2dA
 2PXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j/KdSLL3
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.18.0
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 0f56d4c6cc..1c99b87590 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  0b8f47c9451bf101a791f8b5bccf1f33  simplejson-3.17.6.tar.gz
-sha256  cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6  simplejson-3.17.6.tar.gz
+md5  83e24e662f024e06af2fffe698227da4  simplejson-3.18.0.tar.gz
+sha256  58a429d2c2fa80834115b923ff689622de8f214cf0dc4afa9f59e824b444ab31  simplejson-3.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 52bff7569c..1607d9c90c 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.17.6
+PYTHON_SIMPLEJSON_VERSION = 3.18.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/7a/47/c7cc3d4ed15f09917838a2fb4e1759eafb6d2f37ebf7043af984d8b36cf7
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/17/3d/b8bfe1f40558f6a16f70c349adf97480dc71a7d11b2b1a5dc0824a87faa0
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
