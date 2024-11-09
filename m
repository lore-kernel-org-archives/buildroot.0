Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37772D5E37A
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 18:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C4DA81218;
	Sat,  9 Nov 2024 18:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5TfxfhszmBt; Sat,  9 Nov 2024 18:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9970081191
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9970081191;
	Sat,  9 Nov 2024 18:08:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1FE1D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1390400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXzKf6zh7B4k for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 18:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 818A540242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 818A540242
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 818A540242
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 18:08:35 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83aad99d6bfso121084439f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 10:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731175714; x=1731780514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+CCp1vJdSk3XTYqhAXBY8B1MjuT7raHGxxr7NE/mO1A=;
 b=UrWj6j4b0KXHVaJfdBk5Mo0zjceKz1orGD5hFlzpxyfCKtUDwblOgJ6cYyVfZqtXL3
 h58cFOOsE+pzB+zOzX4+xw2CvfRDELVz0G0D46Ome8ruQPHUAYBAqU3nP9ZkjvUkjhv/
 gOWg6z+Y6JPc4r83Bomf4igP679jZ4qAaS9vweJk+ELw30Z+iIap4Bl+D+5zOONaWWuh
 cDWrNA2J9KInqqDUxEhglV2V21Li+5PyfFvBZPUg5xAlWaiBwx5pMtbGaTCmUk4eUz11
 tMsCYeAxKOiWI8QM85ODy/33OXsN7DXFAAmIW4PieDGp6JrspmM+hJc0mR1ey3yxG6y0
 Jubg==
X-Gm-Message-State: AOJu0Yxv7M4h5DWdruuk2AR4vy0zrN/mVT9KJ3+IEtkvovEo2EmMQBPZ
 qJ6E8uuyG/oM2yp4GwL7qMdnd/FGMzFji1/o4sj3GQOYB8Tp3H4MJU0dlg==
X-Google-Smtp-Source: AGHT+IFAK+lo1Lb2E7PGOyc3KXDbHM7Mws93XKsK5nTAMlMrK5DryeFqCyjsZxofxP2sep1iflHf8g==
X-Received: by 2002:a05:6602:160f:b0:832:13ce:1fa3 with SMTP id
 ca18e2360f4ac-83e032fa17amr882580139f.8.1731175713828; 
 Sat, 09 Nov 2024 10:08:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de7870a2e5sm438240173.24.2024.11.09.10.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 10:08:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 11:08:22 -0700
Message-Id: <20241109180822.744358-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731175714; x=1731780514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+CCp1vJdSk3XTYqhAXBY8B1MjuT7raHGxxr7NE/mO1A=;
 b=gNH/jLJgcaWjIxE1UOFC3LRNwuwTTkTfegSpEiJQ7I/9NUnnMS3BMnFpX8Ew2gvvbZ
 nogMSMX72yQOGx69dS6YqU5Jh3BiYUOcccK3fPOwBQVrDtc8eBBhUUNtaSb3n8CEGoF5
 kyTXfWNdhzj4HtnwJOscikH/znhHYBHSQVK6qPK9Aa/a9T16/n1iRK48N737W5cAp+FD
 1LY6XSRnzf0IGHdwnyxD29lT2m8y7bnV65ytFKn1h5JxlEog8ebqKEjmetS1tpZ9EmqE
 vbpE9RtP662+5LlFgRJwjg1SwOQ5mpzWccndejP3WyVuKFkfZxSkUhzP9uHmejbeZ3cD
 wI3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gNH/jLJg
Subject: [Buildroot] [PATCH 1/1]
 package/python-magic-wormhole-transit-relay: bump to version 0.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-magic-wormhole-transit-relay.hash                  | 4 ++--
 .../python-magic-wormhole-transit-relay.mk                    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
index a72907222a..3f038728be 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole-transit-relay/json
-md5  99d1a7d2ff78e7de4a2f91698bc061cd  magic-wormhole-transit-relay-0.3.1.tar.gz
-sha256  2ef2efbe4d34f0e624870f842259fd733ba77152ed310af4349774a62884900e  magic-wormhole-transit-relay-0.3.1.tar.gz
+md5  73be034b4a57e9d190cfb658cbaa5fbf  magic-wormhole-transit-relay-0.4.0.tar.gz
+sha256  912d835da21b11266c77111dc9b5e5800263fc0b98f0a179962267df41819e8c  magic-wormhole-transit-relay-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d70f6469bb210c2aa4c0dfd74f498ef5f0467a137d8296479088e7243c5884eb  LICENSE
diff --git a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
index e557b456ed..03a2d416db 100644
--- a/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
+++ b/package/python-magic-wormhole-transit-relay/python-magic-wormhole-transit-relay.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.3.1
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION = 0.4.0
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SOURCE = magic-wormhole-transit-relay-$(PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/be/81/c5c19ea32d1d770f2513503fef4589c6958ae9b44c03ea121e9fbc74c704
+PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SITE = https://files.pythonhosted.org/packages/d0/87/cb71073e53ea7e1b6f892c52e4114caea81b887a7d34e665b15dc81d669e
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
