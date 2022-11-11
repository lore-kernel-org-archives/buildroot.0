Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A68AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 10:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254164031D;
	Fri, 11 Nov 2022 10:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254164031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47UrfGRkDP-6; Fri, 11 Nov 2022 10:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D76402CE;
	Fri, 11 Nov 2022 10:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D76402CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45CBD1BF2C8
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 203CF4049E
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203CF4049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s59uD5cwXN0y for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 10:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A85E400BB
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A85E400BB
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 10:58:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v1so5955435wrt.11
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 02:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQpyyau4JFDz9/jfAi28rHiM5XQ+8Vn1Sbgn44zibG8=;
 b=Xe8wM1MhGWsPn3V6jjDrgnJMET8EuZEaSZxqmX8OPHjetjeEGcl3PZm2dvIwQ2ckAX
 r3DdDkgEa45ZNRNwFJD+MHzqi4WQveIAhSXRnwFbC/f07iUjAclX80LfiC96lgIqPZ3l
 HOxeejhWegZ/IhPuCQ9zSqgl3OAR4QeqmcgNXC3Cq9KgzUKBV13R2rbXTCZbBz+6drJb
 oq7ruH5eA8fCYlqktSkatnU+8E+/PCw3l4jEQGXeFHFDgrTn97LMcdFxjzCtoCiaL6AW
 0qvimU/Iyi3omI6ZynPS8hRF8gioMXuIL+YddM+SEPHYqSRAShGBstkAjLusR5+sv3mK
 6f1Q==
X-Gm-Message-State: ANoB5pm/5hnkKwJbWMAQJXmiVt8Zp6wamDm32E1cDQ2BR26K2t3fk6Lf
 3j7KezIvxFMgUxVh3Hx9XIb813q2Zfg=
X-Google-Smtp-Source: AA0mqf5mmGaYFaeu3GjTjEj2n39kUp9RvFm4Id2a2b75/9xgDzA+GL0Q0dbE1lrzogwUPJsdAfMH6w==
X-Received: by 2002:adf:f745:0:b0:22e:2b7:f215 with SMTP id
 z5-20020adff745000000b0022e02b7f215mr873300wrp.512.1668164312649; 
 Fri, 11 Nov 2022 02:58:32 -0800 (PST)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm1627594wrr.7.2022.11.11.02.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:58:32 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 11:57:55 +0100
Message-Id: <20221111105757.552459-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111105757.552459-1-nolange79@gmail.com>
References: <20221111105757.552459-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQpyyau4JFDz9/jfAi28rHiM5XQ+8Vn1Sbgn44zibG8=;
 b=GWmjQIN8iueq9CilD2wlIflrPPC5PkcDJCJPu29fhhOPj+z/8qvnqarFsMBfksgqIm
 BbuFjH/Bkf1n1VBj3oloV8cIKaXJarHJ/xtkKeQv8nkzNdg0lR5xvKbEKSGEC35fu0cF
 +cFqoHGx9FQMqQPU1mj/uc6GaFHqBD5hR4E0DbNDXd5ywHkIfuRlE5vWi9UxDQd8+Vls
 cy8VVfafdw1nQAyydpYs79QhbiRgHG6GihhttSlJqvJw+IvzYgr0s4cPGNPXl0CUoqU/
 I1ZMwntDa1mIJDfdvKs+D1ryd7PbUoO3IUWX09mPCbtTzhSV8kRgghRyI+a/lFsYpi2p
 V0rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GWmjQIN8
Subject: [Buildroot] [PATCH v7 3/4] package/systemd: support dnssec if
 openssl is available
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
Cc: james.hilliard1@gmail.com, Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set -Ddefault-dnssec=allow-downgrade if openssl is available as both
openssl and gcrypt are now supported for dnssec.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v6->v7:

*   split off as its own patch
*   seems that the change was done at v250 or earlier

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 78632992fd..4d6000201b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -241,9 +241,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
@@ -313,6 +313,12 @@ else
 SYSTEMD_CONF_OPTS += -Dselinux=false
 endif
 
+ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
+else
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
