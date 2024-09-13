Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8AAFA3748
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 11:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176AB60732;
	Fri, 13 Sep 2024 11:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZBMHieuq_QR; Fri, 13 Sep 2024 11:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9856073F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F9856073F;
	Fri, 13 Sep 2024 11:53:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECA861BF28E
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 11:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB2BE40226
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 11:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaJ584ZgRfDa for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 11:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC87A401C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC87A401C7
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC87A401C7
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 11:53:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso18848115e9.1
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 04:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726228402; x=1726833202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=skg/KMoi9xz7un7e2naf2jdtZqeseY9w+fx2pMUvv6E=;
 b=fJN2CCZoA2Sad1EizHnUb/JO5an6x5v+jVl1sxr+tJPkCddVzOO/obcoEfxe1NnVnF
 vKd18h5EgCWbmYnQP6362uijAiE1cr6WL3bhdn5j+bmYrkUJXvbYNbSwT2gX0JWIjOZk
 yjFZIleTii3JN+13AxOF1FdmCS5XhOpA7MQyL/OSd0k7irINRXkf5EQFsVoy3vE9mG0Y
 UPj71GpkMZJPL9ee33p2iPjWfqN4XPNAX2Il9HGp4NXc+At0LapSbUKPGiODEKmcLKuw
 vAEOLrcspYTPG/Mcdd4JUB8vb6kuvS3Ca6h5sCZSXAeNUsHsAmmtthLf0dlZFOS6wLA8
 VfEw==
X-Gm-Message-State: AOJu0YwNlnifwIUlO/2wlGEd4D5cGOGxiKVTqnTCHhP1Cst/sdaB/t31
 KUMHBgM3q+EpZ0hC0otpnVYFbJGhW5rE/yqaylvCEqxEp4+tlBDJkJ6JacAcducNpeAHlPI8vdl
 8atu71w==
X-Google-Smtp-Source: AGHT+IEkegNb+sgderMFQ5vL+eqdp2cYYcIFXrWHudqy2YORgXi+z+bnptwcivRPEulOCoPIZk2Vug==
X-Received: by 2002:a05:6000:128b:b0:374:c911:7756 with SMTP id
 ffacd0b85a97d-378c2d5a0b9mr3603517f8f.38.1726228402194; 
 Fri, 13 Sep 2024 04:53:22 -0700 (PDT)
Received: from L7DL6DY3.kohlerco.com
 (lfbn-nan-1-1856-175.w90-104.abo.wanadoo.fr. [90.104.40.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a1a0sm16631831f8f.23.2024.09.13.04.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 04:53:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 13 Sep 2024 13:53:19 +0200
Message-Id: <20240913115319.169625-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1726228402; x=1726833202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=skg/KMoi9xz7un7e2naf2jdtZqeseY9w+fx2pMUvv6E=;
 b=T5/8/lUusJo5/MXiMnPl0FQRj/hIkJ5uxCd3umbRnOSdG//bhJQpgU8N2vtdcg2BKh
 ztDriRt8qtJ+zDCbx8j30x8nhncREDpEf1Oxn7aWQlzd9qT5TyZsPag/ttVep9nLEec2
 mjKeMhdhYE8EoAJdSosq7lArZt/gJFTFQkTLo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=T5/8/lUu
Subject: [Buildroot] [PATCH 1/1] package/environment-setup: export pkgconf's
 evironment variables
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkgconf can not find libraries outside of the default sysroot without
PKG_CONFIG_PATH and PKG_CONFIG_PATH properly set.

Make environment-setup export those variables so that pkgconf can
look for libraries in the buildroot sysroot.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
The issue can be reproduced by searching for libraries using buildroot's
pkgconf after sourcing environment-setup.

I found the issue when compiling using meson. The meson "dependency"
keyword uses pkgconf to find libraries, which uses pkgconf
(and other programs) [1].

[1]: https://mesonbuild.com/Dependencies.html

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/environment-setup/environment-setup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 069ee25f9f..2e0dbe071a 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -32,6 +32,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 		$(ENVIRONMENT_SETUP_FILE)
 	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"PKG_CONFIG_PATH=\$$STAGING_DIR/usr/lib/pkgconfig\"\n" >> $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"PKG_CONFIG_SYSROOT_DIR=\$$STAGING_DIR\"\n" >> $(ENVIRONMENT_SETUP_FILE)
 
 	$(if $(BR2_LINUX_KERNEL),\
 		printf "export \"KERNELDIR=$(LINUX_BUILDDIR)\"\n" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
