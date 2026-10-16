Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4038ACCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA9A8608C4;
	Fri, 16 Oct 2026 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBRl6Y2x-DpK; Fri, 16 Oct 2026 12:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ED3B86080C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792152570;
	b=NNHIOcwGrmGwtMdiy4Hi5FKMONpVE88vwqzip0+d12mRAC9gqunuxId+UtWSoJYiVjKc
	 O0PrxGslJYDGd7PjeF5AQEOTtFziyEtxPSWp0Fia/OvI6CCpddk+mhvqjwHq2sbXkzYNH
	 hmfd0bNVUpviHkkwphOzCXmP2lY+XMK6tmB9TZkEabZIeSe3ahXLsuIdl/zyIDFjOv4r8
	 TowZdQays/b1pTv1TzDqVVFkzrvwteG2ngKyL3AaoWU4DRiUjZP50mltsYHLM0Ffjqcnn
	 mk29/gk+zJfgsXCviA7yYq2VhcwJJp1WA2FAUhO093Ew8B+rJ+BYcP0QPq3EvjyHCHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792152570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:Date:To:Cc:Message-ID:
	 MIME-Version:Content-Disposition:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ELCNuFtNyjmZARZ21k9/+RoLLte46ZU6f6QLRkqwZkk=;
	b=busGBZ7EuN0Kl9pi6+FOSuPs+AuxDA+Pf7T/1mxsUs7DJTDmqL/dLyYfRRm03suZ+Sjw
	 1+fh9l05Ff9Z2fCmwN2grE3xCqSSQIN4G4U7qAtJEO26NFyf85l6DYS6miwpapiDZjj2x
	 wdKW9RX8X7oODrF/XWRMx3GMSuP8MNDrtpt51bnYGaF0CFULdeO+39/gNkgbF4rSF4INq
	 eFQZODfEW7go2esWTsBvSKtabqRLe3Rb1TwvqD80Zqj0j0rJPRtkNmqlqEYLweW00I/dj
	 +OmaFaT7/6oA9tQp9Fs7K5xSDJlJDicesSm6HzjNsXrjdAM6plTLt+O6mIM5krGG54Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792152570;
	bh=ELCNuFtNyjmZARZ21k9/+RoLLte46ZU6f6QLRkqwZkk=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PoAeLyhiRuJZtQ8GlHPGz8zMT/QGfLHjseaXuP4L5wvzJzZnZ7NkvcZ8EcQFSf46n
	 Cygf/fbnkxX/iq8r8BetLKxfMukVpXNYceeCvnCAAI04f/ogFe2TKkbGV43CPATc5I
	 ujsO5V6PzF0IWM+kVadpLtkot5GHm1C2fAqqCb4R/XFVwW9TscUwi29YgqltqgXL6E
	 fetvndV5IEVdKmRfDIPlBmkrgb6TjNrQ6IdyC12tsX0fVCvMDXKKbMT3VEmfqMCc8x
	 1uaj5TuhHHzWjyE6Z6blpgNc264cP9IeE5WARBUtuUL8lgGqQkcWEYrANXYZkriapi
	 c1HtBAUDMJaCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED3B86080C;
	Fri, 16 Oct 2026 12:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5640B255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C04440802
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Gnto6vD5oWr for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 18C16407CF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792152567;
 b=NdJ2nHiXgMV4UaDPwMsZ94jkM0bTXekTyeLeVOzb9MtUbkl8XB167VxTkq+Aq9wfUUsM
 jU2wJEMrDvCpULhm71ddu5LtKeJ9nLVcVDunhtGaBGV6NrwN84MUrOB/KWHP39d0u0N8p
 RQ5dM8i8AzZZKIWB6DLWVaWWMOQbo1lbhllqMQf9tDydimwHQgOtMn0zhRVKdEaGMFvXI
 ZzuaFHxfxFpuz4wzyEfyX0DKiArhjS5A71fXyVThhoABlic8ToNnUmmdl5mERXIgVotCY
 m2blCMN6TnORdy+xL8z+qYivKE2JM4D/lykzDYHsSK8kvHnNHkRpI1IW9Xz5kKzKUhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792152567;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition;
 bh=F+yKPaVwewP8DcZU4C7gAdALQKO3TYZscXOjaZp2K4Y=;
 b=MZQ7YAk5YO4N5VQt/JLAe892SnjUW31Fj4ju5P7Iut9J8dqD3qwFA5xOVQNn3Ehb5Wu6
 hIpZX5ksl5WqmBm16LXkg1BOmPB1LGRgKTA6lVJ7VSHMNoq2i6mbsHFQMRmxBIEfaKGc9
 6vCWYw795LLAy571nQ9a4oo9fqPB3zsamher9UypEXsPdf3PJ5wdVYyA8BovCIwfMHLZj
 JyGqgGdMuYs2yzT75ApXM8xXInXXm5TdJ/FQk1lCrRD1LuOTQkR8bJHU8aRALvItnrBnm
 6gf3QWhIHdAw22TJQb8XnIMrd+Z7SCYaLllvHra6pE9fTkb3dyMHj3u7zSkGwQPVV3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LXDVoJSQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LXDVoJSQ
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18C16407CF
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:09:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1088002f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792152564; x=1792757364; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:date:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=F+yKPaVwewP8DcZU4C7gAdALQKO3TYZscXOjaZp2K4Y=;
 b=LXDVoJSQxxK8m2HiNmCiNRpk3o3oUGdBJuFUJxEyVRHZqZK2kAGhH/0sUWsCLq5102
 0g+l59gRPWJoDyOHRNWBnXiG4AUdtuBLR/87mFROiw3zfdqWJDnFR5tIP4VkCLyPVGJ3
 vj7JoH0nam7AZy/JnZP2iCB3Sc1KVzvWuRAao70KUTZEdVxuFY6K2y0aP3uWk0ElqDgU
 WAc0s8vR/S2FNXKV7/+xJkLa/lYflWIuSJUnu3uhMADT2X/fUpi0scYKcOtuUQ2pn0B1
 wSSpFAwwuMnsN0FESpG7KmHJV4LbgXiol2k+85Frbz6gcQiHfjMmtOxbrC+dmcno4l9B
 t3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792152564; x=1792757364;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F+yKPaVwewP8DcZU4C7gAdALQKO3TYZscXOjaZp2K4Y=;
 b=YVmrqu0+GVulsSJBAEECiybtbJWpEmBcmf9sP6ohvhG5m3/NuIwWyzqElYBoOZ3WJG
 xqZZYWAChY4ffA0tKY6ZKpFTwItsPzG8zbkVAtKpGEEUrR2S3sWzWUxq7V0aetoui4hA
 mMePq0vU9s9wfdMTMzyR6GTjUjm13kEHo4hFx0SJHi6b9h0aZga9e+bI8G9mzSTa0LlK
 GLtH6272S7NnCqRGHifR2yqXt702CVyE6DiTE52eiozx3zmRIKMZWvlQhfpg4wD/8H40
 SXQKE9HFChV8IHazOHKRsUR66O9gIbZ5gf+I076fiNahiwOe1azyfMVgK3c2N6zia5Gu
 BsEg==
X-Gm-Message-State: AFq9FYJ/22iDWd5ct1IOEHaXlLBOmF/IJ5do8dKfpgPnGThmzpJhNZla
 +Jy/MTPeVvDtKWIdOtX6IRA7NmT0qBPlibLHVoeRA8YP5rFgJT+2MzLGGNdad1O3
X-Gm-Gg: AYBFou3Js2kXx0qpNJbg4C6fTjrl+CN6Ikha8HS9yvme5zEijzuTdoCzx3Ed+uKQBLu
 1OfUBM8I7RvT9w1zvfx6G4BWzJVSPeMbQi+BBgqxRlYCE4IoRpuo+7w6SMBYof1B1R5hYAA+yNC
 CuUVtvnwogelQqG7D3q9tGAPDa9kf/ikG5GyDaVBPvDLTGFobmkJeJ8bvsOThJG9aH06lR36U7K
 XXscZ1i+mL12jLCrdSKTae3d1ZDvDhGSt54yk4Pg93YuNePLKs2bmqoRre3oXcreMVq6fPgzgOh
 0XxC+ntv8XF7WEhW6O9I3M4T9r0rsW+w/zkmZVlcCvGszH2qDS2FYGfhWS2y/Ot/kkvTOEIT0gN
 Nk3in+h4zdUoSO25CD413EKxh4PbiB0qSA6ge4lolyhTwRcYmKYZPEVcuDYQEoQ2S0Uywe9DQbh
 sKSS4AdWBxaoZZ2uOCHzofr2ZimemcpNM3Cz0KHR7jCQLh5CSMyPqpYXlP1k2HZNMkjtD4gaIXW
 FI9Kbyg6ZjRHnKEDqKbUb6J3aE6tmZ9zpjKPABRj3cMcGstk3Pu7ZiS2DXHvFXsTnpmKkE5cfpR
 fL0kfg==
X-Received: by 2002:a5d:5386:0:b0:487:767:b301 with SMTP id
 ffacd0b85a97d-48dbacd94c0mr34427515f8f.57.1792152564256; 
 Fri, 16 Oct 2026 05:09:24 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4c575esm4195043f8f.10.2026.10.16.05.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:09:23 -0700 (PDT)
From: Maxime Leroy <leo.denieul.yoshino@gmail.com>
X-Google-Original-From: Maxime Leroy <maxime@leroys.fr>
Date: Fri, 16 Oct 2026 14:09:22 +0200
To: buildroot@buildroot.org
Cc: maxime@leroys.fr, vjardin@free.fr, olteanv@gmail.com
Message-ID: <atIT8qn_5xhhuXGw@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v6 1/3] package/qoriq-restool: add runtime
 dependencies
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

The scripts shipped with restool require:
- bash: they use #!/bin/bash shebang and bash-specific
  features (shopt, declare -A)

The ls-append-dpl script also requires:
- dtc programs: the script uses dtc and fdtget commands

Since dtc needs dynamic libraries, add the corresponding dependency.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/qoriq-restool/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
index 600c2c958d..46330e8cac 100644
--- a/package/qoriq-restool/Config.in
+++ b/package/qoriq-restool/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_QORIQ_RESTOOL
 	bool "qoriq-restool"
 	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on !BR2_STATIC_LIBS # dtc
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BASH
+	select BR2_PACKAGE_DTC
+	select BR2_PACKAGE_DTC_PROGRAMS
 	help
 	  The DPAA2 architecture in Layerscape SoCs consists of
 	  networking resources that can be assembled into various
@@ -19,3 +24,7 @@ config BR2_PACKAGE_QORIQ_RESTOOL
 	  that specified in the boot-time DPL file.
 
 	  https://github.com/nxp-qoriq/restool
+
+comment "qoriq-restool needs a toolchain w/ dynamic library"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_STATIC_LIBS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
