Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB1C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 06:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11DD4400D3;
	Wed, 24 Aug 2022 06:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11DD4400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IzRbk5tzeQN; Wed, 24 Aug 2022 06:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4522140499;
	Wed, 24 Aug 2022 06:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4522140499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 349321BF2BE
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 06:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C79E81443
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 06:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C79E81443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQ75V-wV8axA for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 06:45:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE7F681415
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE7F681415
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 06:45:57 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id y3so5273294ejc.1
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 23:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Jhf54oGHzIUCWesY3mw4rD/em2w05tTJ1rbgeI6US40=;
 b=vBAme91fAZEHk+tSwZvYiJSKlHDejJ1WWrcvDbQO5h4rMHx0x9RccFMfSAtF5wzdFJ
 B+s/CEBJc0wRa6kUGiz7vVXo0z9rvz/fA5yOev0TqhbZieJ3tGbkGlYFfTWNmCBYzOGB
 LSmXU2+95YYt83agXOAuZGpQRdqDLmfUXWn+dOCALLUjOPhpmGOFBcU7Q5ZN5ZBk21w8
 6ItwCzU492lY8CaxDdW0/o1l6lvkaR0ASWsC+jl9NmEmojLDDKuCbrTTHz6tKJ+dxQRN
 2l9qRjCBZl037wb5sxy2UgCi4jZfRRgBUsnE436VThlk2r3916qzuwuIr3PmYl3ydoOr
 gdxg==
X-Gm-Message-State: ACgBeo2xOBaelE8/uN5FXWugPAhiV6nmC8hsZeLqUXkOIrUpmIm2tMKM
 GiVGNYxGOyw9FNAo2DNi2uUSszA9+NI=
X-Google-Smtp-Source: AA6agR4C9wVE9HdSdCW4mZxL5sNyURKlDJCSt6nh5ZsMseji+x055z5SNw0GMVYJ61IWGYTevAmskA==
X-Received: by 2002:a17:906:cc56:b0:73d:a6ff:4b79 with SMTP id
 mm22-20020a170906cc5600b0073da6ff4b79mr1917127ejb.536.1661323555967; 
 Tue, 23 Aug 2022 23:45:55 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a50d4dd000000b0044676682954sm2562311edj.25.2022.08.23.23.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 23:45:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Aug 2022 08:45:48 +0200
Message-Id: <20220824064548.1693605-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Jhf54oGHzIUCWesY3mw4rD/em2w05tTJ1rbgeI6US40=;
 b=dZlaek7xX78C8NVcZW+c8ylTEFSabo1PvxJy/9l0yJnK/iuy4uiLp1QOPI3i385A4y
 XfPefSVPVQpAW2IbGrvFbdM6N0VBbP0pRL5ShS9bSysIKWeejSzoVpEMPfwRO7n03c16
 NWQsxroMpqUTpzjMaXtZm+TI+oOdbdLDZLeJINS6TKpq6el/64FidryMpbF3IIuWTar2
 9enU9bENF+YVUMg5yhaEvaXo/ytcZBHD03fQrm394uCStTk7mGovcCt2CQcPlg0XMTfH
 dE7FbRfYwhR3Ncl0arBKKjtgK5lUBPjOh9OASc07ulIuI7Imm0bmbOns2TqQhsxOvf5F
 sqnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dZlaek7x
Subject: [Buildroot] [PATCH] package/qoriq-rcw: bump to version LSDK-21.08
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 5848799a0..f34c771d1 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bbb595f0b68beb114620f7aeaff073b90938329e10cd6b36daa9f2087f3119a0  qoriq-rcw-LSDK-20.12-br1.tar.gz
+sha256  caa6802f2ba5ea92fd27e7c977749010a91c9091fcc3fe626f96d9cacfba1f0a  qoriq-rcw-LSDK-21.08-br1.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 93e660b1d..0501c36f4 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = LSDK-20.12
+QORIQ_RCW_VERSION = LSDK-21.08
 QORIQ_RCW_SITE = https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
 QORIQ_RCW_SITE_METHOD = git
 QORIQ_RCW_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
