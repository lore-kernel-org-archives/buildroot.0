Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403EAEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 07:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A29808A1;
	Wed, 12 Jul 2023 07:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A29808A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RifbifdFXzRO; Wed, 12 Jul 2023 07:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA1883B23;
	Wed, 12 Jul 2023 07:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA1883B23
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8B1B1BF47D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 07:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96DFA83AC6
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 07:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DFA83AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdKTaLbyW1uX for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 07:03:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E9283AC5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E9283AC5
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 07:03:38 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-78360b822abso227455339f.2
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 00:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689145417; x=1691737417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TX/LasGRU35wwLvq/9CY7jTzNwht5Bto8S6CRPUd7I=;
 b=Csel2fXMYhdAyacuXAUevHIw7aTffrW2wHMdP6jPdQPheOoKxLaYN8+jvmzIAJbu4z
 8dwkQgYm5CPCgqONvTk5kBiRw7A8JZZdZLkOZ/BaU5NUd1++w0YV6LiKnTogbeqFBI42
 uicgAPFzH8kjPICVV2XEpSjcguDyrK6v+G4Ltt53RIO7lWsm50FvYOX9+3yrNjL6hmmz
 hNrgNqs6L3GJ237Ujm7uUEZ4RHtr18NF4G9AGOclYtMJOPbD2rI3229PxaKjGjfIfDnV
 g/DNumnWHvI4yo7ch0+UlYBgBReMtl7zMMmpXyyJcjjHmWyMusF0HfVVXS335jCbu3Bz
 dvjw==
X-Gm-Message-State: ABy/qLac03EITMfZA0DFUNhZfFFHD0+ZatNVXvoGqO/hFUJgX6TTUtEl
 ykRAZ88DcGP5V7Bn2pvxtOfSthE8oyg=
X-Google-Smtp-Source: APBJJlHqSI1pvm/tLASNOT4ecoqaIs56SX3YtCh2Q38cSaTDnOcPenDEDE9nYXaMZOyuQIyu/yb8tw==
X-Received: by 2002:a92:c68c:0:b0:342:7948:80dd with SMTP id
 o12-20020a92c68c000000b00342794880ddmr16267144ilg.18.1689145417206; 
 Wed, 12 Jul 2023 00:03:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 t9-20020a02ab89000000b0042af7792d7dsm992131jan.97.2023.07.12.00.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 00:03:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 01:03:35 -0600
Message-Id: <20230712070335.1648184-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689145417; x=1691737417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7TX/LasGRU35wwLvq/9CY7jTzNwht5Bto8S6CRPUd7I=;
 b=k9Qew68TUGqejjsfMhvuxKNagQgra455XBXB/IZXEecgkTpWmQKe3LdRsqxgUmE+7L
 L96EZ63T3mLxsXzE8sXd6hRUwhxSw+sQpVdYLSRqannaQ08w3zgYrwDcZK1WmQBtj5/N
 SCcy2MuYvtKTZps+UHO7uAJ+dNi2IXq1GD53SFPsNvzKpTE02m5IqZJTxzv4+RZH/jNH
 ZebnJQ68okRF6a8vRVzVkV/85e/KfXh/3utDCF2z+Q17MeJODA0mEv2OgqZfYRhur8Vp
 JJ44nTmpKced1C8F2dyyRg1sAAv1CD/pMwhUEGqws28KGCofYdqK78j9rl6vRtl9j+0S
 9rtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k9Qew68T
Subject: [Buildroot] [PATCH 1/1] package/icu: bump to version 73-2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 77d5a9269c..0948bf495e 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a457431de164b4aa7eca00ed134d00dfbf88a77c6986a10ae7774fc076bb8c45  icu4c-73_1-src.tgz
+sha256  818a80712ed3caacd9b652305e01afc7fa167e6f2e94996da44b90c2ab604ce1  icu4c-73_2-src.tgz
 sha256  f3005e195ff74d8812cc1f182a1c446fab678d70a10e3dada497585befee5416  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 96ac5cef61..d4be2e4e8f 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 73-1
+ICU_VERSION = 73-2
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
