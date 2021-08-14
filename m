Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0DDC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4626056B
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E4626056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C632C60626;
	Sat, 14 Aug 2021 21:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzUGygwsUGAY; Sat, 14 Aug 2021 21:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599E66062B;
	Sat, 14 Aug 2021 21:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61BEB1BF958
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 514626062B
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHye6akxQRS4 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:01:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8D9B60626
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:01:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so12109204wms.2
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scJWLulaP6JPoBDINAcFFPgj5XkW9ofRXFYJFsh+/fk=;
 b=A/K+pIF2n3nr6ek1LpqkSbjsOhOpxj3DWRzh6CUEgpPGnX61HBzgYFsGPjSG/NTTGZ
 H79zq0CZHDjVNhjE6OBAuAim6tEKFgumr7BOXvyEu5kiVFD0ECzC9L9k6g7BzkHAlyAK
 JbqTWwZTplFQqQ9oYdLh+Yd/1edW3fs7OglCQcygC8TJ37WuJNNA8VZ3DJXejLEsjE3x
 gaNDeI7do6B7VgqDKIjibwIkfZFERYaFp1YwGu56c+meMXVUysVs1hYgo8M6RWOVYLUK
 fV9ncOjVrUu2+RHSuqBcqTFeqXNxNbmO7f7wjbASyWOaYkd6GtK1fvWIYmeleLCfFGKY
 jwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scJWLulaP6JPoBDINAcFFPgj5XkW9ofRXFYJFsh+/fk=;
 b=BFC1RhvYUZS16o0K3WbZZsftKSEi+KE4qEZCFUZfl1DsWX1D9rSSrkxqLCDOSCbkJs
 doLovbP1z3YjZ0T/FQQNi2Jbx1ZA2DcEOlvrBwpigDiQlX/TQRLBOI84QnIunVfyJgni
 QOCulKlckwqke9fowL0wpCZFf9ZgvwpHEAVgISDBrBDKJBRmjokHx9TNP2QLD3GSkTVp
 Jzmuc0JgJcbvotkxVTZEogJtuQGJijKUj5XBzjZinJk2+YNN4MkegkFWnAQf9PQSMZI2
 ox6qwmSIUGaRpcRPt0UvLaegLY7gQrDi/+oeypBh7QhzhSijdJDzZZnq3aYeA4Ox5WMQ
 HtVw==
X-Gm-Message-State: AOAM530Mb9gSHHz5xqVZz1By/Sp+CqBqKZfNx8e+CS3wKqsc6hJIGWVO
 +pWfd+Y6u6/lsXEhsbPF4OG0wCW4pU0c6Q==
X-Google-Smtp-Source: ABdhPJxuAVX1UpST2DkNLlHAX8rLSPTuZP56rp7ncZ51m7XFvo4WvgWy0YEEHjf1d7XVWpdDIk8NPA==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr8280288wmb.92.1628974858635; 
 Sat, 14 Aug 2021 14:00:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id t8sm6744975wrx.27.2021.08.14.14.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 14:00:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 23:00:41 +0200
Message-Id: <20210814210042.354849-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/sylpheed: add SYLPHEED_CPE_ID_VENDOR
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

cpe:2.3:a:sylpheed_project:sylpheed is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asylpheed_project%3Asylpheed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sylpheed/sylpheed.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 0453fba521..2f8a7aeff9 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -10,6 +10,7 @@ SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.xz
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
+SYLPHEED_CPE_ID_VENDOR = sylpheed_project
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
