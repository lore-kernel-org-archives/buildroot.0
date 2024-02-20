Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77CC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 19:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B852C605ED;
	Tue, 20 Feb 2024 19:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mf-81TCXwe_H; Tue, 20 Feb 2024 19:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3101606F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3101606F5;
	Tue, 20 Feb 2024 19:06:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFAE81BF2A2
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 19:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3BE401F3
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 19:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rxUyXyMCJ8E for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 19:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31F5D40196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31F5D40196
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31F5D40196
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:05:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d2710f3acso2566298f8f.0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 11:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708455957; x=1709060757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OABNkaBKqj6Xeurm9lPIK0TT459MAIPff+LuRNgc2T8=;
 b=fmrukxDinTRjhhbnpGyXNMryE5ZPtf4u6cuHPW+ozWL86lDOnnOUq3nADg78kHumFP
 qVITjt85ECwieAQF3CgDW6oNiCYfsB11l8NXCemUhzYeNSBfUL9WBwdr7RFDm5tHdaCr
 kXZF1WlXAxfJEP/INeqx8PCqxYNB4qKZiBvsAKguBQ11JF8fqRZplXg0rF4RvHJfYwMW
 jZ1vtWwo1r0zVV6oC4MFumEY995n6TmVSupJw73wqfb53iOBUmaUq7XxCq2tUTq8P2rl
 Rgo6ttJm322eskUD/MU+CmYpqkNNt0f5oDkr0vqa9IqZL7ug+5mR+k0dPiDNFLndu7ux
 uA+A==
X-Gm-Message-State: AOJu0YwNEwJCtBt39VCEAjy5HTW32BFck9chn2lyvk3lfrO7Ec3uJBN8
 YdMh73UPb6fGMbPKGVL/F9uGnb0MwQmYo3n3OMBW/iEKEy75KcWNt0J4NLoTBGY=
X-Google-Smtp-Source: AGHT+IGAmMbonDP4mBUJ8GbFCwFMWfuFqytxCIk13t0V3H08Otx7EkC9fyypk6iHB9vLSxHeyranrg==
X-Received: by 2002:a5d:4e4d:0:b0:33d:1fc3:68ed with SMTP id
 r13-20020a5d4e4d000000b0033d1fc368edmr12239760wrt.2.1708455956474; 
 Tue, 20 Feb 2024 11:05:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b0033d67bdce97sm3451374wrb.84.2024.02.20.11.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 11:05:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 20:05:53 +0100
Message-ID: <20240220190553.3237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708455957; x=1709060757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OABNkaBKqj6Xeurm9lPIK0TT459MAIPff+LuRNgc2T8=;
 b=YfGKZbxn80sWBQyODWNe2jli5aBHzodQWtnk1XE27wK39IKN5rUnfLrI/ZN8gTs0qX
 Aq8TuFucwfrvB+BsAatKUfKG1lpyguGXXJkFcnmJHKSSUBXFgMve2Ghr0mkx/kPjlCg3
 LweqRDj+/FzyoInqNjRjPAgBQriuFlRHHx0Xbkq2mP1WVXAXdrOEdR6Lh5UoLRJBpaZC
 kVUHbfU8b1Z4JxHgqCvx8W3QMWNvfqLmvZwgM+RtnQSP4nQXUXXFzQpydGy7NHMx7Cam
 WhGBA7fnSczj1LGQzks0kNBvAupZSdpvoKi9BxdH8j90JRq3ZL5zQW1QD674JuJ3K3k5
 QUFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YfGKZbxn
Subject: [Buildroot] [PATCH 1/1] package/ltris: drop unrecognized option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--enable-sound has been dropped since version 1.2.4 and
https://sourceforge.net/p/lgames/code/432:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --disable-shared, --enable-sound

Fixes: 61848605cd26d29f54c16de862aedba7cf334be4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ltris/ltris.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index 98902de44c..b34ac142ce 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -18,12 +18,9 @@ LTRIS_CONF_ENV = \
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
 LTRIS_DEPENDENCIES += sdl_mixer host-pkgconf
-LTRIS_CONF_OPTS += --enable-sound
 # configure script does NOT use pkg-config to figure out how to link
 # with sdl_mixer, breaking static linking as sdl_mixer can use libmad
 LTRIS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs SDL_mixer`
-else
-LTRIS_CONF_OPTS += --disable-sound
 endif
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
