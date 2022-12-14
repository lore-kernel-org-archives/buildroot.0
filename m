Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E58AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3568560B8D;
	Wed, 14 Dec 2022 14:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3568560B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4l4eI6CRzFK; Wed, 14 Dec 2022 14:30:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 777B960AB7;
	Wed, 14 Dec 2022 14:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 777B960AB7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC9031BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96CE04088F
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CE04088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoFHRqy4hUNU for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:30:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C4F24077D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C4F24077D
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:30:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id d123so3457217iof.6
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P9aGpHAGkd/yJwMXJORTLZLouh2w5LtnDUXtHtUjyzo=;
 b=lEtJ5pNPXZ+nY5fQZ4dh1Ph/f+32hb88xi4yCBqZKtrU/SPm3VJppScl1tj6SpSEcn
 n3QyHqFcgYFGJC3VN1jxJY5lLadWYNxo3jrbPhEcWWnN+s31D8jo+F69HkYUHxA1ZnGf
 IhBirL6ARQZPoO7u+OMEAfiUyFgxnpLoK+SghDdW49zDIHLJ1/SBUrhpAa13i4ZVHgub
 HWnzwuu0u6titbK2YTNDuxxJeNss4sa2jncH95xdWBfsS5LDOLsJ4bmW4+3LYutmofTB
 soTnoQV+xM7d5YxMXYUsOb8fin/jA4CXzOcREReT7n9Am5n1sf8xtJEIR5jM/WIEggbL
 cP4A==
X-Gm-Message-State: ANoB5plTgpWYGMikzR72ESuzMgQMBPd5n1NODcZAA7mhGLGGc0Yq+ITV
 biCEgaM/qszsMZ0NutTebakAu/LI7ASlQqsB
X-Google-Smtp-Source: AA0mqf6Z1OL5SvNZDMG9L4MxXgf19LBxCX9DrkJnEHrWQpzAUFyr/BATLzFcAzC8Sme3WHUb17OcsA==
X-Received: by 2002:a6b:4a07:0:b0:6df:619e:6589 with SMTP id
 w7-20020a6b4a07000000b006df619e6589mr12478677iob.19.1671028199059; 
 Wed, 14 Dec 2022 06:29:59 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o7-20020a0566022e0700b006a49722dc6dsm6345900iow.11.2022.12.14.06.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:29:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:29:56 -0700
Message-Id: <20221214142956.2961182-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P9aGpHAGkd/yJwMXJORTLZLouh2w5LtnDUXtHtUjyzo=;
 b=EDK0hwVKbrcklmwjFvKew5VfW/1cO502LoeC+tU0dZMbH4gc1PJ92v3WBnEkUCV2x9
 YUaeAb+jpYXohl6glmnsjVmnFOz3ILnf74VfGkckklXlSYdoFQnjgU278RVx/ewAG2tt
 +IrGv78zJR0UV7ytfIVsjL3qffsUnvEXZCdVv36s+VQdFfvgOH/Mx3qT/PmJ+V3d4dKp
 ukmKkagzD50M2Z3x5+qFY5XSlDl5nRQ1cIYNpEe8qR3/pTYrzT9gklz4Y413L59Qcavg
 j0dEJIR89nia8l8XoCJX/SQTVNQ49Q4PsS/ljIyJMbqyCTqMf50LpfHzMbyQEJui7srR
 EySA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EDK0hwVK
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to verison 4.9.2
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
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index cd1943b0b4..72df6d0278 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f  lxml-4.9.1.tar.gz
+sha256  2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67  lxml-4.9.2.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 050495c3f3..657622a962 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.9.1
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/70/bb/7a2c7b4f8f434aa1ee801704bf08f1e53d7b5feba3d5313ab17003477808
+PYTHON_LXML_VERSION = 4.9.2
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/06/5a/e11cad7b79f2cf3dd2ff8f81fa8ca667e7591d3d8451768589996b65dec1
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
