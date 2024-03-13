Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCDBC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5C91414BE;
	Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvADietiPjxC; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8056B40B7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8056B40B7D;
	Wed, 13 Mar 2024 09:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06C521BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03CDF8133B
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWGtoPj-T4xn for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4254781346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4254781346
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4254781346
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso74029161fa.2
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321263; x=1710926063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K50v26rnU6y9f1oPqfO7xkPrw8keHmGChiDQsNyQ7vI=;
 b=n0/4YcLQfyz/C1Gnfi6zQ9DDkVBGPqN478fheFEQwnXRFV4/SxVid8/OCmWBxnDTqz
 zsmyH8Qoxe+fq/sDZkx5bHwjPirSWY35TV+q+LpjcSWfJk4TfoNM4ilFIOIajIhY1o94
 A6bLN6jGt+Xa9C3wfxIGVRBGtXk3MURa8jn6X4zafqyrCRk+YHvh2hPIW0Z2pCjfcSa2
 fFWHkvoQE0JLBkyr2ChvFQJSyP65FstuDwIvxdvO157oxiRaRXfPcDpfyuLk6hMOB3su
 lBEgy6XjYzD29PRyBOD43Z0ESgSdF2cLjdvKnSK7W0A4SX+a4azzL2u60E1XlbWTIWT5
 Z2Yw==
X-Gm-Message-State: AOJu0YwO4k5dg06sXN5Ta5uS1x7cpv9CVb2uoGy0J17AXe4Vc2aSClm9
 2vlss9V0Rzx50snXCyeL+CxE3jcNOsdmY0gEOk9hFFPXMnXue2mU0SV5/jE60Kc=
X-Google-Smtp-Source: AGHT+IHsnvxN3exXwnpAcStlVU1N1eLgGAPAZ1M+U/9eVPsEIIBPZcDQvAbscWsDhFys7oepBiscEg==
X-Received: by 2002:a2e:9b03:0:b0:2d2:ae55:f428 with SMTP id
 u3-20020a2e9b03000000b002d2ae55f428mr1879855lji.34.1710321262738; 
 Wed, 13 Mar 2024 02:14:22 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:22 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:44 +0100
Message-Id: <20240313091412.20865-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321263; x=1710926063; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K50v26rnU6y9f1oPqfO7xkPrw8keHmGChiDQsNyQ7vI=;
 b=GvAlgCQ3WIDiVM8P/2WWkBwmw+UyEdxEjYuvYnj8+aznG6X7GzUwpBWLhX539nd+kL
 60nJ4FXKjI864rRfF7RngIXfuS0AY+mzC70alYnyOXwffukfyVftLyNRACEFb9Kd+zRv
 MdSYCkFfJhjGQ0iS59AljdUty1ABdECBgL3BnWJLwbwC6RSGl1AGW0OuJAoJeutUkd80
 MUX2qiqo86nYXtEMwGNdMtOtxHPUJmUU0K/iRkYji7J4JrWktVWrXzWfgykthV7kEFe0
 xYdxtZ0d028zL+vKnRHtTlj+gnkLp+gsdYYHuLKyABmTq6O76HlNL7lT8knj3yDQWoZL
 KzqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GvAlgCQ3
Subject: [Buildroot] [PATCH 03/31] package/dcron: disable busybox crond &
 crontab
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dcron/dcron.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index f0c3efbf8..d4dd48e77 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -33,4 +33,9 @@ define DCRON_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
 endef
 
+define DCRON_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_CROND)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_CRONTAB)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
