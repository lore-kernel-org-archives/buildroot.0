Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE60C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 07:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14C498413D;
	Mon,  6 Jun 2022 07:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6n5YGjLUrtkD; Mon,  6 Jun 2022 07:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C02F8412C;
	Mon,  6 Jun 2022 07:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3B1F1BF30C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A224840470
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 07:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMYTUHzOdk9O for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 07:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0944010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 07:56:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so9557557wme.5
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GzS9cUcpv66+D9RQucCaSzYSGW4ySyGpmM4DYAVrWtQ=;
 b=fRNXRosM8vE9mqMsafpWocLvQn51ws31YudAWcMh4Wy3PDlx4Umh9FwQ2fO97YFUMv
 Q8dD3EMw6rSejkx/KjoAR8KyOCaVGK+r3LP8NMPISm52HeIvfcxwYs45S94aci1cmcMk
 zfa9TUBuuG59qfbh0nXnRm1EkINd5ov7xc2CjrnQu53vEX7Rfh/UL2D3WJRt/eCP4Gsg
 hCoo5LCT7FNzRCfeVkM6hmzVBxw9mKbay+m5jQ4h5SSFyz+uFG7vA1lZ5d7+MwO6rave
 +x28FBr1tVZa9i5+qqlnCdi+VmrxngbZBA/xl86JS6MUG9Nc/JR3foFG9gijAmWlK1xj
 MFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GzS9cUcpv66+D9RQucCaSzYSGW4ySyGpmM4DYAVrWtQ=;
 b=yXZrsglwQGz9tQoSogc1LFSlE/xaxoEQvH3QyQZ3u64FSFkvgk74YXa8zh+M+4iwgD
 45sA58teaUO1fk/19L8XpUitYBBsf/7HzG0sq54H/MEE2ggkWEZrDfv6u2D24+BpgVC4
 Zt+BnyWnIOu4Qro/Qqle7tWWmEDu2JbJm2zei5HKjyF4DVAqxSfi5T7hzmyEV0mDXO1E
 4Tjygky3TsWf2ccmi11Yzc86HLSKcmbs+TGNBraYXD72fa4ZOC6URWqMCc6UmeMwLm0l
 fQGPtV8JYaJA5YJnImuSlhBLwLWUtFLQv49smJGEGgZNnpAFKNzInW7lIORFKBrtLjJc
 KKvQ==
X-Gm-Message-State: AOAM533AWRNNPWhijrJy5hBmyUBvj9cbshECK24itukJymcH5O9VO+SI
 6YOQ4HgKwoplbPnItbXbyMaQD2O+amQ=
X-Google-Smtp-Source: ABdhPJwy6OfaWwuKu75KE+EQ5qX2NKcyySwDNE6t8F8pH/vfHBO5u8OGnPB4miDevV1iNd1Z5UUcHA==
X-Received: by 2002:a05:600c:10cb:b0:39c:4e74:2b41 with SMTP id
 l11-20020a05600c10cb00b0039c4e742b41mr4543222wmd.130.1654502191504; 
 Mon, 06 Jun 2022 00:56:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b0039c45fc58c4sm7140490wma.21.2022.06.06.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 00:56:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 09:53:25 +0200
Message-Id: <20220606075325.70794-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with ARMv6 raised since commit
d69d40c029dc7d8199b745eaee759d92b66c5d17:

rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz: OK (sha256: 83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e)
wget --passive-ftp -nd -t 3 -O '/nvmedata/autobuild/instance-20/output-1/build/.rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz.rnWGvt/output' 'https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz'
--2022-06-05 12:30:08--  https://static.rust-lang.org/dist/rust-std-1.60.0-armeb-unknown-linux-musleabi.tar.xz
Resolving static.rust-lang.org (static.rust-lang.org)... 108.156.120.70, 108.156.120.75, 108.156.120.122, ...
Connecting to static.rust-lang.org (static.rust-lang.org)|108.156.120.70|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2022-06-05 12:30:08 ERROR 404: Not Found.

Fixes:
 - http://autobuild.buildroot.org/results/4b187767c233f0dae3fa7f8fea9dd67e2b5bb7d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rustc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index a86d95236d..9ce0f62592 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -114,6 +114,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv5te" if BR2_ARM_CPU_ARMV5
+	default "arm" if BR2_ARM_CPU_ARMV6
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
 	default "riscv64gc" if BR2_RISCV_64
 	default BR2_ARCH
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
