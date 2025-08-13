Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51869C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A95483D23;
	Wed, 13 Aug 2025 19:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRFLvEKOHLq9; Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424D183F99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424D183F99;
	Wed, 13 Aug 2025 19:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 20CE71C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF4561BA4
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paWoWYas1Zvj for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 19:26:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 080F661BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080F661BAD
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080F661BAD
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso33788166b.3
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 12:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755113183; x=1755717983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=qogMdEVGingUDKVastEteJY01fNH5Nd0ECwdDlZ0zrQc2Qjl7c30oZOcQJyYbGKfGr
 rJxJRtZrvvRPeQrb2eoTeIBjo/BiKVcfhLjagx/q2PKgAELh1Qq6/9WiiYO4Qd6IbAT0
 vfn4p4a4J3ezY8Xo+vZSwJCp62mxMBA5Of80fFkVLFxTSQqceR1sILP4miq3DKMGPneB
 N3vU+4Ksf0QPPikpUK0iC339t6FPAKtgZNSqA1WPguP29GPYxIcQHmShX1FUsLogedW4
 kS0CQozzDjr473F1y8Z0auWVGjEJZZ6zu/oa2vc6uhNsAr4uZI2h8pQtSBKKSGYpc4W7
 WdQw==
X-Gm-Message-State: AOJu0Yz2+WT+bX24/kyxXj/zspJZHbEJd3KQqeP7jfF7NExarotY4/ME
 dlk25l0gsf8vGpqJmi9FgvvuYbs0KPTVqBN0hhBH2oiOpNwQsGHQ+OWIH/+3mq2iucKkGrR4xRp
 wrZJJv8M=
X-Gm-Gg: ASbGncuMKlRsBP4mhT0LNw0FofZVMicGJlX3108LSftdUsswcqE74j+eYX4/LPeCnDU
 1ai7DJ9C7GfmzZ7OJSwNHOcyHrOYwBt7QJXP1uxz6M2GxxwodOAZpu2aRpB65o+gxnsWdVRbcD7
 4VgMy1zaesaJz9KqC+Ihm7Z/+JuXEte8q70zK2UR3EwovlZomhZ15x9DV60aXyxbyLNz1ES2wtK
 AIH+VmJZeZ77qw1j9MBECUfE7NkEtgRbfvYW7bnZYCTXqCVD66QhRB0t+5fUlV9PWsILiY0uZlE
 Zzm8bqynlYuaWUVehToVG7ZwVdKmFdcqerutnfNEY3LKmIz7UF4j/vFVbdV8v3RnpNASPSnFjmv
 YkppmcUGxektbg2aMoK+NSJSodvtk8SpwYSOe7P6w1GD9Q1s3O6KU8XLEIOd8Sl77h4QR/PEFI5
 QhSYVuv8g5y3zl
X-Google-Smtp-Source: AGHT+IFrHKWwtpeT+cTUu0sxeHy8+56GkAxhP4aTXZQw9bMfmshXW25pp1m7W4d6nbUrQIr9Yt5x1w==
X-Received: by 2002:a17:906:c152:b0:af9:610e:343e with SMTP id
 a640c23a62f3a-afcb93988f4mr30860866b.11.1755113182790; 
 Wed, 13 Aug 2025 12:26:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:3fd1:eaf1:73ac:376f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2453396166b.59.2025.08.13.12.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 12:26:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 21:26:02 +0200
Message-ID: <20250813192605.1540321-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
References: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755113183; x=1755717983;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JT8MvWsy5P59IqKvZtPcHmV5Q2HyVsjBIgeB0M1+FgE=;
 b=SloM2ysyZTnm5m1QXrTLipuLwzErOJXdBF2+7A1dzqdyWX37DQvOiDoMTsbYg5TzMB
 Q3dFhG/0yIWgUb8Qx75N4BlkmMZYN27rFoQwTg2q0iPKZ2kpGV2g+Lc6RMoILtix3y5s
 gYHCOwd++UjnubegLNKirroRlQwtS2t9VBjwU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SloM2ysy
Subject: [Buildroot] [RFC v2 2/5] package/qwt: bump to version 6.3.0
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
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

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
