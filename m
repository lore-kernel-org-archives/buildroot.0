Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA1CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:51:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62EBF60F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62EBF60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEF583BB6;
	Wed,  4 Aug 2021 09:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qv7-L4_HQsT4; Wed,  4 Aug 2021 09:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBFF83BA5;
	Wed,  4 Aug 2021 09:51:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C8B21BF4DA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88CAC4058F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACBVc3s0Gbjl for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 09:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0804404F4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 09:51:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso3497606wms.1
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0nnzecRTR4ZlpJsVAMGPwiiLi7Ni56/Iai0nra3Edw=;
 b=DgjIi/z3o5rg/jVa8Xv6m9M5+IpWdeeJ9gYoi35vAoa3aQjUA9EOAhTK7WqZunb3Fl
 dmp4bK1KTHpfDFkkSt7jw44Pz5Ru3DS9M5vGD8C36qO7Xzo/O3tZ8qlqryqeg/a/tFuB
 HjoAjDBUMelvY1eDZOhpjBXU/kNOl3X7kQJW3l7AfNXYPoKA9tfJYC70rxtQnCagNA2Z
 E8xpwyp69k1uvUrCfq+cQHYqek/33Hkw/xVFeaS3BW8UmhHw0ZrTgcJDWB0f5n7OGRnG
 XggmXdLx/ZuZvAe2rhHDtxWuVYuGECCJCsIwnzqVtbBkXuWd/mypzQnREbUiroRE9H98
 ax/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q0nnzecRTR4ZlpJsVAMGPwiiLi7Ni56/Iai0nra3Edw=;
 b=Md7jknURBdLCPEtyuIkXVYVfXSi0qN2Zi90jYvwBn6irohLltAfNsAkodjB+Z7Yhp2
 VytjIRFvMqXfkEJ5LGuFUtLuZffJKXMSFytCbA55sXB8q/6bJDu4uZ4rjucuylwNApz+
 95o9SoWf2Ce2gLIuBqQLg6yKNbWiwn8CJA3Y/tX0oF9NOYvkLBYKpoAB+dtwwktmntZR
 H5SnL1EcAx4KEbcaRkbQrU/yniayifcJyOvxxzWlza4HSUzT+hZVc/lmBpmPcJZA8/FH
 A1KdWJ9YuzueBzgLyDikosxpZIgviMLznnv2aXuSQM5vuOaIkPCzhUPxpPx0PBPIPUWy
 HZPA==
X-Gm-Message-State: AOAM531AgNE+E8e1EkYm/j2YzDevObcZv/qGAMc9goe3NBgbc8ECwHOk
 o14I8KrgcLDzeB+OiZ/zny/eZQmkUyijmg==
X-Google-Smtp-Source: ABdhPJzO6dMIRjNUljUL2wWyD4r6vZM5VcZs5Dci9t3ovw8UiKk5IUh0lJUsWUu4E7rPD6qVlI73FQ==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr8916319wmb.5.1628070698689;
 Wed, 04 Aug 2021 02:51:38 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id a12sm5314507wmj.22.2021.08.04.02.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 02:51:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 11:51:29 +0200
Message-Id: <20210804095129.931129-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luaossl: requires DES support in
 openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/3e043f992f81ba1e7ad7a2c64d73425e074301a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luaossl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
index d8763e76a3..f84c59f2a0 100644
--- a/package/luaossl/Config.in
+++ b/package/luaossl/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LUAOSSL
 	bool "luaossl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
 	  5.2, and later.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
