Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B035C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58DC660EC0
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58DC660EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19220403F2;
	Mon, 25 Oct 2021 22:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsBci3R17WPp; Mon, 25 Oct 2021 22:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5657D403EB;
	Mon, 25 Oct 2021 22:04:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A38B1BF861
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7741F80C93
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWbby_6Z81Rr for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A461E80C75
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:04:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 83-20020a1c0456000000b0032cb02544aaso56730wme.5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bU0+/Eb+sKGnDjmpoOLuA4caN2MAD3OEMJTRCXFaF40=;
 b=DqQYHFjschXUqGbn0BkCIwNrV+ZYsI3POZC1qBfZDD7+2z1flLAEVPfKLvLsYvH8v+
 ARlrFZOW2Y/KS6oDSpnxcWc1gMp+MVrPUrVciYqVPIzc41cIIvQ7ec3z5TJ0BttVAuhC
 EF0uOHn8T46bquUl9pD6PlqKTWKjyjNuqCSDpf65KNkPiRLDkyYeIu0fEy7TIbekrMqE
 XC/x9KVBvnbdWRB/Y2OLkBId2TqIjBPHdE96TiYf7DSp4b5eQYRWpF+K87BJSYxPF0yx
 mVadsBwU4BbyLgPqK5D0rz0i225VmUvx7epyby97Fu6DBRes4mwKlGz0AFYiZ7eYBQnf
 BYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bU0+/Eb+sKGnDjmpoOLuA4caN2MAD3OEMJTRCXFaF40=;
 b=LRwobBFqhCTscM1NYluW7xyAm3OF8qx9yj+l53sNGnK/NKnlwDeFwv5OGoLHgR5E4a
 6z3ScnvpB1BThgxGRZ8UgQLyMpHw8162mlvqvU2wp+Wg7Hz0jnC2GvLCrjz5rwmq1wQf
 s5Ed53Q2LvO4j8iOLWpKFA3nlHQ3BjiXyW2vv292WyAaJ1j4ipn3iJdBjCF40ZCBopdJ
 fynbMe55yVnCZgezmAWbetqS/D3F/rLwxeSKm37AQrQb+yUmc0il7csE5ZDvqMsvmUwl
 M/ySHmMax2gN+PwQeSWXRyAN6BzXIkFOy+nI/niCij9oEkqiSLO+d0NqXAvPKBm8uf2G
 G3ZQ==
X-Gm-Message-State: AOAM531aH9hd4PzKiBJRRVJSgMti8HM1uBPMVfsCTe6f1YCSlQWSpUWj
 hGDAka/uxhpzJHbQai9IC3ym5IkYB4w=
X-Google-Smtp-Source: ABdhPJxLo3GwPAHag8iTQZMLZ2hPsqk84I4ZHkrlPld/PQsK6kS1CP/fYQgd9zJ6/TPuyQ3gFWQc+w==
X-Received: by 2002:a05:600c:1c88:: with SMTP id
 k8mr22754841wms.169.1635199461302; 
 Mon, 25 Oct 2021 15:04:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n25sm5274940wms.10.2021.10.25.15.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:04:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 00:02:52 +0200
Message-Id: <20211025220252.3714185-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rsh-redone: don't override
 dependencies
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

Don't override RSH_REDONE_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsh-redone/rsh-redone.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index d73e473dc6..307e54066c 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -24,7 +24,7 @@ RSH_REDONE_MAKE_FLAGS = \
 	BIN="$(RSH_REDONE_BINS-y)" SBIN="$(RSH_REDONE_SBINS-y)"
 
 ifneq ($(BR2_PACKAGE_RSH_REDONE_RSHD)$(BR2_PACKAGE_RSH_REDONE_RLOGIND),)
-RSH_REDONE_DEPENDENCIES = linux-pam
+RSH_REDONE_DEPENDENCIES += linux-pam
 endif
 
 define RSH_REDONE_BUILD_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
