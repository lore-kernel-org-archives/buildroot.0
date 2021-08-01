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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470E5C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B036108D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0B036108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E4683CB5;
	Sun,  1 Aug 2021 08:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baf7CfydQU5y; Sun,  1 Aug 2021 08:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA75A83CA8;
	Sun,  1 Aug 2021 08:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABA7F1BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94CA3401D7
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pji6Sa4WMhWN for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:09:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB895400C2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:09:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z4so17578077wrv.11
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9z5l1gObiHvWgkIvq5nRFYM/BKi0RFXOZjajYjYJa4o=;
 b=PVMOKwJl++zmz0+S8PqdmiuGmCcd6p1DTRBU7CVX8Fy4EApE/nSb5pLcX9V5WPNNuq
 TKMGv4PXr0iy2568AVEF1hfWFuYeDqe8j8ZzqEBa5LcXISJTOn8A6Hb1KBQh5nIkGYJB
 iANGjVnUBXzu4aMJMildybChuSjS50vAlGqIbQq267gjLS9FoAs1gS7m0IfDPYDgKLKA
 fjlBGp3M3PTUKUKC2v/ovVbVzSUKC6wM+yHbivIPZy3oMdwvXTFNAUwuSJXSs0jWIhEI
 Ikw4q7Wys1GWd36BhrvXXROBcGXl0H4lBpg5bzE4n5vC9/4ojntl8HpCX6dCRftsBJPK
 j/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9z5l1gObiHvWgkIvq5nRFYM/BKi0RFXOZjajYjYJa4o=;
 b=cFKncnLlpdP9RSY7Yfr/OLoaE/D4xfXMUTcBadRScXS0B6EYmx6O4H39wlZ2uWkM3X
 XPMX03zQzOx/z3yeePa68LoVGgTVRRXXVNtAWarI3KEPoNoa3utiMxeN2wpVHI0HPQri
 FEHsELxcsZtRmQL2C0LqWX/taZYUvKPj5UyUHy3V8FdGxCo2H8GZxs7vQZ7W+U3GkWQw
 t5GSvUkw+744y8lk9ih1D02skLvl5sWrI6T2Tpol9sffYSSsguUxZqooP0eXVFOfcUVs
 jUmJ7bDNZJRbhvbBP7i/+UmBm5wTMT7/hoAl40C/MJNGnhnoyRU/TMk1ghlXAhERue7v
 QIkA==
X-Gm-Message-State: AOAM530/MTjFZE5KMZMTVWmM7mlklgNpYOp7hE7hjGChuCTPwMFBGyJg
 LKCvoHk9sg+8U6keeCK8RVcCmUiA690d1w==
X-Google-Smtp-Source: ABdhPJwHuhbO+HUVeTVg9DxVdwuk5HZNkpv3EnbtPYkQWJ8VChtA6bv2T0Kh4AoScX0ba89ApRj3IQ==
X-Received: by 2002:adf:ea52:: with SMTP id j18mr11623730wrn.294.1627805374540; 
 Sun, 01 Aug 2021 01:09:34 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id x16sm7488744wru.40.2021.08.01.01.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:09:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:09:28 +0200
Message-Id: <20210801080928.2630353-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ibrdtnd: fix build with gcc 11
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

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ibrdtnd/ibrdtnd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ibrdtnd/ibrdtnd.mk b/package/ibrdtnd/ibrdtnd.mk
index 0632ed36b7..20ac496fee 100644
--- a/package/ibrdtnd/ibrdtnd.mk
+++ b/package/ibrdtnd/ibrdtnd.mk
@@ -18,7 +18,9 @@ IBRDTND_CONF_OPTS = \
 	--without-vmime
 
 # don't build documentation
-IBRDTND_CONF_ENV = PDFLATEX='no'
+IBRDTND_CONF_ENV = \
+	PDFLATEX='no' \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
 IBRDTND_CONF_OPTS += --enable-libdaemon
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
