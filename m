Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F467C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 17:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094B360D4F;
	Wed,  8 Mar 2023 17:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094B360D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdGGRlr9gevn; Wed,  8 Mar 2023 17:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA9F60AF2;
	Wed,  8 Mar 2023 17:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA9F60AF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A603B1BF47D
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8022860AF2
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8022860AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTgjJ7o6YYyE for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 17:47:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0518760A77
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0518760A77
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 17:47:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bx12so16157962wrb.11
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 09:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678297675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rd+DCjSuLD8phWX8LWUhrTj0Im1qKrHvfaz2ZqB6dqA=;
 b=BXp90X9NBgGQcs1CDL4VehFSBc3b7tKnq6uyT4+/nThmtZ4erKMz5/yaVwlqg0dCc3
 +EbCQ0keUe6stAoWZqgEJ8vREOFAIWbhWYZ8zG9hu1Q96RabERdTxl34psckjNdC4xeQ
 gukm8Nqq6iBqI7RDAYODTlzAXLYnHnj1L5KulXSnqlr06pLQbo8eRor6nUirI8bMiAgm
 Ry6MFXxMUjYpluWR0z70ZEqYJ3YCR8cP60rOTzirp0RHtZDX5Co6/KqsO42gXTmBhPU2
 Mlm2ZTpvpzeIKLE1JgPQ6rPAlVDXU4kwKeuPtXiBDGug6PPskZM5CLBKg1wMh2fW+IbG
 2Ocw==
X-Gm-Message-State: AO0yUKWI+8oYAXqkWiYwrvE8Z/wP/dG9IJrS3MfUzHAXr6kcSo9SA7RZ
 pdc+i3d8kx9XBMFvzfdXG46aB+cLukw=
X-Google-Smtp-Source: AK7set80WJT04T77mOftE16ckeR80rKJw0Q/RdBcydLu/n/XRtww/zAaUnx6kQOURNZ5uaBnySwkEQ==
X-Received: by 2002:a5d:4d49:0:b0:2c6:c9f1:e444 with SMTP id
 a9-20020a5d4d49000000b002c6c9f1e444mr17340197wru.16.1678297675611; 
 Wed, 08 Mar 2023 09:47:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003dc42d48defsm147536wmq.6.2023.03.08.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:47:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 18:47:53 +0100
Message-Id: <20230308174753.9766-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678297675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rd+DCjSuLD8phWX8LWUhrTj0Im1qKrHvfaz2ZqB6dqA=;
 b=q2Dn/uHXz/N+a5CV2kDdmYyNBXk+RYMHkRkbL217Gpp2uDNkZCq/bcrwr87W86qxEP
 CBFhNhDjUOIOtFr+YQtB0xP0NAUgvS7ocJTBALXB5cvKCJgUsLeuKuIEkonNSUQBVAEl
 VBgyE3omoJjz8qQqdyP0iVpIo20IazsmwMLEEUq+VQTL4A58ZpFvJcuqz54z58l4H128
 4rCGxIEfEr7hC6Fz5JhzEV9HbL/f+etstLTq6CwgcX9Z9dvRAbuQ7x41TYa9VWfjEZw7
 svVpnCL7w4H2HqPcRUI9ttiiJU5s/P49XvvdKJMvoBaQGbJR94vSpMRtBVvHGH/2Mvxd
 1hEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q2Dn/uHX
Subject: [Buildroot] [PATCH 1/1] Revert "package/pkg-autotools: force cross
 compiling"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 83e06196ab2193b73b4d7c1decc12bdd654a91e1 which
raises the following build failure with thttpd or wipe:

configure: warning: cross_compiling=yes: invalid host type
loading site script /dev/null
creating cache ./config.cache
configure: error: can only configure for one host and one target at a time

Fixes:
 - http://autobuild.buildroot.org/results/e2156c3747b37d0ec2559a67f2f468ad42a20dbc
 - http://autobuild.buildroot.org/results/a356dd0cd1fb4c9a1b9d6a4cbad4ae2a34dbb562

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-autotools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index aac80369e0..717ff81593 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -195,7 +195,6 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
-		cross_compiling=yes \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(NLS_OPTS) \
@@ -230,7 +229,6 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-nls \
-		cross_compiling=no \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
