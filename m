Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F30C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D9E4011F;
	Tue,  4 Jan 2022 17:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zj-ypRyrEAOS; Tue,  4 Jan 2022 17:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B30414C8;
	Tue,  4 Jan 2022 17:11:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5BD61BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 926F340118
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZiFdcgqISdl for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 242F940104
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:11:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y22so151158294edq.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SJx+rj8T6EOh12cAy6++d/vX+LK/CljIySNiWsWV1qM=;
 b=JJ396u3RtqdR+v23lm3ddM/X2XAf/2hGz7l05ybaQNhNChxUIUSK6gNRvVzjDzRzG1
 P090GXGka2+cVJPen1CjRXOm+RZhv8syhU67oFGGkHjhaiUaLJKYMXhjp7zFS3j0TPTc
 j12Wz6elkQ5hcL24tm8rMNhtgm6E/mFl8RxKorWEokbjLEanJzwL9UrwnqOMA7Gk4Kwx
 E73X1+n/MPPMv4sPu0ltioO6sWjRH5K3fuQIoVVP/TsOvFMYU0kiGYMektkm6hs6v/Vn
 LfWZq7GvJJ8f6COmXfnlpPp0upPd/l7KgV/bep+yPcCTiBNELDtrYB13h1kYEQEOqG8X
 tWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SJx+rj8T6EOh12cAy6++d/vX+LK/CljIySNiWsWV1qM=;
 b=rvYLxCYmFVkOqUVDq3jA/d42sTD26kwANtQJYKqRDAaUzof0GdyyMlWXQXq/F2w0tK
 Xru2A0vc3RrPtkDn8OxKosoirh17cUbl2Fh5DFKorTyC0HndmG7On26jhsyxZVJUdt3z
 Hl4p2H1NwVNCmB+GP835nme+EdF+7WC8dzfKoWI01/LDBThXl2gk66yI/vvcw6x2GtbJ
 kPrjGiqWXMUdVjSIxoZ09SHiPdG3hNBa0/3RqsFwhccmGWrs0AZS/6h+dvKelu3v8112
 fjRVpxp7XmwZnIrYRY9zUFscsT2NnIxHJR2VcmZlZWF6F1IoOiFrXQk2AKxOfNtXS36j
 8KSg==
X-Gm-Message-State: AOAM5308qSVtLDIwM5ZX5Qljyw8qMOGF06o5ityNz+7MHlCcM4P0Aohh
 XSU15XCbnjrW295/GA7+G2DxP62I7dW3Xg==
X-Google-Smtp-Source: ABdhPJyMXTGjpTxLIje9tT4m2suBDw52HjL1DZWPCBW/1GOElGr/JOG4Iwj4Rzoy5c5KZiYZuBk7tA==
X-Received: by 2002:a17:906:4a02:: with SMTP id
 w2mr40137196eju.398.1641316297091; 
 Tue, 04 Jan 2022 09:11:37 -0800 (PST)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x20sm13181152edd.28.2022.01.04.09.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:11:36 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 18:11:28 +0100
Message-Id: <20220104171128.956397-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Config.in.legacy: fix removed bootlin riscv64
 toolchains
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

commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
bootlin toolchains by RISC-V LP64D. However, Config.in.legacy was added
for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE, which never
existed (the stable version was only added after the switch to LP64D).
Conversely, BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE,
which was removed, was not mentioned in Config.in.legacy.

Correct the symbol name and its comment in Config.in.legacy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5994d94487..e5349e58ac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -153,8 +153,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
 	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
 	  in favor of RISC-V 64-bit LP64D toolchains.
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE
-	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE
+	bool "Bootlin riscv64 musl bleeding-edge toolchain removed"
 	select BR2_LEGACY
 	help
 	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
