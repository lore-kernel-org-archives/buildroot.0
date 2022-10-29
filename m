Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43212FA3744
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 09:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6F23409A6;
	Sat, 29 Oct 2022 09:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F23409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gnb0ki5Otm9; Sat, 29 Oct 2022 09:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32D54097E;
	Sat, 29 Oct 2022 09:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32D54097E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49FF11BF319
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2270E81470
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 09:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2270E81470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNnSHSbMLvsG for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 09:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3058145D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE3058145D
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 09:25:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o4so9413461wrq.6
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 02:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D782SBJGXBXIXEAPYI2uKfLy0Y9HHMfOs3DnEPquXxI=;
 b=khnN8XzRcBXcSciVo8ieoV0oHN1bIQVgeym+SU2pDk0W0MYjSXvmLELuGIB7sBJqSG
 paHM14BxcxucAJTS09/Hp9zOEvXICCx2ccpInMC29j3ix1kCM2FwweMp31DcV5WdQ17x
 PXQiQXfIJbevd6FqPmbBBb0T667BzIiadJho7RSJgUSC7NgFg1h3A4Q5D3VddCu4vf/s
 GpBsibfFzk2JbR0FDRU1Dj+Df8g7FXfSxR0ZcrGW6cT808tojfGXOQvpAV6ut4HhTkYA
 DQ5oao5t9yV7Tka9m5VMTGuY2VgBjrTEjkoJe8BibuCt72j5iQhHux0crvl0BBNV0X6n
 U/LQ==
X-Gm-Message-State: ACrzQf3lWP6mUfyWaHRYGu0EFbCmNBIMAvDJfRVye1KOVgjocL4/CIWM
 Hb+0tajsCaIa0nzCftGnEWLxpYZPpa8=
X-Google-Smtp-Source: AMsMyM5JOWgwmLZ9XQYiQKHGI7uO47aVsxNiHYzr5Id9N57No3xfqN9jMMQm9BogNVWNOujDX63IOg==
X-Received: by 2002:a05:6000:18a5:b0:230:a3a:d93e with SMTP id
 b5-20020a05600018a500b002300a3ad93emr1881592wri.626.1667035522725; 
 Sat, 29 Oct 2022 02:25:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n28-20020a05600c3b9c00b003b4a699ce8esm1135302wms.6.2022.10.29.02.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 02:25:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 11:25:17 +0200
Message-Id: <20221029092517.115919-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D782SBJGXBXIXEAPYI2uKfLy0Y9HHMfOs3DnEPquXxI=;
 b=XUv08OQE8/jDeauV8esb+7+PH99KOFf1vE95JNcuoRp+Yg8OAhh1886foVSXVVK1oX
 ILuECHaBM1KGH2kap5Y1hSFBn3bepjFnjKnA0aq9sPUkrBaFrezXSrvFQtuxjAEqHoJn
 sabPLBV+azkeGlVnjIxIormBMn25Dw7Li/JFIm80K2UPz64Gdx04l9aOsWVHMIAi3hik
 NmpsQfD8Fi5uhMwDVlDERmY+DNvWPGrNC8BaAm3yeNJE7a1kQM1sy6rWpWcth7SQOPuO
 kcPvY1bx0yP6n3YirkF/KD9EsyK0M49xON7q4OZ8q3H3Dhc8BOwB0qUtGtf2J2KofGw+
 Lasw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XUv08OQE
Subject: [Buildroot] [PATCH 1/1] package/mxml: bump to version 3.3.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of NOTICE (update in year:
https://github.com/michaelrsweet/mxml/commit/d32818a16ceb352b8889f95ec7ff65575ad2e4f2)

https://github.com/michaelrsweet/mxml/releases/tag/v3.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mxml/mxml.hash | 4 ++--
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 38056f4c3a..412977dff0 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7cf976366f9e8e4f8cff7d35a59bcf6201c769fce9e58015d64f4b6de1fe3dd8  mxml-3.3.tar.gz
+sha256  0c663ed1fe393b5619f80101798202eea43534abd7c8aff389022fd8c1dacc32  mxml-3.3.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
+sha256  7dedb0043b0bbed7880bcc9724b3a3dae4d5ab2dce98a7904703109572b626e3  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 88d35cb7ee..d224cf5308 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.3
+MXML_VERSION = 3.3.1
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
