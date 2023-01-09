Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25EC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 02:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A0B960A8C;
	Mon,  9 Jan 2023 02:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0B960A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wV4w5FZ-ZsWY; Mon,  9 Jan 2023 02:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940B260A7A;
	Mon,  9 Jan 2023 02:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940B260A7A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A59B1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EC0981763
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 02:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC0981763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9x2R5CW1bu9L for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 02:52:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0E581760
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B0E581760
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 02:52:05 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m15so4327038ilq.2
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 18:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXhbo1tzQEhzt5VRbJ3qU4xEjAnUQh82uDEQbC9lgy4=;
 b=FNYngI8dNFR93mwlMXLlTtZxMoKpbHAn3Vgrjdx2WjR3I+UxFiij2aDI2erKiKaP8j
 ZwVZv3m83DTOp5y66iY1w0NyQFvC8HbJs5744mZPfb+cmVz5dAq7IH/vU7QgJl1/DBCK
 KJHEBYCQc8AGAe63LPg820qygOvrLUkYnRK2i9NMVgOYT4/JWPA938hJkluyEnbchUnh
 zYCxyY0xmRzrZrgCS8tz+UpA6CMxCd+zA4Oa2S/8/ymGCWw359W1J2BHtkvjH4peWAfa
 hDrU02CMAG3dI/NOfsRpG1CZzlhHS0hbCGDvOpOfV8tEeXHjz0lasIOCQRFgOFztuCpq
 mvig==
X-Gm-Message-State: AFqh2krTC5fZmxQVtODWI/NAkkJgffQlCMG3rZM/7YvYPp7jEeHvm5CI
 3J5Pvcn8rHxJ1TaKT43FdoZkMzd80vj/gg==
X-Google-Smtp-Source: AMrXdXs4F5xGGDdKNk3zv082AvedwjuWGMb6maTlEo/Pf0B/Qp73NlI9ntSOxhYCBXQsmtXUl3GCkg==
X-Received: by 2002:a92:ce06:0:b0:30c:3500:20cf with SMTP id
 b6-20020a92ce06000000b0030c350020cfmr27495568ilo.1.1673232724053; 
 Sun, 08 Jan 2023 18:52:04 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 r6-20020a924406000000b0030d86710f31sm2380734ila.1.2023.01.08.18.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 18:52:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 19:52:01 -0700
Message-Id: <20230109025201.1939360-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qXhbo1tzQEhzt5VRbJ3qU4xEjAnUQh82uDEQbC9lgy4=;
 b=VQOAz72GuapFn7yQwFjxNU784Yrw6Us9Io2+aNTOgFsf8SrHb9NpIhSLlxfM3ZrmlB
 My0S9BXrlu4ohAcQPzIKC7xvrpUkjpQ71DdM9mbfqYmIMZnvL4pSGFc0rfGbU29FrQyj
 DmXL2xNZJxI+LhItFsYZ7EpN965oINk7rvIDWeLy8dozDPYw1Sb0nNIPInkqsD4NghnZ
 escJpHJrDPCtCctRDKFf0UjBqPC21CYsEx1pV9yFxvpEfzOJhlwSQovAFifwzGzvn/Gw
 8LdnCxIONEHjFpBVl65TyfctAhknAijLaN1WzhebTuFUjh8zjtfzJp+tT4CUGNH8mRpi
 pOKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VQOAz72G
Subject: [Buildroot] [PATCH 1/1] package/python-aioblescan: bump to version
 0.2.14
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioblescan/python-aioblescan.hash | 4 ++--
 package/python-aioblescan/python-aioblescan.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 9a40ca4560..c754325fb1 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  0601cf9335e5d89166a88f53597c79bf  aioblescan-0.2.13.tar.gz
-sha256  28632e32c8180ea4b792f4cf9b88968dd100f4d3cee0cf16d27c193cf954422a  aioblescan-0.2.13.tar.gz
+md5  10014cfd24b8f9f54099bbf7e2ea528a  aioblescan-0.2.14.tar.gz
+sha256  3a47c5292186ee87fc49cb076a5271c766510f44749b93ac4a32bbb4cb5258a0  aioblescan-0.2.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index f0e277d528..7e0cde6c85 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.13
+PYTHON_AIOBLESCAN_VERSION = 0.2.14
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/bd/04/c6798c76704d57da22f19c2e47485821d4b23144ef75f9c0e18dbfe47565
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/45/15/faf503083bc5a2d81f1b17fbbe30d15f35217b6c5e944c771c8760354d59
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
