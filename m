Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640ADC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E83617E4
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32E83617E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDB1C40003;
	Mon,  8 Nov 2021 19:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRBZlKpzCYNL; Mon,  8 Nov 2021 19:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C6F6400C4;
	Mon,  8 Nov 2021 19:27:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5D51BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD6874031C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jD5EYu32dHSc for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:27:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D04DB4031B
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 19:27:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so587942wme.4
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 11:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXQag3cUA8hzXny3eSYWXUr1YeNM/nkc58RW5U0nu3E=;
 b=bkiFuQycCLyQCtDw7/zrdIwg/JK9CsQTjqHkk/TADaswbN1LZtyj0Miq1XOneZSD7X
 a1M9A59itKKy/aX3C8d1rPkYBjiWA7JsU9N/yFSGxNiJjDoaoVRLRKlHCxRMBe/se7H2
 0ohbuE0b9+nvo64pLTS63FZjDVperBJPNiF6HAEYOMGKm7nrgZPUXxluFmOUIcK1j9h4
 rvxjS6/+8wq43zd+CcuIyiDeC0pPUGaHXcz5C0fwiC8VWJKe1y3ML2WqiveRG5EjQF7I
 e0/1XKvNF3JbnYewYIAEUrUcgcuL3eu1rhjm5zG9cHY5Vv1rm2q+ew7jdTGg1AZTjJaA
 m9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXQag3cUA8hzXny3eSYWXUr1YeNM/nkc58RW5U0nu3E=;
 b=alwOwkDht5Q0s2eH55ulycMqjQpsHsAO+ILgRttEztiRkahUiT7hyLix0Aq/tgiwm/
 xc8A/01olPX2jY8gnBIMiq/NG/oIT811lU3k0T46n83FuSzyBBweOLiHfePm3Zf4gq1Z
 K8X23yjQQj2wfd120om/fOGCQMZEiXLheZUGpXFcfeR50rBY7HX8aOZKsyeCEaUtkxWK
 k4CMKeO3p9OE8NvbS07nTRm/ujp7BsDz9QaeX+MZpt0kiBIHM7cgnvCE7IcS8fImNVY4
 ukSmcze2aA3UaBcElWdcvb8WdCSzeZguEgss6eEYWi/ckMVvITnE6YKhCswQ28ll5GVt
 Es2w==
X-Gm-Message-State: AOAM531DKtTlDxR5ym5b7jf4FR7peqTUxJPDmdJh4/AzTTTGmQzLI/lm
 VxS8jH+ON4Q6oZJlTXxeJX4oVo7n+G8bDQ==
X-Google-Smtp-Source: ABdhPJztesP4v2HLUB/ySzMV7QAaI522B6mbN2+DrTsJ9pgUX/2hTxAvbcSBa4zbtBYUWqC9CQu6+g==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr773684wme.2.1636399664887;
 Mon, 08 Nov 2021 11:27:44 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:f823:1d08:390b:d00e])
 by smtp.gmail.com with ESMTPSA id l4sm16954437wrv.94.2021.11.08.11.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:27:44 -0800 (PST)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 20:27:42 +0100
Message-Id: <20211108192742.456355-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mxml: bump to version 3.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mxml 3.3 is a bug fix release. Changes include:

  - Cleaned up usage of free throughout the library
  - Added more error handling to the library
  - Fixed potential memory leak in mxmlLoad* functions
  - Fixed mxmlSaveString with a buffer size of 0
  - Fixed MXML_MINOR_VERSION value in "mxml.h"
  - Fixed POSIX threading support for MingW
  - Fixed some minor memory leaks found by Coverity.

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/mxml/mxml.hash | 2 +-
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 70f82cada8..38056f4c3a 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b894f6c64964f2e77902564c17ba00f5d077a7a24054e7c1937903b0bd42c974  mxml-3.2.tar.gz
+sha256  7cf976366f9e8e4f8cff7d35a59bcf6201c769fce9e58015d64f4b6de1fe3dd8  mxml-3.3.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
 sha256  ed63aec4c75b9c21a5156b40052138032269bd27fd6f4bc0c51389807cdc7db9  NOTICE
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 85930ab388..5563015b02 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 3.2
+MXML_VERSION = 3.3
 MXML_SITE = https://github.com/michaelrsweet/mxml/releases/download/v$(MXML_VERSION)
 MXML_LICENSE = Apache-2.0 with exceptions
 MXML_LICENSE_FILES = LICENSE NOTICE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
