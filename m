Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCCFC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C0460AFB;
	Mon,  1 Jul 2024 18:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS0aD2YkpXts; Mon,  1 Jul 2024 18:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCC760ADD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCC760ADD;
	Mon,  1 Jul 2024 18:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCCC11BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6838412E4
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKZc5pMgk3kV for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C245A412E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C245A412E9
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C245A412E9
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:07:49 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-371c97913cdso13687635ab.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719857268; x=1720462068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fy1nryZqN1PrcuXNrnrrmdh7XnYtYCQCYlp0dPEsGEs=;
 b=YO+NKjHF4Pnrzcvx67QuFdNNaNCqE0Zq6p20Pf/x1MM7rgY5NDAhaMYi68af0BePC1
 IK4SuQAGhKPncJhlst+ianCxf0tBv4wEhqWmK/98XAi6JjEOGD2cjc7g/BWp9k7TjVRA
 jz8F7oKoE+squ77GqQ6xQmFZ7inf8fyP0WMTJZKxitnBc1v+jyzkh6zZDcy8YGpXn8V7
 Bp0aiH6PE/Nn2jzJtbfrMLJx83Qg9fOJjvqVT9GTuiN8pmhg2+AyQZOuiCM911da4Ajh
 bIqmTXrAkxaSrddDs1oN8lLQggv8s8Up8T1ZB7+CE43inOEzHpdfHJztJhFibXnWdyIl
 dKIw==
X-Gm-Message-State: AOJu0YxbPoupKSoD1NwSKNQMa3yuek40XDCrmB167aCkVV4LUjR+W1vc
 z56BmS0V0g4IIWfFAgO7jrwgtTLHgBs86vgMuAUiFwCF36LK92uJdcpeCw==
X-Google-Smtp-Source: AGHT+IFObEcnDSSJQKndNz9qFCW+Rq55+muSTRTUifXOsw1A7IYW7yNQTY1AswjYJ2wuTOvCUgEdtA==
X-Received: by 2002:a92:cda4:0:b0:374:ac3a:e32c with SMTP id
 e9e14a558f8ab-37cd1b83db4mr85590705ab.16.1719857268509; 
 Mon, 01 Jul 2024 11:07:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad22cb6eesm19685085ab.4.2024.07.01.11.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:07:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:07:46 -0600
Message-Id: <20240701180746.1734676-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719857268; x=1720462068; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fy1nryZqN1PrcuXNrnrrmdh7XnYtYCQCYlp0dPEsGEs=;
 b=QgpvDUeoARz+VFpGDiZImeWhCXqlkeDrv/g8PD37G5J0UeSUUrusl8R7Uuwz1jzTiL
 /TSLdqUFg380lW/KednujChmbrrtc7Gz18im7f3VJAEzDWw4UKGHs9FdD4i5STGlJzGW
 B8jCoWgn4gA1j8FJesROUeC2LkecUp/8pxYdcf/vbQA98tM9n/X9IkOZKCqg1wudDVDv
 cTPWo6/l3csP1MIcg50YyeXMmB4HY/JIqsi+FACbo7bYRsAL5pncBmpy4+WYOoLTyrMT
 2Irihrlc3o/ESh3Fpm2rZleB4IedW0VNmGSRyb3n1xSkwrL2tQjy5XxGcRu+kNtRkeLc
 +v8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QgpvDUeo
Subject: [Buildroot] [PATCH 1/1] package/python-aiofiles: bump to version
 24.1.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index 3dc9281de7..f68b0b55b5 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  ab5dfab3180f56a21b46e1e90b16c6e6  aiofiles-23.2.1.tar.gz
-sha256  84ec2218d8419404abcb9f0c02df3f34c6e0a68ed41072acfb1cef5cbc29051a  aiofiles-23.2.1.tar.gz
+md5  530273426ff7ee50283e52186e185c81  aiofiles-24.1.0.tar.gz
+sha256  22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c  aiofiles-24.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 954647bf76..9eae73d3c1 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 23.2.1
+PYTHON_AIOFILES_VERSION = 24.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/af/41/cfed10bc64d774f497a86e5ede9248e1d062db675504b41c320954d99641
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
 PYTHON_AIOFILES_SETUP_TYPE = pep517
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
