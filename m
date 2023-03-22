Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6BEC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B024F41403;
	Wed, 22 Mar 2023 01:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B024F41403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvzF0E2Sz5Tm; Wed, 22 Mar 2023 01:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A3F4139E;
	Wed, 22 Mar 2023 01:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4A3F4139E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9651E1BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7149940320
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7149940320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZrOggoAinFL for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:47:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E24401C9
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95E24401C9
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:47:11 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id x6so857821ile.3
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679449630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9L8alHwabcP+6/65tStlUglbWz3X/myBVX2ruKumMs=;
 b=0FktbSyZS2kmlGcQkmQtf4Uj1H1FKmKkM47YjjZlw3uttjLCH36+SzeiIdNBXhDgf3
 F50/HJZbOIFxAty0heSdFeEs+9rCP42gSyI3gRpHpqWGpmO3Ttq7aYp+2V/ttuhNjmOD
 QLZf0wnr0D7RccswgGf5tPZLsqiGZqRzSxLcupdwS14FBhCmZwYBihYilhC9Z8BPgorP
 EvhmcsPmhbZzhZFvfJofcZRkkBsWLUheFwacoOfsDSwzQwOuJ2xwc+v8DiJFQSQFLjvO
 0An2eMotB815NA43O5/w3CZHn76vZ5kxWGjTrXU+PbkRllKo5buT+xrnDKTtda30QLIE
 T8uA==
X-Gm-Message-State: AO0yUKXe0KeRNQ7nJL/NifCBT1UWKMqGZH5n7osTNrUwyuw2VPgFAzZ0
 wK7izeNFEF+aBhbBXqGckuIHFuxhdZTiSw==
X-Google-Smtp-Source: AK7set90RuaH2O+7oSg12UgNQ3cdIFEVAK/WiRbzUE0QasK/D8DpJWRhEKwQ014uQdzL//yj5z4BVw==
X-Received: by 2002:a92:c04f:0:b0:316:f93f:6baa with SMTP id
 o15-20020a92c04f000000b00316f93f6baamr3479942ilf.31.1679449630487; 
 Tue, 21 Mar 2023 18:47:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 c28-20020a02331c000000b0040071bcb216sm4754239jae.102.2023.03.21.18.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:47:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:47:03 -0600
Message-Id: <20230322014703.77456-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679449630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9L8alHwabcP+6/65tStlUglbWz3X/myBVX2ruKumMs=;
 b=eUWbJGxWp6PItlKCbOndWctUnzvISi7hPu3iRwMkDPt58LGyULMpZ16T1xksq3cuX9
 rUEjAzY0BH7CJ0HGt5U8hfob3FdcGN727hNYwdLFNwWq4UywPrU/+4v2yuZcsBl23yWY
 xNzn8osS2Bu7ooi7VfeY8EzdmpCBvLKQehGn8/GDmD54it6HZu9SyFCDEAfqfwKdlalX
 gwgZKb7K9LwTizgr0ZPMb6WUhiESuY9dwVLBFtSHgl9JynaUGz7x4t8t0rCYN8emjhXN
 gTlr7Kbg0XC8yt7g6zJhGO3MOzSJ0rZqzSBzli9VWLFTswpkcU5+jSMMFcov/azVoHWy
 2IaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eUWbJGxW
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: bump to
 version 4.12.0
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

Verified license remains MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 6 +++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 4641d2e3a3..1777563190 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  22f22f89cf9da41b22e1ece9639c66a3  beautifulsoup4-4.11.1.tar.gz
-sha256  ad9aa55b65ef2808eb405f46cf74df7fcb7044d5cbc26487f96eb2ef2e436693  beautifulsoup4-4.11.1.tar.gz
+md5  428d2737d94d238b146081c03d3b2b87  beautifulsoup4-4.12.0.tar.gz
+sha256  c5fceeaec29d09c84970e47c65f2f0efe57872f7cff494c9691a26ec0ff13234  beautifulsoup4-4.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  9e41dab3a48f5c734a9d5446557b28a6616e4924ee51d205598e4416bb93ce25  LICENSE
+sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 78f885ba08..7896dd0f39 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.11.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/e8/b0/cd2b968000577ec5ce6c741a54d846dfa402372369b8b6861720aa9ecea7
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c5/4c/b5b7d6e1d4406973fb7f4e5df81c6f07890fa82548ac3b945deed1df9d48
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
