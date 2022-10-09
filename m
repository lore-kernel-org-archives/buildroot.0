Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5875CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE5640640;
	Sun,  9 Oct 2022 16:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE5640640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRLLzIyPiXxJ; Sun,  9 Oct 2022 16:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C9A340643;
	Sun,  9 Oct 2022 16:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C9A340643
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F55E1BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ACA3813FC
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACA3813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVdDWgnmM4C8 for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D9B813F4
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D9B813F4
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d6so13471888lfs.10
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gxoxkzMsx5oQ0p2ArcXsuqo1xKNMKRrTxYJPf7MQViA=;
 b=DQyCWnnjFsqiCwnYzNn8OcdafOiGPNvj19ORGS6YLQGWdWCvTm76aC/Boku7FepHPS
 OAfU4xM8seNmZRekNKEbeeOqOt+YmNf+/hQ51+lXKO4PKMK9YbyjUrRw+2gDaRlTnfyG
 16AeNTfJLjKNM0SenXgcvjkZ2EgcmvOumW8cnCg4CjwdbIecRwXWVHgD24uuP0/Ycc5l
 Yz+cESzYDqUOv6Zx/+G/6etbSjNNHeuf2mT9x83COcpnWpraZLJWUb9D7GKLjYqGCe3D
 clXVVUxTfk++geruPoRpWkIrTWNk63VNbI5ksTkJuLGL9aEWhp83lpJANkVeLFxUVhRf
 AsdA==
X-Gm-Message-State: ACrzQf0+ctEBlSOSId4Q4TmQvj2dL7HrWniccSFzUEEWTKsg6H84YJd8
 eYRqVWbiB46pcKdwtnGzArB1pLNq24Y=
X-Google-Smtp-Source: AMsMyM6rrFzXmyxaOi3hEogE2edeJSbbnu1e02NKL/XcdMIxor3GsXYu1a9xo9u2wIUxLxEwZuJA+g==
X-Received: by 2002:a05:6512:3444:b0:4a2:3f41:ba72 with SMTP id
 j4-20020a056512344400b004a23f41ba72mr5518671lfr.396.1665331196804; 
 Sun, 09 Oct 2022 08:59:56 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:56 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:35 +0200
Message-Id: <20221009155938.2041695-8-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxoxkzMsx5oQ0p2ArcXsuqo1xKNMKRrTxYJPf7MQViA=;
 b=EmimjAaBIcbCIFKNzUQVNBxck6vdOjrkClOyMJJ3ydmDlUFPde1BelAqXFOJOxUt76
 ogyvVj9aVhMUngfOpgc5xApccN8G82/x+WVCi9aKUtRJKOgZCWcNEd7jwpPOX3UcDUd6
 01d+9Kg+ZfA61HfLvPMRtsqLRVAYSGHHPcmXBpENbXnG9XDwHVUv70qwxLyNAotrTINX
 UHJjCkvIF9QWNwwkMxqlODDL0g16rGbK7UXQ5bw6Q6RdU0Ny3oDPbZdIKow11cNbcGwX
 QBbWbdnBes7zPK5NxG6RqqOYjl00Wo/DMrDNy+9MkH4nJaVkiBh976x1oMWMjelYW/sq
 qiQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EmimjAaB
Subject: [Buildroot] [PATCH 7/9] package/s6-dns: bump to v2.3.5.4
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6-dns/s6-dns.hash | 4 ++--
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index c63e96e129..5083024520 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  0c1d50e5d7bc65cbf59b6f37fbd7f6f5645694224bb8c4dc1943d7921bc74f63  s6-dns-2.3.5.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  76af222472c4754f83cdc59ad354255ce1b1e6f6833a059328463f8e51f4db43  s6-dns-2.3.5.4.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index dfde2c29f1..1b7d65570f 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.5.1
+S6_DNS_VERSION = 2.3.5.4
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
