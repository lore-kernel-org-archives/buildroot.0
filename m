Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEAEC28B2B
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 17:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9064B41603;
	Fri, 19 Aug 2022 17:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9064B41603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blaae_QOHu0e; Fri, 19 Aug 2022 17:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B7CC41053;
	Fri, 19 Aug 2022 17:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B7CC41053
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC4151BF366
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75CB60B32
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 17:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C75CB60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYwSI30CEk-i for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B6D60C17
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61B6D60C17
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 17:51:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b5so1714727wrr.5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 10:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=NGV7Qj2+FtddG2MPkPxoZvAKz3YppwAbDSr20ym7r5w=;
 b=13rrtAdJFkwU1WrKUwB4c2XbeIWBAgq3yTm7PMzO0ZKmecXh4Oh20DVbsFLjxgOqG7
 swAKfaf0r/8kv789aAZmTDgvJDY6ZwP94ricrT3zknvxyrngvoOvgFqBprgQTl1BJmRP
 jUXIjyphysAS/KTPnKEg9KH3PhTxVHeK2Kfa+Oo+b/41rvgEwhe5vZJq8UjJAQonor7W
 rfdmQ/C/onC0OjPomSveitergMk54SNKsfc8zdAuNJaBy0p/3qCO29jflTklvxHfeXXB
 +cd5O+Sw+EBmYiyPFa97dLFDrlJTt/yMYJ7J2+wqwjj/cMETf3A65AK+NOl8xFImw5bi
 Ahfw==
X-Gm-Message-State: ACgBeo2/CVe0Ffha/nyWXgr7cavZnbmomsYot+VuKANhPFoz6KdpDyWW
 A3XEKmqUc/v/xFoqp6JknDSsC92fZOQ=
X-Google-Smtp-Source: AA6agR75G/dJDl6ms3KNujnWXLTzZqvr6mgtN23DM/1VDPBUdJ9fgteWytliRf6R6HQYaay+pVgZKg==
X-Received: by 2002:a5d:6481:0:b0:220:7f92:3c0f with SMTP id
 o1-20020a5d6481000000b002207f923c0fmr4948668wri.464.1660931463416; 
 Fri, 19 Aug 2022 10:51:03 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:54a5:9a99:1f8c:15e1])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm8937295wme.8.2022.08.19.10.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 10:51:03 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 19:50:59 +0200
Message-Id: <212daefb880a3c5e49ff4aa8278cc4c3bc67360e.1660931225.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660931225.git.yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=NGV7Qj2+FtddG2MPkPxoZvAKz3YppwAbDSr20ym7r5w=;
 b=CTnLoPBqonCoKd6M5cFRjIcbt0BtwTIqwys5QR+CL4RdGvlToiGj0fCEJ7UbG+Ck9L
 JJrYU7f0jWp/6R3X23BZWftPR2VuimQBS9QhQ69bmKYd+2cXVhx0ExG/wv+091Q0Gmt4
 EK2ZCAwEinnKQHyECQrZDMo7SE1kQ6hBkZcACM1ZttXgXHU1BDeEEMFeTujfZiAfetKP
 PCtl6s+aWm4BEw6bikCSBhmohsAlBhFL6Wb+saHgRGG9KeuA0m7rSmieE73iRYp1RENf
 5tAsMOpgXUif3QAR6ov7SQ7OrHaq4SgankndJh7MfVz9qRC6zwi4OK2/4oLTknfcFh+U
 Rpzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CTnLoPBq
Subject: [Buildroot] [PATCH 2/4] package/dracut: allow users to provide
 their own modules
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dracut modules can only be looked for in HOST_DIR/lib/dracut/modules.d/
and dracut does not offer the possibility to look elsewhere.

Installing files in HOST_DIR/ can do done either from a host-package, or
via a post-built script; there is no overlay like there is for target/.
This is a bit cumbersome.

Add an option to the host-dracut package, so users can point to a list
of modules to install.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/dracut/Config.in.host | 11 +++++++++++
 package/dracut/dracut.mk      |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 18f562b310..5756dbd43f 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -7,3 +7,14 @@ config BR2_PACKAGE_HOST_DRACUT
 	  and combining it with the dracut framework.
 
 	  https://dracut.wiki.kernel.org
+
+if BR2_PACKAGE_HOST_DRACUT
+
+config BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES
+	string "extra dracut modules"
+	help
+	  Space-separated list of directories containing dracut modules
+	  to install. The modules will be installed alongside the ones
+	  bundled with dracut.
+
+endif
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 2b6a144aac..96fa7db6ba 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -19,6 +19,15 @@ define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 endef
 HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 
+HOST_DRACUT_EXTRA_MODULES = $(call qstrip,$(BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES))
+define HOST_DRACUT_INSTALL_EXTRA_MODULES
+	$(Q)mkdir -p $(HOST_DIR)/lib/dracut/modules.d/
+	$(foreach m,$(HOST_DRACUT_EXTRA_MODULES), \
+		cp -a $(m)/* $(HOST_DIR)/lib/dracut/modules.d/
+	)
+endef
+HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_INSTALL_EXTRA_MODULES
+
 # When using uClibc or musl, there must be "ld-uClibc.so.1" or
 # "ld-musl-x.so" symlinks, respectively - else the init process cannot
 # start
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
