Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAB6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74FD540261;
	Sun,  5 Dec 2021 00:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjesOjBTK1gy; Sun,  5 Dec 2021 00:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 809434040E;
	Sun,  5 Dec 2021 00:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D7F01BF963
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A299403C1
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwpXHDhYEXuG for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F59A40306
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:20 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id s6so1126366ild.9
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BlFOKLNy1AwmZDkm9JhIJViT/ZhpmEANQ5YvPALObQ=;
 b=kjfWM7HDCzTwgPykRNujjacWFBFH4aAHVizxZSGsQBnwVFY2qE324hcnVFDrsIrvNY
 g20rLdnHYfSY/oefx8v5B2om9iElhtwBqJwSTqs1lWLc03M3fXKsoRf6oj5wAO60mcHY
 jcDosaYWxcGdbubiDHLLB5eN/k5Bnq1G2yjEYnctZU+uiPFky0m61X54qfPMeWnuP9cZ
 RkmyxX35K6MZOS2i89FFjxwo5EWzdSzuooByB5TpXpI4hF2ADY32xmtZDFSLVnIuXSmp
 TJ0+DA8QObTEOC9PPr4bxmgl3O8IR84Y+8UmzVDW8YE0T5T+6MOW+SF+aunxg/F5NyoU
 FDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BlFOKLNy1AwmZDkm9JhIJViT/ZhpmEANQ5YvPALObQ=;
 b=2fkJEUlm/LElhNcrNINZJg/RXYY/Z1FMwJ3lBIog8ZNHQCXKtqW8fQMEANhMyXORDw
 1DxeGL85VIrAPJOKpWobB1kmaa+FT+yW01Dh7yoZZWckwSulSF6XDdjGjBC4/Ufz4lss
 YUYt611mPptsORknbL9PxFlFpTvv/xVMnFvJnYb/8xV0RhWux0V17w1XztHOT0jvLW3Y
 4HwgtXwdiCD6+fnFgDQbxkkCh5bOm8WMWlRb2IluY8s0IIGfK5fVSB23WIHer10/3W4W
 K2l+cx0L2nLUsyGwAiFSYfC5kRXHngByMJbtGCsHw0/Fv4GN60QSeZcGmY798GgNUjEW
 ad9A==
X-Gm-Message-State: AOAM531g9W/tcnMP3/zlUhBVgi00NZhzi9fGtGio6FjLqo29n8Z9r8SX
 zbCjqxw7XCYZnGe3NGwvz7qbSAXVU4s=
X-Google-Smtp-Source: ABdhPJx2iGaP8XU03KmiK0IFyKhKLLy0DImDmUKQY3zW0YhFOo0+XpRrD8m+FclCetRSGlQMogR+CA==
X-Received: by 2002:a05:6e02:2144:: with SMTP id
 d4mr27794136ilv.11.1638665659120; 
 Sat, 04 Dec 2021 16:54:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:07 -0700
Message-Id: <20211205005412.2888068-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/7] package/network-manager: add optional
 iwd support
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
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ea47e0797e..5d836d0bbc 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -42,6 +42,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_IWD),y)
+NETWORK_MANAGER_DEPENDENCIES += iwd
+NETWORK_MANAGER_CONF_OPTS += --with-iwd=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --with-iwd=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
 NETWORK_MANAGER_CONF_OPTS += --enable-concheck
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
