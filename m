Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6B1C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B73AD41C8C;
	Fri, 12 Apr 2024 21:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnThJ0SprpRd; Fri, 12 Apr 2024 21:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A8C41C82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A8C41C82;
	Fri, 12 Apr 2024 21:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3481BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3751241C4F
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoaS0dTEJOIC for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E23C41493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E23C41493
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E23C41493
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-417f81ef284so7545925e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958214; x=1713563014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iITBCy1uVWklHIMZDti+g/KFbqOh57OY1EhLNHZwaCY=;
 b=U1KiLQK1WAY0OA0Vq8347jhofl8DiLQGLY51rTtx02O0M/kZJlGi1uzYLAgAB+oLsS
 9fkg5Jv+2nXeF2MNht70b6kU3BFHc/zyhAVejqHSm0y25kuMRDG8pxSVmKWpfjh6/xyF
 EomlXyLhka5TiC+n/AoFPIfyq8JCqsU96lhBGjUcWWiodbEOGBB0EuAh2SAhhrzQ2+XM
 MRrNOtwSDKVLR2UQgvYWUUucoL7oC52TF2jMYbB73UCFMqoBYRSrABbNHxdD4H0gzure
 yKxQLY3FfeogND6NGFYs34zaQcN7CnehH/y/dFif9GyiR2CgeRX20rUUvE6JD98fq4hh
 bgUA==
X-Gm-Message-State: AOJu0YxsEWifdFMPTK5kGl/KrOkTEcf9VpDsfQY8AMU2ZZvbLuwNPcmu
 HaphugSVR2RVrXLH6pVWqf/fDYRPlTZX1P4pY4vHF4CldDBq0qdIdMLambaM9o9qTx2k3k+8k4/
 mvaE=
X-Google-Smtp-Source: AGHT+IEyyr87IfqMWQUC6hxYMEh/rqmeLnQ9QLA5qnJO5+1QxHIO0jx5ONOP6vIV3JnQgeMUc1mmaQ==
X-Received: by 2002:a05:600c:1c95:b0:416:9fc0:972d with SMTP id
 k21-20020a05600c1c9500b004169fc0972dmr3121779wms.37.1712958214007; 
 Fri, 12 Apr 2024 14:43:34 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:08 +0200
Message-Id: <3c8dd9da9315d5ed33b43fdbfc5898573d966a84.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958214; x=1713563014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iITBCy1uVWklHIMZDti+g/KFbqOh57OY1EhLNHZwaCY=;
 b=Xwd8QAP0J+J6gW6XiLxrIMNKeoE/JmXSFMKGn8ozNiUH7SGfozsHHisP8n2x0U8IAb
 I15rWTUsK/7chLKIZnqNOoTt2pL55Ks/Hij1U1n3zsX43yTQ1zlsC7nN+quQyBGCeCgx
 4MgdXO2kFo5TyoQWqU1HapnDGuI+wxLZ8hr8rNmYRq+IpKFiiCRbAvswO1hLhm3hLsfz
 y+HSWl7FgoOXAC2abJBQuTnqSAZhkdyT+7b4NmL9vU/Is9jSMVhSorqzXVuh+eO2bSP2
 lNpVi1kP0BmGryBm4l8mjfPSktcyB6CHFSau+A2aBJhay26Kt3mcG95uqIysNVkAjA2H
 XVNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xwd8QAP0
Subject: [Buildroot] [PATCH 4/6] package/libgcrypt: Add host package
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/libgcrypt/libgcrypt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 2e4bf7448e..af342c6948 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -13,6 +13,7 @@ LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CPE_ID_VENDOR = gnupg
+HOST_LIBGCRYPT_DEPENDENCIES = host-libgpg-error
 
 # Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
@@ -20,6 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+HOST_LIBGCRYPT_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR)
 
 # disable asm for broken archs
 ifeq ($(BR2_i386)$(BR2_m68k_cf),y)
@@ -32,3 +35,4 @@ LIBGCRYPT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
