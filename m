Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B464C83FB0;
	Thu, 16 Dec 2021 22:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtr3mQqMEQFb; Thu, 16 Dec 2021 22:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267B883FA8;
	Thu, 16 Dec 2021 22:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A29CA1BF29D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92F3341818
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw_Pi2n2ZLZq for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 22:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FB841817
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 22:54:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so444932wme.4
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjljqDqT6PWgJ7wnEs41idE0kkh4gy0KWtmRmfFWfMc=;
 b=qHEJBjlIW3xxF9QxjG6aoPxPm5+3BEJ8Uv8zje+Pfqcp6o5zgD2/PPJCMhz/iOvpqX
 FM3Lmm5YWDGrLYR5ZJoEZ4qojQxrr3ZoCSNckFQfXg1ySPWuvf9GvJa5+x+jl2qwulHI
 5zhBWioAa5HOWlAA0ZoGwUHktC15wDzyenCnP3lfQ34hqaM7d5J3rvPyKlULVmPcnDk5
 rJpjYg9XsF2awmJtUU+ogMO2Vc8I5UCSiOhwDi+3sScJhnusvwokkC4KUQn6XopHfD9i
 s3syXBO1jMWHtZo3vlNUBw1n7An53oEaf6+sPqa0GwCnjQZxfk6KutfsHQEb+YBrW7Ph
 GepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TjljqDqT6PWgJ7wnEs41idE0kkh4gy0KWtmRmfFWfMc=;
 b=p9Box0GIUDLA1mTTN0esY31KeTBIl5PerKQdT3KSkOFhcE+PqcQT8Rme8FdOkBsmyo
 6xjomZZPMSPjZ+BK/JZ0PmYLjZiYbe/dElnKeKQ2QGR9lTg+j5gJPk+J/DLY7r1PrTSo
 5Hl9Tst7sa1G477SLYHdc8z1EylULl/6xofcMBZir+szBlruQsrj994s88vfgBEgnc46
 IAm7tzacUrKATOfgQaelkjS2Twk/91bdcEIEf+1e2ddGEIxiDmiz0S5HvUCmB8G9UsDy
 JKcOu5YfrMI4lPu2ezKOHJVwtww2xRT5iDgytCJ+Ahn7Z7WV77BBy+2fGsVKhn2ya2A+
 7Z1w==
X-Gm-Message-State: AOAM5305elHYxUyONLKPxSwiAG/oxpqg2hIMLpDd6CCRWS1bGNUNUdI9
 VGX0DWnyRV4YerlcBJ3GPLtQ3Ynzt4L56g==
X-Google-Smtp-Source: ABdhPJwOMhK3urLX+5dGgJdOtxEReK6eKlMIRnS8lIZp3bGboJOSVHGU0VFCg/dVNVomKSjI3aUWQQ==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr95706wmj.37.1639695254652;
 Thu, 16 Dec 2021 14:54:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id u10sm8044309wrs.99.2021.12.16.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:54:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 23:53:39 +0100
Message-Id: <20211216225339.1067213-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211216225339.1067213-1-fontaine.fabrice@gmail.com>
References: <20211216225339.1067213-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/tcllib: bump to version 1.20
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
Cc: Davide Viti <zinosat@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license.terms (reformatting with
https://github.com/tcltk/tcllib/commit/628ec67635e48f611c5462b7c574e44cd301f83e)

https://core.tcl-lang.org/tcllib/doc/tcllib-1-20/support/releases/history/README-1.20.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcllib/tcllib.hash | 6 ++++--
 package/tcllib/tcllib.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index d08b5a172a..fb80841998 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,3 +1,5 @@
+# From https://core.tcl-lang.org/tcllib/uv/tcllib-1.20.SHA256
+sha256  199e8ec7ee26220e8463bc84dd55c44965fc8ef4d4ac6e4684b2b1c03b1bd5b9  tcllib-1.20.tar.xz
+
 # Locally computed:
-sha256  0db9e17d6c0f44d3ca2df2ea5023e35c0f3767e7008c3cb26d201446eb68add1  tcllib-1.13.tar.bz2
-sha256  530ec70eb11a455bd582d86b6d74c2dd7cc367d90b8bbdd59fcb43ae02f95a4b  license.terms
+sha256  38e1f556213f4008cfd280457af57c76a1fe043dc026ece1c704c09b5f6e865c  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index dfa35c8941..0f60eb8aca 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TCLLIB_VERSION = 1.13
-TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.bz2
+TCLLIB_VERSION = 1.20
+TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.xz
 TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
 TCLLIB_LICENSE = TCL
 TCLLIB_LICENSE_FILES = license.terms
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
