Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2AACF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B39F4029B;
	Sun, 13 Oct 2024 19:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPHhBH3Lxm40; Sun, 13 Oct 2024 19:33:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CA24042E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8CA24042E;
	Sun, 13 Oct 2024 19:33:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8187F1BF3BE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FF60403FE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpAGsazWaqzW for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3048D4050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3048D4050C
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3048D4050C
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:33:00 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-835393376e1so229669539f.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728847979; x=1729452779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoUZpGB+hFBj9OWtQGk31DHiMawXsEE9RJ4zMbvZPjU=;
 b=JNIqAHM5Y3GcGWfWzdz8iJxO00oFzsewovm4/DIh1lK8tAQbMvQxn6VJmEO2GUTgG5
 gzomekEUtN/hz0Vnka4gMhgndoun0whsi/1cEP9o06bsnG4HJFha33G5Q1LjHjzc842P
 qetWDFg7OX5zZ34itEs/Z84fDHapt7uwHV8RdMIvlBtxk+HCMybLhyrCE7TBQE5TMExa
 SMVbVTDZQnefn/2XXPPEbdj6utNuNRVvDfkVSMbxXmWFgRh+WQ4qD9b3gPqtUSB88Z01
 y6bD9LRfurcpyoV54aOO13vegefsr9VtyeddFcV3nnrT60n7PYrbCjVwELNjdGBniM2z
 l7Bw==
X-Gm-Message-State: AOJu0YwCy1/P6+yImDRRqu4Osmcr2w901ql2uf7uf3qINnMM+ZDaISEK
 yeUiz51t4Wok86MawuyImYs6ALU/l6Btd1dcnfk70FmIHcncnKtyYJLfLg==
X-Google-Smtp-Source: AGHT+IHeW/osPxaconL6l69pjsin7ciqWDykNW5v791OZ9LIV0MWB6RDwrhHPnI9eYx/TNxFrAMAIg==
X-Received: by 2002:a05:6e02:1b0b:b0:3a3:b240:ff71 with SMTP id
 e9e14a558f8ab-3a3bcdaa74bmr41523765ab.4.1728847978904; 
 Sun, 13 Oct 2024 12:32:58 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbc3de4e53sm860571173.15.2024.10.13.12.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:32:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:32:51 -0600
Message-Id: <20241013193251.2807543-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241013193251.2807543-1-james.hilliard1@gmail.com>
References: <20241013193251.2807543-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728847979; x=1729452779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoUZpGB+hFBj9OWtQGk31DHiMawXsEE9RJ4zMbvZPjU=;
 b=dvyQ7wl1doY2Ddg0k/gOLh3iIrlGjlNMSs28oma5rB6nWnBVQ/mfwAiFjdjUklk4VU
 89p1s2keDu7Qhmz9S92PStOcItGhjrGHFuI25B+Ohn4PvHe+mp3DHpo5NZiR8gD8bF9m
 WPsXxLbQ/ckcxXbDXZBrDXXBkElmurcEqvl2Et0/9N0KwBft8pvfYya4RDZUG2nmpdTc
 HeNttRkd4E4NzRNRg3h0CvTQu77V5eiw9nSWbgJatutkA1hPB2aDT3/LKViVWMASoUWn
 1Jw5XQqJ7bc0h6NCyZJ7evSIAQVKX4MdvDRedXaNSJjJ+S4PdxA02pZl0eg7+xQSkLZW
 74HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dvyQ7wl1
Subject: [Buildroot] [PATCH 2/2] package/python-starlette: bump to version
 0.39.2
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index ea5cb4799e..9a9671f41c 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  e2e61f4def1d357e73795c646bda57e8  starlette-0.38.5.tar.gz
-sha256  04a92830a9b6eb1442c766199d62260c3d4dc9c4f9188360626b1e0273cb7077  starlette-0.38.5.tar.gz
+md5  cdef39e4684305e568bd91b45ceb9dbf  starlette-0.39.2.tar.gz
+sha256  caaa3b87ef8518ef913dac4f073dea44e85f73343ad2bdc17941931835b2a26a  starlette-0.39.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index bce75a1957..57d6e319f8 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.38.5
+PYTHON_STARLETTE_VERSION = 0.39.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/13/aa/57975da16ca0c368bbb5687daa6ad79561c2328a44667a1d6802e94df3e5
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/02/0a/62fbd5697f6174041f9b4e2e377b6f383f9189b77dbb7d73d24624caca1d
 PYTHON_STARLETTE_SETUP_TYPE = pep517
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
