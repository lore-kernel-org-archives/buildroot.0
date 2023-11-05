Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFB5C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE584177B;
	Sun,  5 Nov 2023 07:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EE584177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ume0mVemfeat; Sun,  5 Nov 2023 07:21:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C7D41761;
	Sun,  5 Nov 2023 07:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C7D41761
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E93C1BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE24404C2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE24404C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuYacDkPrsYC for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:21:23 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 222B8403EA
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222B8403EA
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35932aa21a3so13489315ab.2
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699168881; x=1699773681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFzChSFQA4u8xRUazlNyHAMJRtf2YgYcsPZf3atw37w=;
 b=ggVLHi1/RjVvFQNzNy1ts/VkeY23pNLxqWOStFHTuk3B3PRGg0NrmZeAQs0g8paxU2
 B3SVJFObw/AnkiGmxWhA5bZqiOMzn7a/CkBDQK2EYu4iSPsCo3bwXyjsAlPDBAlji4TD
 Euh4kIU4EtXmGnNGBOeN9fKvXVzbj+KR76qcCRg6M1wdUqrg677HwOUUoHgqC055bsDE
 mT7dp7mtw328OCYiYYi3gUQF3qQEh2u/xFrxRh4eSMga0j6n1uOHtHFbZPEHh8zMu+4a
 f7gO8+q/2vlF3ysB6cuTRw000br7lrakbTbJykb4XBbw2d3KL7S9WyjbF7bVKxWct/ZU
 Z73g==
X-Gm-Message-State: AOJu0YxVspV0l/xEZ4WZmkFEWTUeQxIvPXszWas0cSXBrbbaOkl6CrM/
 vRQtvJ0/yIi5EbmdU1VaAuQ5yUMiyP4=
X-Google-Smtp-Source: AGHT+IFFjbwF+PPzWeTXanxnaLsmBe859Gr7R/OYe+ZvrjaGgmJ/aIdDsRMBdE2s7tMEgMzco09PwA==
X-Received: by 2002:a05:6e02:1ba8:b0:351:4b68:ec3a with SMTP id
 n8-20020a056e021ba800b003514b68ec3amr35126408ili.9.1699168881692; 
 Sun, 05 Nov 2023 00:21:21 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r7-20020a92d447000000b00357409c4e57sm1707968ilm.44.2023.11.05.00.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:21:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:21:19 -0600
Message-Id: <20231105072119.2877363-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699168881; x=1699773681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YFzChSFQA4u8xRUazlNyHAMJRtf2YgYcsPZf3atw37w=;
 b=dudt/B7aBdIT5QzCYd9GZgE9jWMbW9ya6M+cYJERv0Xn7y0rMmtgKMq0ucA1NZYJ6i
 2W0HYOic3YChBmDvcJTw3334ZQ6znC3yMe5xATHZZM0W6apSlpngaOjB8j2FdIqzQXTE
 oxV3KU5zaaFS7NPXzKS9YOxRSLUxJf3lbgA8cZnckFX3rdkmCgjt4PxfXHKCPemNPH5H
 ZYb+024iuuHvCyXaHcCu/ps12M+oNr3HBgN/UHBD7exNPQ6DC7We2yl8GYtwkiTAOSgi
 EoiShmo1AOe6ss7Jm+7eBgYzlF9BY0T63MWFZqGBgUirC/UZHYGa+g4HE+qAdpp7dqNF
 IvkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dudt/B7a
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 3.0.1
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index f378436beb..2de253e1b5 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  e6637d59015cba7e86f2111e6aa8168b  greenlet-2.0.2.tar.gz
-sha256  e7c8dc13af7db097bed64a051d2dd49e9f0af495c26995c00a9ee842690d34c0  greenlet-2.0.2.tar.gz
+md5  3905122960191e81410714f7db4835e4  greenlet-3.0.1.tar.gz
+sha256  816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6eb0696acb24005b  greenlet-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 40f05f667e..7ca1ac1674 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 2.0.2
+PYTHON_GREENLET_VERSION = 3.0.1
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/1e/1e/632e55a04d732c8184201238d911207682b119c35cecbb9a573a6c566731
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/54/df/718c9b3e90edba70fa919bb3aaa5c3c8dabf3a8252ad1e93d33c348e5ca4
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
