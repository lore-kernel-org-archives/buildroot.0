Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5370FC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0DF60F5A
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B0DF60F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDBCD402EF;
	Mon, 26 Jul 2021 21:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id waFjepaij91a; Mon, 26 Jul 2021 21:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A3F640124;
	Mon, 26 Jul 2021 21:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 048241BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A124024B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qADn4cfchAcL for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:30:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E65A3401D6
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:30:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so394467wms.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 14:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kHdM6rMdwvMa8TE3e+rRBMHBbgrr/ePwRSyW6lbApa4=;
 b=FdQz2uThJiQSokR6Sv6axAZ0dX2ZsksgMTvEl35Cb9N43qPr09XbUcm6wcVep8UtBg
 m886AMgecOU4HwgvX1aL5X0O3uKnrUTdDmKj8UsiFoHRARLAARE20iHBenZX3r0PJN1g
 6p68CLjdiGslhbjK1k6MhhQ3pEGSpr+DXI1Gj/QIw21TjTI73aAAOax97ytL91JJ4g1c
 uU5x5HZa9kL6rfCwAse+K8f35l978ENDLOef0NgZVIa7OS/fkBqlfBSzGpcYmyRfEDyt
 4Gdwa2CY7ZOY2/ll0kVeP0zk/WN0bTaHI9qnfiOItB2rn8HvmcOQhscWpuDBelLE/LYw
 ZtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kHdM6rMdwvMa8TE3e+rRBMHBbgrr/ePwRSyW6lbApa4=;
 b=BYFDu83MIIllmnvT4Ix775O0Bhgokg3K8z3gILl+M/19SdcvQ3t0ecvHvtoshsooo/
 qfGNVmd2NJWFW8Vw4Bym1EhsXj1dkcDX5wul60W6mtzjQvQz4PRBP9b3tFOzwZJlLt6u
 Q3fhhNTo4yV7a22vQ5z0WTIlhbpOwoscw5fGhnXcNR127EiFPtU1z/yU37Z8XVJKnyBE
 6wZ68W0/o8y80WQX0508OlWfnmSRMfecFyk0w4kwlq82Ub+Icip4gl7WcbufteIh+vE4
 Vnmilsul9Jz5fqv9UGrZgOIPuKiD8au8r2vo4GIgS6pmjbGMiH4Nzcsz8rX2bh/y28dg
 Xdyg==
X-Gm-Message-State: AOAM532FKYeXqbaFGKVj62zBNm/O0kJl8Svk+i56xNdDcdZxLV1q6tIR
 xOCYfNtBWYQu7ck5dXlaYYn/DcpFWXXd4g==
X-Google-Smtp-Source: ABdhPJwEscpqDghO6yiXpsVLcf1PjFt10e6mjw1nph6J0jryvWNXySNMkyfWAfUbIq5/Z/9RVEameQ==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr657927wmc.160.1627335016877; 
 Mon, 26 Jul 2021 14:30:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j14sm995143wru.58.2021.07.26.14.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:30:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:29:53 +0200
Message-Id: <20210726212953.1854886-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump to version 2.7
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update indentation in hash file (two spaces)

https://github.com/vergoh/vnstat/releases/tag/v2.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vnstat/vnstat.hash | 4 ++--
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 6934c569b2..0f269039b1 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7  vnstat-2.6.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  4c28a1d8bc03c2b6e7ab96c876e07dd8ea174b7cad73b7190ecb2b9501e83e9e  vnstat-2.7.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 73cab9f73a..7f5ff67b82 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.6
+VNSTAT_VERSION = 2.7
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
