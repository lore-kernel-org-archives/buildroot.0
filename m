Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7BBC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9BD60F12
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A9BD60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E3183EE6;
	Fri,  3 Sep 2021 16:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPXJ2p3tj_6f; Fri,  3 Sep 2021 16:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6563F83E5D;
	Fri,  3 Sep 2021 16:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A56511BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 951C180D96
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHIcsf1a62eC for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7362F80DAA
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id v1so3587731plo.10
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USulRNweNztHc55o4aCohjdlbHAYnI1WoKOU2wSRfsQ=;
 b=NWF2r5HBYaiyJzef/c8q2tT83P/9OulC3XPcPJLQ/LIpLmmV72ichLWPyPN0kl6Azd
 Zmf+8RBiYFfY6FVIej0Dr8KtninIq0EUPCjnJyUxbCeurA84Ulsc4ijNKi2erjtbWYos
 HrfJgi9uDNfLGhVhRPdWwhCJgbKFGKJw+ckwRngJbjvnUEc40KBWW96D77xijlvIcqTp
 DckQzsMO41aDWd5uPs5aBjWssQCyLpCKv0pU/hhmLpZAYb1p2pfamje98gObPEiOaWgN
 RU5/+wuklCbQMzQt631HgHVJ2Y27LKEGuBbG1pwk8Oachiu5b/vhu7fMCBSVxfhQOVb2
 6Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USulRNweNztHc55o4aCohjdlbHAYnI1WoKOU2wSRfsQ=;
 b=C7u8wARk9f8+ryz7J3zXgmi2R6yHOOkbyRclH25Scl67suuDaz2U8i+VMoW/AWNyYG
 2lrtKdnmdj2wZjqQUJXmiBiTLAx7rpC0xaxUvTJLMjJ7SUw4Zxv2o/cQnu0YaGInJOle
 ilSWim/XpXZQ4TlIDPe0yyHapVg4EN/AVcMU0gzdzwIAHKZPj5smas1+Z5GKOqct5uG6
 eMjtSCnM9b36ndllGnaT1UvcjJHJo3mJl8/+zCuU+TR5+N3TnnddD+dTMazTqNShjz1T
 vVHanMKrKg70A+9DmvuBXQ1qqi7AP+mjAuIaXhl1xYJ6aq53HfxqmgK0HGZ4NTdCZ5QV
 kh7Q==
X-Gm-Message-State: AOAM532casUfq0VlJ+2UhcDC8u+hPRA9PChkRr8kroCEzbv8Tj3oMlkS
 jvJe2v84JkU2GL9ntea0XKgCRIp3fk/azA==
X-Google-Smtp-Source: ABdhPJzWiDW9qzKKrShoHA89xkN7pG5Mc67MSRoVy63MbeQbyZlfHZaCxzKrjyWaKiIbyo6ZQFCu9A==
X-Received: by 2002:a17:902:db0a:b0:138:d2b6:4d1c with SMTP id
 m10-20020a170902db0a00b00138d2b64d1cmr3673738plx.72.1630686037710; 
 Fri, 03 Sep 2021 09:20:37 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:37 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:23 -0700
Message-Id: <20210903162027.1935040-4-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 3/7] g-ir-scanner.in: Fix shellcheck
 warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/g-ir-scanner.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 22df7be309..013eb15700 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
 # These environment variables are empty by default, and as such ccompiler.py
 # defaults to either using the system tools (CC, CXX, and CPP) or leaving
@@ -15,8 +15,8 @@ export LDFLAGS="${LDFLAGS:-@TARGET_LDFLAGS@}"
 
 export GI_SCANNER_DISABLE_CACHE=1
 
-${HOST_DIR}/bin/g-ir-scanner \
---lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
---use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
---use-ldd-wrapper=$(dirname $0)/g-ir-scanner-lddwrapper \
---add-include-path=$(dirname $0)/../share/gir-1.0 "$@"
+"${HOST_DIR}"/bin/g-ir-scanner \
+    --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
+    --use-binary-wrapper="$(dirname "$0")"/g-ir-scanner-qemuwrapper \
+    --use-ldd-wrapper="$(dirname "$0")"/g-ir-scanner-lddwrapper \
+    --add-include-path="$(dirname "$0")"/../share/gir-1.0 "$@"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
