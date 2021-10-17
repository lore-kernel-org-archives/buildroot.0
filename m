Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9A1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:07:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B8A60EE5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9B8A60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D452402EC;
	Sun, 17 Oct 2021 20:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgwcrmPquthk; Sun, 17 Oct 2021 20:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B9D4020A;
	Sun, 17 Oct 2021 20:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A885A1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9646081024
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQ-Sic7cuLgI for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6A5B80E66
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:07:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k7so37130805wrd.13
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ItHooWEDV6m/sgNRRdxDmI0zeG1yQIBzi50TMGfnhDA=;
 b=Zb0rf0RQMz0xVbYUmlIeFL7gYpaV6qQP9MQ+ix0G1DSOHpMAyAMkF47ISpKjMOOibv
 g2aylNYRMJBn1vGX415DkDMkWlBn1SMkytPnbteyspqJSKEm6ZTJOdTN56lnB7/rjH4g
 MujZhZI/7L39rQWpeDHtubUKAXeaYWWKEGAQEailsFPEl6juB742F8QZDnwOpv2Mckvz
 Ubjqog8HTmlgQmsF47yvZxmXW+NEj7LmkJbR38KA+4A1047chaKdfdrpTlLVfz9Ck3ye
 7ZhgZWmH3oON3B7Eh3v/7kir4JUREKVooaRCZVIz5t3o7LizOV4lrURPD6KOX4hmOHth
 Ny0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ItHooWEDV6m/sgNRRdxDmI0zeG1yQIBzi50TMGfnhDA=;
 b=AarX8l/lQO6eWh1TUDGy6eC+XCgnUpurFHrPB+H+yvviG5+5cck52zGU1F/+J3FLJB
 e/LwGn/pCRoH5O6i32iSqzjH4x6p8B6GCgdBqIYcK29MePiFwdLbHEQIgd7tPKxxR+/3
 U1AdVL1S39oKknEqn+gABC6s6pFnZocqSsnZABHJPV5EqWWriFT0ILPLmWaFBH4q1H+U
 jJvjb+QOlt0OVzsw2n8BFX6JsMMsV08eD/Wl/J1lX98+6QM68cxjgQbReJGEOkuax1Kq
 yCIsrpT6oq8PqKSuCY/ujiJ6ILAW9MENYIN+E5WQtXI+Sy3gHbCVLY6lHsFmonbRQjdt
 EqWg==
X-Gm-Message-State: AOAM531LPAtJsRvaqguX+CsghSjvuO4VhdOZV4jRE5RDRpvo+Lp8Xfjj
 6Gl+zIIqkssbfxk0aLOcezayydfEHUk=
X-Google-Smtp-Source: ABdhPJxf40oJhLHYJDUw2gkpnapztUW80Yh4aMuyC/10ys5d5jFBBaqRfqBl8ONOllIEwR9sV10NSw==
X-Received: by 2002:a05:6000:1549:: with SMTP id
 9mr30629371wry.274.1634501252734; 
 Sun, 17 Oct 2021 13:07:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o7sm11036759wme.9.2021.10.17.13.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 13:07:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 22:05:58 +0200
Message-Id: <20211017200558.1409403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3: fix bzip2 build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
21a56f9edbca8dd8b19567be6be2b32e44ebb860 which wrongly removed
the select on BR2_PACKAGE_BZIP2 from BR2_PACKAGE_PYTHON3_BZIP2:

Makefile:587: *** bzip2 is in the dependency chain of python3 that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/041a2f9c536fce1a1acf6da0464855e4f1e1604f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 18b6d6367b..efc4dbb3d4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -54,6 +54,7 @@ config BR2_PACKAGE_PYTHON3_BERKELEYDB
 
 config BR2_PACKAGE_PYTHON3_BZIP2
 	bool "bz2 module"
+	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python3
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
