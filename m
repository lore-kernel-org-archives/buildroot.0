Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE76CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FE3B810A8;
	Sat,  3 Oct 2026 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0pdEVV96q_d; Sat,  3 Oct 2026 16:43:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8F18C8108C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045838;
	b=dZfQ2/yiq4XDK/dBc0VcDfEvuYmcQwPEXL/6DfgfwRVJp54Hvt5iIrEgLgUQXZJK9181
	 OeTaguOZKEExi62bRi0ShR1zPWadm69jZWdGftDCG6+s0ZcBMAVIXR44CUREwiWc3k2Af
	 2cGhs9ZxZOIlUTyHSoqTGmZ/7cYlQLIW+QRLXZaRP2iT363fulWFinQ9+p4EhNyp7ylgL
	 WiYUGS8ABNIuNIivIujqus+qDPvUNYsuEmvx84lGH32MIy/89joxDpZmQYEtK4hyysZcH
	 38PA2R+tBRNVjizuuPLssZJvc/dIYXbITGBxD4jCmHXdy/Bc0TmDVz3KX1Xsbzpt9oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045838;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BG/b/wXBH6Miwla/Kh3A4gU/7fOmFNbCjBQNZYDv8hw=;
	b=Lt4qbVxADvzPtDyaHYlf3tzg6yR6ga3s+D8C4wPR6TxxTFAMo4pA73MDY5MW7WEq3C+h
	 ThNlyz5ObPUTA0U3fNEt1v+Sv8xf5VDw/vcDivyZT8xVXQYb0J7DY/pCzHWtCcfpdtpj0
	 gceSkJdQ7NApaZa0jg1xodnoOguC+Rqi/4H4gIaIKBpm5JsSi8WRL22eZ8rAo28pnslrb
	 rc19Hto2/zKg3q4kNwA2aeACaRkL6Q5YasZmvZ1ULrH+WkoiluJoEAt0JnUvut2MA21fZ
	 MEhDwEibaf70lFtMC31CdLAUWGmGP3egkLxK7+4jrw4s92L96LK5IsBSbS3juhajW+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045838;
	bh=BG/b/wXBH6Miwla/Kh3A4gU/7fOmFNbCjBQNZYDv8hw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MEskPGouP5GGHJhtZrL5nmGNIp2vyrlvU4+urSIBFm/BHXO8OZVgKhmfu2SC4ktfg
	 OkXsbsTcQb7C4A6Jn4IbtzdTeXxl0EXLc7xNGFeOhreak5JokWfceqDfJ38Q0+ewhV
	 kXvBYbsGzp/eebq31uOB4z4uCNM3elECMr9tKtTw9SitKcCnbKRMXd/0dh+c+26/rw
	 C4R5KxVX7qEUGTw0+2GsO9eh/Wzp/a7+J6CorJvtOgQPN2yfo1sTHEEqzEk4yQwxv9
	 7+WW6eFUUsaqqbETLxkjxSXzVRb0FfsuiyboVHxptnus7ILjMpuLI3q0f5pTY5d+jd
	 22wPRytO2aGTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F18C8108C;
	Sat,  3 Oct 2026 16:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFE21D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B6F6069F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bA7EHCtLHj6V for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4EED460639
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045836;
 b=S92f8V5tZvdYmlNQh6jQeH8Lxwa4n788kGhICv2o1fV1WINufuOG+BSBKDx59QWatW6h
 IqUfnVDbDC3Q75bDBdy0WNaGqIDLqUfmFhK0YsaAjguRa0Iw6WdbUMttbqVstTXghMRr8
 tktXX1kqJJOJ9/RBKDSnXmHAZGVzCOpCluzqmcLIIJeFgyq0RwH3hdUmwa8t7URgxNBQB
 8v02/e4JnQrhRyGUI2738cJam7oxBXsnRdWeYhdS8GtEEv7KpqfyiyjTfJO5nm5yEl4N7
 n1GqR97XJPOLHNyRuo0lWxQFI/trTdhFN3RdW3bULl2nCDltItETJCap5tZwmiKqZXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045836;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=KMl9NnzMPnLMiWrGA55zCGDe1LiQ/N1pvaYTh2Qx9zk=;
 b=dPn4NphmX07NzJG+NiRPeE6a1Y/06V50SwltXDy1LYX/p6fz6UpAASi8zBjUY2kzDA2z
 1coR4txkXAdloLE1ijsr5iOWfxyLdS1NuCxHpR5AAhH0PdQQnfccbDeLkAD2/I26XJOrl
 Q9hhGFL8AXkbFzx1+BmbejQj7JJseZwkcHFEcGH2K9sbsTOg+CFRqpip8AxEfaNkv+LEZ
 gZ2TwSnqXWWWqcOkHz0Jx2tFPVkCcmY6aPNFCtdjEpvXtRSuqDVThQ6BvFNQ+PJhmM3Uu
 KKQbF8l3JCQlJBeudYqVi7DiTQA5cqcMkYgWVFF0l8WZLqDEERkd7ttNxI76DJP/stQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ko1vjbMh; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::d;
 helo=mail-wr2-x0d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ko1vjbMh
Received: from mail-wr2-x0d.google.com (mail-wr2-x0d.google.com
 [IPv6:2a00:1450:4864:30::d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EED460639
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:43:55 +0000 (UTC)
Received: by mail-wr2-x0d.google.com with SMTP id
 ffacd0b85a97d-482f6351831so188473f8f.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791045834; x=1791650634;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KMl9NnzMPnLMiWrGA55zCGDe1LiQ/N1pvaYTh2Qx9zk=;
 b=Ko1vjbMh6HrafS7WhswfSKl/9wMcRmevJXP6lcU1judqvJubinRdFs7VOIawW1kqEc
 MjXQtGe6BEK4RU6pPLRRYkt+DFbectpMNs01XU+9VVZpuuZaBQ7Fd2TblbwQJAOZg7C9
 YOawAXwRhQiVIBjmfXhYaOrty+Szm9pyci8lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791045834; x=1791650634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KMl9NnzMPnLMiWrGA55zCGDe1LiQ/N1pvaYTh2Qx9zk=;
 b=2Ufzf0iPeaaJVHvV76EDwTY3vfSJjcOg+Wh2x8rzOW1WEiL1aRotw1F4vMBnQSjUqN
 qZwkbtKAdVAR9B/NwNeOQ/iy0AX6MVJzbW3D1QICaz5KrfJrBUWGwycaxyxwtGlUq2zY
 jIUmSsPX/rgbG2TQ9sNbU5rULO/izrkrmFQMFKn3yqF4Q+5uoFVaPTU3FZPf6lJtLyuI
 a4W+53+C7M0oniE4ECUozZOVrIVK/uDMjRopKlR4/WH2istrVOqM/fIZ65IkYQYj6Ev+
 7Zzp4KR5Fs08HUAgi917Z7Mow7UT/LDcQKbynlesFMlaHPjF+mnjKsQkXT/hEetynhAH
 M+Vg==
X-Gm-Message-State: AFq9FYIR6WSJqofSQlRQXQCuvTGGRZqsOPdec6Ew45rxMTW2Lz92SCsd
 SyTcSU/mr1Z2K55LaPqwnvlzqdOl8QS769tuXtjvuLxWzkKdHALR8XHtcE2mzNEg0tHO+epF06+
 VBSI2
X-Gm-Gg: AYBFou2AQoVnkOSVgqIedV5sP6xmYodkdpi5TCGFnV6c0v296CG3SC4R7WrAllH0Mww
 FpakRyIa1Fi3DYhVmlKV9x4c/FuOjp+AVCJhoMpMtWDik5HHq7t4Z5Yhluw0i1xT7nQl92h4Wyy
 4z+aAJZMc6JqSx02rFAHDjRLGGy05T+4OAgiYIeb+w/7KQoKljXb9lMZl9wczkvqfy51CJKTQa5
 b17dbipdZun8Od3PnLsqR/zgXDwE8feACoiQ9WhH1uzYbn5eNCUb6+KVGH2BByl1/UMhZdb0SOq
 x4MgFeifHBI5C9JdDUg4kR8S/ImEribQfqz3k4b0CMJ78DLXSjTW2IjqFuyoTescWIIvJoU/X1B
 Lb3z10pignVo7WXQwDVQ/gHobwaxYOBwuSpNxPkspbicLPOi36YqLlJVTJdA/M/vs0J+IYyE50a
 DCb1MXlgayYUWVambmTK/48QAPmXdawG/jfppKhoEn4S2I1x7ucujbTqBfiYaN6Z4NEeZyTyoba
 lqnPB20qkceCDu1HHRaaIje9Y0N7kLC81LSBNYj1n8ReOKo/rEgHCvt7P+XRZroTH6cCbR0SL7S
 zcrccsyw7OFwxxXucYDqxDiBkpY3GIvmZ1J6IvrC9Lndo+z53KR8YTuJtyOZLxT0HqCVzf8=
X-Received: by 2002:a5d:6f0e:0:b0:485:8a47:5b91 with SMTP id
 ffacd0b85a97d-48b1272d2d2mr12250332f8f.46.1791045833695; 
 Sat, 03 Oct 2026 09:43:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b38306dd4sm12625765f8f.43.2026.10.03.09.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 09:43:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat,  3 Oct 2026 18:43:44 +0200
Message-ID: <20261003164344.488550-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgphoto2: drop autoreconf
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

Commit 8b05934511ab ("package/libgphoto2: bump to version 2.5.34")
removed the patch touching the autoconf macros, but left behind the
comment referring to it and LIBGPHOTO2_AUTORECONF = YES. The release
tarball ships a regenerated configure script that already includes the
jpeg_mem_dest size type check, so autoreconf is no longer needed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libgphoto2/libgphoto2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index a639245c25f7..1c39b26cd08f 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,8 +9,6 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
-# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
-LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
