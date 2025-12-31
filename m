Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47178EE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 19:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0727E40216;
	Wed, 31 Dec 2025 19:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4V7u9qx78xr; Wed, 31 Dec 2025 19:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CAB240253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767208871;
	bh=LNgiqy8WjUBx5z95tcYRdsJfu0TFXHokwvBNszcg1+A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MItHJ70DGg1oO1g1bjRUQjqEuee1mYHiIKKBNFxOjh+L3efoqJsw3TA6cLFwdQQfo
	 7Hcgr3arigvqmYw64mMB4YEIlPgmFKe6h2k+SmdkelVeXgHqkZk6DoT7/xM0jjHVZ2
	 bDjWG71pH2M9lNqeuSg9/OyvdtWs7uZKokndH76X0ZtA02geggOqLA1PptcUKCTiyp
	 o7s2njRh0A9mny+lm6wOP3ZF+B2Le3HuCiFPK9eeRM2S+8kgYR+S8wn8bzFWc2wPTX
	 kgo4C6Jg/BpTJ+HYNpYil4zpsSvNXUMzUOgsEDhXXqS3maKTEx8CZaNcVS4zpR7yCH
	 v03i7YmX6HT0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAB240253;
	Wed, 31 Dec 2025 19:21:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4E9AD8
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F696063C
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnUWkXy3GkKB for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 19:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E645560614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E645560614
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E645560614
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 19:21:08 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7c75a5cb752so7790601a34.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767208867; x=1767813667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdQFqEceicefc3aL+loDGq3ZxC3lTc7aTC1z+CQ1e3I=;
 b=TvbwlihlnTWZZOB6JQVg7znExtn3xHzWuZb52R58xUHB3auQ5E2GrZBf1HfRKiujSO
 +IRgooPHW8tw4Nai1WIdToxEZPOuL2iyax8x5K/OLOPQQW/YVhbMawKY5WwcIbn2tZcE
 qUr9+Ei0hQXfOhHFjwm4J4C9elzbmTVcSZXdzma/NqEBrZATRXT8DypUaGEC8LKFrJ/l
 8UM6VWnxHnWv7Q7CvEIauk6Mo3v3ZDl4N4QdztZNuPIfpDvXIRE9IvW1890Au3qQgYf4
 5CguWLkxw7znVPUsGMDPlDiM0/T2NEG1jiEk63LTiDwLHSe8xano+AgkNXwP3Cip8HDg
 V7Ng==
X-Gm-Message-State: AOJu0YzUemzxB01a9+ZQcnvI/IHxd2LTmqPYuxcfqubgoQSoBCKVHHKd
 sqPk5GtWMsdf1KAggOos7G3VuM/Og2maH6tYayTW/YRfgUQqK9PqYPLapJ+/Jf0KOvQ=
X-Gm-Gg: AY/fxX7MRFixSDaj3ahhuBmLFE+BoVm3FIPwc8+f4T5jFfaCJD09P9aJQS9pO4sgXwY
 phGtz4bs/qqj3mDS1TZ9lF7TATU7ul0JoCCKVEIpSZnPTtn8zFD8dkNWD3NaCVX1c+w72nu/bzW
 MTAsXjZcdDVaRCq45LcbI/HXfEhjWYGWiAcHiyclrD1bX1SzwEYwAmnxQolhfo+B5NKUyfzy0+T
 Pi9Ofjwii5eNguvOPa4qpOt9aD1j37MTdoGRV+oRNXXtdcLBlDHWruyOV0FLH4ilvUDCRi53jAs
 3MMokTYRZsqijHOOkPGuYrROhrr54QZzLJnkXs+10Xnx62qP/CBLr8iMDP5uWMdFyuIdO8ce/dM
 +m5uAP6oVJz+D3W60S+deEiAYQq8pBjXk5LAM2qAQTgIctzyDjeBPi6lnHDhgDB8ywNkSzwiqni
 dSpdP8VJ/nlosqG+bvkoCb9xFJT0/0hBm3q1oON3BBt22fg9O/zJQxUbZnSBQW1CuPd3q+OYHO5
 64nlx4VN2yYBGL5t3baGyLAG/2iQ8vHIAdD1DkDGap6X4OAdh8pe4A=
X-Google-Smtp-Source: AGHT+IHjKpfs+M8d+cRvSHMPkmZBZV6r2UOaS+OkxCd7NqV61GfxkP+7fxRETYU/xsV93UtBkpIuqA==
X-Received: by 2002:a4a:e3d3:0:b0:659:9a49:8f6f with SMTP id
 006d021491bc7-65d0ea9b17emr11617571eaf.52.1767208867520; 
 Wed, 31 Dec 2025 11:21:07 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f46c775sm21353665eaf.5.2025.12.31.11.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 11:21:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:21:04 -0700
Message-ID: <20251231192104.4004301-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767208867; x=1767813667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vdQFqEceicefc3aL+loDGq3ZxC3lTc7aTC1z+CQ1e3I=;
 b=ZDX2zMxF9Bb+1/rGcDtmhXywS1jEzi7UHw6ZPwFyr0cDQKH8/bEbozeD80pKiBbSIQ
 PFYoYUB1ip8SQl5Df0hOQ2qVylWGhOv5IkJMYnm7oyH4VPW7ydHMwsO43pIhysaSA2ga
 sm76G92Iqzn0gCErlCIxPREbhrypyucqV4xGfMdMezFjoYBsnxfB4fXT7INgg20cDeDU
 a4dfbKUaemF+DLoGYme3tfBpaWOAFqltD7MjzPbl/2RjcwtWkTCd4zfGrDS96aIPMoyg
 NyM0Z1azd8SO+DTcNOPITdUErNEmC7Sjw21c/+bo/yhWdwUGK9tdMYFIkBacAJXqjT03
 vbnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZDX2zMxF
Subject: [Buildroot] [PATCH v2 1/1] package/python-soupsieve: bump to
 version 2.8.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add missing hash file
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 8dbcd237f7..be9bc3402b 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  111f637c4017009883667bea09b0a442  soupsieve-2.8.tar.gz
-sha256  e2dd4a40a628cb5f28f6d4b0db8800b8f581b65bb380b97de22ba5ca8d72572f  soupsieve-2.8.tar.gz
+md5  ec2c755903968868cb307512203ef3c5  soupsieve-2.8.1.tar.gz
+sha256  4cf733bc50fa805f5df4b8ef4740fc0e0fa6218cf3006269afd3f9d6d80fd350  soupsieve-2.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  571d0dafef795a196a0bbc3ac9b160a06b3cad41c320fecd98da3e26a8c81971  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index cec1b63b19..34fec5218a 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8
+PYTHON_SOUPSIEVE_VERSION = 2.8.1
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/6d/e6/21ccce3262dd4889aa3332e5a119a3491a95e8f60939870a3a035aabac0d
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/89/23/adf3796d740536d63a6fbda113d07e60c734b6ed5d3058d1e47fc0495e47
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
