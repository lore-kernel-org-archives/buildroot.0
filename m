Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29B4C43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 20:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BFB81A8E;
	Wed, 29 Jun 2022 20:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54BFB81A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLCTxnqtZjE2; Wed, 29 Jun 2022 20:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E59817AD;
	Wed, 29 Jun 2022 20:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E59817AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DACA1BF2A6
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 183914035D
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 20:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183914035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvgKXrdATinZ for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 20:28:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C9940333
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C9940333
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:28:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id j7so296218wmp.2
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 13:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q4N6TY+erPjM1GBlK9uvnl+5+TuvWH8vajq0nbCeNTc=;
 b=0jf7Ygb3SBL5MFLXLmpqfdFclOFbWeNhmrrdJ/BdEVJCUUYA7k7cU9Rl03wcq3qJdH
 aQnCzHZZl9c5akj2AAKfHfn+zf97/p1Y0B5BMmDL2i6GvWcSABymQR9vQ5TLSZMdWkaK
 OTC2ckqJ7LsJmER7dG60lcp3kR/87Qy0GLhrSAEakcJ34bPQI1OMI9TF0LGAeb8PQYzW
 cd+E19HkOhSkx23+WRLZww6NvjNoeXK44VVecpCdR+ZlJPmjfbdVu5rk4LlQO92dHg/M
 0hou4qTKePfkK8UGFXLejlkZIFCUAfpxDJphTCziXrE4i3Abm1iHchoc/gpkD4ZDdejr
 dVdw==
X-Gm-Message-State: AJIora9TbY9YbDcwjgAFBQf4yvNtZxSgTfAFz8sYkT7076LcT/mlCixR
 rM4E93T4aJfWEvF3IbLe2d9DcyG3Kys=
X-Google-Smtp-Source: AGRyM1u23h3lwcNPTn4sVMAd1/gKiIdWppKUIsoSky47r+jYJKo0jNhMTnAf2acp0uURKuoxNf56kw==
X-Received: by 2002:a05:600c:1990:b0:39c:9469:5217 with SMTP id
 t16-20020a05600c199000b0039c94695217mr5724522wmq.49.1656534507805; 
 Wed, 29 Jun 2022 13:28:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003a02b9c47e4sm225239wmq.27.2022.06.29.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 13:28:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 22:25:37 +0200
Message-Id: <20220629202537.574093-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q4N6TY+erPjM1GBlK9uvnl+5+TuvWH8vajq0nbCeNTc=;
 b=Jhy38pGOQ7AUq4cWbRYrp3cQIvOatT/UQpYMrkGgKEjlwJ/GXTfSgw24GgfIVh/uiW
 RkjFE9h3pPJxhHKogQN/uqb/xmQNsdrZEAzcdy+xmmL/r0xH/N+B00QT2Aq2b5CG5rmx
 Te2gxOaCS9SSUJVcMLG3g3jYb2LM9TFNL8m+S7PDZaRwYcSO04RhkkLFV7Uer3b1dcj0
 w+OtpBROY+/PWY2JH2Yr3BSyMbAAdV4vas8lFZDqmagp33fJUeq7iF+EGJo1amViFmed
 vR25sWGmK0dpNxhzqEeXTFUYT+LdJGGR8MJuI++jmRffnTgbKo4ck6FCc66eJTEBh/yC
 fVXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Jhy38pGO
Subject: [Buildroot] [PATCH 1/1] package/glog: bump to version 0.6.0
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
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/google/glog/releases/tag/v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glog/glog.hash | 2 +-
 package/glog/glog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 3f84472967..fab77c522b 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5  glog-0.5.0.tar.gz
+sha256  8a83bf982f37bb70825df71a9709fa90ea9f4447fb3c099e1d720a439d88bad6  glog-0.6.0.tar.gz
 
 # Hash for License file:
 sha256  0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 325107fb9e..ddf71fd15a 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOG_VERSION = 0.5.0
+GLOG_VERSION = 0.6.0
 GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
