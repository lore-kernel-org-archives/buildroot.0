Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7F9C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6941B832C7;
	Fri, 23 Sep 2022 01:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6941B832C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOinGfkLgpTs; Fri, 23 Sep 2022 01:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B36D82D96;
	Fri, 23 Sep 2022 01:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B36D82D96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4897A1BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22940416AF
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22940416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKJvQ9myo5VT for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:24:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AB4416A5
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1AB4416A5
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:24:33 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 f20-20020a9d7b54000000b006574e21f1b6so7390151oto.5
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HSg3tkWYIwp1wDHqFevlH3HDsDDm4qv69wFq06RTenw=;
 b=stt8OK/+d1hDd1tsOvxpDiOtR/z1dN16ITeqySvs9AMYysA4s1gCbLXGGbBsELIMRV
 vEDpy5u+LwW/5ftQb00nOfXunJAypRf6YxwsvlFii0Q20KrCoGjQOAzh8Ct6IEDfmTiC
 qCowpffbM/XTn4LA7XEsQwb9g5jN5o9QTVKBhJe+gjXMZw4RqHO/owEL4q/TdORtXVCU
 5geyfgQBlDsGraohxmopnnW3IcMRSh6OKGJgJhFeu5Vhvm1A7XmN6NshooxPUjjAG7Wk
 tPLb6XCdtvCWUBTjHRkQJhYaOexJYpCqJTJ8R+mw7WySQUgS0JplnO7SrR2Wc+NaEiR0
 GaPw==
X-Gm-Message-State: ACrzQf0Cgm6rHinzqcmz6KhMG9Xe6HLjBdI0R9adjCG/2flVdx8Imc2X
 z4U2bJjc3Y8U8TG4D1LmTflOGGwSgnhKrw==
X-Google-Smtp-Source: AMsMyM7kpHw+LCDOMamglpxPmW3BS8ZtCWqmD+Wb/3g1xPX/YPmK4dCk6Zow0YLDQ5coBsSRgxdYkg==
X-Received: by 2002:a05:6830:1bd3:b0:655:cd7e:f2ae with SMTP id
 v19-20020a0568301bd300b00655cd7ef2aemr2995743ota.324.1663896272449; 
 Thu, 22 Sep 2022 18:24:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q3-20020a0568080ec300b00342fc99c5cbsm3140491oiv.54.2022.09.22.18.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:24:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:24:29 -0600
Message-Id: <20220923012429.2772854-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=HSg3tkWYIwp1wDHqFevlH3HDsDDm4qv69wFq06RTenw=;
 b=OFSTV73Lxd9/kmVFDxvgU3PDhzvoJcKw9vbdFZIgOdYwUPB5pANl6KdIlAnENY1WMH
 w0SVvc+niZ4xPccH4qJafWdFYB+JZyJqSWn+tmA/QcIx3Ol5XmDEfvYdEwH3afbn0zPW
 xvZ02qTna71OM39fg1lhvqUoM9/V1dVlzA/CbUtfzqiU/fngcR9ZgBPu5/fgLo2faVmM
 kG7rZutODTs5CWKFYrfPIu8myGVU+5MxGAk3IANV9wJuQ0dXOE9u4VrRjaksuO7tm83A
 RVBNT+hBk/8Dp+bEWOmZn3HhvbxMypDVPLh/B7GXp9fVAw/MQcd3Iiir4+eUeota8+CR
 UK6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OFSTV73L
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.4
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
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 27c42c8b59..3a758a6eac 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  5856306eac5f25db8249e37a4c6ee3e7  idna-3.3.tar.gz
-sha256  9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d  idna-3.3.tar.gz
+md5  13ea24e076212b6baae1135a116d1e0e  idna-3.4.tar.gz
+sha256  814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4  idna-3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index 6f416156d0..4d9994a9c7 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.3
+PYTHON_IDNA_VERSION = 3.4
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
