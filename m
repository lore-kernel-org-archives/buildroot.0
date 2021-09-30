Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACED9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01EB96162E
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01EB96162E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85093402F2;
	Thu, 30 Sep 2021 07:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7smNn6A3RgNh; Thu, 30 Sep 2021 07:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B92D402D6;
	Thu, 30 Sep 2021 07:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 694761BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 594A083F5D
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0xj8Nlgfeei for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D6983F5B
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d26so8266156wrb.6
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCJIgH4LU0WWCqpofOP3VzQKzsN3JmLxac3f3ddbhKQ=;
 b=MU8oec+15q5A3DOohV6sKJ7sSy4nesBIIAUcoZraKhXbqrvlsBlnEq96bHx9sD4cQ2
 D09LeHW/ErGP2ipNlAUH38Bs8hPTkd7JqQXfsBTLZ4PhytVTmUFPzVef7weThjuj5Opi
 dWJwFV05FTneFDVWVkigpT65JlmBr7MdokmZ1V0TyHcny+an1RcBjBjvMjefMrkL96g8
 KNgJ7wyxvqH7pLk1nN++akrMBdqzh4rRB9A9aMrbL4QgF89gci/VHqS+C0HeRku/+zoq
 MnavwELUJpL9zj+uBxPoebT4M25tJRdPc4/xWgIR2f++CQsm9VMNnd65IQiSOHuErwDA
 OTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCJIgH4LU0WWCqpofOP3VzQKzsN3JmLxac3f3ddbhKQ=;
 b=G+CAYYrb4ngB77Xa6wTT9SsHv5+/yZsR5mrUWWD8ChXMB0wD8DRCVDn1r/4FTdq+Xw
 IKMBok+/2P0bCxqRyTq2MziwEH/NSfjQ0S1xcPhEitOSWi04Gyf7zSC6mbreyla1aK/K
 v27IUuXqNQcNu5b4QuXY7xqN8rpeW0Wc849GQSl2g3PvHl+3SOtWgstiRg4fW7LFpQ8m
 OY1rYjEqMLByXjIeB3vwaM0X9rhboegA8yzLikUVPlgGCVJc1IL9t0d3CvQ75uco5v/s
 obn8MTPmXbeqq8tyq1VOzvnIOGRE7zBwtEv0wm0YSexo1EeJdrXsIA40IvbNeoCSZfT6
 uYGQ==
X-Gm-Message-State: AOAM5333Sb9577NX7LpGhz57YXTMGEXYTGHFnUbJ1lm3c7ScQ0b57F7N
 exp9Sul8j0K8fialNHQmuwRXXnunOMM=
X-Google-Smtp-Source: ABdhPJwZ7lJuyH096z8siXU4jC/5ykcnzUeoZyqNdzLG9ryX1AXokvHDjvdMyHcY+txBCpQ8VQYNOg==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr4341196wrb.374.1632985260157;
 Thu, 30 Sep 2021 00:01:00 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:00:59 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:39 +0300
Message-Id: <20210930070051.40361-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-request-id: bump to version
 1.0.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-request-id/python-request-id.hash | 6 +++---
 package/python-request-id/python-request-id.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-request-id/python-request-id.hash b/package/python-request-id/python-request-id.hash
index ecf9d6508d..a0e59a3260 100644
--- a/package/python-request-id/python-request-id.hash
+++ b/package/python-request-id/python-request-id.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/request-id/json
-md5	81d6159edc745384181cb97f045c51b4  request-id-1.0.tar.gz
-sha256	4928002c8e4c767f3f8319194c9f3080ff98f14cabf44c0674a81ee58ec20fc4  request-id-1.0.tar.gz
+md5  abf0125561fb38198893ba4b46c5ce28  request-id-1.0.1.tar.gz
+sha256  4adf1dc880085571454667ee4dba36a12b720eea5dbbfbbbd840c5a24268b4f7  request-id-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
+sha256  2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
diff --git a/package/python-request-id/python-request-id.mk b/package/python-request-id/python-request-id.mk
index 4812e53c72..8fe8dc04fb 100644
--- a/package/python-request-id/python-request-id.mk
+++ b/package/python-request-id/python-request-id.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUEST_ID_VERSION = 1.0
+PYTHON_REQUEST_ID_VERSION = 1.0.1
 PYTHON_REQUEST_ID_SOURCE = request-id-$(PYTHON_REQUEST_ID_VERSION).tar.gz
-PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/bc/b6/ade909d4af3dffe492789d36ea58a0ecbd637f8200bc480b282d455fe497
+PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/9b/b3/30617b85b1766b6a804f2b8abc0ca7496f6349236f7eec28cb42687ca8e3
 PYTHON_REQUEST_ID_SETUP_TYPE = setuptools
 PYTHON_REQUEST_ID_LICENSE = MIT
 PYTHON_REQUEST_ID_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
