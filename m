Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648CFC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC2140901;
	Mon,  9 Jan 2023 07:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC2140901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sQFs8T5oyrk; Mon,  9 Jan 2023 07:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E0A40903;
	Mon,  9 Jan 2023 07:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6E0A40903
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A88D61BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8096E6074C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8096E6074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-YXqz3fsdf6 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B77F60681
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B77F60681
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:18:52 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id y2so4496420ily.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgX+ayQeGKkWGsTj3TQVcc6MOGSJ1zHO5gk0HjcT2F0=;
 b=ojcKG7X+qzaEa9GcwlfTdNKjecRYbS6BJ5Jv0P6cXFzZGWCoFtOKSRNgioX2EKpn1J
 NPIlzixfA4qhRp42B9+2i4Y0UP1CLs2DkL++b+bl5j6PHuGWSn8dpQxpF3UUvkmPKlVe
 ydNsQWdjvOgVCe1Xndi1KxeZjjCGdg7nKG+5WGw6g0g/xT3aj4WgWYCkGxZRm9A86/8s
 ZZepJG3VXR4i/Hq5LVtYmM5lKnIFYAiBQJz15m3VgnHAsyd3ht3P99aGI9Pa0E/jPC8u
 X5Scdlfb/LdUYsBcEvhff3dBOoJJe6Ph/O79mXMi2vQx2H+V9fxxkMIbqZI/+wgD7Yk6
 n8vQ==
X-Gm-Message-State: AFqh2kqTeiYVWo70+jcRGFSQdq61/FlB9V/8ZnzEyl0yu5l3/c8kwWNo
 tJZcYtrkWd97r9zN0cob0y+LXfEojVfar5N3
X-Google-Smtp-Source: AMrXdXu6cm6oReiXODQHtCo1tAxBFg9xY7fuhsmnVrhOPRg57OCwItGWDJGyr6stpekVPTRjpoydCQ==
X-Received: by 2002:a92:da42:0:b0:303:1277:7c7b with SMTP id
 p2-20020a92da42000000b0030312777c7bmr41239821ilq.30.1673248731555; 
 Sun, 08 Jan 2023 23:18:51 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p16-20020a056e0206d000b0030c053fb7ccsm2491724ils.47.2023.01.08.23.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:18:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 00:18:50 -0700
Message-Id: <20230109071850.3167390-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cgX+ayQeGKkWGsTj3TQVcc6MOGSJ1zHO5gk0HjcT2F0=;
 b=EVwgpDtbsi/gZDRpwdDX0r10C0Ce6HLS1o2M7BA8FzuLUoPHKvsVwJqRo5By/ju5+l
 LiWj7R/6mby7hA1zl69mtxS/ELLFcJ+wpn47sWMjUU1FZ0EDtxE43GexZfYlOddYAcAT
 pPD3IMQCRJ82XznK3sbRWB+gSIWfEsb6r0rkReihL1VfTW0pwSAr/C/uls9g6NgKqVk1
 SHaaYaZDXW6IF8eyjgTBXt493fRavwCxAYG+QAT1gRBj8SphQXrZbC2gwvA0te/DC+v4
 dEHe5XjgjsQYfPUM3EPpV/xPqYehn+XLp+HPjk1HwvL+xFn4+7aKpYr7p7frFe6EupgG
 6yXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EVwgpDtb
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 2.2.1
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
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 3bacccf2d6..0653787110 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  d029b806814bcba26745c26769a847bc  watchdog-2.2.0.tar.gz
-sha256  83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01  watchdog-2.2.0.tar.gz
+md5  04cda210c7ffd04582d2466328ee7368  watchdog-2.2.1.tar.gz
+sha256  cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f  watchdog-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index bb9f145e16..9c058e38ad 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.2.0
+PYTHON_WATCHDOG_VERSION = 2.2.1
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/c3/fb/bd960970258366b0704307ccd12617d64201407bfb6d31ae412d2762ccf1
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/11/6f/0396d373e039b89c60e23a1a9025edc6dd203121fe0af7d1427e85d5ec98
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
