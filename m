Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB84C48BF6
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C7D60B50;
	Mon, 26 Feb 2024 20:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzUe-yvOVMmF; Mon, 26 Feb 2024 20:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315BC60B54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315BC60B54;
	Mon, 26 Feb 2024 20:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 405D21BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8F340663
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjHSnG3oeUoc for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B4C8405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4C8405F4
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B4C8405F4
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5a0a0036583so398506eaf.1
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980894; x=1709585694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOkv5FiyIZcWW8Wqd4XOYUbT9EkQ6lHZfhVKZaimcMs=;
 b=kUZiZaYRe+fQtEujOppOM/39dHISu3bo7ivY8CNZMmrYCwX8PoUdohWn00xlpIl3KS
 dBzyJAr8TAneoN2bvAPsiy1OArEgyFCER9Lv2wW0wmMATMZYmhVdTBhdrBpEWGpaRRSR
 3oAPTF4qcL0iFfIc3YHVBmxBVkXtO8yAacYtz3DcJz9sr8XEBXZ1NemYSrOsESVOBw7A
 tVzok3LoUynVhgAiWrzY4uXPpO4gNOiz7n8ADOUaOV56RLnScRE1xx0CbdPNiVcfLFo8
 KnyVYCKEq5OiF3uSvdIjUBDDTg1RK+I8p3ghuH2dYpAHJGTwNGeTY960A4HiXOKu85sS
 nfUg==
X-Gm-Message-State: AOJu0YyfXbs7GoULL6LPR7Nj+dkIahcCLWZtxzByFJ/3FtdiAnCCNUPw
 uXbZWHt7RVR4u2TcwG9TPHHQmB44W8ztZL5oxhgfL3chel1PuUrOB6XGEu8WvQiF9TGb4feFyIL
 p
X-Google-Smtp-Source: AGHT+IGhhl8r4zF6PoC9vjqnMqk4Hr44B4sAuHEWxp+GelsUMNkU7yNC9Y6P1amxqjuOPkq0OGKvwA==
X-Received: by 2002:a05:6358:530a:b0:17b:57a6:888e with SMTP id
 n10-20020a056358530a00b0017b57a6888emr10135474rwf.2.1708980893915; 
 Mon, 26 Feb 2024 12:54:53 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:53 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:41 -0700
Message-ID: <20240226205446.842600-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980894; x=1709585694;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZOkv5FiyIZcWW8Wqd4XOYUbT9EkQ6lHZfhVKZaimcMs=;
 b=RxfdjcbDhWH0XtRtnqXA9eWEKz4waYBS34ulYITcnxncliWLGxlt8X1V7F8n1N9l23
 H4Kz1Eti7Ek7ij4JypIAF7tsoscKlhyalYnikJeWPH3nFGAbR71r/nubY/TqlXcg7Ooc
 1xWFZPSyjTqP6yur+HUuLJPsh7lGHU5sGmPgc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RxfdjcbD
Subject: [Buildroot] [PATCH 5/9] package/checkpolicy: bump version to 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index fcfd81c554..d2ecc7265a 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  7aa48ab2222a0b9881111d6d7f70c3014d3d9338827d9e02df105a68c0df5dbc  checkpolicy-3.5.tar.gz
+sha256  1b346b3cdd4f8a78a157627bad64a3b3479c67b6a19d15e6d5c8694620eadbc1  checkpolicy-3.6.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 024d306233..109aaf6072 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.5
+CHECKPOLICY_VERSION = 3.6
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
