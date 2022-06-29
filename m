Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC246C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 19:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC624091A;
	Wed, 29 Jun 2022 19:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC624091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5XZ_nt0WSSh; Wed, 29 Jun 2022 19:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47F16405C0;
	Wed, 29 Jun 2022 19:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F16405C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3E6B1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA5E041504
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5E041504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_33OO_Rp1As for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 19:17:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0B04401EE
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0B04401EE
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 19:17:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b26so11514144wrc.2
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWUjzmvoxuiFcQcZPtnVr/6+7WarDrZJFQJ82Cc9AdA=;
 b=25anw7CYTBsF8tj5sVMGPLssOGng29h9sHj5uiiXHGA+PjRDZ3GWximyQ08KDpAPn/
 K0+T3dAwgmEuAs/86Dg31AykijM8T6Q65MVfGhbAwpyPUhn9jASGt7VqUN3QSEZ0OSx8
 H4I7YCnm46BLpz/lrGHNUQIchqFkfEXLT3cg/5n6MWfCjGQMpa+rZie8uRMIZYprxYFT
 nWS7wgLfOUYVFaQxlweYLULm3TQpHC4cih2ZbOSMjhSeLsMAVqH5OE4/NdQOA1fDGIWC
 YT15clLzQo7j63dnT6QhGWeVGdXQF3ypHZwY6GBnNz2nS5dwxZS9EYBOrb+LGE5l2I7K
 Y2vw==
X-Gm-Message-State: AJIora/7rEerJK/6WcH+XkioiA6Qw6OmpcgEtnkJMxVREIJYjXfyLaJ7
 P38K/aAKJQWsnmvlimgSZp+t3mJVUKo=
X-Google-Smtp-Source: AGRyM1toPZbQLMgeJ5Qork3sJbIMa/w2ahwTur2wQ+19+y5M4ovsEffrroJrODggNrOXHff+nYt9XQ==
X-Received: by 2002:a5d:64c7:0:b0:21b:9661:6aac with SMTP id
 f7-20020a5d64c7000000b0021b96616aacmr4635194wri.496.1656530226501; 
 Wed, 29 Jun 2022 12:17:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056000010500b00210352bf36fsm16734533wrx.33.2022.06.29.12.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:17:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 21:14:04 +0200
Message-Id: <20220629191404.179891-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EWUjzmvoxuiFcQcZPtnVr/6+7WarDrZJFQJ82Cc9AdA=;
 b=hePw86xsyTpHDVp9+gSrcGFqs7cAyMZOVfIG9ykJ3pGfHUXSm5VcyMZ7Kt+78UDd4m
 4qBYT30n0xmEgNLQCHJqmXH8obsDQbeQg338ZsQjSNaUbqkPdrTjPiscwxzZgzom3Cm7
 jqXKOwBGJIIno9P18vLMNkXW2hwQCKOxWKWZwmazszIcVh1b4OjKuv13xufqhDnD1rT3
 +rGf9obXqHl2oIrblPPM+ncH1Fa77Cq0zELzCx/P0uvx7pRIoDEe7pdAuF7uQi+G935N
 PBh5uqrL/Vw7Ig0abeG70dpIzz1LtJOXVlH22ecvOKiASKZg1HGNu89K+izgpGM8SITu
 8FUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hePw86xs
Subject: [Buildroot] [PATCH 1/1] package/sshfs: bump to version 3.7.3
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

https://github.com/libfuse/sshfs/blob/sshfs-3.7.3/ChangeLog.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sshfs/sshfs.hash | 2 +-
 package/sshfs/sshfs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 106f06f09f..9372e471c2 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  fe5d3436d61b46974889e0c4515899c21a9d67851e3793c209989f72353d7750  sshfs-3.7.1.tar.xz
+sha256  5218ce7bdd2ce0a34137a0d7798e0f6d09f0e6d21b1e98ee730a18b0699c2e99  sshfs-3.7.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 6759f6ab3b..61f11af55f 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 3.7.1
+SSHFS_VERSION = 3.7.3
 SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
