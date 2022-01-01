Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57AFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572BE4020C;
	Sat,  1 Jan 2022 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRmhSRxVWi58; Sat,  1 Jan 2022 21:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A119A4020E;
	Sat,  1 Jan 2022 21:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8C3F1BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D200E813FA
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMfUDpAjKSSD for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E92A1813E6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:33:48 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y18so27944459iob.8
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zMRXr6ZxF2EsE9TgyhpZhXmn/+Wvq+dGTNICcFinOd0=;
 b=Al12T92LsSP+EztTs+Zbvp4bBR6saI/EiyzM9MEI+T1IeJCg9nLfB7+B3q0/sMR4aA
 JYF9LAt3dY9CdNcUmWMsGM302PD7m1gn+Lj9kVlBeFJnkPgI9CXSBi8+WSwYlHDrEfnq
 1BfoIJiYHRVjrVQJHPR3rsykrjTAGXAgSBB/iXZw60ufywUEdMmLh+FIcaiyNxZkypD0
 bob6I9Bd6RCoO7r/23CPPPBnqIuF4hy5zEfw7Zg+RKc6wDBWq/weBi2GIs0BG8sev+IE
 DmLlDiLAEXKpOKIOonBBsTFGez1BJhOQPH2nhOLoZxNQYIlNi4Mrn4PMRbh4X99fNWgp
 LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zMRXr6ZxF2EsE9TgyhpZhXmn/+Wvq+dGTNICcFinOd0=;
 b=Cw1eblihizoWtitD0Wj5iSJVCVn8rmLwxos/FZMUC5McMZLOaXek9HEkv0SC7K7ZCu
 2Ht0foTyIowJS+841N54A4xMTKj1uDmnAKUFAgNmN/iG8ZsQcfnqAosarIzdEgFtbQgQ
 ABXV/i3QrukJl+0mMhWBmHYz5dS+3rGhegD4tYRg+qzT0ssg4+Gau3e00KvLVtLV89c9
 fVcyD8of2Lwsm7R3aM2OfEzJHmJoeqv0L0Eu5/JikP7faTSTWMVQ9RtT6av3ntjMa50z
 73gdiEta/2yjYnETUwuW8eZHxk5x/7z+GEL1ZkLt3HxWtQCjlFgfg1htZocMFPPrBKBg
 5OIw==
X-Gm-Message-State: AOAM530yR6Kixnnk5KjVlWHJaEzqV6gjLDOFMHk+3ihFiInDTlASOPhk
 IhK4VAlV8Dx4AM/pJk5SyA7fjY99pTg=
X-Google-Smtp-Source: ABdhPJwmX+N6Vfi0NpBzDs50LYvA+8D6gaMQlUHVYhBPOe2ISw8hmmhYHWuQb6n8A4/WRPthWhGdaA==
X-Received: by 2002:a05:6638:1347:: with SMTP id
 u7mr19381296jad.281.1641072827857; 
 Sat, 01 Jan 2022 13:33:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id q8sm20229954iow.47.2022.01.01.13.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 13:33:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 14:33:46 -0700
Message-Id: <20220101213346.408623-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.4.2
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
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 879463c2ce..9910e632a2 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  87b3ad8a9dd8875fa46c6ec06e3fb0ba  cbor2-5.4.1.tar.gz
-sha256  a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9  cbor2-5.4.1.tar.gz
+md5  b3a6085ee1a9e11ddec305f7a7bc5956  cbor2-5.4.2.tar.gz
+sha256  e283e70b55a049ff364cc5e648fde587e4d9b0e87e4b2664c69e639135e6b3b8  cbor2-5.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index af42d0344a..4cc09a219f 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.1
+PYTHON_CBOR2_VERSION = 5.4.2
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9e/25/9dd432c051010faea6a702cb85d0b53dc9d5414513866b6a73b3ac954092
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d4/ca/b96be94f694155ce58823c38cf8fd1aa620bdc91e2c801713cdb4167b6aa
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
