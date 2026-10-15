Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E2CCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BABBA60AEC;
	Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JK5mbye_urV; Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D910A60AE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101154;
	b=fporMWRIKzPLxJ54jypEmdHy7Xz5Pmgh9IQMrUmWQj7Pyv6RkOALKsENTrUb7ZRFYkWn
	 aP2TwYl1TMGsEkdrxdxm8SBRlLth2YJcF0yNzG9kBpLkWjyTT0DmHss+g1ezs92yY6a4r
	 40XkMlebCn7wnkjRb5nLU2xaHnZvu4Bd2JeHwPQoXSxf9dtZIvUzmurNkMnHDerGUIepE
	 RCXNFrRsq6wJLQ+Moij4XfGpjB/XZaBCAmyNKQPMMBHpKQeWxkz1clHdCQ9Q54seLxPD6
	 vepmD/E3Y1KMdwKDRjSTepbQjmR8rVAhwY/IX7lmz+9xDLBDgMEddPUw4Eo2Zyy/fAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EOfQCt8zYyLJHyqE1NWkI6Y3a8Jb7GqUTu3ZuR07MSY=;
	b=Y/pjxtC4kOkQwjjL0UYV32vf3QhkSxSGrC4+PqN/3rF8eOpJJm6C3nsz6Vy3OW/91E9g
	 1zWyyNrRfQcDBpD43w0lfV67ymyFIG/ZbkaoWcZHWlUugMCMvxn24yd9GwC+pv04g82uY
	 ajYwEewqSwesTcWbv2s8NioN2iK6QPwUu/KikVYBbgiGe+43AMm/7GUm9s92FvpJKGSgY
	 dv17zE+umphZHRZNubfsG5/ezUCGGVb3dAeBp4wACcAKHAQZXD2Ube60OP1vdbQuDWnMC
	 LvIt53ZsM6hH5ZLl6XG2gtn753LRoBR7RNBJzhveTLiL/WeZCQc0r/4Q7GMeiJLFuLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101153;
	bh=EOfQCt8zYyLJHyqE1NWkI6Y3a8Jb7GqUTu3ZuR07MSY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SmamFC0Oi8qRg6yNe0whEu9EuGZKk+hvoiAeZUPG28ZRRDgw8aG7FJgNzH6y8LFCg
	 Tt5/PKiWohujzXXcSsTK7T2Eu9JO9oHFxwU2w4C5rQKUs46qiTZaoJm493xHRLj7Gf
	 CZFbONIbP4O7eOxlBdAAXfBwx40mN8ed4qWmJNs1QrGUu3HJo5y4VsmtoPBW+wJHz5
	 y8QayUhut7skAQbwGu2/5rLLe+zlsgDbmYM3v/2/u81HIWRgsv8Ds8SVgqF6LobOfv
	 3f8TGZKNvBzmpLdXkYULUqQayv/SezzxIG2NEAaA6znb5azN2WoM1dpz9lhhNYipc7
	 6d55kXt59uq8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D910A60AE1;
	Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F130C362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E31AF4093B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1hUUTcf89mt for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0D03C4092B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101150;
 b=WTOv6NW/M3CDJKPDSxRHzkXsASXJ5Jtruqx+XpOCgrmL4deub6STa1cb6/mEap6wL4nW
 xTiE5BU160E377Vr8D+a3PhCGD9hPZevXFBVxfRsgL+TJV0OEbe6MpV7sjMEl5MUW3q8W
 vi8xY/ZIeWkg2h3cXEdbJZTgU5B93S8/IhaCTcpUmv135auLnmh9n2cLTazWJEf3gupiW
 xUPHdWbTW+Efow4m+qnzvV0MC1cWC4HQbmMSKI2ANf/drYTlt+Z9N7K87Ys7EX/rVmqHd
 dtjiWLr7/e6HlcGLMlgWhaWnKz0IkUJ8j8HJNHA+5mHdK6HcJoC8TS92Pm+JTbkSfIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101150;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S2vEp6s0xCTWcK2ma231l4LaVZHc9C0JK9WlPL4clTo=;
 b=fx+ql++oUA7g+ez/q4tjg0m2iy4mbwy5uMruAYBvQe5GmqV8uwU13i1H7JBQxAVy520s
 TSPR1L6qgU4mApUntH6h7CduoS8Uzs9pLY3BvhFTisBu5TZ0GCcDPy5QxcJWtbvnLxlcd
 Ptocta7C5nDYEFrDvDMtc9GSmB3yIsZhqXfdPUqv7P6YzOvUC3pEcl607bzXTVlVscIGA
 ui8iOkvkiFyp2kgqyVSNQB9RZv9t65tRIf4wbH7Bj+QcQYeG6sILpjwt3nktbuQo5jKqK
 GBnxzJCKE9hQDzpv08hSxbzic3niXP9nbkMbTD88JpREN7Kg5VY7dtnpNlkNFzPmCQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="JBFHN/BN"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JBFHN/BN
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D03C4092B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:29 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4f14642adb4so2908207b6e.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101149; x=1792705949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S2vEp6s0xCTWcK2ma231l4LaVZHc9C0JK9WlPL4clTo=;
 b=JBFHN/BNSy2CKt8Z0HL2uywmvGSwamd0uqLsFTpAR1BN2CSMvjCqkMnWEaTOwM8cK4
 tqxc3o3p2Sq0q7ulTagWIDjuOTZBbOFaQZIxTA38xM9T4O9THQLALgYxpnM6nywTv4mT
 kh5emtdu7A3t8lXNl3NB55C4665MLl1DPiUUi00QikonFtkGWKX5CyzIE7ZAbAdAdTnr
 T2XnZIFY87YGr73EyInnw1bMCLfZ/EW7gL9y2iTs8ME64KlEn3pWIG2iaimQWVo4HM8a
 hwlnnjvtQbCVcIsHGdaTmQLp3qrKSZwk3gK0rMdWKqKx80+UQGii7Sd78MnVKaNPQJVX
 5eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101149; x=1792705949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S2vEp6s0xCTWcK2ma231l4LaVZHc9C0JK9WlPL4clTo=;
 b=mZyC/dtM5iVCA3tug44QMT0ygOt+nKoLBF6qUk6zDrny/YzZSZRPJjKkotj7SxfOnL
 +6XWtIDKsze9ImLoFA9ogamOV4QHbZlOFGYwxoWYwEj1JB6HoQ+3X8Cu8UiEz/asRpNf
 NwF6x4J6ENaMGTqI4S6Dn8UwmiBSs10cstq7SNBhUEmay59NJLdYVPBaxAKeGqmTrTmP
 hjvwLx+uM0nYlX9Ctpc6ZtlD5BlLH6hIuy0QS6LdCo4Hs4K4l4AEy0C0ALThgt1qQ1kJ
 CwK0qSQnZYSv+e/fKcsL1sjdQdmumGYBJyPkUo8dQegIm6qPnZJy5uGttDjCQFJfQFqK
 768g==
X-Gm-Message-State: AFq9FYLL62nruDyztqqAKyEoKax6KwSgl260LkayPUSWU5yv1xFX1iar
 8eFNBrZCEPK9wQcS8HrrP53UwAVgGih3jzhi7PT1JGTG8mRMbpgIVtiwWk/hhQ==
X-Gm-Gg: AYBFou1bjTrTJwflqsA06kQHK9qAFIa8Jh95Y9Y988XEuwxEuELLdqP7Pq1NTE9pjcD
 vlS6FNvaotCyjB96lf/HmTopQ5x+fKKM1ySScMPNwYYc2heivjwiCXOCyhgU/bLO1/5VqeAMmrB
 O9latuhB088YJdc+ilK7B3SdMajC9q4p+BYOB0deJcSgP52j1xoIqCeUAkZd2rF6Kt9xgxAK4a9
 8pMdRoCXVvQnU6EIocEgDibBOWQ1/Te/ZAcR5hAOIXg5rystOb+XucPBWZ6K+6BD3rPjXEPm1rx
 JDEb7NXkb+SoGzWfsBYojbILffJmxtiK2vEx9n849rtOq7nNwN4Ei2Asq/fHkaP1xBGzyBdccam
 hM9GL4J1t/0OU58t4qC/5jwkf8jlLtU/jNmubhLr9SJMMJzAQNiQLXZGhtq9dHCEDd3lBuZ9d2h
 BOTgaWhx7SaqLpOzWMnWmTEie57KA8Rh1tYlZwN3JgJNh3uOAcnIJiQdYYKJ5RMlX+PIlp5zRYt
 DCqh4UVErYmRhWI5BlWQC44wftwU2YeLBccriW3W9rK0xj+jLdO6yFezYeXI3w7KgnFG0iVj+Gs
 wkQScN1P2qT3D/O6Ry9HwfbVwJ1TfP3AeAOE5LMoqWfS9KvGywIZ1IJFqRlwiBquwNgou0FrJST
 BMGd9dCt7vPyJ6OdlSESGPIIP9nD63BbioPQSLnVzfHg=
X-Received: by 2002:a05:6808:c40f:b0:4f4:d914:8603 with SMTP id
 5614622812f47-50c4c7a2ecamr22336310b6e.15.1792101149028; 
 Thu, 15 Oct 2026 14:52:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:46 -0600
Message-ID: <20261015215210.3426895-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycares: bump to version 5.2.0
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index f3d592a90e..14583b122a 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  32f250031005a3bd9a4e1a8e39488f2f  pycares-5.1.0.tar.gz
-sha256  4ae0712df072773a3193b23f124d9458d6b2054a22c9ea0059c9dff6b8f91050  pycares-5.1.0.tar.gz
+md5  b326db41b14da39ba62344fc6ec799cd  pycares-5.2.0.tar.gz
+sha256  90ea74fe26593d2c4e79e1ac4dcdff4a2434b183ec6feef0524e4874a7d307ef  pycares-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 2b8d2955fe..555f2e969e 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.1.0
+PYTHON_PYCARES_VERSION = 5.2.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/3f/b9/8f8389df1dfe3c9f6b5b02cfab60781685d146bee529e7628b77a1df7e9c
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/e1/16/66c5e0498934011d36887d69ce116e347253399d06931a6ca900c7cc0899
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
