Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96210C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3338611C7
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 00:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3338611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830B6404EC;
	Thu,  4 Nov 2021 00:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSUwf_VnCuA9; Thu,  4 Nov 2021 00:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E00C8404E8;
	Thu,  4 Nov 2021 00:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9652F1BF9CB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 847CF4016D
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 00:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODXY9hw9ZSpr for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 00:36:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 477EE400DF
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 00:36:13 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 8so2674313qty.10
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 17:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbzUzOqEusID02Zwm4ySfWIAJKLRAJj3KRfeVdrl+nI=;
 b=fzmVHQiJ/3N8IItJDaMK6m0X+Mo8PDDMveSlLgqU0ZUvC06ndSYrmhMOu7Vl8gsKUv
 2zVWL/afym+brjp3jhIcBsg7H6AQelDA5SAmJbuDKtRGOjeV/PC/D515wrpmpyn9PufS
 eFKyjKX+um9ozZa3XPZL0NPo9jrzxBAN2Fc/mil1EozAIiyJeRBvEcS6TfLGK5u9W2f+
 gtdFUd1tHM5HymEbnkCx/+VB5QioiAcYzflss7u6d4yLpVtysWaM4QHc7M6eDdoTgKqe
 yvtLRu8pE3zqVTl/0z07CWUvAFa4/1J6T3iibxI9ikl0qoR5SPKQsh9pa+RhMeEb6vww
 bdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbzUzOqEusID02Zwm4ySfWIAJKLRAJj3KRfeVdrl+nI=;
 b=3M/Opc1AH44YzyTEM/g4fefb0TMvlS1dGcQq6zMqGeJJt+1tOlWG+j/prIYJLcKAOP
 DhJb/q9qhk3ETcPyLASmtsJxWWTNoDI/8JTkVmDs453n4fVsXjSD3DFGJijuv5ya32TG
 d7u4kPxKSCWebvRUlZJbJR5R4MPo6zRJsRb70zLrFXeMmeRUYB6reJPaMVlSi1hTuSaH
 Tpn2D8Wup2ZI9eugqEoczgDsPomLzAHHVH8BMRcfzoEyqURhGrYkVL9UZSmAvawpQaJP
 fj4d1dQwJu77eBh8kIe5DTHHVWfC4znYsIYp6t/KUiiPLjxgpgEVIvmBEaC7IqjFXr4D
 1eoQ==
X-Gm-Message-State: AOAM5324CUkJckzCToCUkpgOb/XuyusWaYAojxh4C6EaBZ1xKBBB4ZNo
 kH0bXeiNEfSeLDUkaV8/2zI6s/g6HUo=
X-Google-Smtp-Source: ABdhPJyv6FErzYmBCDZlzBSuBvqTnYimx8cSACs4Q2/nIDYabdXUvElweNrMvxIDoh0+fnJrhbrSwA==
X-Received: by 2002:a05:622a:1392:: with SMTP id
 o18mr13260592qtk.403.1635986171818; 
 Wed, 03 Nov 2021 17:36:11 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o6sm2847034qta.2.2021.11.03.17.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 17:36:10 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 17:36:03 -0700
Message-Id: <20211104003607.2022984-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH vRFC 0/4] package/midori: bump to version 9.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a huge update that took me a few weeks of playing around with
to get going.

Heres the tldr version:
  - Midori now lives at https://github.com/midori-browser/core
  - The latest version builds with host-python3
  - libpeas is a requirement of midori 9.0
  - webkitgtk has to be compiled with introspection support
  - gcr and it's ui plugin is no longer optional
  - gcr ui also works with wayland and x11

I tested this with test-pkg -a 
45 builds, 38 skipped, 0 build failed, 0 legal-info failed

It's huge, it's complicated, and it needs review.

You're welcome ;)

Adam

Adam Duskett (4):
  package/gcr/gcr.mk: enable gtk backend for wayland
  package/webkitgtk: add gobject-introspection optional dependency
  package/libpeas: new package
  package/midori: bump to version 9.0

 package/Config.in                             |  3 +-
 package/gcr/gcr.mk                            |  4 +-
 package/libpeas/Config.in                     | 45 ++++++++++++++++++
 package/libpeas/libpeas.hash                  |  4 ++
 package/libpeas/libpeas.mk                    | 38 +++++++++++++++
 .../0001-disable-vala-fatal-warnings.patch    | 30 ++++++++++++
 package/midori/0001-fix-bug-1492932.patch     | 44 ------------------
 ...ion-to-specify-path-to-g-ir-compiler.patch | 37 +++++++++++++++
 package/midori/0002-gcr-for-x11-only.patch    | 32 -------------
 package/midori/Config.in                      | 46 ++++++++++++++-----
 package/midori/midori.hash                    |  4 +-
 package/midori/midori.mk                      | 19 ++++----
 package/webkitgtk/webkitgtk.mk                |  8 +++-
 13 files changed, 210 insertions(+), 104 deletions(-)
 create mode 100644 package/libpeas/Config.in
 create mode 100644 package/libpeas/libpeas.hash
 create mode 100644 package/libpeas/libpeas.mk
 create mode 100644 package/midori/0001-disable-vala-fatal-warnings.patch
 delete mode 100644 package/midori/0001-fix-bug-1492932.patch
 create mode 100644 package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
 delete mode 100644 package/midori/0002-gcr-for-x11-only.patch

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
