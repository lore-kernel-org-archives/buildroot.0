Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B5C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 11:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7C1845CE;
	Wed,  6 Aug 2025 11:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYnKnwNIN5lb; Wed,  6 Aug 2025 11:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97973845C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97973845C5;
	Wed,  6 Aug 2025 11:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5492D31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B08414E5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17SGJJLrkFry for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 11:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 500B2414B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 500B2414B5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 500B2414B5
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e794b331so3637235e9.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 04:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754481198; x=1755085998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6rNQRSxgTk0Oajsv7sHj9dqe7OdqDv5aHgMf2fOIQg=;
 b=D8c47NCxOqRPyL44XxF29uDgup786KYNJ2HLQuM/KE6Y8JYr/Ef1TO8eag6jUw2GsH
 vF4IodU32TJ4a3PAQW3mcdjEjcs2CPfJJuP882rNIvokq8cfETlDfI9oZTW87BPhuLkb
 wAopEQIq8tKFVXwRLDX88Be2INepbefMkNj1Ai2/kVFW3/AKYrZsWS/2fAe96BBmE4vH
 L69vNjCrI0aZ/p9dWWZiSXZdFDWoRJkbWSZ5Ybs8wrVdGBWBqF1SqMZoahwFg/u6Kth5
 bufJBUXwxVEGv90RE5apY5Xh7zvKjD1FA1f7Q/ceg8H3D8gugMzCnOXrGWnewCvs77O2
 iIEw==
X-Gm-Message-State: AOJu0YwriQkk6oIWm9uN9SxT0VJlHVmVlm8fq2knSIKZchr3dr7pHuV1
 Ex0cZGcZBaIGImhUtzuM1SvL4BRKl/lEsgnwmqrP/XVlIjMaxwdNWkQw2Xpo/bqHx8axVgynama
 kC6UI
X-Gm-Gg: ASbGnctroYzB0tikmigW6Ug5LPtkhlGp1qx9aQDrXwAcRm3LcPFTIo/8c/chSq/ZpBB
 QhxcBdRh13qatcEC/9VNeL31l6oiiaRlG2If9TTGPc+n3DX2uWHdgHJqagRo5yHlBO8F0+u+oQH
 RTycycREjAZwwALAISNsTKxxshmOX/474jDZSkzVzQEB9I5wE0CCEkHl7dJYOXA82i9Gjf+M37t
 fN/zSPOURVSd1BfIhD7LFw4SQUUaXXklUy2y+2GSsXFxfcaBrEFXIEzKyOj5KNRD/nPlxLqJ+9W
 foiYG1T1qnZEWHz7wmzET6QWFrzToWOPnLCdyvuXJUfLMied85XagGPwKTDP36cNCNsr62Kmxoo
 6NLXGekAlbsHw+gqM+Cze9c6C3e1gUF3fw5iL2Zf9r9S8qRFvArb6ILNZqagD4nfUE9Ms+f3EPE
 8b7cF/K17Dpy/iaZjib66J+p0TJSOh
X-Google-Smtp-Source: AGHT+IHDsj/ywpQ+jb4n9hhsYa29AHZD8spjnDNO3O4425MXGvy+SsExvDy3PCZjNSUo1kB53zMUpQ==
X-Received: by 2002:a05:600c:4510:b0:459:dba8:bb7b with SMTP id
 5b1f17b1804b1-459e7450de5mr21497965e9.13.1754481198155; 
 Wed, 06 Aug 2025 04:53:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:3f96:8759:f916:8982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm142606555e9.22.2025.08.06.04.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:53:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 13:52:17 +0200
Message-ID: <20250806115219.3307438-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
References: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754481198; x=1755085998;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6rNQRSxgTk0Oajsv7sHj9dqe7OdqDv5aHgMf2fOIQg=;
 b=rzIH0recxwdAozhIJ3IKoMwOrPY3HOgtpEVk5XKLGUnLf6iv2NYGEUAuIx7BnrJ/sN
 WywjHZIXSSlNfJc2udafhVGJaXJrcwTN988VkkWFCYD31Le3anYivHXVVwGuxAPTMt2B
 OTsr3HYwOsa0XUi/lSQUTOyJYvIz61AyYOYAw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rzIH0rec
Subject: [Buildroot] [RFC PATCH 2/4] package/qwt: bump to version 6.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd69..e20c9ebadab9 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f6f..67292ee025be 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
