Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5F0C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 08:31:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DA660EBB
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 08:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0DA660EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91391606DC;
	Wed,  4 Aug 2021 08:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhcwN9fwtC4Z; Wed,  4 Aug 2021 08:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11256067E;
	Wed,  4 Aug 2021 08:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1AB1BF865
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 08:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E65F83AC6
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 08:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7CrIGLhUbCM for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 08:31:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3832982B8C
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 08:31:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k4so1323494wrc.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MhavSCnH7K043W6Hrn/MTs2Rsx1BCkm8BA+Vc/kdzI=;
 b=iHBF4N2Pu8nJAiVvegOT/4CEK19zJ2sFBPd6XOY+oepCtMtnkSrC6oWMDCIgcq8QUD
 2UMA7QXu1jU1vjYGNkQBiyuok5z5gy5kSz0Dlkx5KusT42gUkixy81fpf5MxRE7vaKgj
 5Fad4nPEslZD8jgT+nnSTv0Nm7LFJsV0r5XYWyJzHOvqoUujRiM0hMII+uE+bcE9FR2i
 6v2kSKG7yFyFE/BoCHXwx/lSkoeOTOxrzHi7AqFZixLm7y/q/H7I3CIQGDesRNQMukEl
 PjDMz5cGPRsTAMXh/5sYmwQzgAE02F0SnGXLW9wPQHWssyfh3eX+VmYO65afiUFGIsZQ
 wPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MhavSCnH7K043W6Hrn/MTs2Rsx1BCkm8BA+Vc/kdzI=;
 b=MeNjseS0njPe+p59nxQC3tpQ4J/1s77MVpHztcVG6affCNZkVFlpRd3V/f0z1Gxojf
 D8YLdSGaE+Nz8D45KZc/DmsDTnGc9CTKVO+8jIk4KZCZFHt626UoAN8PmYSYxvbs8ObF
 JmHEGiEo9TabxK5amX7aIMnjTV04uGZFDm0YA8IBBFvkPCygIoQlTtN4DEUlUMZBvKIY
 en1Noh5xcELxmWpm6Q2zV9d5Uvd4ySAunwBm8ywfGeLZqc9ZirDl/v4gtG51WdLpe+S8
 9dng9MjO8KFN9yKC9RjTAawREaOOmUDNwHTXfC4omrxfxoLrTgtfTegOQ/cfQ2PblDFy
 4rZA==
X-Gm-Message-State: AOAM532m5FOT8q+yHeFfZmpIIvL9l9y6+rTegXycZM9xCsCOr9tbWtZ4
 QSRDSyIkiJ9Nlc4j8Ioyz6VtLNRvM4j4YQ==
X-Google-Smtp-Source: ABdhPJwHCgj0uR9sIUAWek5/FKIW5F7h+Y4RhoNRxxmgK22bdJcpHgEtegR2dHG2a823sWufno8oog==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr27803967wrp.123.1628065907076; 
 Wed, 04 Aug 2021 01:31:47 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id a9sm1628484wrv.37.2021.08.04.01.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:31:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 10:31:37 +0200
Message-Id: <20210804083137.483753-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openzwave: fix example build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

-std=c++11 has been wrongly removed from CFLAGS since commit
c5ca521e232eae31276e7a12d17f0cf9d9c0108f resulting in the following
build failure:

In file included from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Driver.h:38:0,
                 from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Manager.h:39,
                 from Main.cpp:37:
/home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Node.h:566:32: error: 'std::shared_ptr' has not been declared
    void SetProductDetails(std::shared_ptr<Internal::ProductDescriptor> product);
                                ^

Fixes:
 - http://autobuild.buildroot.org/results/a7999ffe3b93391b9a20dcfa3ddd9d21daf0cace

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openzwave/openzwave.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 0f639635dd..17da3b9b87 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
-	DEBUG_CFLAGS="-fPIC" \
-	RELEASE_CFLAGS="-fPIC" \
+	DEBUG_CFLAGS="-fPIC -std=c++11" \
+	RELEASE_CFLAGS="-fPIC -std=c++11" \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
