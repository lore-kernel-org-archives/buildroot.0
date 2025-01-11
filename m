Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C18E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E0983B9F;
	Sat, 11 Jan 2025 19:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCaFODT44nhv; Sat, 11 Jan 2025 19:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B8083B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B8083B92;
	Sat, 11 Jan 2025 19:03:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C96F6950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B75F083B90
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8hPgRAFSSUQ for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE4DC83B92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4DC83B92
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE4DC83B92
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:03:48 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a817ee9936so9567705ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736622227; x=1737227027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jCneVgrcIDlu4WuKcJ8KxCIteKDzkTcwgnsbJ5q0JEQ=;
 b=oJgbKXaPCTaZC1JC5ORLlCDhmskazjPNNBiowQEkeguHZpzj4n9s2UXEra1gMLAGtb
 8PLsh0yR4wUyAduVTBas5jhIpPWosVW5oL/Gbp8rCMkK9L5woGTd8fd/SqJYafodxP27
 LKoobqsqzu++370ug8bXKkZTCUux+rCDPCaUtviWV+A7yGxtMEdnzijRYxWx5ZT3WqcB
 xopWeF11f+Nu8d2h67c01x2jrs8hi/WX/iLP9xR2dN0RoUpTGgKsBtiB367augFfH0MZ
 X53qchuhBGUsWDs2met6jgz+14yoZpt5IOnRByk67KmZxCqH9oQ/XZsh4mEM3DEkSb6A
 A3qQ==
X-Gm-Message-State: AOJu0YyQS/MwZqaWOm3Td5Sz6n43nEv3qoBw3gDf/ROdbbGe1rF1g2G8
 QKPOh8h/iMr9aw6VuD5bltEeX+aATJVmWOx5qE+YsENAJkMHXec1f8VpLzxbYZ4=
X-Gm-Gg: ASbGncuIsgLq/wjxsjYS+9Ak1bV0xbAKK497qDav2KJRAhZVKm/SeAVgoJZvDDYGqM7
 08nhKWWikIPvT7SoayNWWKVP7b8eqaQdeBvIIHAAU1EDOhEiUdUS0Y6LUZXKWlH8B3+G1WfFZXZ
 Uv5Jo4rFfqRLaT+fcNuFNv8r2oFDFi7GWPzjMNpiuokzJK+Gpb3gHiW8Orxytdl7zm1YPXJifQV
 b2T1YxUmuussbAitVMEYb8rFkSjY/M9ORwGNX58Qz1UWwoK34HV8eMSUR1attmu3d73YiKMtEvp
 dsOKeMk+gal9OgdysSOYamlrCQBDEnw=
X-Google-Smtp-Source: AGHT+IFKIPC54pWPA904jbTkyXUDgc9NDXhwNhwE1SyL1W1ZUs84kFoSQ7SK0IGq0Fmm32atsySVOw==
X-Received: by 2002:a05:6e02:1a89:b0:3ce:64a4:4c34 with SMTP id
 e9e14a558f8ab-3ce64a44d5amr19899255ab.3.1736622227665; 
 Sat, 11 Jan 2025 11:03:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f8efdsm1664251173.2.2025.01.11.11.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:03:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:03:45 -0700
Message-Id: <20250111190345.2961575-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736622227; x=1737227027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jCneVgrcIDlu4WuKcJ8KxCIteKDzkTcwgnsbJ5q0JEQ=;
 b=XsWeObwmd2kBW88VVLYIXR6F6cPvBBEGtAtj+e5Q7dUdpNV7Bf+qJeOyP0PK3n3Jsr
 eJhFmdNb2m+R0dKKGv/zMaHgca3cttDQr3cAqmgEXwVt3jnCuIlzVq9tk4VlxCMuebfL
 XgOAfvDj+IhPAD9E5HfEHgM27LX/5/KhbotTWBUanuHy934M2pL8L4JdlxxmAIP6HwRf
 KCsSpoA6f7Nnm5bv01ROdLx3nvMaoUW0UhbHl1ofrnRid5TceI39fHNsVGKFyAI6dVgi
 dnhz2328cwUNJkvMGJnXIbOVxyPtFHoza/5H0LEBAckwNdpEjvCQXqCjvrWYmMbLijSV
 yYDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XsWeObwm
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 1.17.1
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
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index b89c805bf6..b83d7fc575 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  3e370b4bc08f7dcc518cf8895673b19c  wrapt-1.16.0.tar.gz
-sha256  5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06b1899d  wrapt-1.16.0.tar.gz
+md5  31bef7bc31a8ba7da00cb33a70aca7a1  wrapt-1.17.1.tar.gz
+sha256  16b2fdfa09a74a3930175b6d9d7d008022aa72a4f02de2b3eecafcc1adfd3cfe  wrapt-1.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5974efbbc8b626b2050810d63c3a907ee21c92bf64b3740fc623ad05eb3448ab  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index ed4a911e14..32bac19d61 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.16.0
+PYTHON_WRAPT_VERSION = 1.17.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/95/4c/063a912e20bcef7124e0df97282a8af3ff3e4b603ce84c481d6d7346be0a
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/c8/dd/35c573cc2b4b8d65ea96bba0247d05710f284857d30e2266d1874f1c727d
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
