Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D8E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 23:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F938814DD;
	Sun, 28 Dec 2025 23:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2bxQPclSnoa; Sun, 28 Dec 2025 23:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202FD81516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766965777;
	bh=4N8nuSiUXbhF1tgqojHQc5kIstPv5o8I6Y3emxfnOPU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Lhuxu1vvjao7zr9Hv8ndPq32Q0qUVDv3I8/w4aBuISvF36Om5pxIfbFJNBytb0u/4
	 j3xabIoNwJvmsus+9BbQVnLKFdkzIHArTTwWcSNWfL/AplCwkIhXdQTkImwv0yf406
	 MOL7edGdkn2fBWxu/FdI4mt6ohG8egyPBekLRXB8DlhCt4Zhy4psxU+jVpp3sCt/EE
	 XMtJ/Fs1BCaY8aUP05pBVk2zkjbo8kZFYG8wViKrts/eSVm9vmPSwR2zPYrunENiNO
	 Zr6l++C0oo7m8Y+StyNwxh3iCh6jcFtFmGTuWgK7Wc+paJH3Hcf8UEVirhA4JeJ5z1
	 73w6ayxKiL4mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 202FD81516;
	Sun, 28 Dec 2025 23:49:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C58F91E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7CB760A97
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6epi5TVCUj8 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 23:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CFCA60A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFCA60A96
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CFCA60A96
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 23:49:34 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-455749af2e1so5970010b6e.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766965774; x=1767570574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41UIs3OLDghIwftvh6ivlpbmjCGqpSFf0mOVb28q53U=;
 b=G/gkRvVeh2Y5jSfqTbU3tJpzJRFoI2YjCF8zQ7ofJnXrMpTLSftZIvAJZJWthLFRan
 /uSsoW262h+vzxv7b5pXxCI5cu63FFTfrgHFEnM99wfsfnmP+fVOQQhOs/tRTmwt3e05
 QpkeQD7b+ZEYSzXhuVdwuaJyF2xamXUVRIRevyH6bujWhkr3p1o6gzMIUl59g3mBXuBT
 uxcbZLFvoDBsdR8QTJ2y726fvl7Jq25ZC/zuScBET1I/gYYynEERIaCh0v1guWaY3Y4O
 MYX+mDzDCu02jANgHO3jCGCtqB7oYHixYWg9Yx4MamreA+MilWyaT4qlLTOkyq1MWcQL
 iZJA==
X-Gm-Message-State: AOJu0YxCe1X1xKBe3yYdPhOFvCfCMHgGU3eKVjmeUIhcCTm9xvKBu/EU
 qKYhD+cgB75+67EunJmjPlGBlPyu2SyQEHQ6jb2ri6r0yCHS/2gh+xDT+oaLWlNwzjA=
X-Gm-Gg: AY/fxX6g9f+6S9UpsxXllGq8zbuczu/nK9jkVoB8z7WadtfcdG7cP4pEOVnW8S/4N1r
 KI6UDGnqonbvGTpt0AYVsyJRBZP8GR/dVlB31sNUdI2CJb3yqHRupI64ST3jv0Bp+knNGGfmJVo
 OP1HHr1lfXzL0sKp9IaE7jMtsAY1TWaw4xj9+OQ+rpF0u45/X9B2hSK9/+o09s49eC1m/h3XeAB
 DFBUOS6JpNj3JHS30e/NCoL6fHD+XqyeK14TdvxhKSoR930oFbGTa/f4sWQlAZOp1/EHofL7buS
 fDEXT+tde8rejaO0EsiSXdbFVwEmeZzVVwfRTYaz/xcclJfpn7kmI4jt5d1fodHGetumsxjIIcF
 0aYd2F2SKdpC98/QXWAlIc7Egd7x1WchhICnyEOL9Ite8G6Wxupjovkg8LxgElXwKeCiJhme2cT
 RR2q0ocqd+YMnpL9EghfkMoU/qXGxNuAAEdF/zDP/Dbwq7iArK17J9CPDdxJXUJhC/IDE9wnYtR
 v9xrT5z3C73CxkhMo4fW0Tnj7Et9ormIgMJvd777Il0jGAEenB2JoM=
X-Google-Smtp-Source: AGHT+IHVpgd5foHtWZKP1iQPwXurUemZ3OKwlkt9j5y/sTA9HH8CKe5O2QN3lj5B+1fHWMMyIDV/kQ==
X-Received: by 2002:a05:6808:30a6:b0:43f:28bb:2f85 with SMTP id
 5614622812f47-457b2127e70mr13424647b6e.8.1766965773807; 
 Sun, 28 Dec 2025 15:49:33 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3edb117sm14075260b6e.16.2025.12.28.15.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 15:49:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 16:49:31 -0700
Message-ID: <20251228234931.2896108-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766965774; x=1767570574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41UIs3OLDghIwftvh6ivlpbmjCGqpSFf0mOVb28q53U=;
 b=gnWnd2L+7ZJh/taj9VxsoWOu9oqIyR+/VBofkCsR+wtUqD5FpHGDO4CUjWsmTHeMnB
 e2w+EDqGwEz/q/IAjPN7ar3gfm6fI23CVfwtBTjn8qv4CHSbh1H7et9qS1X6cAmosGsG
 O0yUty3EGK/ZLXodn4Cnr75UEDtusxs6XNtKQJlEb681cAOF2q6BsUvoNfxxxwG4I/bV
 rJV7IPXH6rAkG1lhQ8NQwb4HapsgSKmuPp60H/Pz2dSNFqTFkopUi/UOw1x8ajZC3sGL
 WXf8NnQgu+hgeVXX+JtZF/ScGI/q1406u3gzQqvk/0hAhIraFXrKU8blWxEt9FcEQzvr
 R/Jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gnWnd2L+
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to version
 2.22.0
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
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index e484386cab..03427599d8 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  367f96d0ad12d7a3a44d6b1c4e7c6b8b  asyncssh-2.21.1.tar.gz
-sha256  9943802955e2131536c2b1e71aacc68f56973a399937ed0b725086d7461c990c  asyncssh-2.21.1.tar.gz
+md5  0b1bd9d856dfc1b283ae1cd07d2bbee1  asyncssh-2.22.0.tar.gz
+sha256  c3ce72b01be4f97b40e62844dd384227e5ff5a401a3793007c42f86a5c8eb537  asyncssh-2.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 6fad7924c3..5d4a056d32 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.21.1
+PYTHON_ASYNCSSH_VERSION = 2.22.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6b/b8/065c20bb5c9b8991648c0f25b13e445b4f51556cc3fdd0ad13ce4787c156
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/fc/d5/957886c316466349d55c4de6a688a10a98295c0b4429deb8db1a17f3eb19
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
