Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CFCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7214F6137F
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 06:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7214F6137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06865401B1;
	Tue,  5 Oct 2021 06:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDuG9Bpw4yqH; Tue,  5 Oct 2021 06:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2944B40193;
	Tue,  5 Oct 2021 06:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1301BF3C9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C42783B05
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 06:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ob455LWbuuWe for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 06:44:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68EEA835B1
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 06:44:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t8so35507597wri.1
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 23:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XPJNSgm6jTWqH9hqb2nCW0dc0nBcwHaPKvve0LPM6aA=;
 b=PEni1ptei3XGxD8mP6YuJjXdMzePqBPFG39DDCilIVfKC1st5AYj87njzlu5rPkyVy
 pLa8OK0lQG+ETpLEid/gqfslQLwyka5YhTa9NP+7Zs+0RrkOUfD5BXJe7zb4cwJ9lBGa
 DZqIzuDnMiT4K5fxDgnefOO8YtO7BPle8ueo0MK8HC7FMiAQu1u28xXUW2xC1EvuSWaW
 k4T7Py7pWToBhNPkqNfZpmp1PhL7a/A1siCi/ZAPLcrA+EdEtG4oBUsw8mDaECp5tuN/
 e5PkArH+mWauAcjEJ28wQeqlwmfi5+7b4cdPyHKXOAc7XoK+DNCw1YxseQbfyQbRpFmf
 /Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XPJNSgm6jTWqH9hqb2nCW0dc0nBcwHaPKvve0LPM6aA=;
 b=DSIriFJ9GBZzu2lHHyccd/7uPFwf1YJ2TW64SMkO8c+SQrpS8vL5qcD/wUtInUbky4
 8dAsm2AF6fz2EdPlqtFSBWZgWPqi7dqxsCH4CU+FErDHqHSxWPppmxo18adW7ELrEL/u
 J6vvOzOtb5NAumINGRLpokyovU+WFq/wgl614Oas557NvPOqPqhryRmJZL7Zy91TXzia
 fvo2i/PN9gMvKgV6OcwUOt8Md/+MRy8fHs4v0ZTyfN7FS2d/81FEBt1XLFk+wNzWdldU
 JLjZ9DlrTB4RNHTJVUUF9qvbfjQZaC5bouM3esC3hPXTtP0Mf1X87axLG+D5NtNk2E6F
 yeYw==
X-Gm-Message-State: AOAM530pSb5Yo0vgYr9YgkAIgHwNcNor5+qz33JZq8GSjQByd5Gg5pus
 0REvMt56bj/byVHigdhdP/kpwfttJOs=
X-Google-Smtp-Source: ABdhPJyIeRcd/wPkCrieoIT7kYTMxt3HunEyDcTKwYzxwLbojrv30aSF1ZWdb+dOGfqJ8hc7wMYICg==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr19571182wrr.371.1633416272437; 
 Mon, 04 Oct 2021 23:44:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id 143sm817384wma.37.2021.10.04.23.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 23:44:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 08:43:33 +0200
Message-Id: <20211005064334.737168-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/net-tools: add
 NET_TOOLS_CPE_ID_VENDOR
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

cpe:2.3:a:net-tools_project:net-tools is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anet-tools_project%3Anet-tools

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/net-tools/net-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 985fe2e35e..eb268a6e14 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -9,6 +9,7 @@ NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
+NET_TOOLS_CPE_ID_VENDOR = net-tools_project
 
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
