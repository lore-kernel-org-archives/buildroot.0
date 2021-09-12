Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F418C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95E860FED
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D95E860FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E5460BE6;
	Sun, 12 Sep 2021 14:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XTu7Rvuo_tR; Sun, 12 Sep 2021 14:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17BB960BEF;
	Sun, 12 Sep 2021 14:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4944C1BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37D874014E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aijfZ6dk0J-9 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 610FF4013A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3720230wme.0
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yom0kPihC5IHRANhIPorSF6jAiwrxaBGJkItIQSlBjA=;
 b=QDTRCcwbzbW6Q1mp80ojqs+r8DIAuGMRVCtQI/7iJGqVjVSZdN7CbpIrq63HhGkdc2
 L7u6FYEaK1O0MaPrLXeDjgGlCZZnX5netPX/Zu0Ah25COzcrF4rr/WB3CxwOsG6LQ3yr
 vIlHxkRecAlv/b4kLNTwubqgzUQ5m4yIGUTEfVJGUIvZdl8nLha5zJasnMz4Wlm6HKTN
 MkK3iu7ch6SuG5tzsKXdCedDWzleiwahT/9u0UAWo5+RLdxoZiNlbQXuOi4VwNlN43FM
 RGj9Y5wHNy3zC6STK0yRpP0XBGioZqY/otfKiS31aIb4ldjN58hJjXx3TbimvOPemYd+
 eqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yom0kPihC5IHRANhIPorSF6jAiwrxaBGJkItIQSlBjA=;
 b=ZVw/M+IOIvkbmVYqXQd7UG0jpMTXsZxbTx4kztTtDlcEH0gp5HciutbOU+iRHnYAIv
 SsommhojYu1Jji7Ru1pPOF/oWz0Ep01iUo2mAcgI2R4BhBPu/Q5KDy9rA2PA3UW1eQlE
 BzdM88ELOuFXTBlB60FcdMkDM9IXaF+jA46FW01rEMr93n5qSEtBS+hpRYmVujuDX68Z
 /VTQ/G4ywg6sx0ONgbSP8DB6MnGGehEuccOT+IH+P7UO+dRD+JLtH3UPCKlZA1ZKby41
 2Xhnh6jeSyuekpL3SOoAs+2t1T4NskOMwF8c1TKjeyNi5tEt+ea9zsCV+Q9KVFc5OQiq
 Vk8A==
X-Gm-Message-State: AOAM532fu16Oq0dhdkxdGgPK9fLjS6ELq62QA1NjOJ7bclcnO2ZiTVIc
 c7CHWVHlt+O4H/acrnbHss/eESJ/Cts=
X-Google-Smtp-Source: ABdhPJzMANqIRcI05iktTyCgMPj/3ajI2cmpxRdjrzU0qRZ4gBKaASLLKwKPW44SR5PESyfCNteRHg==
X-Received: by 2002:a1c:2684:: with SMTP id m126mr6961418wmm.65.1631455910715; 
 Sun, 12 Sep 2021 07:11:50 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:33 +0200
Message-Id: <20210912141140.253778-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/16] support/testing: test_openssh: use a
 prebuilt toolchain
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Switch from the Buildroot internal toolchain for armv5 to
the prebuilt Bootlin external toolchain.

The test doesn't require to build a toolchain, there was
no prebuilt glibc toolchain recent enough at the time this
test has been introduced.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_openssh.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index 490147f86f..4b48059573 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -47,9 +47,8 @@ class TestOpenSshGlibc(TestOpensshBase):
         TestOpensshBase.opensshconfig + \
         """
         BR2_arm=y
-        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-        BR2_KERNEL_HEADERS_4_19=y
-        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
