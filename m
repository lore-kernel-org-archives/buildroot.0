Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6336CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 08:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E2CF415B3;
	Thu,  4 Apr 2024 08:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUNI1Y3_5gk4; Thu,  4 Apr 2024 08:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C29A41B4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C29A41B4E;
	Thu,  4 Apr 2024 08:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27AB41BF2B8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2160A82C33
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 08:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goZAF2ILJ9wk for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 08:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F28082C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F28082C18
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F28082C18
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 08:17:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5193f56986so5138266b.0
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 01:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712218673; x=1712823473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kWkOpiTuqhS9ray6/r9c/ZNZrXeSxCvCp5LBwyNpQY=;
 b=eV9b/04JoliJDH4DBNAXWLOTo4oxCwXs3DM/zQiInFrwrT6ZMQzCKTmUoa7M/4xm01
 1zSIgOZhHVfw+Z5x4iVuODJ/pdQi/4vfXpXqtzdFDu+0jmPFVBYly411wSsoEmsE6VDB
 ZKF1N7ky2huHiqUHBWTFt6mCHHTdq7uXxzQ/gxoLkZoxVem6swEfYHHVSbvftM/jHHEI
 jHpBiYoz4O+xQcGgP5V2VhaILW8JoJ6OBJSXZAa1Us3DkxCGkJtUgB3ur8L6NUg567Xo
 sm9Psi+aX4m1C7FHgWIosqt2za6FkjNIoMe/AOK8OzQSBqMf5gb27T4mT9ki6OA/Pef6
 Q67w==
X-Gm-Message-State: AOJu0Yyv/SY5RG//64ivclf81dgREQ7TBfvLXzLMFQkdDyJINPcz/Wkb
 YDaYoTb/PpY9vf52lOJxfeDXZgDQd2mDIQvSOpxUBktHUTsIUjt1udmdvZluOzM=
X-Google-Smtp-Source: AGHT+IFdtoYGlDUpBiq+ux7W8WFW+/5W6lnIEneCIIPo0umuxYvcL3xgVPsbA9UFMA9u1Ryt22072Q==
X-Received: by 2002:a17:906:2c19:b0:a51:87af:5b8a with SMTP id
 e25-20020a1709062c1900b00a5187af5b8amr759447ejh.15.1712218672517; 
 Thu, 04 Apr 2024 01:17:52 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a17090609ca00b00a4733982ba9sm8614271eje.160.2024.04.04.01.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 01:17:52 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 10:17:15 +0200
Message-Id: <20240404081714.1190807-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404081714.1190807-1-heiko.thiery@gmail.com>
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712218673; x=1712823473; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kWkOpiTuqhS9ray6/r9c/ZNZrXeSxCvCp5LBwyNpQY=;
 b=Dlb5EHEv2NQ8pd7xx7C68VqYI3jN9nqsgg8AIZv6kxDxj0vmA9I689Ael95XzkWD6n
 ev4cnR5XHOIoXbka1CLGyQXmUgbbVO9TI6/jfmRMXGjuhNWvpdd53CT0Czao+D7bRq3m
 Vuly67V6sD76TKvF1khRJK56CL7Bf7+TiTb+T6T3bzJW6LdKuvDe8AdkDIou0H7A9fJ5
 EZiqMThVTWdm2RNigC2LfGUBbjZDwqmuu/83/gwtuUgO5TE7CZJVWYOmNHwzemNroZnN
 vsDNRsZjwCqRbneZnE1njVOdCVkqW6eR7Dcu1ray4I7Hzb42aiyiI3m1zqN4wwSySOBR
 Qz9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dlb5EHEv
Subject: [Buildroot] [PATCH v2 2/3] boot/ti-k3-r5-loader: add dependency to
 yamllint
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index b3c48109c8..3f1000caad 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -48,6 +48,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-python-pylibfdt \
 	host-python-pyyaml \
 	host-python-setuptools \
+	host-python-yamllint \
 	ti-k3-boot-firmware
 
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
