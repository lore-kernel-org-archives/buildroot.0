Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C6ECCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 11:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831AA60F76;
	Tue,  4 Nov 2025 11:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzsG-bGXIIMD; Tue,  4 Nov 2025 11:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD9060F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD9060F65;
	Tue,  4 Nov 2025 11:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED005462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6F9660F65
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kftU6vueDUt6 for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 11:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CEC6860F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC6860F58
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEC6860F58
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 11:19:56 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b70afc39b87so21536266b.2
 for <buildroot@buildroot.org>; Tue, 04 Nov 2025 03:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762255194; x=1762859994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xK/8P6hT2Vh+26usVptv6rTdGWghR6PJVIqvOg/z9IY=;
 b=CuBO444pFO1Ke3LfE/IHJw7FUoeu0uYLPDrv0LJPT6XNvBhNf5Zc3Vo9WBMpaOsJVP
 2BIXugayM6FrD0sZq1mhZMqY4/HoQqnFl00e2HCKbQuZkwRm2yy36Xy8wwd4hDaONCA0
 zQ5HBDPGzpJlJUVmfGT5Xu79PyHh8u32la49322VvxNb321T57dtQtFkhTbfQUsjSaev
 IhcAumPAETuBAvHC/+0nuNccpS+44tMoZEy6F4DPF3MRIMFxdQheILm65hZ/n0hiqnb3
 JVEiPU8jYFiELDj/bE2TSPd2v930KpXXwNLhm7FoUDDWXWK9F79vRTlKBnGn+N0upwjM
 bvzQ==
X-Gm-Message-State: AOJu0Ywemdk9zNT9nwvpXEnjMe0+sB3TaEeGOzg0yK6OYrxXOMlHMGWv
 MosQwyoB8FeIPrN95MW2A7mbAiiDmX9PdLimrIQh0PyMrqLmil5EmQkmrLdO/nzwevwxDcToT5+
 CJewv
X-Gm-Gg: ASbGncs9PNeNXhsJdJTg76HoN1PvsF84M9GrK8qIK2NPcsC0dGIJCQDp05H7FRyAMGk
 JCRUIMAEMgbOmWkJJlr4Db9NcK/otkRQmQT5aAtbRxtzhgDaWMG/+iOhhyVe/NZvdszp28RLdB8
 5sSESwOkfSBfNhhZQmqe25ZHV5YWZdOuK2XuJYMU1YCV5f2NGEOusqH6+Z2Bpv/NuzW6aH/2ufx
 u0rAsNYWwziUQQf5W70tLzYspk+xPJDisTdcqdBxKlOkU6wRZa016qwb4MbJrOhITVPuB/ax7Pd
 kWjqP5hnwvCACTtPL7NX9VgXO5CjwZYfUu6FV2TOKXobksg9oFvI/TbNBOwHBDiKbwAGnXWExJ2
 4gLLKaYoh8hwzplvI9ACjLXg7Pj7ro+KNy9v87DAFgZGVLe8Aw8gYErb0u1XhlxsMrUARAsBNLO
 cGXGNbp8v7PZBGcM/w4xqBvgFECtUqaDJkjQAJQRY2MODJ6G00LxRHWRvHBHJSihduOTRNVXKMJ
 2XcVaw0f9plT92X+DYc3uwgAPZvp2om8zeaInZ1pQ==
X-Google-Smtp-Source: AGHT+IE8wm5TzDbOG5nxpAuephA5FG9+PN9/V2nudRX+BI9XlZpzzdNuGHI5BxpbD9hD+N4OVKtg8w==
X-Received: by 2002:a17:907:3da5:b0:b70:4377:4d29 with SMTP id
 a640c23a62f3a-b707011afbdmr919476566b.2.1762255194341; 
 Tue, 04 Nov 2025 03:19:54 -0800 (PST)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b723f6e26adsm185998566b.43.2025.11.04.03.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 03:19:54 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  4 Nov 2025 12:19:51 +0100
Message-ID: <20251104111952.246662-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762255194; x=1762859994;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xK/8P6hT2Vh+26usVptv6rTdGWghR6PJVIqvOg/z9IY=;
 b=Pr5p5KK7SBtiUMeLOUOJWFLV8Jw9TnxBJTtoFl4Ig/u0KYqPyEK92c2YVJjDz3HaPB
 7iWwkfkkX3ukonknhwKkygEgFuM7dJ/qkzglAGfOL5pg2dxpaa+G+M3YuLcbj+Rjsf0t
 2/Q/WEOFDRDcwLay0xsqRRPPYBD/I0vWG2+cE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Pr5p5KK7
Subject: [Buildroot] [PATCH] package/python-pysocks: add host variant
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

The host-depot-tools package now requires a host variant of the
python-pysocks package due to the python-httplib2 update on commit
55a80f89d7321000591de349c7083a94c0349187.

Httplib2 removed the internal socks.py file on commit
1a6ff781792099e9e14d7beb610bd99112b17b07.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-pysocks/python-pysocks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index ccb70fc5db..1925220d23 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -12,3 +12,4 @@ PYTHON_PYSOCKS_LICENSE_FILES = LICENSE
 PYTHON_PYSOCKS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
