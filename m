Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3BAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB2B41F47;
	Mon,  6 Nov 2023 20:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB2B41F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQBVyyewPax8; Mon,  6 Nov 2023 20:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB66141EF4;
	Mon,  6 Nov 2023 20:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB66141EF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8A01BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF093606FF
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF093606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B03yEJLKTT8F for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:13:14 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F07C6068A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F07C6068A
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so2914281f8f.3
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699301592; x=1699906392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDh5cvrxiIAWr5Mpdr8HZroe8ZANVzuHULda9jiDRRc=;
 b=wODpYFh6+lVBHGaO784hIh8qWQizhebQEt1OwoYRUJr8NA9kuOWTOVMJuTQGHnrx4z
 7wdchX3JZMogmFeGi8af3eqM594o0Ve+2ZIYfuLg7i9f85Yc+PVPGnfp1+x96XtNCHfw
 VGjT03RTxRHlzVCcVpSTc6qXc4+4pv5ebYOJnPCQILw2/AA9+wqIBryKJdp57DCEAeoN
 5LjLGurf0whP6Zbm8hM0HfUa//kc1GVRi3OvSaTeG+GuGC7UicbvxR8PxJRwz4N1q8Y9
 O+DMBSpSRQfvat4ve36wZ1rIN35aVc5qKXUzYuGYN8CVmdmASoze68K6bWSta5v3EXmB
 bDpg==
X-Gm-Message-State: AOJu0YwOicrZgyeB6U36TDV98AFfQ/K0r5wiBveLxpLTV3/TCBX7om2q
 z2XeOhJdSwWLeidghBzp/DGG1aYOSgQ=
X-Google-Smtp-Source: AGHT+IFCfYEKmaIOXw3roeLqCy/7rL+lrcQANF1h9DDZMwgKPZTMepq2NuAE/Q0pWhrKNf4bt/0UDQ==
X-Received: by 2002:a5d:414a:0:b0:32d:af58:b4e9 with SMTP id
 c10-20020a5d414a000000b0032daf58b4e9mr21269251wrq.24.1699301591807; 
 Mon, 06 Nov 2023 12:13:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y11-20020adff6cb000000b0032fc609c118sm441128wrp.66.2023.11.06.12.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:13:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 21:13:09 +0100
Message-ID: <20231106201309.7280-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699301592; x=1699906392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDh5cvrxiIAWr5Mpdr8HZroe8ZANVzuHULda9jiDRRc=;
 b=igChaZEAIJn8+dRdU8d+Y9eTfMc+w4wVDP2Dfl/eabKjXxhuLAJhukOkL9cbeeDcT9
 9NDHh+ATGRb+N6eC3curlMLxw9pglKZlFxE2h8FSBZ6rTe6bCQapIHdkVUgf7CVhE9MF
 Dk+PksRYEHFtI6aNbtttPK/chKQ7BSSeBV0EEVlFFlGnsm9DArE7k7aSJEyF/v9nrVDn
 aBFzTgumg9n7AInBoZTfGqZoPFnAK9/S4a4jXmv9Aj313Jyrw65yUTYIkiGtk1qoblbu
 UOGJksfHsCfTuecMVgNAJXxy4U/8EBovCws3GmpNdzSfOsfJtJ7kxY0oSgMvIy53HEOm
 7qrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=igChaZEA
Subject: [Buildroot] [PATCH 1/1] package/xen: fix selinux module
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following refpolicy build failure raised since commit
64ce823223fece5c106994d9654a126fc6161d6a:

policy/modules/system/xen.te:559:ERROR 'type udev_runtime_t is not within scope' at token ';' on line 628879:
	allow xm_t udev_runtime_t:dir { open read getattr lock search ioctl add_name remove_name write };

[...]

policy/modules/system/udev.te:205:ERROR 'unknown type systemd_hwdb_t' at token ';' on line 582304:
        allow udev_t systemd_hwdb_t:file map;

Fixes:
 - http://autobuild.buildroot.org/results/849050b00a2ee5983c2324cb955cd533189a0460

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xen/xen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index ad71b14105..80412cca97 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,7 +6,7 @@
 
 XEN_VERSION = 4.14.6
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_SELINUX_MODULES = xen
+XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
