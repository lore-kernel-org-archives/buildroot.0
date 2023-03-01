Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93873C64EC7
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 00:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 021D1402B1;
	Wed,  1 Mar 2023 00:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021D1402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfd47fx4ECuF; Wed,  1 Mar 2023 00:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 427AF4026F;
	Wed,  1 Mar 2023 00:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427AF4026F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D01D1BF94D
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 00:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 336B4416C6
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 00:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336B4416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ErfabTM1isW2 for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 00:55:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9391D416C4
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9391D416C4
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 00:55:01 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id a2so1895392plm.4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:55:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HFp5BW5k6K49f4o7H9B0LVjAeoaO5APAvEGdnx9+8Tc=;
 b=cj5xcyAcij9hWoItaXwidVpRVLjk3GIIYRwLp8isxVbieLISs+i8lFCA/JYx8LE+va
 14JroP1Hmm3ThO2Ob070EegBe9U94Ejp9dQcPVLnD1GO1gq3/SjNWyB5fGtmfoo0Qpik
 sLUnin9yl1T8NkRnt2i0xU19myP7wrTpvbjo+Warv/V73p+Wwbg/aGUkEMSnWL7dq8U9
 4BsT4Bucb5AfWs4Xwb/EtjtFjt0tNx0anqoIFJ94Qw1jrLQItjyiQadwY05xxlaI7Br+
 Ub2hJQoHFQyt/cNbP2hSG2aweTCfnt/fE4tnDn7IvPrBMqeL0d3ZQt5jktAVg0onN9vS
 Vx2Q==
X-Gm-Message-State: AO0yUKVPrnb/OOEukY5hlh72xXkn5T8sHqTMnE1PZLPh+/7+0P8ncV76
 JwyuATHIPDbah1/pLYKKBrHKB318cXnKjA==
X-Google-Smtp-Source: AK7set+OioZ/WtxbXK0jO7SwjeGQNuZ/hJS8MOAyfj3uY48VwE8c46nOwwLqQTDRaqa05GsKufjXXg==
X-Received: by 2002:a17:902:ab1e:b0:192:4f85:b91d with SMTP id
 ik30-20020a170902ab1e00b001924f85b91dmr4448976plb.46.1677632100101; 
 Tue, 28 Feb 2023 16:55:00 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170902d90400b00198ac2769aesm7038993plz.135.2023.02.28.16.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 16:54:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:54:56 -0800
Message-Id: <20230301005456.250709-1-christian@paral.in>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/qemu: check if qemu-system is
 enabled when creating symlink
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

Commit c6b9cd9a11fe7fec6bfec2ddbd42c2851dba0011 added a symlink to qemu-system
as a post install hook. However, it does not check if qemu-system is actually
enabled with BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE.

Add the check to make sure we only create the symlink if that is enabled.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/qemu/qemu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 58b4ff10a5..cc8dc42a24 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -488,10 +488,12 @@ define HOST_QEMU_INSTALL_CMDS
 endef
 
 # install symlink to qemu-system
+ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
 define HOST_QEMU_POST_INSTALL_SYMLINK
 	ln -sf ./qemu-system-$(HOST_QEMU_ARCH) $(HOST_DIR)/bin/qemu-system
 endef
 HOST_QEMU_POST_INSTALL_HOOKS += HOST_QEMU_POST_INSTALL_SYMLINK
+endif
 
 $(eval $(host-generic-package))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
