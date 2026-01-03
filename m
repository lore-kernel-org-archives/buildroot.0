Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C8FA3727
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3A082043;
	Sat,  3 Jan 2026 01:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBDW8WGlvFRn; Sat,  3 Jan 2026 01:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65DF882152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767403088;
	bh=+nzgMiYwGQCLLbWosIFL3CfgqUrIJ4V3+BHSko5Bt0M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YjoPkGLKntuvVTQZnYCljJ661dDk0Zv0XiDHBDwZ+ixQfs8TNZf5XMMJH1+dMRexa
	 t2Ut1J630iQPV6+OzH8VLBvfZjxdfIHcURx8fbugFBW5RD/4jWgtGJ0f7wp3uc+V/2
	 hw5CKAw2QudWyS+QQcDuIRrfywu1EnqVLR9wv19lH/f1eozfmC29OX/iI+a/ivwqP5
	 MExxjpSWURXiop6g63dHfqnxoDQc4AjaH7zdron9TB1u7n5zOv0bQ9AMvNAFbakLgb
	 6HbNf+795TM6qkxfQDFpN48cXAQsiDfY+lfjKLZlEHQWbPTEnux8dRAclzqd3eYzAu
	 Z6wGeLS9sON/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DF882152;
	Sat,  3 Jan 2026 01:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66CD2351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63A62606DE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBHTAqU6i1ZH for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96C7D6067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96C7D6067A
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96C7D6067A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:18:06 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6598413b604so7681156eaf.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767403085; x=1768007885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6ZlJ0TQKYQ8wRtrg7BKXClsM6ADLjHWol4MOUq5ABs=;
 b=QhS6o0klDdJdbSK4wBscWPZRmXiwczFSTY3Uvrotdvefc6sNAr+LQHQov42tht7xNK
 ajA4ijWOQhyzsrwNhKY7WAL5Yhu+tDckpWW9ojxK3fyqEIenqWEZAWt3ZDD+H2ZUydYK
 uPlHnnTV8DPCWvZFkIERjNV5Xf6M8uc3l6PBV0FTSG3nhhtdyYDGjlBjPZFBmXA0G4ST
 xsQHXRJlGXdpYBBkKmzyRxGeT0GZVtTUjbZw7AtxJ8ykArYoptzYhJovpLviqbbH81SK
 QxEaNgQABxW3FrwrzK1iSQ5DZzY/Sx9q612/pZ7DYqumJM2WdWU5GQWaiWZqYTtCD53v
 DaQg==
X-Gm-Message-State: AOJu0YwfhqpKlagJGZNN+pxfS9Q1LOIQYcbW9wRwtbgYWXUoK2GHCsAw
 qNhCy7TxW7p/oi+GSGkvb6nuHPwBajbfonirI6gNdieERkFceMmMVSGLCY++27DMNcE=
X-Gm-Gg: AY/fxX6ErCqBOXo1QK0IlI/YcUa84EEiR+bZqw7otAEpNvDUsouP6M+WVbZmmCB5fZM
 JU2OWvc5a2aARiKu9fjy4Q+ciYCXPIhy8OkX0inTu/W85rq3kUebnSTkgbSeq9sAW8H5kzjhIRz
 dWIKjPHLUhcxWwEwrg9395w/TTPj9oeOD+swvho3mqYC/cDVO9ALf3DoI+eycNQ8Du0elw0CvR/
 k17n7Hn3XWrg8dyFr3oeU/oZ2Z8gw1C7XrxCTAf7w4KqByzD38yobNqKvX8/bZD5BasKziH/uXU
 /MDLKDqSmV09NIlKtiNbLYBHu/J7tg8o6ExDbCw+Cin5bv7HjVE2DepZ2btW3f88YxZzU46W8c5
 h4h+wNF5PWW0vjgk8AVnYYVZ+Eaw3lxhjjDPLFXgcjWcQ8CwFj5sDvn83Gys69k38m4+hkxdqyo
 cWYJDzrxwIamVPknVrTDk4KHRFW86cdEtgRdm1WZ2Y6pc29rW/tsstmSLQes68dIZ7hCQ4aQUn4
 hxLxC50hgkX0oCMay2W/ZuJzOGybbwjwjGk7anERPr53L1nh+yJEvI=
X-Google-Smtp-Source: AGHT+IEI0Rsp45NcUSnfmiLsBtKsnmcXbZjsu6K+t9mrBr0YHoMeXoRvvCwD3ld5O236Jq2Zqt/GDQ==
X-Received: by 2002:a05:6820:1507:b0:659:9a49:9086 with SMTP id
 006d021491bc7-65d0eb44ca3mr16056153eaf.81.1767403085036; 
 Fri, 02 Jan 2026 17:18:05 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab65763sm26267089fac.13.2026.01.02.17.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:18:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:18:02 -0700
Message-ID: <20260103011802.740218-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767403085; x=1768007885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V6ZlJ0TQKYQ8wRtrg7BKXClsM6ADLjHWol4MOUq5ABs=;
 b=WOWGQyvP9aFy51gc1mgjmjeFFc7TdUuoTo2Chlcibo9xOAwC3+Ie/BzO6gfJuV6kKa
 MIUJYWu6d1lz6JOXaACSGeZWSbP9diCN5lgRomGi6kbo7cE1DBqpM8s85rqQC8Hu5TzZ
 hCGeoJHmiK190nVFOkY9k0ZaEP+wfa0oontS4ZSxmP7Hj0RnPdauSsDnzZYLioosCcY3
 Q+68WUqROmWzte8ntKXNgoVRDfoZEXulu4A/15jpMnOuiY92MyzJ38Hc8bi4gYHkgWBC
 WJh406QqmQ94fYwCbAAMvMNyH0IYLUQAXNAWKzBnDF2hIB5gJ4GSDxZ5LgsNHs4pqcqU
 ecCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WOWGQyvP
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.3.0
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
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 3fc82ebb5c..b6b65fd843 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  a6d2eafea6e44440bb30f0a62de5d089  channels_redis-4.2.1.tar.gz
-sha256  8375e81493e684792efe6e6eca60ef3d7782ef76c6664057d2e5c31e80d636dd  channels_redis-4.2.1.tar.gz
+md5  172d42f51bc62b92dbc218c59c9ebab7  channels_redis-4.3.0.tar.gz
+sha256  740ee7b54f0e28cf2264a940a24453d3f00526a96931f911fcb69228ef245dd2  channels_redis-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index f91e96c849..d651383127 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.2.1
+PYTHON_CHANNELS_REDIS_VERSION = 4.3.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/c7/6d/c379c9feea4522cbdb4eba9b3d23a6270ba8cbd94e847b21834d898109d6
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/ab/69/fd3407ad407a80e72ca53850eb7a4c306273e67d5bbb71a86d0e6d088439
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
