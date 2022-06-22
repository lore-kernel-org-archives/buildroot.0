Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BA0C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 19:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545C660E37;
	Wed, 22 Jun 2022 19:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545C660E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KD94QTu1ka4; Wed, 22 Jun 2022 19:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C7260E29;
	Wed, 22 Jun 2022 19:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C7260E29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E77041BF3DF
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 19:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0358417C4
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 19:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0358417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAoY_oXlNUml for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 19:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CB2417B6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54CB2417B6
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 19:43:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so247305wms.5
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 12:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KvX4JIMyF4+GzHjb+wIIkA/UOB5BP9NUVsKv6tE48o=;
 b=3Wo9oHYIqV1Y8oAjAGgDZdMLh8+nzCKr1yG1zqPiJUQH75VgmosbBx2+FYaNy8oLDB
 w/BLkcb7Pq+es6ByZ6mckqOfvryQuVjoAe98ao9Fcqnr622ZqM3CYzMKvU8zHTbhMcVw
 9EuPR57sBoKffM8DutJmiiKhp05lQz6iHkFdM05CNdZwiowkqr1NzsPHC7YCMlt9UNgK
 0ZtaxHdxsI+5Tkz7mESoTsrmJGxj/YOEZ9B/q4h57CYhKVBdt9IDLTaMmor2mYW1HPNh
 7Pewu6s0aSywr1bVpO+7b7sobHwdGPgDXRWIOyLW/FZ00mmyYpjPVZCUCPOnj0QTg4L8
 qTxg==
X-Gm-Message-State: AJIora94HA1UdmTZOPM1UU4ihvzSnduigBf1MV81+PRhhvXJ49fQJDCy
 pJyR7J2jqo57ihWvzR81YrVtoILfrrU=
X-Google-Smtp-Source: AGRyM1v1bAzRDO+vm2KACEZWr2cgV4xGkvyTG0hSI2hUMD3XjynYTTmJrVabKvcWyf73WynP8zgSow==
X-Received: by 2002:a1c:7713:0:b0:39e:e5c4:fe9a with SMTP id
 t19-20020a1c7713000000b0039ee5c4fe9amr5638946wmi.65.1655927013950; 
 Wed, 22 Jun 2022 12:43:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c2901000000b0039c4506bd25sm540583wmp.14.2022.06.22.12.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 12:43:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 21:40:41 +0200
Message-Id: <20220622194041.122597-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KvX4JIMyF4+GzHjb+wIIkA/UOB5BP9NUVsKv6tE48o=;
 b=CeEUlC6hSaMCEqEwjpJt7J4V3OmXvB1/WEAYNVs5AqQY3EGMraesx6fVedqL9rEECV
 ypkbo4ZFvbVV852xpCzREWquWzvI6W3dsPnQ4GLTbZBVY3gQ1yQIUvNshX8De2ep+3if
 v4pXB2VXeXUULUI6PuUps4qm1Nic313wOH8aD4X+L8wv+ZEDVcE1HWKO6JArEkAS0iRH
 rejjr3ipagZMT51T1guCX1el6RyqayNuTtS1t0kKwZUmcs4oKGpQ2eIY2By6bVY5U8WZ
 4LHa8S2JfuKtQQIEf0uXKbairSS6cgN7lCS8mbIc+0jyPo4t6/kNw2BVkKZg70X5uJgJ
 LODA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CeEUlC6h
Subject: [Buildroot] [PATCH 1/1] package/git-crypt: bump to version 0.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/AGWA/git-crypt/blob/0.7.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git-crypt/git-crypt.hash | 6 +++---
 package/git-crypt/git-crypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/git-crypt/git-crypt.hash b/package/git-crypt/git-crypt.hash
index 973432d7d0..5957a0273d 100644
--- a/package/git-crypt/git-crypt.hash
+++ b/package/git-crypt/git-crypt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 6d30fcd99442d50f4b3c8d554067ff1d980cdf9f3120ee774131172dba98fd6f  git-crypt-0.6.0.tar.gz
+sha256  50f100816a636a682404703b6c23a459e4d30248b2886a5cf571b0d52527c7d8  git-crypt-0.7.0.tar.gz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-sha256 506657e7a381165550e6c33e35b3b03bbef3e1feb68ba5529e264bd75ed2dc64  parse_options.hpp
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  506657e7a381165550e6c33e35b3b03bbef3e1feb68ba5529e264bd75ed2dc64  parse_options.hpp
diff --git a/package/git-crypt/git-crypt.mk b/package/git-crypt/git-crypt.mk
index 37e3d885a9..d562522485 100644
--- a/package/git-crypt/git-crypt.mk
+++ b/package/git-crypt/git-crypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_CRYPT_VERSION = 0.6.0
+GIT_CRYPT_VERSION = 0.7.0
 GIT_CRYPT_SITE = https://www.agwa.name/projects/git-crypt/downloads
 GIT_CRYPT_DEPENDENCIES = host-pkgconf openssl
 GIT_CRYPT_LICENSE = GPL-3.0+, MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
