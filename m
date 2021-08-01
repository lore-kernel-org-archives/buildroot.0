Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BACC432BE
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 19:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028E760EBD
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 19:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 028E760EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF76660683;
	Sun,  1 Aug 2021 19:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFBxK4ZU9mBo; Sun,  1 Aug 2021 19:58:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2968760633;
	Sun,  1 Aug 2021 19:58:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 336521BF424
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 19:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B69B8379C
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 19:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tc0cqfA7Vfe1 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 19:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46D97835ED
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 19:58:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b13so8036089wrs.3
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 12:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CW5RKPR6ThVQvc7jhoy91MYgdENiYzhBabKUNJIZwTo=;
 b=aNupIB015vjz7KiQCljMbc7oa6V2yyOUg2qB87wU784xK6kpQp/2BuzBQCJhrOjetb
 9DUfxPojnF1r/Cwi5idRxznSEG+tD3JKgtj/F+ycmCmkxLhgyZzT4oizmIItJsWLVZst
 EFrmubVSBCMsGqcTyRPAyV+8sFeRuZAf2EuN2Iq/GILaX345mpxf2/qy+87jD8F2rYML
 x0kRS8UGEPRFZYqi47vOdgDFJlalmdkYSvxXG762TpmJWOtMHYJx8L4QLwqbnm9ELnMb
 /ayqoyWn3cubOSjEZst1JTbBnYJir6HFXMr5byBAxYA3xOQYY9QZYYnmh8pslIhezEbR
 LGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CW5RKPR6ThVQvc7jhoy91MYgdENiYzhBabKUNJIZwTo=;
 b=lHUw9oC32sKTWte48mphLbwYbf2qCUrGjcjI+fIO2km1nY7Z+wiyZ9dx1Ucv44oCB1
 n1XBVCQokWOsMpdmWdqFftzAB8xgdfeq+45gUUos155KyDDGdnIl6vcEq7dZJkudAY48
 TWJUFGpVRxl84ZxAhS+SOdMM3807rGUazZltOLiJjwKN5FTCBMH99xb9rNvKiY/+dJLH
 vBdqZRkd5Slm0NjBM3Y3GDXssxhuTxQozsi+TDazNECE9o5bHG7MtKd81TwUlM1NgFn6
 nrMd5dxClNM+G8deewAfNl4beAmireM0OJFPpNlwWI9mKswGsjP1k9rEtp8qeQ25ThgM
 a0nw==
X-Gm-Message-State: AOAM532GFs0ECm90cvG99uyF9tzWsPvtTcqnmhas1VZvymOHP2VcJzyc
 jjK7iZF/a6LXWvwEjNiKCViaBM6Uqjjzxg==
X-Google-Smtp-Source: ABdhPJxtYtOFf+OgO1ljknqFJPUpvregr6C1Ypm9FtTEIbbXN+HVXMPmghEtI6rskoa9XCtwpA1y/A==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr14027281wru.368.1627847908920; 
 Sun, 01 Aug 2021 12:58:28 -0700 (PDT)
Received: from kali.home (pop.92-184-106-251.mobile.abo.orange.fr.
 [92.184.106.251])
 by smtp.gmail.com with ESMTPSA id b15sm10452431wrr.27.2021.08.01.12.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 12:58:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 21:58:20 +0200
Message-Id: <20210801195820.3928625-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/samba4: add SELinux module
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for samba4 is added by the services/samba module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ffb582e14d..21daa034af 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -12,6 +12,7 @@ SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
 SAMBA4_CPE_ID_PRODUCT = samba
+SAMBA4_SELINUX_MODULES = samba
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
