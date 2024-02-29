Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE26C54E49
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 13:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC986822F2;
	Thu, 29 Feb 2024 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Plz6Y61iTW3R; Thu, 29 Feb 2024 13:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08064822FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08064822FC;
	Thu, 29 Feb 2024 13:11:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBB511BF2EF
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6575608FA
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_aT232mZQwW for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 13:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DD886086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD886086C
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD886086C
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 13:11:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d568fbf62so490526f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 05:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709212272; x=1709817072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iC5O2ZnzfFN7RDxph9Ki1u8Ev/uNb0b038MRQdA7E4A=;
 b=tyBm+14X2Ip4mp7U57Vc+977HBDATjoE/kU2Q/G/vjJm/Y/3x3dQQmtgimQfmaLmSy
 P43Kvu4eM8bNSl0yKCqKLSu2M7x/QreHHhlEZ0bexcYzvNnjDWT2VYWfibTMbuB7WOI2
 GzFonUceZtEODiG3DKq4UBhGJn2YbrpdLGu/nGJbH5i3t29nXTWscf9IFfvP3lso+cXx
 KAZK9NnB49lQM0saMhyt3UgjwP08321Le9FkRNbFSq5UTK5OFUQh06C6XfmQ2/lB03WS
 gKOA6oqIzBXcmLV3tYgMrt2d7rACA5UaR36r3lIzI0HaR7eGkM7BBTSj0yBBIdCz785c
 NZZw==
X-Gm-Message-State: AOJu0YyoQh7t98wYeNNyGyHsdP9nXbg8dWHBZj0e94rKA/Ybf7ziE8Uq
 GbK+4XjY/QjGmalVeVOkvoqBFFhqxj2OatonJMbaiNtcPFvL/cPlkJqEzgTBBpahqrHQDDW5mwM
 N
X-Google-Smtp-Source: AGHT+IHMYmjbbq+PhOpUltO5iDRmUi6D/J8WuIDQzeKgRVEWX55s2RtNSanMB0r6xftjanEgfKhwCA==
X-Received: by 2002:adf:fe50:0:b0:33d:d7be:5850 with SMTP id
 m16-20020adffe50000000b0033dd7be5850mr1355335wrs.65.1709212271580; 
 Thu, 29 Feb 2024 05:11:11 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a5d59c6000000b0033d926bf7b5sm1796562wry.76.2024.02.29.05.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 05:11:11 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 14:11:07 +0100
Message-ID: <20240229131108.363533-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709212272; x=1709817072;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iC5O2ZnzfFN7RDxph9Ki1u8Ev/uNb0b038MRQdA7E4A=;
 b=yJTtS9eBpBx73/vtWSkAPd58sFc2fK9hz23ygpfKTQ2A2x7Mtfje4z8cFvG+qRz/XX
 unY4D1qzHS6nas2nOrrrFzqnr/JUjFeiECbtv43eLXrdv28T1YSjTDbuNl76VZ9jjn/R
 ihrbH7MzfsVp9Nta9Ucv/4ABas/KrDm/L2UUTokxyfpUm/zdZALGfZV+cAd1Q++i/INa
 WJHX9l++rGBBN9Rsq6TXPrr1qbBZRkYnPP+ALmxCJlUaizazMD6BfznCnfJxmiCu2RHE
 X+mmAdsmTvg4LE0ukaLz/oEnTZjkfj7QXS13X4kEc52nyeKV9bxtqcxsP+nulgGL58tg
 wvSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yJTtS9eB
Subject: [Buildroot] [PATCH 1/2] package/rust: use host libraries from
 HOST_DIR
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-rust package depends on several host packages to provide tools and
libraries but it doesn't take into account HOST_DIR while building rustc
compiler. Indeed, rustc needs zlib and fail to link if zlib is not
installed on the host.

  error: could not compile `rustc_driver` (lib) due to previous error

If zlib is installed on the host, we can notice it with ldd tool (while
it should be linked with the one provided by Buildroot host-zlib).

  ldd [...]TestRust/host/bin/rustc
  libz.so.1 => /lib64/libz.so.1

Provide HOST_LDFLAGS using llvm.ldflags in config.toml.
(HOST_LDFLAGS provide -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib)

With that fixed, rustc_driver link with libz from HOST_DIR but the
host-rust build still fail later due to another issue.

  error: could not compile `rustdoc-tool` (bin "rustdoc_tool_binary") due to previous error

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6256881545
http://autobuild.buildroot.org/results/a6b/a6b28783f29e6b729824bf42679a62f72ad5bee0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index f7a5c0fcd5..c464e77f4f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -64,6 +64,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
 		echo 'ninja = false'; \
+		echo 'ldflags = "$(HOST_LDFLAGS)"'; \
 	) > $(@D)/config.toml
 endef
 
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
