Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4269FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E5184828;
	Sun, 24 Jul 2022 03:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E5184828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCXyh3Twlj0j; Sun, 24 Jul 2022 03:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BBE840BE;
	Sun, 24 Jul 2022 03:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8BBE840BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB471BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FFB86107A
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FFB86107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4OBev7mvw6YV for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:42:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6E161030
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A6E161030
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:42:01 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q14so6405630iod.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcsANYzdGh8be1y8onYfUyTi9+1wRBTj4Z6NRyqu4Ro=;
 b=5T+wIeBQhR3RLaiXqbw2jbSL+Oa9T3pGzfcLG5XyaHutwwEV/wBqBT+Wzoh87FtryD
 dCiEdh4+MK85L8JD6JvhYcyqGXudaKSfsNy1pG5n+EvQHvPh7UH9m1K63rAJt19bgYi0
 K8VtLsKevCpcW8OcQLC5osDlhiqyQDv2kTn6hKd8tfE/zOAiROko9RIIJwn026o9zfLB
 CLy3erKP8Ny0vA1JKbIuZdjVxr5gJFL1U0podHjRxFRg+H7TcwBPkTYwqYA6VfZ1BqK/
 R/IajP9w/SY57ruNmgrcFoHciG9QAqK5F4sEJ1MJ8yxuTs27Dyy6Qh72kXkWnMqoLzKv
 sMXg==
X-Gm-Message-State: AJIora+LXAQSOys4RTha/lP23Gb060njshJvqvjnP8vljJfQnTgZ/qyj
 TnTwy4AgtvaeMvk/0+CUzFJTCMmh23+WZA==
X-Google-Smtp-Source: AGRyM1tdMxYJf4wcl9/pX6bGX96DVUgwSqq2YDAgc6oqx72mATtFMyszMmkEO9OZ2hU0jTkr1/0P8w==
X-Received: by 2002:a05:6602:13d5:b0:67c:9149:fe0f with SMTP id
 o21-20020a05660213d500b0067c9149fe0fmr992102iov.114.1658634120088; 
 Sat, 23 Jul 2022 20:42:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 z8-20020a056638214800b00339e7ec8a39sm3830460jaj.7.2022.07.23.20.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:41:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:41:57 -0600
Message-Id: <20220724034157.1275346-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcsANYzdGh8be1y8onYfUyTi9+1wRBTj4Z6NRyqu4Ro=;
 b=UwGT234yot/r+s26UPH6WvPj4/x+c25kVONAH3C9AWV++7wKOxm8DJ1f9UEWD/s2HA
 Bw/pz1pLE9z8KFoHwb8cMCd/ao3Ws0VqeQx4F3k4C0zwIe6aZTpz2pvIzoa6P9Q0uIX0
 CjJ4difbALThiVfJSVzECigynvLMYsekNTuc//DI993+4QNw/hfr7DVuYi8DDEbo06wv
 dNcM4NoKLH5av46FDZgs9mpARYBiJhIC6S/79ATrR+HS4OyU4zI57X8jGShvHhgsxP83
 ipDjRnMyqrN7SB1bHFs8yzfT0lhnJz98wuOhZa+pCGQGnQjfWsQONMzrqfpu9XCr51BT
 zgxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UwGT234y
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.10
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
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index bab97249b0..7efb96dcc9 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  d4b58522821a33c5e421191b83e0dbac  urllib3-1.26.9.tar.gz
-sha256  aabaf16477806a5e1dd19aa41f8c2b7950dd3c746362d7e3223dbe6de6ac448e  urllib3-1.26.9.tar.gz
+# md5, sha256 from https://pypi.org/pypi/URLLIB3/json
+md5  80f4985c3e636b10bafc65f3d64c3df6  urllib3-1.26.10.tar.gz
+sha256  879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6  urllib3-1.26.10.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index cb2f7ffe5d..b8de7e69dd 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.9
+PYTHON_URLLIB3_VERSION = 1.26.10
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1b/a5/4eab74853625505725cefdf168f48661b2cd04e7843ab836f3f63abf81da
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/25/36/f056e5f1389004cf886bb7a8514077f24224238a7534497c014a6b9ac770
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
