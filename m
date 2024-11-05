Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB620D33A29
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8674380F94;
	Tue,  5 Nov 2024 18:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdQSai890te5; Tue,  5 Nov 2024 18:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9160680FF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9160680FF8;
	Tue,  5 Nov 2024 18:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2323DB8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11DE180EDD
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jE5WmmJ7OBSy for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2657780CCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2657780CCC
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2657780CCC
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:52:53 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a6c2077afcso9935025ab.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730832772; x=1731437572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTL5PaBZ1fzzoEd3IKqIPCJ2ttGFjEw/tFGFB1F/Lhs=;
 b=vDcE98ZTUp5uFPxp+BVHJtVkmNj6559wf0Ye6vOC1ByUpv8nJegwclFPtKW82+IyRW
 jNTB0TDtJQvqr8egWAgvqb9YpsHGREn42QTj04V8yQt+K01PPS++nsJbQEgQwzOIgNx4
 y//LEuYs9iOdsK8eSpU32NfN+EWBgbuIBkI0CtMQPPuUlY4f63wQyJWHIwT4DIKBWT/W
 d8tmwXlhrlzKFlWy0dShA+51evyUc0OiNBHWUafnkyt2G6FeBs253oCLEmE7IHVSd0g/
 SB9knMv98+XbyTyfgTaUBskciwtd8Gck4BJ6IzEvGX8zPzdynBgMQ5Ds5R8BXRG1IFQy
 OOOw==
X-Gm-Message-State: AOJu0YxVSJejTTaO0FlkR4tjVSYTLbi1wq6jJmE3WA/1ui4A9+qQQNlj
 3KsPTpTH+32jjL97CsPovux62llINc6RG22vI70PdsjlnHZoQlEtoU393g==
X-Google-Smtp-Source: AGHT+IHYRU7jSR1KRGPZsbmwGZymwJ0yEiioVAtQ5mC1YWgqJCe07V3S+58cJIjK+RFVRTVXUJ634Q==
X-Received: by 2002:a05:6e02:1fcc:b0:3a0:49da:8f6d with SMTP id
 e9e14a558f8ab-3a4ed3057c0mr361367005ab.22.1730832771960; 
 Tue, 05 Nov 2024 10:52:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6c31e50fdsm18453115ab.28.2024.11.05.10.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:52:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:52:50 -0700
Message-Id: <20241105185250.1536270-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730832772; x=1731437572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cTL5PaBZ1fzzoEd3IKqIPCJ2ttGFjEw/tFGFB1F/Lhs=;
 b=dvKViwI4N9W43SGTJWfZzcQ1+/zMnGB/0YSyXqAbhyCU2W18kWxSf4RzgqqKcQXCMi
 Hv5NrQ51j7iMBkc0gajJ0V1ZgEqbQ4y5jj60FBQaSwoXsEESUK564wJpWo1F33x/RsKY
 cV9euuqmTTay9Cch7VEXzAGct83THy5pm9wEF2YCaUXM1GOexvm7e12b2JeuPD6ivvbh
 aCVTZ+9sQ2a2ROQo2INZMd1qoReu3nuLDUkQW9qbt6yVYwa7IpmGUl60l5ngKPlpVWbP
 msoWwJUP6v/6iPN/MaL9rbpuBdX2DVG8LPvskZLVicAlsCQAdugO/1JotgpC6kdMkRW1
 g32A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dvKViwI4
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.23.1
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
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
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
index 3a7a9dc2a7..8a6a3cf85b 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  f7b800ad13a5948d208e04973e75aafa  marshmallow-3.23.0.tar.gz
-sha256  98d8827a9f10c03d44ead298d2e99c6aea8197df18ccfad360dae7f89a50da2e  marshmallow-3.23.0.tar.gz
+md5  45f26839a3486cac60f6aa043e5035dd  marshmallow-3.23.1.tar.gz
+sha256  3a8dfda6edd8dcdbf216c0ede1d1e78d230a6dc9c5a088f58c4083b974a0d468  marshmallow-3.23.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 49558583a8..2c2e7f1ee3 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.23.0
+PYTHON_MARSHMALLOW_VERSION = 3.23.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/b7/41/05580fed5798ba8032341e7e330b866adc88dfca3bc3ec86c04e4ffdc427
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/6d/30/14d8609f65c8aeddddd3181c06d2c9582da6278f063b27c910bbf9903441
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
