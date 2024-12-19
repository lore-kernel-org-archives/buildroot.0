Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0798E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFF560BD8;
	Thu, 19 Dec 2024 02:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2UG_Jg63ltE; Thu, 19 Dec 2024 02:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D5E60E1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D5E60E1B;
	Thu, 19 Dec 2024 02:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B232C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 899DB60E1B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oN9WOuy5omV for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:49:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D0D460BD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0D460BD8
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D0D460BD8
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:49:29 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a9cb8460f7so2425375ab.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734576568; x=1735181368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/h/R7NO/peDDGKDQFyeHodxiOYT4f8hlhoEdM3S3lk=;
 b=vNRc3GIdmMkyTkO/bDk7GP8dWahmlSFtZfjR0m/UVSg7NNdRilxKOjv0vlmBYufhm+
 hyjkNjW4DMJJIu9f4UAtfyHPBVolwnl4iJFVNaK/90alEc0CM+3b25YlB1gI0TAjkgDT
 H9JG204djsncu3n3xGxOeugcH62vlAGJrO8AZ5rg65CrBLeBPJUp8UVHSdvUKn3KK5Fr
 T9a5m03GUE5ib03WN3uwK58YX8RdFjQ98GGKMhwEvq5SwP+MzxKTDH0Ylc4w/8AamNhF
 /oSwpjJ061F0QqmZCXPPzLeo8S9ffXmUt0q0RTfqOuW0ZWKVBphNeGwDukWDp+EgS+gx
 U7sw==
X-Gm-Message-State: AOJu0Yww9PW6oHDf3v1kx0ULnu4ydkixX2PafC2yeDXvaYpwAVgv23ty
 ZdpevQuwBDTK0Tub/55Dh1GA/vW6sVmuPLZs7giZ9+7I3+rP156eWWJQpriGHjo=
X-Gm-Gg: ASbGncsWbXH/SESOjLaz8R5McLUx3Wvuy5BDgOqH94pt+Uw5DGnwmuuplC6q/67X59N
 86GsLdWrOqLpu6w5ax8UOTac9TqKm6C1KHV9MZHITDgKRncZPT3zHwoQ9ifMQEBmedLqg6BA7dP
 E7U4PmFcml7814KXNxDrC0qhVBv1P+lO7hu7tfTFj8tcsAsgyioyB3kCzMbmqn6qwRiGEHV/Yiu
 biJfm/LK1h7EKax1dK78vVzRRBrR7moeSE9VMr7NbDSQ/BrxyAPxe8mydWWveR8ga8AsfK8CWwY
 OnfEoeM1PL9LXWxQOkFr5AnCa59Wl8NLMQ==
X-Google-Smtp-Source: AGHT+IFCNZ0N+FE4I3WZ+UacD1fXsl59iUWgV9s/rorwyBuQqVolqm04PNbxLSCzm3WsbA8xyOlLHw==
X-Received: by 2002:a05:6e02:2145:b0:3a7:8cc2:9a84 with SMTP id
 e9e14a558f8ab-3bdc0411de8mr53572735ab.5.1734576568283; 
 Wed, 18 Dec 2024 18:49:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0de052ec7sm789445ab.8.2024.12.18.18.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:49:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:49:26 -0700
Message-Id: <20241219024926.295334-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734576568; x=1735181368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1/h/R7NO/peDDGKDQFyeHodxiOYT4f8hlhoEdM3S3lk=;
 b=UjcpljJlv0ZLS93LbVukUkL/917nUq2zP3mPO71ScZbwwTJEzO9UrQmLtPG4B+aH0E
 XPIFeXnT+YXJdCCSPZrzyPPJPo+augpbrSlYLz1F0pTPjbgqs1S0s8y0mniY34z81Qy8
 fGvUMqZRt7cDMIyzj54ySCY1CBbFXxYfNHhUTHX+SLRqaVGJ+f5unIawqRboGMWN2kRt
 TkzQREJyKUNs0Ycs1fbgEcKW4snf/4i8lfCicSD+utoNq7Xf69d31C2FYHslHtFIOfoO
 mXnIxLgi+XQk2PI61LJVSiDDCSMa/ZCObFeSP4nIn7Q2+wZzrgERoj2a2HvCtgK8W6FA
 BQnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UjcpljJl
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 14.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 5d24d5f6c4..4ecc4868ad 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  ff1293b549e8177a5272e54208659d0d  websockets-13.1.tar.gz
-sha256  a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878  websockets-13.1.tar.gz
+md5  eaef5161b6d36f8f66a1328c7e3bde7f  websockets-14.1.tar.gz
+sha256  398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8  websockets-14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 6fbdf983e9..f918bba383 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 13.1
+PYTHON_WEBSOCKETS_VERSION = 14.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/e2/73/9223dbc7be3dcaf2a7bbf756c351ec8da04b1fa573edaf545b95f6b0c7fd
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/f4/1b/380b883ce05bb5f45a905b61790319a28958a9ab1e4b6b95ff5464b60ca1
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
