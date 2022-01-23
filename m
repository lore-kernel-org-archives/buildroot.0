Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970E1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 11:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF8060B6B;
	Sun, 23 Jan 2022 11:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXXGsBcHXkjw; Sun, 23 Jan 2022 11:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA3B60B0A;
	Sun, 23 Jan 2022 11:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 724E31BF47D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604B140629
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27ybutXucBOl for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 11:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D7814017E
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 11:03:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i2so8296098wrb.12
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 03:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=na3dOEiVu9ZT6gBIlaAsUn+FHoujd0pFaxPubTUS/Cw=;
 b=dVBQbL9mb6Ewko6xBR62lnduaOSlmMmWGar+d0qsjXrbZRW0usyZUMMbCD2htPbNMF
 BAPhmbCKzTzLdJhk2I03wcoMHTHMzfYQ6J7zq7Ge6IHpzoUOi65bdTj65kaWx9pR7PBM
 m+hgmxZ9gupwYk43f6DvrL2r8w3fXpyeAJlM8xKzfvcYxXWgVMnUnsBUlrgpahgvO1ux
 dQTvb6af8aO+IEXiA/VDIl/LJxyGiiVdNv59qm8KzXJ2j4fGPU8fm/PFbmVQWE7p8Znj
 WLu31okQYyKg7SGbn/XQGc96KQy4R8wgdjiPY4r4aFqpxq4Wzz6NDNuC/XqRz9mvWCQc
 Z6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=na3dOEiVu9ZT6gBIlaAsUn+FHoujd0pFaxPubTUS/Cw=;
 b=Y7MLQ3rLQfYIGFU3BO6RR+Ts37z5huUQ4u/o7rpY5x9mQqLEUOYTHo2DhFivVR3RO6
 wElj4r8u3qSPZ2FUME+zLEDZoRmb5cOG0OH9c3PMYeo4NY2XW0HsJf/nExPsfq+GWGEp
 aDwZaqFv55i379h5t1PebowH2zfPYfq50F3XJob2Z7SnZ/83QyU8dXl35BtggkWba94h
 4pzntNmAv7L8ELmSNTaGJbiUtk/QnY1UnNULxE1Efz/CKT9fwjBJwFgZQyRyZwHCK4wS
 Gqh/gSTpvmYdJ/Xb/UXf0Z768SOTnym41LmTfl52DwR18MsYKxkBAjbbUxNkAl7cV2VB
 lzng==
X-Gm-Message-State: AOAM530cKRqIHzRa54cyLFk51NPxuqZjVQDUMY3AsuxDI3xund0UcKt8
 Z9fEZHDWeNGFtftGQJWtJ2NvBMzaqIs=
X-Google-Smtp-Source: ABdhPJwAGVdQfMDuhLyj2XAjX1ucaHQr64IRMDP2LC0Ku/PF2dk+YRzY7C+KK4+8/f2xv6K8CM/uKg==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr10365732wrd.94.1642935818581; 
 Sun, 23 Jan 2022 03:03:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id bd20sm11326983wmb.38.2022.01.23.03.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 03:03:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 12:01:55 +0100
Message-Id: <20220123110155.570748-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/collectl: bump to version 4.3.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

4.3.2	 Oct 7, 2021
 - very minor bug. the last command in perfquery is not in a loop and
   prevents the collectl daemon from starting via the service.

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectl/collectl.hash | 8 ++++----
 package/collectl/collectl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
index d866e0becc..1785d25d87 100644
--- a/package/collectl/collectl.hash
+++ b/package/collectl/collectl.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 2187264d974b36a653c8a4b028ac6eeab23e1885f8b2563a33f06358f39889f1  collectl-4.3.1.src.tar.gz
-sha256 b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
-sha256 264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
+sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
+sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
+sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
index c9fb59293c..c6cb2e1494 100644
--- a/package/collectl/collectl.mk
+++ b/package/collectl/collectl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTL_VERSION = 4.3.1
+COLLECTL_VERSION = 4.3.2
 COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
 COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
 COLLECTL_LICENSE = Artistic or GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
