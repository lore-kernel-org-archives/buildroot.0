Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FF0CEE320
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CABF4021C;
	Wed,  9 Oct 2024 15:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j0yobqXzV-G; Wed,  9 Oct 2024 15:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40632403CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40632403CB;
	Wed,  9 Oct 2024 15:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20EB91BF97D
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D617B812F9
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4kPeImJTPm2 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCDE581301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCDE581301
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCDE581301
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:32:11 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-835464abfa7so14065939f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728487931; x=1729092731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJrXhqZUGw2FP4zDjXgAl5oHaKbnLBT7jm6lVgrPbGY=;
 b=geiDnxrPSMyVDNk/RqOzrtt5aYf5bduCOf789mocY7HOz14TOywA2J33GFSM5UZMXy
 N526Rin8CW35R2DaPInes5+1n1CvHGbrdz7+Vt/kue8VCcSBWqKX0G3PASKlNknpuVAP
 3hqkFETphtkkbvUXU3UvXdtwFaeCTDioy6oM71wlvIRSLMOztwgMXds955ZkL5S9XC0B
 GERKOa0QyGntb/urPecH/rEjQK0iYvaxxvdYW8rxFne2aDEJLqn1OMAmHqPvcfJjiW/2
 VhbOcxESgwXB6vzqoTPBKwYN50L3d5lNPlZEak0FVQKZl8vde/DetaDiHY1geNbPR5ae
 ESHw==
X-Gm-Message-State: AOJu0YwiERbZ7O6JnIqdTfhSSKLye4neuHORP3C3RBdZGOaVIQa1HH1O
 WYMUkkZEUItP6ZZIK5nW4KRm5xSgyhDuW/5bTneIP6gDw/3TBzRYqvZHQ/gr
X-Google-Smtp-Source: AGHT+IF6QgroYAcgK0t+lICJ6OMp/ofuKKheNDQTOY/Te1rikby/xoRz9AhmO1Y83OsAxm/IKpDE8Q==
X-Received: by 2002:a05:6e02:20e5:b0:3a3:35f0:4c19 with SMTP id
 e9e14a558f8ab-3a397d30cb8mr26875085ab.21.1728487930551; 
 Wed, 09 Oct 2024 08:32:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb35b42sm2084480173.14.2024.10.09.08.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:32:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:32:08 -0600
Message-Id: <20241009153208.3776928-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728487931; x=1729092731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PJrXhqZUGw2FP4zDjXgAl5oHaKbnLBT7jm6lVgrPbGY=;
 b=kHugz8n9IbuEHl5sixM/nrqqaKHm8522ALAKgFHpNqHMH2LmI+YXZOsDagUp/SWXOU
 pQRQt6Qz1NIYDyL+IPv2/MxLYxRneU/VWa3FcICwRq44+46nuq+PHSqak7hHZ1nfrYkB
 oJp5XD6eBM7Rtvlkdqbfuva2+6sa2fyOe4U10kEvCSXNy0mtbHPK+ircfZI4AuSFH21M
 G74Oe+zO+IjXFV3L55+QqVSWBiBgFYuPoo7tQX6ASW2imKc22xkus6mqfdB4FGnyupWU
 bEs3FO4QmdaBkBSa2/JeixPjXd+iXbwqUy60hHJjb9aaf0eipsow3p8qUltDMiRMFBGw
 MqQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kHugz8n9
Subject: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to version
 3.5.1
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
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 88bd7c9565..73ee60f268 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  5e5bb2e193a5581cb06abae2de3dd3d8  argcomplete-3.5.0.tar.gz
-sha256  4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b  argcomplete-3.5.0.tar.gz
+md5  d41f3c39f4be81d29bb6166e8e57116a  argcomplete-3.5.1.tar.gz
+sha256  eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4  argcomplete-3.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 1773f98914..0118cbb9d6 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.5.0
+PYTHON_ARGCOMPLETE_VERSION = 3.5.1
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/75/33/a3d23a2e9ac78f9eaf1fce7490fee430d43ca7d42c65adabbb36a2b28ff6
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/5f/39/27605e133e7f4bb0c8e48c9a6b87101515e3446003e0442761f6a02ac35e
 PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
