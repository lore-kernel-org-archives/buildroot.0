Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2EFC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 08:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15696077F;
	Wed, 24 Jul 2024 08:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fChCD9NzVJNz; Wed, 24 Jul 2024 08:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE96B6088F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE96B6088F;
	Wed, 24 Jul 2024 08:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF56B1BF853
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 08:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB4928134D
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 08:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRQj7BUGM4wv for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 08:53:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82A35811DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A35811DE
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82A35811DE
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 08:53:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-368584f9e36so3686257f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 01:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721811186; x=1722415986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+FQOZoSfxaAlPUbb3pVijpt/vWGPqOB/r20P4F87908=;
 b=sElf7NF6d45iljro4IWEthD6k2Bn0UMXYC6gtffW7huEYKQ/7ELdpucssEXusSmuBY
 r85/TSwOmY0qjznVR45KdZLN2oFCUEes2grTIJQOPKxABoHf2/bHFRLwfd//ohI5WbvY
 qsqwt4w5jhTp3p1OXKHo7UYoklQC0dCdJ+hlwwwtvTum81ADEE8jq9zMrGTDB8hHKSBa
 /pTuLihF34Ih0+gqe616KmrcIns/atxftAZSjSMV09v3/gSSSSohrcsBpefpM6q5WljG
 GR1ag2UzBmbCm7D2D6hRNVDSKP5q62dhzpgXUanevMBVmMFsJvyZY8nNkjA5cR0KrIZO
 whmQ==
X-Gm-Message-State: AOJu0YzPaUelePKR3Zr/msvRu2o9k00nhqRKyCjpxa26NU2MmnhGEWBf
 mZWLCNphDekP8nS6M34kBFlJKk7h2dAjp9QaPqHujrk+0XEBLCX3gy89Kg==
X-Google-Smtp-Source: AGHT+IHXet11Vdf3PD6LglHxBijJekILW8bVHaYXStsEiapihxKAeYW6wmJ9isvsOZcr+iWq7Gmpng==
X-Received: by 2002:a5d:408f:0:b0:367:8f29:f7b8 with SMTP id
 ffacd0b85a97d-369bb0a0c57mr8135938f8f.51.1721811185705; 
 Wed, 24 Jul 2024 01:53:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941377csm19272855e9.48.2024.07.24.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 01:53:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jul 2024 10:53:02 +0200
Message-ID: <20240724085302.1821942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721811186; x=1722415986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+FQOZoSfxaAlPUbb3pVijpt/vWGPqOB/r20P4F87908=;
 b=RIHBNX2X+Tdv7kbBxHMTrYNyu4evsgnRBhEPkT1g32eUldOqd6bkHjl0p8hCrebI3y
 MDngxIPGltTqxKRMi6L8HvuoVhGTS2wDlo0kFjhyzpQJauyZUyrd5P/q9MkUzl2pk+nx
 k6VirGr2d4YxPk6ko1uCL0jFySvvhOObXD7YIc4gxw6gkDyCJBJl6jAlLf87UDJxhKhZ
 hzF6WMBqjYuj1DOuOVrQOyF1dkkYILhec7Db3f85cld5EovwuPb/0fiMvNiy321suBzZ
 OehJfOsuXY53AB+sIiiQq4xrFIOIEBT32pdzeDaQ7uGWPZ+4PL62SSdhs3ygsJa1iy58
 4zag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RIHBNX2X
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: don't install host
 udev files
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass an empty value for udevdir to avoid the following host build
failure on one of the autobuilders:

/usr/bin/install -c -m755 -d /usr/lib/udev/rules.d
/usr/bin/install -c -m644 64-btrfs-dm.rules 64-btrfs-zoned.rules /usr/lib/udev/rules.d
/usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-dm.rules': Permission denied
/usr/bin/install: cannot create regular file '/usr/lib/udev/rules.d/64-btrfs-zoned.rules': Permission denied

This build failure can be raised since the addition of the host variant
in commit ed69859a7261ee86e71aa666d30a28e374769e15. udev rules were
added by upstream in 2016 by
https://github.com/kdave/btrfs-progs/commit/62c0666378eb70285b6a3052bf4144d2132a5891

Fixes: ed69859a7261ee86e71aa666d30a28e374769e15
 - http://autobuild.buildroot.org/results/c46238afe8d23cf4bff4e7290a5eaebd0640eb6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/btrfs-progs/btrfs-progs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 800c0e3082..69424a2d72 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -62,5 +62,7 @@ HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-python \
 	--disable-convert
 
+HOST_BTRFS_PROGS_INSTALL_OPTS = udevdir= install
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
