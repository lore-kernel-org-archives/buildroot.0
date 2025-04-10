Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F611C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 21:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 498C161AC5;
	Thu, 10 Apr 2025 21:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vWpGmTjEiMK; Thu, 10 Apr 2025 21:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDD0607B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FDD0607B7;
	Thu, 10 Apr 2025 21:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 533CF108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44ADD80C7A
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8psrkJ6OAd0 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 21:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CAE8C84010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAE8C84010
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAE8C84010
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 21:05:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 64883B00579;
 Thu, 10 Apr 2025 23:05:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
	Julien Olivain <ju.o@free.fr>
Date: Thu, 10 Apr 2025 23:05:13 +0200
Message-ID: <20250410210513.1511537-2-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410210513.1511537-1-ju.o@free.fr>
References: <20250410210513.1511537-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744319131;
 bh=+XaJJyWFtdqwGwnJgqF9YvXcTOpDio1phyjB2pkqbFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C13+EbKB8UWFvVJz5bU/OObwaNNIAbFUkRwwbyGj/Fb/nznW7T+tOSJ3DrBWRIeiJ
 mOWq8F7kWXoXARSq40e9hq8iXRl+LdZwkTvY6/7QUAzt4LKOhD1Zf6cUJvtUq90vWW
 3b06bdKs7X2VQ2EFpEFyFL34sqrNSwekLIpDQ0p/eOQeZJEJWjSBRyYZlwkM9aBC+E
 2AXumi+rrcSiaqXeKnaSKrRgY0LI5H8r7Nr1lo8zoowYNPKBuZDrmvMr2i6E9PzSIm
 IJB2+Bz2XCeKbQcGxsx+XgxtqLI8vGmAM+nM97wXNGxxMmK74CfOSiDox+B7SexbZw
 /gIi/QV93lRxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C13+EbKB
Subject: [Buildroot] [PATCH 2/2] configs/hifive_unmatched: add missing uboot
 custom hash file
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

Commit [1] introduced the hifive_unmatched_defconfig with
BR2_DOWNLOAD_FORCE_CHECK_HASH enabled and with custom hash files.
But it forgot to add the custom hash for uboot. It was not detected
at that time because the U-Boot version was the same as the default
"latest" version and was providing its hash.

This defconfig fails to build since the default "latest" was bumped
in commit [2].

This commit fixes the issue by adding the missing uboot hash.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9677167053

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f9cc5dbd453c80790c1f2f7e9b19a85ded5979be
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/c14ce5346d969e660cc788f2f4d8619b27c805a2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sifive/hifive-unmatched/patches/uboot/uboot.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 board/sifive/hifive-unmatched/patches/uboot/uboot.hash

diff --git a/board/sifive/hifive-unmatched/patches/uboot/uboot.hash b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
