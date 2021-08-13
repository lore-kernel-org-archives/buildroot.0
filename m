Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BB8C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9521260F51
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9521260F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4AC400FF;
	Fri, 13 Aug 2021 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kF_yvj8UawHk; Fri, 13 Aug 2021 21:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68A454012D;
	Fri, 13 Aug 2021 21:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 396B41BF40F
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E2A405B1
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viVwrhv7i3LD for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 21:17:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90D0F40594
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 21:17:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b13so15007517wrs.3
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//DX/qcKCliixAkd3UqGb1Rjr8d6elzWQy6MAzqiH88=;
 b=FOREztPAGPll107DGO/1ExwimZUY1tlWx01/oCSms6EZWTJTHtySLh7bUGUZDLoKRa
 K+xjSOZ4HOLcup6svocg65Qezt7+yoq/xma2Bom+elhSa6wkh+xoB1yp26FZyZwLsOiq
 rAxDpJmSOLPEw5ouL74BUSDUpX/zLkvXJaGsOnJSn0zE1RJubCENQ8Tva5wQKeDYBAQt
 rbiZBZkYiiQYBf15mzOQROe4MhDzmj5/Pk7iC0XuXz9iBG+Z+Cy0B9hKi095pR9bJxw7
 QGCDsiYPLnzZmKizPuZjgkzQAyD98uMv3fQL1zGZQbDhQMTqPKGt8ygPOJoZ0YYJjwaH
 mS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//DX/qcKCliixAkd3UqGb1Rjr8d6elzWQy6MAzqiH88=;
 b=VUhk/2hIUhZKBUnICTB5/tGOdCYA06MZuV5Kv+pNxGz7tzyOTWo7BTuw2Q1NdSULzU
 KMTZ64XM4dNWsIGLYrZ4jPPnsuXeT05nJbZKewwms4V/M12s8QDLxdHHRE7ZsoSPAmlW
 /72ZPcBPvPjX4nBY8k7RkaSzBtf8mTfjD765DLaLsgeqrDEUo8Q4qqBOGWjPFGouft1q
 nUCu9c8Gk/REr7mopQoBeGVf4s8MUe8SfidgoDwVSzrwvEuGbxYayICU+lXd0F0/MAOy
 +eaoYHC9KBPSNycUWgNcCaid+CLVi6xg3pfPWVEjyLCNI2Dteg4FSVM3MHIQQy2eSY+i
 P80Q==
X-Gm-Message-State: AOAM531/MgCRXsvQKe90kry0RAntgAs0LhlSt/IuPg+wkEyug7Y/4DhU
 ykjULv+Zb9DPvZBkJM1bjT2lRpnvKnkFVg==
X-Google-Smtp-Source: ABdhPJwItvVw0uWE27X51SDNkScT04ROnW9XIZYHg+zpXe7XpBieSUlYZol42hGMjP4RVh+umcSnMQ==
X-Received: by 2002:a5d:6146:: with SMTP id y6mr5148171wrt.278.1628889420438; 
 Fri, 13 Aug 2021 14:17:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id i5sm2625363wrs.85.2021.08.13.14.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 14:16:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 23:16:48 +0200
Message-Id: <20210813211648.3483726-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fontconfig: fix per-package build
 with NLS
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

Add TARGET_NLS_DEPENDENCIES and host-gettext dependency to avoid the
following build failure with host-cairo raised because fontconfig
installs its ITS files in the wrong directory (i.e. outside of
gettext-tiny symlink):

mkdir -p /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-fontconfig/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-freetype/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-libglib2/host/ /tmp/instance-0/output-1/per-package/host-cairo/host
cannot delete non-empty directory: share/gettext
could not make way for new symlink: share/gettext

Fixes:
 - http://autobuild.buildroot.org/results/00e29958cecfffa4e994ab549637117dd8f55c30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fontconfig/fontconfig.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index d59e893d4d..e34acde534 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -11,9 +11,11 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.bz2
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux)
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
+	$(TARGET_NLS_DEPENDENCIES)
 HOST_FONTCONFIG_DEPENDENCIES = \
-	host-freetype host-expat host-pkgconf host-gperf host-util-linux
+	host-freetype host-expat host-pkgconf host-gperf host-util-linux \
+	host-gettext
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VENDOR = fontconfig_project
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
