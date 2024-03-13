Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA0C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F41FC40ACA;
	Wed, 13 Mar 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uWBOcuEzL7H; Wed, 13 Mar 2024 09:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3D74157C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E3D74157C;
	Wed, 13 Mar 2024 09:14:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42DB51BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B0F4813BA
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flyITivrpZyt for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54DA78133B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DA78133B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54DA78133B
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-413e7b96403so3279575e9.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321267; x=1710926067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2vNNDKDdf+hrqvFtbXUfgjH/i78Bjdgv58bRCzV3cg=;
 b=onaUyMh5Wx35Bs0s01GL+nJNO9Ude2/OKTj13dPn2uWrefwiwJgJFxn2wFaPEhAO4q
 QJ41uV8EJ10tMUbLkDasMWibOhU3MB17NiH6z8VNB8yndV+rdhwBWuaatJTPlReHRvEG
 qAgIjVfJp1mONNroEHcrXo1bABniB8mXyMKgssgWHiuornv31G6W4qGKhJfrbCaQKiCj
 1fVtrJfGH7U43wLgyVtEeqlNjJgOjDP4UD6nrBANXLNxnLgSugvbv2cXrqvioFJwlZt9
 DGPoQr/lHlWPq6jwsOlTRXEIxGHSLXGbI8OHWUcDguTiOFOMKs0FKf2z1pd3h0y/elyO
 ADxA==
X-Gm-Message-State: AOJu0Yw+Mz6CzEWorzni4T9cVZ81FiJMHP5u7jWm3q/FrRUg1UMAB7hz
 tU/Vn1gXZxC8f+K5lS5TIMt0rzz0Xbw3t29f/xAsXRaiBBvQrVezauo6p0E+grM=
X-Google-Smtp-Source: AGHT+IFekS6iZLALBCMfs5ZkXWtppIMxg4wiIJ40dTZRb4UaEV+dXhMbonu4VMvTxIvAjWO6JTUBMw==
X-Received: by 2002:a05:600c:19d0:b0:412:ff72:a6f1 with SMTP id
 u16-20020a05600c19d000b00412ff72a6f1mr8897827wmq.38.1710321267432; 
 Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:52 +0100
Message-Id: <20240313091412.20865-11-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321267; x=1710926067; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2vNNDKDdf+hrqvFtbXUfgjH/i78Bjdgv58bRCzV3cg=;
 b=ObadJ6gPPcY9LoskFga537ifs8nBwkFVKJOx0/cDljqC9S2fS1h19x1f7Qgr28141j
 e3CAySwpEQT3JCZ+roUtiV6NLfpsCIDPNqUWP8VgxYhA/gt+t8BbaTNFeghFY/9XBHbf
 fQ8mrEp+oG7NdgfwTzHSqgLqUgW/ZV6ugD9s4DYu6sMlEYqbj7nufpXI+gCi9YDx+T9b
 pot30B+Sd8KenE5YB613NCPyRzVDEj62mKwJxVQs7arhbXrL4nBAb2fb4UE2iWlg720D
 JaAINe0qlPYtOtb7jLJpxAT8MFZC7cAPI7Rohwhlvo6N1FD3vVMVOriCAc66OCYz2uLG
 LW6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ObadJ6gP
Subject: [Buildroot] [PATCH 11/31] package/hdparm: disable busybox hdparm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/hdparm/hdparm.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 3c8b77e5e..78132b47e 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -20,4 +20,8 @@ define HDPARM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/hdparm $(TARGET_DIR)/sbin/hdparm
 endef
 
+define HDPARM_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_HDPARM)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
