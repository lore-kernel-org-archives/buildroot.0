Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8021DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 11:31:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB3960EB5
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EB3960EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F9E40650;
	Fri, 30 Jul 2021 11:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ie7wyvvc3Gb4; Fri, 30 Jul 2021 11:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E35B40515;
	Fri, 30 Jul 2021 11:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACD4E1BF3C5
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 11:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BFB1605E6
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 11:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKXB2rbY_fog for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 11:30:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A79D9605D1
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 11:30:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c16so10868856wrp.13
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtpVZBiJ4kPaRzkexivxtvNUs98oWO/1pIXOWd+iOd8=;
 b=VbgWVerSk+ZZQlJFRdcImJgOl1e3pUMnCxPXIP7Oz8ltWNqYIV5w8lID/dR6VVsAB0
 X8K1EMnOOV/vnpTiK/XPE726uUOsFtfmRXkiWUeSCscRClyNU0Q80brpEpWp08zcA207
 SHej3XQwZuxQpm6wbnahYgPOHdgI4SjFKLwKavqh8scRqdiMmNlD7Y4fjcwscefkf22k
 MeMNS0Vtyfp799iz47erifsw+yd30uUo9CiSSK+wyOh1SVa1DCVs40k0PCrU1KIBQWac
 AryaS7JwfRGixW+DcAzcNRVSTLGC7jF5yzknWVNkJr80TLjuoMp2zOh/MGBPjWMpM+Fz
 lGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XtpVZBiJ4kPaRzkexivxtvNUs98oWO/1pIXOWd+iOd8=;
 b=JW8rGasChlB6TGnHRtS3Uaqw66lg23/tLygnVbVsP7ULAzMwq3cJtq/0/XL8wKoUHX
 h1OkkdGjMOtyLUkB8h1TOhBy73vNEpsfHvE0HWOBmcVYrOWtnXLddbyVyZ0aJF7adi+P
 uTaXmi+Xzi1ahJrOjaGlVj8kHbpugieqx8h07CahoMG37wegLvfi7k35pRWnz7C8s7Kc
 1PrBt0JIe9ocRd2egWwOG/ku14iZ2GWhKNoR1UjH9ydSZAHB78UiIJPEtAhdlvhtTXJa
 /RXG8qcGFH4WrC85DIG/3RvF0y6D9lxhSZLkGXHwernNmjn4wuel73K9eyB4jznuPcJj
 fClg==
X-Gm-Message-State: AOAM530dRdmBfxXzEA5C4q48ry0xtOKkjyMwHSCm2SpS5PEykrcWncDh
 Bi0WwUyxuW1EORAGcTB5I7H/1HbltK8xhA==
X-Google-Smtp-Source: ABdhPJy1x5U7EYui/L1HIoYlaZ0cDpGOxVFfsrjLfy1hvBrBpfvt65EU1JKSe31ckGyEPwh+gtmsJg==
X-Received: by 2002:adf:ef85:: with SMTP id d5mr2579468wro.372.1627644657657; 
 Fri, 30 Jul 2021 04:30:57 -0700 (PDT)
Received: from kali.home (pop.92-184-116-29.mobile.abo.orange.fr.
 [92.184.116.29])
 by smtp.gmail.com with ESMTPSA id f15sm1336736wrp.12.2021.07.30.04.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 04:30:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 13:30:47 +0200
Message-Id: <20210730113047.3678442-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gssdp: disable sniffer
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable sniffer as it depends on gtk4 since
https://gitlab.gnome.org/GNOME/gssdp/-/commit/c251ddcd03331ecba8702658be8023fb32743a85
and so build failures are raised since bump to version 1.3.0 in commit
42b46562a286d0082638f9bac5346c523877b5c2

Fixes:
 - http://autobuild.buildroot.org/results/3b4f4a2c19696b32c3a70af5792a305cd861328c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gssdp/gssdp.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 03987ff085..9e67d35db1 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -12,7 +12,7 @@ GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
-GSSDP_CONF_OPTS = -Dexamples=false
+GSSDP_CONF_OPTS = -Dexamples=false -Dsniffer=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
@@ -21,11 +21,4 @@ else
 GSSDP_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-GSSDP_DEPENDENCIES += libgtk3
-GSSDP_CONF_OPTS += -Dsniffer=true
-else
-GSSDP_CONF_OPTS += -Dsniffer=false
-endif
-
 $(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
