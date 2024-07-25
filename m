Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C93CC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 07:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1146840DF9;
	Thu, 25 Jul 2024 07:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXizr4t9-Bp0; Thu, 25 Jul 2024 07:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8CB540E34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8CB540E34;
	Thu, 25 Jul 2024 07:39:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 562DC1BF397
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 07:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FE8581B3E
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 07:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfJQ1D3eY6Tf for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 07:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 106A081B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 106A081B35
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 106A081B35
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 07:39:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42797bcfc77so4366275e9.2
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 00:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721893152; x=1722497952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AtNX17I7htbY+GKf3sfP098SWnNhBIOiwEddADhNBhU=;
 b=SCgGR4huEQ8iaxGWaq/YDcHGUe72qnmzC4aN6N+tDu2NK+fqbJtUw5Qm+tRdMfZj3k
 sUtoFUfyeHu6IiLTgh6YoR8WO0DUEF2OtHThZDPQNbdJZVlHppuuxoJLYJpyYTly2nk2
 lj5c3LFQAnHMO0Ba2pVjaaqmkOTU5avn7lDCVxW2pluPWNADzQYfWmyYZzdutfpF+dUU
 o8xeGVPAUaSEVXMDshZq2iS3Xc5Fp6hu2DrQyRlDT19RZzmBzHfgjivEJjSmgrCLnB9T
 nvqwUbH3ELZw6hFHCeS7NYdijfLmjgl6gzT3haXqSB4GWqTsX6Cmf8WHcNz3uC/l9aAr
 RzuQ==
X-Gm-Message-State: AOJu0YyhS4nxMghuEh8NPCl9cfEdXZwMBYamUUdg7qB56wxHLJ0YqtHD
 GAcBvQlUWdc0v2jR1PRRpoNKuDj6LPiA5ks2uzrgu1c/LFIrDp+/c04vGg==
X-Google-Smtp-Source: AGHT+IGqzTX3oTkCnEKK09GXFlCQmP0Te/kMzUnALxrAeOtQYyi8b4+V67rdbaywW/iSXvQ3uaujOw==
X-Received: by 2002:a05:6000:1816:b0:367:33f0:91c6 with SMTP id
 ffacd0b85a97d-36b31a58d49mr1418171f8f.62.1721893152163; 
 Thu, 25 Jul 2024 00:39:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b368622c3sm1174467f8f.100.2024.07.25.00.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 00:39:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 09:39:08 +0200
Message-ID: <20240725073908.598145-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721893152; x=1722497952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AtNX17I7htbY+GKf3sfP098SWnNhBIOiwEddADhNBhU=;
 b=UfEp0QrOFXk9UeasnEojC+PykZK2hK+XMlIECsAFN3UWrSE1b4eRalcUDo+F36w3A8
 9YM+66MeT6WR46hDX1Oam99EPNn7oANa3BlzfLIx6CGnxS/bsSNyFphr9OWthegxL/bm
 ik0ifqXS0WxuHyJ0Kzpr3nhLSUDeLEdk8JnZYwfRRiUYBnmO5L00uGhR8EXONHHIV/9f
 C4dDjrGziJ5s8un5Jj/k/QV5dNgOpyd9f55qGtLpN0ufyiLO/SXbuxGJAYwiUjHCrsng
 V76GLfIhHO3hK/+9+0ZZmae4b9lTZO55sZ95qyzJU/wupTvKUOr+HdZSoex7RhXaFnPB
 TOBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UfEp0QrO
Subject: [Buildroot] [PATCH 1/1] package/mokutil: force libopenssl
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mokutil unconditionally uses X509_get0_subject_key_id resulting in the
following build failure with libressl since its addition in commit
2e6e121496bfcbe09c018558be13733077b6df9b:

/home/autobuild/autobuild/instance-18/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/13.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: mokutil-efi_x509.o: in function `get_cert_skid':
efi_x509.c:(.text+0x4e6): undefined reference to `X509_get0_subject_key_id'

Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
 - http://autobuild.buildroot.org/results/88b549734eae4b25de1b8e1c4f04bace0a7e7418
 - http://autobuild.buildroot.org/results/05ac319bfb2a252f3dcdc5d04761f276afb53b6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mokutil/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index dd02078b4e..8895b66d20 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_MOKUTIL
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  mokutil is a tool to import or delete the machines owner
 	  keys (MOK) stored in the database of shim.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
