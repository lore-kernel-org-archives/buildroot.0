Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96355C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 11:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 062AA813EC;
	Sat, 29 Oct 2022 11:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 062AA813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6w4F0rYpfxKJ; Sat, 29 Oct 2022 11:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414FA813E0;
	Sat, 29 Oct 2022 11:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414FA813E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6A951BF3B8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88836606E6
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88836606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmrwrJ8v3TxF for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 11:09:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF1060672
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEF1060672
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 11:09:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v1so9595200wrt.11
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yVLwOTZt9qCzCUleIiR9EyrHrdQe7nQ3VYeZb1asH08=;
 b=fBFFswSQRG2vZPi7Utxr8oYNmt8cuCswx0Z0hWm4zSlPLE1e8/2E2g8wk8NkfmiVAq
 l71V9/2MyfcQooCI5AzezUyxs3+8VRa/U2+CZseA/SI86sKy5K4Z36tuYHeRMtYrCMk/
 K4K08mmWehY4zeWm8BkW7ImSfvKyHWF3uouSCbRf68d7LAHrVSBbq2ubKgFqMjTe5Y4f
 KwPr/DlkbWn/ikCWZuDhbWgDzaOsf/a55ysJoDTF5sedFFGrCrjhUK+brHP/3QJaV482
 SLmwKrxINBbTIOOOiF5Ue1Z8U69lehtp9NdllSv2YNuE3K1eIvNN7R09e7l3aL8b5mDL
 xKqw==
X-Gm-Message-State: ACrzQf1VAqgtduTML4VXA5zODbJHbUAoS+g0E0NV2PGSrLjnp35Nw9xt
 QKY8OQqRq+01n5y8K8jtXHJHWVRYSWMU/qfB
X-Google-Smtp-Source: AMsMyM7t/7QHWYMcKFBw4iuIwuJdWDBcIn2b6/lflk3viBmJ6UxHrX8TBiTKBlpxacpbIiwVc7hTXw==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr2076380wrr.361.1667041789423; 
 Sat, 29 Oct 2022 04:09:49 -0700 (PDT)
Received: from gleb-linux..
 (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net. [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003c64c186206sm1376054wms.16.2022.10.29.04.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:09:48 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 12:09:42 +0100
Message-Id: <20221029110943.155259-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yVLwOTZt9qCzCUleIiR9EyrHrdQe7nQ3VYeZb1asH08=;
 b=aoPro+FZKfBKFCz/Bo609MNr4imTCKdYrU5ogGJr61Tk46mlW2PxA95DwJ4D8mqozm
 u5c/ejbLrNCwSlqOa5B8QFgd3EU2MWzQaJgK2A2eyAMcPiWXA6r23e2STGkSxLod6C9g
 5NOqbdtKnKYrLu3ypQKCiwLHAqvB8E4JY/rMV6VOrRdlYzHmpCIJqLgit5s0WPFw2sqL
 k2jCkSWtO1QNGHTPJWvm8jnnupucDrGIIx23lFlko+GrT0KeOY1svcShYeQUvr+fkUv5
 O5jg/sV//nx7IpFlgLsY3blt0YDY7SgbDvg86dwrbLoWTZyWUq/AIqJ6XvtnzEG8OyVY
 /d2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aoPro+FZ
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: unset CMAKE_GENERATOR
 vars
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the user environment defines `CMAKE_GENERATOR` (e.g.
`CMAKE_GENERATOR=Ninja`), buildroot would previously fail to build cmake
packages because buildroot uses `make` explicitly (as opposed to
`cmake --build`).

Unsets all the `CMAKE_GENERATOR*` variables before configuring a cmake
package.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 081960b5bf..96b2579cc5 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,6 +86,7 @@ define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
@@ -111,6 +112,7 @@ define $(2)_CONFIGURE_CMDS
 	(mkdir -p $$($$(PKG)_BUILDDIR) && \
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \
 	PATH=$$(BR_PATH) \
 	PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
