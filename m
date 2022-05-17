Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 10:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA96610B3;
	Tue, 17 May 2022 10:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PHweMNeR3Zo; Tue, 17 May 2022 10:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAFA60E07;
	Tue, 17 May 2022 10:36:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6D71BF28A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D6B641746
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 10:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8I-dUoMgBZ4 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 10:36:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF83A403A8
 for <buildroot@buildroot.org>; Tue, 17 May 2022 10:36:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 204so16523620pfx.3
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6OBa0AeMXhaoKgK2/zxMoFfv/2/+9TXRaAuKZ9NXdZc=;
 b=Lzl4TE54RMbTXx8jxY56umKkqSg0Z3QT84+RLI6/DfYFm4Fiwe1FTCa+gay/qweSD7
 c/T25/gz+XHskjquim4T9P5r3UMNHc9nbykeW0P43NbGJ7M7AmyJHhYciifcefHizqxy
 1WYbjKprgWd4wNE3QslFzH0BHzLnDTG5h/pbgPvVF+vy7i6I7DsVWMCmvEbsRllveYpo
 EElhrYWl992k8j7kF2hGhE8PeK1pyTfsIJr5ND9TRzZR1ceRuUL6S0YYGffFRxS1gnQr
 JeXw4vxkXyD9RIkjx81K0Sez29l4ZAaJZqy7y+q4maZUOK2V92x3MEHPrNWU74vvbiQO
 VcGg==
X-Gm-Message-State: AOAM533knSmgOj0UdL6Pq7maXGamLjmPF0FsTsTFrGPYXFZW0Bpt9mhS
 /czCAkNKDdXONHdqrnp/RNM1ZfNOWpe9Cg==
X-Google-Smtp-Source: ABdhPJzRUa7zdAvY8MOcJciWvetoKrikn7nsJ79E+d3A+snRTW6AfZgHiI98LEd4+KM8W91eAnHNMA==
X-Received: by 2002:a65:550a:0:b0:3db:a518:5417 with SMTP id
 f10-20020a65550a000000b003dba5185417mr16708277pgr.161.1652783772838; 
 Tue, 17 May 2022 03:36:12 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 v9-20020a62c309000000b0050dc762816dsm8499002pfg.71.2022.05.17.03.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 03:36:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:36:08 -0700
Message-Id: <20220517103608.3455749-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-utils: prevent
 kconfig_enable_opt from changing =m to =y
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
option when a package requires it.

However, this will often override an existing enabled module with `=m` with `=y`
which overrides the module to be built-in instead of separate.

This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
the size of the kernel image.

This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - fix indentation spacing: use tab instead of spaces
 - simplify by using $(1) instead of two separate variables

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-utils.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7d1aea7710..218d6ea9b0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -21,8 +21,14 @@ KCONFIG_DOT_CONFIG = $(strip \
 )
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
+# If setting to =y and the option is already set to =m, ignore.
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
+	if [[ "$(lastword $(subst =, ,$(strip $(2))))" == "y" ]]; then \
+		if grep -q "$(strip $(1))=m" $(call KCONFIG_DOT_CONFIG,$(3)); then \
+			exit 0; \
+		fi; \
+	fi; \
+	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)); \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
