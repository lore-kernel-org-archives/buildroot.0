Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439CEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 22:37:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AD260EB7
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 22:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7AD260EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D34B4049B;
	Mon,  6 Sep 2021 22:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-8o1jFg3A1T; Mon,  6 Sep 2021 22:37:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 594DB40480;
	Mon,  6 Sep 2021 22:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8A41BF301
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 22:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF1E060AC7
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 22:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19GThE_4bo8V for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 22:37:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75D7660A3B
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 22:37:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m9so11669245wrb.1
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 15:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yom0kPihC5IHRANhIPorSF6jAiwrxaBGJkItIQSlBjA=;
 b=QQPxvtbswkXj6e+nBdXEeFqFDq+cc0GezgMJt8P5CBXhayXPLFYnPHGvByurfuFVfa
 lbNv1WbINVzpfk/TMdfsfM1+z1NAVLHOTL2UqTGUXoascyuYXKT7hb4thmjuQvHyNtjI
 2k2r0qcY0gFwGnp/09HMKlacjcmeMA3sPfCQYVYmg8tX+1CvHlS32shgSzQ2hGVcRDeo
 +pWYAl4HmtquNuKyD3waKP+XkB8cxuQAZOgKF00cPBXhUUjiu2QfTU1LFhKbliJrIuhH
 FeVSOa3Jql8O6wFKmsIQKAAd2fxgPe6aaoBr6K6I7eGLu0/9BMZsaE8qUOl/6z1emWFE
 QQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yom0kPihC5IHRANhIPorSF6jAiwrxaBGJkItIQSlBjA=;
 b=ATJKn8itAkFeNhIW5FlbW43DS46qGpdZTUau8obB+xx0PZQvTvKdGiB+MajwpKDAFH
 1LxD+algAU/WCGvxhivmixQbL4OYNYnCOFKXOGgetBbYZGp+QV4GPvgUWFJhGJCMl1rI
 ptcdKHEfyEtH6qC386D3TdB4UWx4DR9Naq6kVw5edH7vvEO6Ro1Afn5yxkBPXBPf7fB9
 bC2cmfoi+x7hT89+NDn0K6gT197fQUGkwW48ZEBUJgA73oUndLrrE0iRzxVNzucL6oYx
 xBFMDPRuw+GDKqcDREXg3c/SW/uVS2QNlRMjsT1hhL+oOHbPeZpJ4qcX8FVQDfzzbLFJ
 JfDA==
X-Gm-Message-State: AOAM532+/DZuMy89iyZOsuLexqVx8elu9IDD2Cv82J0zzr/FS/JDNLxj
 LkzaTWmkrZmQ+E29Wan3eYyaEB0dtb4=
X-Google-Smtp-Source: ABdhPJxZAgcoixMpmOA18ijPcUYh7uN8iRkR89uUxPu6OBoaNH1sfCBumtOwDJ6QgUFGHzRfBj+DPg==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr15719016wrj.371.1630967869716; 
 Mon, 06 Sep 2021 15:37:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id x9sm672931wmi.30.2021.09.06.15.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 15:37:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 00:37:45 +0200
Message-Id: <20210906223745.3231596-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_openssh: use a prebuilt
 toolchain
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
