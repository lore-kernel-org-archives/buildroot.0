Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5CCC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 09:15:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF216610C9
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF216610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 616C3401EC;
	Thu,  9 Sep 2021 09:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFRIHuhPD-HT; Thu,  9 Sep 2021 09:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84773401E3;
	Thu,  9 Sep 2021 09:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B965A1BF86B
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 09:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A88104055B
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 09:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lG-AEMoBDnAa for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 09:15:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EB2540185
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 09:15:02 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OG95mcLGqKBZzOG95mezLv; Thu, 09 Sep 2021 11:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631178900; bh=yBbhGhX0MKHJAIy510lR/2XWEY0gU9kvND+GeUJkMDw=;
 h=From:To:Subject:Date:MIME-Version;
 b=gblY6exbHVNh39zOIPO9QrZ0/Y2/3tTeFFxGUtk++9T8XspFYn78nNtLl4hXBq91/
 9ULacKzw7CmlNrzWgeRXszb93gR3UZhBML2gr3SKSt4GnXqRJFa7EqaXFanHDdK5Zi
 bZHUIgT+N9clbbtcM6ZR9Hdi8hGnEacdIKE7zM5/v0Hmvf9YZKBgw6LLQtkKVWGDUp
 VRiE6ZsWWZwtY7AAdGhEFnHN9PtQuHWmYC0wzEEva7vMNIpS29ZFKXln7liUHf35uL
 WmMtrjikcd//ajKzDBFtkVl0ctuaWoj4X87FTdorBwgEcP3Vm1tBBSqvubOM7bgXCW
 4tIrowDsYukdg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 11:14:53 +0200
Message-Id: <20210909091453.2005878-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfO8o9qhdpmznjr1sCT2vNs/WPEVIpVOrvUrbCztPYCEnN2bQkJoUZMjQL5p+hEkD6WLjRQNkwO9SSGtWk5dXpX4VSQsFb5YK/IuJiFv8ZUyYT787V4A/
 XlAjRXpJFQiJwbG3mYvpQUP0k77JQ5PbU31Wd3mtm/kVqIPmVBRp7GeKVXN3XeOb+SyD+muVBnzvpzsWxHaXaaBKKlM1GgnsC+VKq+iua3Sy9hj7ZydjD3p0
 zydKOW76UOOuzw1DOWM9ViLaySEdtqoxtwXJsMjNOQgEp/+tWHnxNdUQYfZIAIEFpiRcWbVKKdJq1TwXtSKEPQ==
Subject: [Buildroot] [PATCH] package/sox: install to staging
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Adrian Amaglio <nainformatique@gresille.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Adrian Amaglio <nainformatique@gresille.org>

Install header files and libraries into the staging area.

Signed-off-by: Adrian Amaglio <nainformatique@gresille.org>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: reword commit log]
---
 package/sox/sox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index dcc1a670b4..d462eb8722 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -10,6 +10,7 @@ SOX_SITE_METHOD = git
 SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
+SOX_INSTALL_STAGING = YES
 SOX_CPE_ID_VENDOR = sound_exchange_project
 SOX_CPE_ID_PRODUCT = sound_exchange
 # From git and we're patching configure.ac
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
