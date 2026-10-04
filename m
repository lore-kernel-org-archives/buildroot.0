Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0D6CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7134760627;
	Sun,  4 Oct 2026 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_bOE9H88Ue9; Sun,  4 Oct 2026 20:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1745F60719
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145142;
	b=ii6yijhphbPA34nsLXBlZqIrQdf8xsWAi+VsdzVeTnjU7O4ACzsF+ARWBlHUgQiO9yF5
	 vrNivsrJncy5oSMIRkS0yN9cbCOKhYBGvFge7t7L+ZTzzB3LnoHi7S6LiDOZe+v4ZGauh
	 aUMgIKLzhRPBpPGodxoYVK90LiGEijZxVg4I02gUeJHvY20AvBMt1pnrHVNoHWycn95A8
	 Yyv6M9RxOU7TG9da2erifvDOBEJmucbwU63sfEr/HFk/xMrcO9CvCb9/BGMg28HPMZxg2
	 TfiwJj3RsndoAAVQLiXYQw9gEGG/ty8xeAfRDBfUxl0z6bi/E7BSV6CTT3kZMEAOh0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c7l6GgZmBF+zY784T+90+UvK6jiiPeL/b7hP06gEjZo=;
	b=bzZUKXsTbu49OZf3xRasC8ljL52sk4nCY2VDe1DC9ar0xLy5vP0umyDIJc0V1I29uiI5
	 YpmXEg88pVTlpBpGroRy3E1hDwD8kp/RofjAqXEM65ENu5EdxCDUh2TMkETuwq7WNBIvh
	 2V7elbCVmNKSEjLq11/CCWbHBxU7GJ24LwJnZmNkK5aSEwLSLX3MdueymyeJO8Uf2EARK
	 jzrVLQIU4tiruVK3UxMnkaNbocdqdqUEfmqcCjDUa/lpQUVsP4yA+19wUK6bj0WO0GIR7
	 av18mH9yGZLkFNQLMD9pvBl7E8w989Lpt+4OarAtVFN//X20fqjs4eO0NUTVLWYruaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145142;
	bh=c7l6GgZmBF+zY784T+90+UvK6jiiPeL/b7hP06gEjZo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=igNU2jc2rcZBik0YpgyYdKtzi7TdFG7q9rj1UTFBZZvUyPl2sFGxHCiukU5+0mryS
	 BiCnKyafX7OKKGkQaoAnCszqTorNRHWTLTS6xt8QF8YY72T+d6oAKqfBYNWDdgH7h4
	 czV/v++FZqxVKwNqWGONDPejT2f3P4IDIB4ImI0jwdqwqY/cRnE5QUCnixEgECvqaG
	 h/1ASDX5Fd4wZg0yftuV84fM0wc9PXUMxdxIq6g+VuH9TeK64RSOYPm3d9V4cVZz50
	 l+tSpamQZFJXS/FdIcZMT8b4oPfqgmk2lnVj44JJaehlzXzUSbFR/QJuZIyf9ELqzS
	 nU4K/LuEI7a7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1745F60719;
	Sun,  4 Oct 2026 20:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8BBB32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EECF400C8
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMdQ2aUh5RQw for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B91C240004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145138;
 b=WjLdykiLO1KHaGSBDTOt9tPQXaOG0czvpzPj6vGEobg9Q21RgoyY/tgtQV1XxK/KZtwa
 Quf/ih0IjU0RoEyli0aiaP0KOqK+teyujo/nESS1jQh9Zc2cWp5ApmQYDDOh5MvYNQSLs
 Qs6X2K9d2gJINxpVhycS73ywVN6jGqwrzKb3iqAM5+31mFTYDELFUY/kVOvL98mtpJ9kx
 ue/A47OTVto+KlaAI3ZubQFXNBOA2Mhv05uKyhKbvo1w8mh8lQdo2ggu+CCIjRRro0kLn
 ziTFQTfC8p8nVm6XHrt2bn29oMhSo+AFLqz9s7Vyg11NNnnZtix+orgKTiq59E4gPIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145138;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=A+OeFSc1CTp2tgjQGfu0UTiRPSPd+89iVxRqs3Fqpxs=;
 b=IHS2UT+gO+fjKpRzbNL3q8MV9siHCaE/rk16eYtQlVtary13moPvXCMKl4dqeqWg/5a3
 eF/y9VZxFe3rVQwLHWShllfQ2MUIdZiZb3diEn/oiz12lBb2uxm3GF8If0FHsjbIx5Zha
 ogPfD6LUy3FBSaGM3D9gOUS7xGuSSHbRt6P/MJZ+s218lnxnMDX4MQ2WaSwGvGUK8ezp9
 AHjI+t5MMmuwM8qYMDsrx4RW4vINVQiIvVPq3oYITPMhBNdkkuhZHAYm95+UWvGhhuc6J
 PGiZilpYtZ3QDmOj/rLgtnTodS5MZgFHFAD0sp7q1DQyBF5q7bkluilt69aOIpJuv6Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bsKjRPyD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bsKjRPyD
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B91C240004
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:18:58 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6deb848ddd7so1014553eaf.0
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145137; x=1791749937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A+OeFSc1CTp2tgjQGfu0UTiRPSPd+89iVxRqs3Fqpxs=;
 b=bsKjRPyDAfEgzQpRoNOWvOChac9VT8YmrQhZv85omTC/MewkOll7S3IhwU2zxx8Gmw
 6s5+5Lc5DfbAPn5SZfqFzAkgfOi/ZRaxL+e0qaosIunhjmFhSQzVOTLOHvjW3iBd5Kst
 p7d0zBewTiGOxs/yd6/5g5X9rshZSdZ13tn+yOrIzQoPd1IGNZT4ib8bKw5VMvutzSCH
 DVsDwQ4jSLPC8uAs2UB5Ibrx6T2+TnJQYnKPWzDB/XywJnB5AHagwBQsBPZQTWwRg0ah
 IXbi85KYOBqau7k7aAFznYqbto8+Nsf0W0jHpYoc00yWNdbZzkO7KyDLvo/+b3hjOYMX
 PPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145137; x=1791749937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A+OeFSc1CTp2tgjQGfu0UTiRPSPd+89iVxRqs3Fqpxs=;
 b=1aJlteW/fjSLAVANa9hPASKSd46GFCSCTrUIgpzLZetTk/sMjLiAGUq0U06konyGfi
 yXGQmhCiqv0V6uhNctBIlMZ0lWN/bEL2EFIpoj4ZqnIOFiy4IGbKb6dTThH57CHS1883
 699q0+FcO8Cy2og1EHPL/0VyytWm4mfN0CGXSLdayi7+yqayJ++1MxYEa/OXXCJZ2uya
 TedH9pgL/9QnmXGDsmkuapjyJ16R5agCk79HxtpSyLH/ppv39Q40Kn5/cVKvCppj1pba
 mdK8u8WcQsDJASfVD+kJ4G1/DODx7FLS/MjkSHk2+RD0QJNZG8hAmHFaMpvn1/6PfZ3J
 3tXQ==
X-Gm-Message-State: AFuF++kPkAB/tKbVkQjr2FSWoWUR5CDiVlO08pRzcQrCCVaNGYl0glQr
 AaXTthrtQh6ExE9/Okvyf9c6NtiXD6yxB5W0b6aRrlyElhVE2gxwRodWG2czVw==
X-Gm-Gg: AYBFou0Tv4RaiC0uu8o7DsvohHiD4ewtmrNpBe6crtYtvtFzwVMPpPo+xhugc4rUNV8
 UeLW/dPJIgYApuRhh6UfGxhKzLYkWvxHqVXIkbhdeeDNmksFNi5GHTDH0kaS84yciWn6WveA5Du
 IdSOWPzAmg+cng8zV8j4dvY7o1QhudM3Q9TzBpWbbVcs5fvOV/SepscNWQLd1UuuwqzxJLsq0FW
 TuQWSkSlwu4MKf0CnsR7y91I7Efqpdvcmelid5uHDvvsVCIPLDY3zoXsJS/j0Q+X9SM3VYP4O8B
 vhuOtp1+14+52kp9WuQZ6yV2JTmmcUfilCBOfUHfFDm7w0fYTRWYzvCduT0AJJG4MV1L1Kp7UOf
 7OPCfzqo4Jd2FR1oMgYV9lCONFgr1AzjU940Oolc420SEDeIm7kcZATYyVVeQZ53doMWHnJ90dz
 qdVKt2PK84yjAzfvlGxW6r/DNUoSndird5FN+4GKvqGRCaUqDCL7MCVyAVXAfCcDVUdoW4JZYa+
 Oy5Tu7xDT7cbWAJBufznBnPI/D7asnpV+MiD2jLdEqX6e3Qi/jJK8nKLN1zI2ZXB7YU0hvQoKJr
 VUuC2Bp5R699hB0jnSbam+ODiE6vfF+WAUNSoBR8tApKLOXlgdlSNYaHzC2VfmiI7KNOE0aDgzW
 BUrZGNxCpQnENqY4HN/WyT1l+1QTI3qJspEu5ve7U+Jk=
X-Received: by 2002:a05:6820:3106:b0:6dc:e1c3:b2cf with SMTP id
 006d021491bc7-6e09e183836mr5297466eaf.55.1791145137294; 
 Sun, 04 Oct 2026 13:18:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a86abbesm10037861a34.24.2026.10.04.13.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:18:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:18:43 -0600
Message-ID: <20261004201853.915471-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license identifier to MIT-CMU:
https://github.com/python-pillow/Pillow/commit/22c05e232c67343b193b9fdeca9e7b683d470bc6

Update license hash due to the copyright holder name update:
https://github.com/python-pillow/Pillow/commit/7c121637c9b0062694069f8f6d173e17dba8c46f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 22d1f3fe7f..6f9c5d2cb1 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
-sha256  87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353  pillow-12.0.0.tar.gz
+md5  c714771477fa686ba789092cf84234c7  pillow-12.3.0.tar.gz
+sha256  3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce  pillow-12.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
+sha256  15181e7363dca9aed78b79bebebc7fde7f1814b8bd311ea3b87ae8ccadfc185b  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 19e3f8e279..433cbae5e5 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 12.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
+PYTHON_PILLOW_VERSION = 12.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_LICENSE = HPND
+PYTHON_PILLOW_LICENSE = MIT-CMU
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
