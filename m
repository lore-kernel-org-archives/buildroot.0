Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05ACC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B3A340567;
	Wed, 27 Jul 2022 13:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B3A340567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFnM3pxY_wwm; Wed, 27 Jul 2022 13:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3CFA40558;
	Wed, 27 Jul 2022 13:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CFA40558
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3422A1BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB7A408EA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB7A408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rx8EslXFMT7i for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:26:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3CB409F0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D3CB409F0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:26:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i8so1207704wro.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvNH8LV6lhgz6iJMiPdyt8ei1YneCYMnUXjQ7kTroRE=;
 b=uNI4S0bsGiSdK62cHJKNNtHf66mHWLpNEXXvY/yNBpaN5UmXDacJSJ7E1Egv/PvLOR
 62w4Tm8unwY1d42d80m2nfgVwKBpB72cBm/SfnWWuurqBLgXsUjYd4dbuQEDaQw/h9+4
 dpxLsfkVR8M5bfM3Xk2lb8Y2vCliNjbYc9JNvA02m6AyKxE61MBAApN3GgIu1bZt+Bsn
 v9vijP2cAXGbv9CS3lkqPH3XhLpRqxEL4LAlSTvCPsKMWrZQoT57FBzQm9LL/nK9jBDj
 B1h+GtoiFXoRnFBTxjjlNB+9QY0EcjbdoPiQ/u7RdZNDb30PXIUeljJTj0Wp/1w6s+Sz
 KlnA==
X-Gm-Message-State: AJIora+WZ3rp9VpRO9cePkye5WoEiiE0nydHVAjeMXnW6ANtlV20jH8t
 VmA/g0HcG8SSTdkY2pSQaSMSJOynQPM=
X-Google-Smtp-Source: AGRyM1vJLenrR+HNX3nMcVMDWm0Kkx58R/ARX6Yne4stD32sCxr6c30IUub4pj4L4WEmDdxyIJqUZQ==
X-Received: by 2002:a05:600c:3582:b0:3a3:3b00:cb25 with SMTP id
 p2-20020a05600c358200b003a33b00cb25mr3092961wmq.170.1658928399850; 
 Wed, 27 Jul 2022 06:26:39 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a3080eacb9sm2662863wmq.24.2022.07.27.06.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:26:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 15:26:29 +0200
Message-Id: <20220727132630.1323856-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
References: <20220727132630.1323856-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OvNH8LV6lhgz6iJMiPdyt8ei1YneCYMnUXjQ7kTroRE=;
 b=XAgjhq93zFUc/tkApuuKa2oMUW282UZcZmZ5KDhJA50EKgatjH10KdQLej1qKird5t
 rsCrAiEv96xB7FPxdBE5GAgSPMCfJSBj9MsCf8thqB21fnc5shg6qmH2wwH/8+r02ea2
 S6CZH7kdCyaYLHhiZ48XgkkjwKYt1ORvBgw+gTMNlW983gXV3KsiL0+6FsEgLB2cdtZh
 vPwVxLtWFz6BxPYZ88L1U5MexSBDgmemcgKDViJP+ahJ7EdhCH1Dmd+F9QxaQ0jNxlpK
 FV0XqwjVUJa6nuGs3bUWBlmDRezm/NR5TYq72QOfC/24FzmsicsJ7sTQNobwyqBHKQoJ
 es0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XAgjhq93
Subject: [Buildroot] [PATCH 3/4] package/jack2: add systemd optional
 dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add systemd optional dependency (enabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack2/jack2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 3b45474cc4..73f723aef0 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -47,6 +47,13 @@ else
 JACK2_CONF_OPTS += --readline=no
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+JACK2_DEPENDENCIES += systemd
+JACK2_CONF_OPTS += --systemd=yes
+else
+JACK2_CONF_OPTS += --systemd=no
+endif
+
 ifeq ($(BR2_PACKAGE_JACK2_LEGACY),y)
 JACK2_CONF_OPTS += --classic
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
