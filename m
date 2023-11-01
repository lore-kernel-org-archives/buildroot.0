Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DC5C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6EEB84B3A;
	Wed,  1 Nov 2023 18:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6EEB84B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RuWdTrgnrot; Wed,  1 Nov 2023 18:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A7084CF3;
	Wed,  1 Nov 2023 18:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A7084CF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA5381BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A370C84CF3
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A370C84CF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIztlxlLzOYV for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:06:17 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30C3284B3A
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30C3284B3A
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40859c464daso580055e9.1
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 11:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698861974; x=1699466774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jsdlmweuveKqFK80q5GGcKxCaNaAuabJo0PFGpbolA8=;
 b=W3R8ocCyU6q9COFyQFcu0ze9kWP8vErvtaDpiHft3fwRHASOrIyk0NdMkCBB+8AXQX
 hmTD/Imtli+BvpBKgJePhJEva8R1eL1GLUU9MYcPJFYL5GbavwWzNt4d+mmnATdNs9KC
 GcIaBSHW8m46z324wL7+RNGv0rKiyA5TkmL+a4MID3d3PwQlzyMYQsU9gz6m9DhdY9kB
 a3DIvCM0TlQGujps2w8F78/dXqytjGcBrKAujN53C9LmwKrkT06aFvH900zM3urIMXmq
 2LAQPBGy9iXjjDQVRMI3u8JiJsIscFjtYzq9w/cvVh2+bHuXxIn17yG6MMO4+f5Dtsc8
 1ejQ==
X-Gm-Message-State: AOJu0YyqV8Ju5AZP4vX4bZmwZkNdKkTRu9W5dae9j4jh3qlnSwmzTeMO
 sSYMQkyp7EQOu4huPrr+tRhwn8uYbKw=
X-Google-Smtp-Source: AGHT+IEoIOa2FeEZJYMHwYj9y0g0zox5o8mudND7HMDnAuH5PvpE/LYAf2tbrO8n4QO7p4TYKFUzGA==
X-Received: by 2002:a05:600c:5250:b0:409:5a92:4718 with SMTP id
 fc16-20020a05600c525000b004095a924718mr2221154wmb.36.1698861974156; 
 Wed, 01 Nov 2023 11:06:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y14-20020a05600c2b0e00b00405718cbeadsm141706wme.1.2023.11.01.11.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 11:06:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 19:06:06 +0100
Message-ID: <20231101180606.18319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698861974; x=1699466774; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jsdlmweuveKqFK80q5GGcKxCaNaAuabJo0PFGpbolA8=;
 b=Y2gZhl3AozDcG0qoP5sSHgXoozrhIeqv271UCRhzvyssxEE2TCJk8dVBmW8MZiqStx
 xsBHZaOfCuo8m5rmCP8gk5sIi2SVp9T+RXt1GSirOaMRvuhvlbmQ24mVIukWpF6zKO2c
 JgJanpaeQHYBcjHXDjzLdHsYb39VZsMC7btjJD2I1m2I5UwFaML7q1N22mEY6lxaPtJI
 1WSyxh8KgOdzuR6epIQw6QXHWlx4XRZJ9yEXsdSoJIpFrIJyr/jOEQbkDGDtNZ1R+QsP
 SBJO/2KAXKWxzZFF8hA+WRLxYE5QNO1tSeGlAPDzj5JZvf80TPXsoCHO7AkV3t6U0RwR
 RXLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y2gZhl3A
Subject: [Buildroot] [PATCH 1/1] package/perl-lwp-protocol-https: add CPE
 variables
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:lwp\:\:protocol\:\:https_project:lwp\:\:protocol\:\:https is a
valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/804408BE-097D-4FE3-B6DB-29324871C6B9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 960de52f0b..ff9ee936dc 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -9,6 +9,8 @@ PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VE
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
 PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
+PERL_LWP_PROTOCOL_HTTPS_CPE_ID_VENDOR = lwp\:\:protocol\:\:https_project
+PERL_LWP_PROTOCOL_HTTPS_CPE_ID_PRODUCT = lwp\:\:protocol\:\:https
 PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
 
 $(eval $(perl-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
