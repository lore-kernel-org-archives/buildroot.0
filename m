Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27602FD0073
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A709A81700;
	Sun,  1 Mar 2026 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6xz00i0xm89; Sun,  1 Mar 2026 19:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AA8481573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772393835;
	bh=L/rlwhxxZEJ8tUli+FxEtIJ4LN8KBl/wuNp4Afy2fe4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AYni5dJWmx8cHHpy49lCkCLbg7kH3iBwhmxTnwsofEKgq46fa3Dj4jkeAINcpofTK
	 B2dac2kiil+vwM5C2Zf0zg75+spisW+Cn6omfkfdxxS1BtQbuIp/bt6wBMDO7ZfJbu
	 gjIxeosYaBetKDZdH4kTokd+PyZLwzklczzwym3pTjqcCVKWhXDGgwhfA7n6iTrYjR
	 7rlj5ZdS+wZN9CqK4JbVTFg0gbLBd78DX41aAQAS8C+UiGP7Ry53hioMwq4AzjACMa
	 B7Bbs94FykJg+bH7IGytxXT11/Gr5rkfRvZ5aogPBWaSv/T1RJtdLwY4VfEvzUQ+4R
	 K7nw4Kvt3szfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AA8481573;
	Sun,  1 Mar 2026 19:37:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 390B624E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ED3E407F8
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQeG5MMzSxYT for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 19:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 924AC40426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 924AC40426
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 924AC40426
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 19:37:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12A94A4C308C;
 Sun,  1 Mar 2026 20:37:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54538)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwmbF-000000004PP-03vM;
 Sun, 01 Mar 2026 19:37:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jared Bents <jared.bents@rockwellcollins.com>
Date: Sun,  1 Mar 2026 20:37:08 +0100
Message-ID: <20260301193708.3268222-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772393829;
 bh=gdCzcCy9mZDfZOerp8/R+IvtICqXXFfjcsedd+zRGfE=;
 h=From:To:Cc:Subject:Date:From;
 b=PAu4tcNEFgSwKYRtnYMw84mwlKBjrD2mWdd+Nruq2gATFJ9HtERGYJ4CtKk/duSMR
 Wk3gvj9nfS9qEFBt5zUp0EHUMJTXFZdpnh9Ae3OdEUKmLzKgBX5KuvKLsoQkOb5O3v
 bdp1oq38C/xIW8Fgb2139Xib2jqql71kqcEomWvYsd/grIeeK/iZimh7Y/CkJj0Rq4
 mOu/febig4fMuVEkxBeQEnq5XV4jcXJ5gGd59gtzWWuCaPq9hveQ/ORYSCUTy45XbC
 CGkxeol9odwboXPPCjyuwyNwE2ErVMt4v/qcGI6L2YUCPXKBveDe6GgfJNKySqVpFM
 gMuBDt+GZh9YA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PAu4tcNE
Subject: [Buildroot] [PATCH 1/1] package/libvirt: fix dependency of lxc
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Buildroot commit ed12e2fbed3d4298ebff9da54fe56b91fa75c41e in 2021 added
BR2_PACKAGE_LIBVIRT_LXC which selects BR2_PACKAGE_LXC but did not add
the dependency !BR2_TOOLCHAIN_USES_UCLIBC which was added to lxc in
2019 by buildroot commit 63aad8a53e33e3fae4793e05662f47637e9e9bfc
causing Kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LXC
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y]
    && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
    && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y]
  Selected by [y]:
  - BR2_PACKAGE_LIBVIRT_LXC [=y] && BR2_PACKAGE_LIBVIRT [=y]
      && BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvirt/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 5664f69dd8..0f73128d09 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -89,12 +89,14 @@ comment "qemu needs a toolchain with gcc >= 8"
 config BR2_PACKAGE_LIBVIRT_LXC
 	bool "lxc"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # lxc
 	select BR2_PACKAGE_LXC
 	help
 	  Linux Container support
 
-comment "lxc needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+comment "lxc needs a glibc or musl toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
