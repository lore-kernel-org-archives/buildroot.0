Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CBC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE12E8110D;
	Thu, 17 Sep 2026 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOLE48AgN9Ky; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BAFC98110A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789677781;
	b=G5oB4Ef8P9aCxmPxjc944+C5LYNiju2CIBfeuMgxQkXg9qchadu12GrHmVEfhk2hwGfG
	 S3/7vUV6w3655W79I4cObjkH3Uy3F23hCXHVL0mjg+0Wtqpfyu7+I172VuEpg8UYSdrvY
	 Wmlq3bMBA43V16wFHPqMgFtQFUZN0zc3KrkCr+T4L1rKdOm/9pFJMuOj7cYC6pznuZMAZ
	 zVyZYDX2x/lIcaCE0Xfo1oi3qYyUwa4KRtobZGRBft+9umn75jaXtooydL/b9AudOokPh
	 LSVfNjdkBQiezP8RLaJvns03f20UPKn2C/7AooyMyN/ynsyT9N1xm6h0qw4O1uR4onw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789677781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ShcHtooxmgvgwVVjW0ID0VEvMABcvV1mXU9u7SBmQ+c=;
	b=VVlXSjvgMbOPhhyPwwTn/KgaZT+4U2I3Iklp/HaqfZe+TOy+dIwpwNxwIj/woEiONS7X
	 IJjScJKh7eANl51M8Oa2dI9DGuQU5my9TZ3305elIGZVuNnj2r6QgpbGHXohEyBTptUGd
	 kuhxxMwJy4FByV4ty+4Z6QTrHDBvaHVoxcl5ROSGR+xpNRBfegkGfhTxdrkMKjaRw3QKl
	 uASgsLzpFgWf6AfigEFyW7lFijIwJh1Rcwhdx46PZgLVQQmkPpgLi/O3iqDAMcAp8JHql
	 9y5knPlQGv2U2ThYc8HA1HJTkKo31cGgJBkx3w3eaSxL2iS5o76LEzzI6z8uVBCFHKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789677781;
	bh=ShcHtooxmgvgwVVjW0ID0VEvMABcvV1mXU9u7SBmQ+c=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KCkiI6C07LnraS1c/vSW+QZ0aIMwRlOSzRxC8ECH4r8nxHq5l8XNa1CisYwQdzwv5
	 kITIPBDIvMb77Slmcrr6QgLGpMkifxUN9kt/NqayeViCFsq8MdIyn1rqNXfk/RIPls
	 2D7e2Bdz8eM6BdmTE+UkF52Tq4sjj+30Qj7AFjIIsiQJnu3z/oxLLz8GHclAI7Hqt+
	 AeOh8O9S8IO4bGiSSIQt6AipyDd+vsmji9uUEVko9sJ1/IDfZ1YudVFZtqNEwRQMi3
	 ohOVH16bf2ojcyMnLW7hpc1+tR2wkTicAA2J0WGYDuPz6rMF1pqMyISm4sDDrj2roe
	 y/CxeGQCNPttg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAFC98110A;
	Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AC5362
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B7EA4047A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnVp1TYIWxJI for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9AEDC4045B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789677780;
 b=oiIa0p/XbEPE54O/7hg38jC73jCIGGhFitJQf835OhYf2k3+Zt+0bmMrSL92xjTU2/JT
 Vd2pWUa3abYkRUF04vY/PzvQuOXV6gArEWH5QN1KRj3RVhxvmB3GNnnpgoxOnpdw4uWzP
 5USETfjjo62T2a2oKK6y7SNlbM/9BHZxS7oepg0k5d5d9pZdRDMSDTZW3TdrctWYlWT2E
 f76B5opdDTvCQC7jaFPERdhfNAhib4FDM1ifV7Uh3cJNa+OFuWzSu32oCVi7Ql5orfHNg
 WvScKgwUJCjHafQFIkovlDSFwMwP+9mMHVDgrXMwTy3LEL0vwM6nH4U2b1a0OEq8F6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789677780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
 bh=DDUwgY5OLD+tqVxxRcr/Jz1pKAHlpLrOMQaKKTgTfis=;
 b=pwEtZY94VoQD/HnEjShLzRdKHKc+SqqJFf5Lz5wSryWmb43KoCmQHWmicFWsoWkJ0vBz
 2wAB16ypoDao99jyqxfDfxQ7KzuVzxg4KTiOUL37MlI0n65Cxsz8yKKU/jaFyuHsWVIuj
 k5su5IrYu1UJE5BQrYvZKwVx05JQmZM8NrjJXGns+u329vhijRCOsyRqLSazMyIF+Uqc+
 WzFRbVUaok9r06NFR7mEVVqrU2LMH2Cq6Ws2ILCSAtuubGp33eCwr9sTqsc0p/PtgL8rn
 HP6wmNJ2VC5mLsWW2cWKUwXBprGYcnaHvB9JWy96nT+xrdJk4U4Dp3cxgtCbe36SlwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rd3MNcbQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rd3MNcbQ
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AEDC4045B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:42:59 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so525935e9.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789677777; x=1790282577; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=DDUwgY5OLD+tqVxxRcr/Jz1pKAHlpLrOMQaKKTgTfis=;
 b=rd3MNcbQvikHONr/nSw/VwRkwjheh6xIA7p/v+aIZvjpQjRoMEawUbBKVCnvCSLDaq
 5M+/JiTmcvwqRwjz88GvYguQTIhs81GL1fL8EP5PSI36YH770afr0/Tzii6f2A0QVDJh
 0H4iIWqGbpIL0Bq1Wq/w01sBBMABbrqym/b6PjyjVj8SjunJMN2XNpJLn+hvu4PGetso
 DalKFAPWnoV2lac9KVei8yjyW3sbLX26NwkdfS9zqqQ+H+fhnXOgcBDeBZIDoiwi69wm
 22KkOWXeqex06JG6SyNo99vcG80Mhd5R0spuL3TjlkeY64yDSKCUxrp25+hxKKEj+0LU
 /6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789677777; x=1790282577;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DDUwgY5OLD+tqVxxRcr/Jz1pKAHlpLrOMQaKKTgTfis=;
 b=HtYLn8hnY1lUgoNnrIBhToOa9Qs4wtnSwzvaqrPzqFqviyP3tYLk1JsoXC5iNfIcqa
 88vYqGMffcUTFcsPXh46pYrKyvQOC/Y0/GSxpWvvtdVpzTfZj4T0EcdyIaZ/WnTBmb/E
 Z6onnEeF883ELAHMe2NvIIHSo/DPks5l6ohEEJn/QNUWcI5W5P+oj5wtj1EizPXTncWC
 Qk0Ij4m2JA7dbqFkkWRKUYgkhcKFMVAbNz8YWhyLElBjDdS1n5v1dKpYkU7X6OuTw4sA
 IKvMKafhpEk2xfqysx8wAhBJzm4a3KeXDamKqYWDA38mmP5yeGM5lYWAizX/fhkpw9+X
 awaA==
X-Gm-Message-State: AFuF++mWFI5BLzOnlnANnag7u4B5vkPZrbi41XnSCeUtuool/Xs00Sk6
 cU1WTTQN8TiKZHsvA1cSVFTGhJHCJKAUljMPDHKPP0UXmXMzvLVOUBNSUu9Sm9wi
X-Gm-Gg: AYBFou3PscrHz4kdzuzfbrA+8u6Ar3nww9WozzmEq3DhJhTZTCqdAcTB41oquZoYoUA
 Fiibep3o2GqK2RgysGeG7YOFN5RNuXF5dDFJpdeE8PbCnxEhr69hUmTnTZ8FFddZfH6BO6jC0UG
 JpLeJsIjAlZj3FaGlYtS8MpV2BnqhnJdpJFGsNgkw/n3oJpSxe+N6g08GMXZv8UNCeirl3PRYsO
 J8TmhDVI8u1Ncgr1PHBQ6QlAVdf7fFxFvg8hy2YPq9nc1mJOP4GjCm0wfOR5aEcw3AUrlRjS8qe
 WQT/gb8NKOR/SghtrwMzSo0L7es4uu1IoPSW2Lzv4RVHs8lwUEpT8gAY7KDlF7y7TLYw+wAVs7O
 EAwvtssyotCWiiNNwlsoDpSPXYKDu2r8CTnpZDhA5WYnD8hFvors49MrGVj8AuO+4JyuCwpbHAb
 Wu2/5F7ilDYk0peqs0Y+9OdTPOzRnMqA6d9py6A1gvgksztN+NcO9msWGa9X5k1DCpseWgEJJ4y
 ZdzX+s=
X-Received: by 2002:a05:600c:1385:b0:49c:edd2:855 with SMTP id
 5b1f17b1804b1-49fc5673264mr1474275e9.6.1789677776829; 
 Thu, 17 Sep 2026 13:42:56 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd2563ccsm126681465e9.13.2026.09.17.13.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:42:55 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Thu, 17 Sep 2026 22:42:43 +0200
Message-Id: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugNmjistcQF5qMOq0YmWgRx
 Ls31eVb/H9AIGEKUCUHCH05sJ8jskcCdmzngZBdNORpXqQmK1G8/eDCqDrUVhvVO22eSkMMFqG
 e92tWN7fD1r3Jrv9D/dp4cuL92sB5/gBVqNtFeQAAAA==
X-Change-ID: 20260917-rock-pi-4b-8c894fd89348
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH 0/3] Add support for ROCK-PI 4B board
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

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
Jean-Paul Etienne (3):
      package/rockchip-rkdeveloptool: new host package
      package/brcmfmac_sdio-firmware: new package
      configs/rock4b_defconfig: add support for Radxa ROCK-PI 4B board

 DEVELOPERS                                         |   6 ++
 board/radxa/rock4b/extlinux.conf                   |   4 +
 board/radxa/rock4b/genimage.cfg                    |  22 +++++
 board/radxa/rock4b/linux.fragment                  |   6 ++
 .../rock4b/overlay/etc/modprobe.d/brcmfmac.conf    |   4 +
 .../rock4b/overlay/etc/network/if-down.d/wpacli    |   1 +
 .../rock4b/overlay/etc/network/if-up.d/wpacli      |  50 +++++++++++
 board/radxa/rock4b/overlay/etc/network/interfaces  |   9 ++
 board/radxa/rock4b/overlay/etc/wpa_supplicant.conf |   3 +
 .../overlay/etc/wpa_supplicant/wpa_action.sh       |  20 +++++
 .../lib/firmware/brcm/brcmfmac43456-sdio.clm_blob  | Bin 0 -> 7163 bytes
 .../patches/linux-headers/linux-headers.hash       |   1 +
 board/radxa/rock4b/patches/linux/linux.hash        |   2 +
 board/radxa/rock4b/patches/uboot/uboot.hash        |   2 +
 board/radxa/rock4b/post-build.sh                   |   9 ++
 board/radxa/rock4b/readme.txt                      |  93 +++++++++++++++++++++
 configs/rock4b_defconfig                           |  62 ++++++++++++++
 package/Config.in                                  |   1 +
 package/Config.in.host                             |   1 +
 package/brcmfmac_sdio-firmware/Config.in           |   6 ++
 .../brcmfmac_sdio-firmware.hash                    |   2 +
 .../brcmfmac_sdio-firmware.mk                      |  18 ++++
 package/rockchip-rkdeveloptool/Config.in.host      |   9 ++
 .../rockchip-rkdeveloptool.hash                    |   5 ++
 .../rockchip-rkdeveloptool.mk                      |  17 ++++
 25 files changed, 353 insertions(+)
---
base-commit: 2ca7fb5e7bf7b416b72faf709bf1220eef0dc352
change-id: 20260917-rock-pi-4b-8c894fd89348

Best regards,
--  
Jean-Paul Etienne <fractalclone@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
