Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C5C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 16:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605EB6081B;
	Fri, 25 Sep 2026 16:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFsUSeBZ64st; Fri, 25 Sep 2026 16:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D4D26069B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790355154;
	b=pLmOq41zcQC+dZ92PPajAZ967YeroMVAWYkAgxBlfcpiapOxFMkX+OOnUQ8ZOPyl+Gja
	 lvrXVHiF93RPBBOEjqjF8LYkdRn93txgJNV2AhgF+JphqKQZSNx5oMGXEBTQfv+zKhU5H
	 JGAhUe5YfVsSH2wW8HcU543+Cx9WryP4TjXAB3mkEvS+R8FO2yY/rgnxUag4sY/fQEAXq
	 KOxlmWyHFQ8/lY4CWrlzS6g6N1Ic81VnH4TKe8ocer/F6ItAgMEJDmljGZlozK8nLOwnu
	 6tmqWGCiGF6E2s9WgPoFGiDNkYEdesq3RdHP18Pe3LYNG0ZK5VVlp1kmZqaSRRrVZKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790355154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zqLq0qtyAzlmMsHYGCl07xP44/njR2xl0G6DywMq3P8=;
	b=AxKXvEgFEcLuakvfB/V1EdAslithkdNw1AVm/aM92xl7bM+PTnvcUgNcWS527vf0v6i1
	 Zg7nTFqhHUfKtvymzq+nAIv59e25CtQzDqnZfjOq8hpi01NbJdDPXmAJQ63z72u8lTbS7
	 1Pj+CiVz+ggcEuJEq63YvDdX0KocKr7X8uQxeDBjK0MJvSzx3VmJYFJ8ov1DKZvQpWkOC
	 5fM/vIIxQ1HcG7vzrZ+0Z/wECzb5GqNjQQKVwEs/8Ns0bnrzKIxhvbNUqzHhKAF5AbcIW
	 JCeZ3kEVLGAfe3oEp9yVPoeogUXiq5of6z41z442nFV9kHdg9WlgLxLz9DT21bYgkcA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790355154;
	bh=zqLq0qtyAzlmMsHYGCl07xP44/njR2xl0G6DywMq3P8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=noy1JaIF3N9v47wAx3t4c2NvF5ogiGZoHCUE4At0yxpkB+Gm7p0HmXa2/srhyfYtK
	 h96xJxB1nl9nCVHQLmnro0H58IUjwYixfnIfO8l1hd2WmFxTHHw9ViLxDQggTDKnuI
	 nrB/B7B6UZMAw+iLmR4jo0bL3UJOogsswcypKJlNe65IXFBgS0Xni8fJN9DXHEgmgm
	 NE/5ZKuqgUCq475P+qQqxYuj1l2DxAnAJIlRdfp5QI3QleQfo+5TQjuTcZKAWOgA2k
	 LWN6P2mC1Mu/595Esmr/Gm81bKE8wZ697pLNby7ppP+kDh8yLYzQ1iwmqnZYt4RpA4
	 35bijacXh9g5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4D26069B;
	Fri, 25 Sep 2026 16:52:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68FE132F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 16:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EA2481101
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 16:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sh6QGL3thrF5 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 16:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 52CAD810F5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:38::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790355152;
 b=kMI7DKfrGWD6lSJlMy2c1atRFnzzf3VQLBrlPPAO3IXyWUN46qNego/4tkl1lEQn07qG
 XzhdW/iMdfa4mdqLEyPO907Do2sWH3kHrjkAWKgoK1lYj8quLWGnn/6lYEN453X5U/tOq
 yux0bhz/VBogW0j0paSniszY4/ik2y0fBUHxTxG0HdyIlA702YLbQEvH9a0S1nn15G6Cs
 9OAdSDkcCRT+qm4lA0z0m/aUDWql55RD8DPYSC3Qv48wWksW+cXtgmimpJQYxykvgiiV2
 pzHZ5QbilP31b0b8v/NArWIMPEZpaZ+5O6vWF5iKDHLzPyPuJQxPlJ+n8wNt+lYBOkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790355152;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=231pyuUJNIcxh4yMlQxod+UhXoayQ6l2MsoLSlUFzRs=;
 b=ftewDTcurghTOnhaHEgXlC8w97VVgaL6ZJ8EBPOhEXErg53FwS9p6+HU+kI/kIe2Ss0l
 dYlMOr4W6+0QS2dGhdDV4n9ZmvObsHSLJVLmdZ2gOx8nAT5ZvGDciTdm8tT5kr2SXYCuT
 EU5h34Gh1IiF7nRzhFivNt6bminC2AEEd9k0YJC0WYudlOXVnUAjNOR/+ZoHWsY0saclC
 FbS1FJbj+eRAejbYHHSD7+ZNJCMPXYtHhDk8GOtaP9GPSq/zMCcXM5VyVm3Wog3CrwUsr
 ElILfC6AdfclB3ScrGKLXlhUtteT5sDzhzL8OA3q9gVs6NeqI0tVA8If4lZfSdY4R8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Svgo12d1; 
 arc=none smtp.remote-ip="2a00:1450:4864:38::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:38::10; helo=mail-lr2-x10.google.com;
 envelope-from=anykey196@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Svgo12d1
Received: from mail-lr2-x10.google.com (mail-lr2-x10.google.com
 [IPv6:2a00:1450:4864:38::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52CAD810F5
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 16:52:32 +0000 (UTC)
Received: by mail-lr2-x10.google.com with SMTP id
 38308e7fff4ca-3a58fef219fso3395851fa.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790355150; x=1790959950; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=231pyuUJNIcxh4yMlQxod+UhXoayQ6l2MsoLSlUFzRs=;
 b=Svgo12d1q4PyalyBX6phIzcnQtKiy57f9hZqkbp8yHGaoAcPXYYEQDFZZdp5pY4iAf
 DnHbxwGiz7b8P94X4cHgEKg80srA3w+TopLMF8mTxv/WQR7XOkHRc6qDrF8gqYqpH7UI
 PvJ1rELDOcmK8QeUMnb5qG0/iftPEkkAQsLmRkBcClyh65e3OSIZdeX1L1tIVfTgUTg/
 DE3YFsSfxPueOh3R/4Gk81TqnzbYi0U3BnDwcuAu1LOH4JLXvTu8/zDpcqM9JCWxLqQd
 DgLtoFeao2kZJbGyGEOQs8CKkboI+Q40Jk36x//77XPL8Ibf5Fg/Of/ZRe2WLLauGfXm
 0SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790355150; x=1790959950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=231pyuUJNIcxh4yMlQxod+UhXoayQ6l2MsoLSlUFzRs=;
 b=xRMf34AArLmM6KB2JppF1OJw7iT05fGd81GE/09euwuRFajj277BQIiFpWHVuYuVSe
 nYVNhOD+dbgjPouFKxixecNErifXbMse8hFM3ULYCq/XykF/uPpjE1HWgSbjFs/+MMt6
 6v8ZjtKudLEmM78ac3fAM1RA5JvgfCmQTB2phXbqfaLsHafz6bAjUU8N/S9z7Y+1jmLf
 bFe3sk67HBW/aPgCgtPE8MP/sTnBpmVcP8/0lYuz3KZEqghwG1+Qon+/WRGLJNi8yomO
 TlRaAMyuEymRE0XqevDIezmg6fw0mY3r/2RIRu9+A5nr8BcZBm+PVAcbRPtvQPB0m4Mf
 pRvw==
X-Gm-Message-State: AFuF++kb1hV3wqo2Duybt2h2ZJn2R02gToKslOysGt8+2ONx0WIcZCxD
 2SpBcatl5WeQ2w2eEK7BH085+Oi8D+2Sm6pYLPOf0VJIk21lRs19LIiEZ9pLI4zzkKAoeQ==
X-Gm-Gg: AYBFou2ZEWxsdUuGvIjhuWF5ecJV73o3Je/rDFU872yYjqu6ihta6UOhd3RGTFtNQBX
 pL8q8WKz2rtcs+58zWwbDR7d1+dViW/mQn3Dj/o6h01EMosgZ9gNiVCWfvuE6PHa3aUEZxjX+Fg
 S1AE3612/Q6u3OZYIF/Yyj8n9MbYNb+VuniN3swysfjVtnTD/+4YymCIs5a3l2hoinFVgfGGYOh
 kKoIfHZiGKqh/xsgeBu+0qAz4uKniku/ydmjjnWAkYfDpc3KGGZaGHArP0Kbl3itKNo0PVwaqDq
 zGqjTzxICultuE3wISKvpLkH3qrgpMnpyGFBbkkWfoQRp3pN3MHi5WmZTegmfZee8oD4mox9Z8A
 fPPDKggpMOuVaYvv7pMvaovpvpFepEnL3g1ou59OPToLl9hHmc59b161sRhPX180MYZQ3LJMDw0
 WLOxzrMa3o3gEP07DCrUGJuHeTLjYmVeFhh0el9JjHOvB/DSIsNg6cOFys/gt5VWIoumD1wXjsQ
 Bji
X-Received: by 2002:a2e:be0f:0:b0:3a6:58ad:1652 with SMTP id
 38308e7fff4ca-3a658ad1b21mr1039571fa.10.1790355149508; 
 Fri, 25 Sep 2026 09:52:29 -0700 (PDT)
Received: from soyom4plus.lan ([188.226.104.175])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a64c31dd63sm7310471fa.33.2026.09.25.09.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 09:52:29 -0700 (PDT)
From: Vladimir Savelev <anykey196@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 21:52:26 +0500
Message-ID: <20260925165226.1502431-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925165226.1502431-1-anykey196@gmail.com>
References: <20260925165226.1502431-1-anykey196@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] board/orangepi/orangepi-zero2w,
 orangepi-zero3: set the hostname
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Vladimir Savelev <anykey196@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Give both boards a recognizable hostname instead of the generic
"buildroot".  The name is used for the login banner and sent as the DHCP
hostname (option 12), so the board is easy to identify on the network.

Signed-off-by: Vladimir Savelev <anykey196@gmail.com>
---
 configs/orangepi_zero2w_defconfig | 1 +
 configs/orangepi_zero3_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index 2da4372fdb..c815028405 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
+BR2_TARGET_GENERIC_HOSTNAME="orangepi-zero2w"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-zero2w/post-image.sh"
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index bfaec7ebd5..61a4f3855b 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero3/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
+BR2_TARGET_GENERIC_HOSTNAME="orangepi-zero3"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
