Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E1E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD7B60689;
	Sat, 11 Jan 2025 13:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPpcVAllSuhA; Sat, 11 Jan 2025 13:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED686071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED686071E;
	Sat, 11 Jan 2025 13:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2194E942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0076280E7A
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uciSus69ImIK for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0AA1683AAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AA1683AAA
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AA1683AAA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:14:03 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a8aed87a0dso9644595ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736601242; x=1737206042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BzDOtDhv9nscuaewA11EnfgDADo1iHfG5fT7q4e/3BA=;
 b=Y+JV6cBMGIAZNAR00bks8jphGfita4GjrYc9DRRnyj19vZxodgcUqtQO7rkVpKxBeR
 Bj3iVpLwAnkkoDEg6KYDIug7pvqT5Gj3e5F862VbPmWE0GX+qp3iJuBb4cJJn7k3k4lG
 NFaU756XutmNOw4gJvd7WUZXDZjeeJ60PWQlSE96dVxz4oKH57UP4OWzwBClIP3QSTih
 MBxCNacmjgU/yFHw+0PmEzb5ZaNFAuG/JFgVgdzH0Z5q9HdtxAhFFw94rA2A0YT6gCIp
 PHuH1KxNmg69FCHaBVnRIspKEtOfHV1+rHUqErDsJKhtmGp/8tFhv6/hbLyzZydp2Vot
 hT+w==
X-Gm-Message-State: AOJu0Yyzfdsr8T3k0qeuJFlI9pXWHxPkKCKt/4EQBSJ8W3e/2paUZGvH
 XZkB9c4u33ZVlMBB5P1gLqLK7yeMOiUc4x9GmFgUag1Yfy2SeTtk5gI2crNwOKM=
X-Gm-Gg: ASbGncvEgnmYw0JTS7UM4WXul+T3HpVB/UqTdPccwjC+5Ehf0W4VpyilC5YSARFkaUa
 IkCmD3e9erFbdPlF+Fevk1GQ1QJGKrwNsZZhgpd/Zb1y9d33Bmz2VSs2hQP0MB6t2y5XASK8J1W
 dvQJXhJFq/kZwei7lXMrPyjXgMkWcOZGVhZHT6KkEW/4kCgga6PlvDoS9uUFsZApQLld1/ql8zk
 6WmzQzTtg2D28/emOwd7TCJlJvWptU7RoBhutlI38CuKzvqwJq0MkEsQsq/i8lQSE94Tw75hjwS
 28SV9gTkfmAXqQTvVYfLm9ybaIucoIY=
X-Google-Smtp-Source: AGHT+IFyMMLhiakEdw6nY0LLOrmRLGF3yi4o0fW+E+3gueqZStFG0/6kJcF/bUmIpznKg37f5VfFaQ==
X-Received: by 2002:a92:c248:0:b0:3a7:e732:4713 with SMTP id
 e9e14a558f8ab-3ce3a9c1aa9mr108709715ab.15.1736601242412; 
 Sat, 11 Jan 2025 05:14:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b718428sm1497425173.89.2025.01.11.05.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:14:00 -0700
Message-Id: <20250111131400.2464699-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736601242; x=1737206042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BzDOtDhv9nscuaewA11EnfgDADo1iHfG5fT7q4e/3BA=;
 b=gle6Y6hjGexAWv6rEnSG5dX4sxwmbJ5CFpHGbXcanDxkQe3oFVXl7WZ2TzRPZc+TvC
 hnOfhGpryvCnwuo6YK0YkayshVBh1evBy6Z2Sa+eJhdbW3BhLXspX+543hpS5vggS7Y2
 HQkD/lh08SXB6ROcm1hAeHgE8cS/Bol2Z0AcNp9sLK2OAm4Ynu2tDs8Cg618KrQ4DbFg
 M43s5EgPn7lNqPlCdIEI4ffyMMfiTtYvWtcYGJJDXWCJHIM7kIb8f82s7g7cEVP6fdrL
 y/pyO5cWf8m9clohR+v27yHCDuDGKJRoM3pTGjBp0EAoAPv+maMP+lDHaNBF68xv0uq5
 Fytw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gle6Y6hj
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.25.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 8a6a3cf85b..f7a158a830 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  45f26839a3486cac60f6aa043e5035dd  marshmallow-3.23.1.tar.gz
-sha256  3a8dfda6edd8dcdbf216c0ede1d1e78d230a6dc9c5a088f58c4083b974a0d468  marshmallow-3.23.1.tar.gz
+md5  881654a8819a7f8ae8f91563cf378b7d  marshmallow-3.25.0.tar.gz
+sha256  5ba94a4eb68894ad6761a505eb225daf7e5cb7b4c32af62d4a45e9d42665bc31  marshmallow-3.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 2c2e7f1ee3..d6a91bae72 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.23.1
+PYTHON_MARSHMALLOW_VERSION = 3.25.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/6d/30/14d8609f65c8aeddddd3181c06d2c9582da6278f063b27c910bbf9903441
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/bd/5c/cbfa41491d6c83b36471f2a2f75602349d20a8f88afd94f83c1e68bbc298
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
