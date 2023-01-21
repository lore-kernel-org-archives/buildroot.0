Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6A3C25B50
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF6581D9F;
	Sat, 21 Jan 2023 16:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF6581D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Jj2qg2CUza0; Sat, 21 Jan 2023 16:36:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0819B8248C;
	Sat, 21 Jan 2023 16:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0819B8248C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 303971BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1882B81836
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 16:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1882B81836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRQD3joD8WEH for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 16:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC5881D9F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CC5881D9F
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 16:36:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso5729243wms.3
 for <buildroot@busybox.net>; Sat, 21 Jan 2023 08:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Yd1gnjS0YWwfgxV3UCB3hxyPwBsHPxzSVUFraplBgk=;
 b=BcGgedlEUnlVNgooRSvoJeug/SlB5Tiqp+HTmQ7GnqnPbnzDGfMdFcmqgQ5GeKPaom
 8GzCG5MnwOtrx5bx28CC7/yDNIIULPXu3BsjDL0rjWeFD7obz0fXiDb28+9dmJNb2oiq
 OUMIc6h9VibxX/FaQ5fdc0CkTDU85ySteT4o12ItA5MIJmG8lnfvsm8D1jHNOKKgB7HG
 CuqDupU2e2lHKVY/OlWqvp5GouEGa6xEbvkosPsYFHZTZTPw+NMmcd4fT0h0lKSORcTb
 Uvw11st0eSHu+fr/M/PKkhkQUFg29kgToIZDBtqjAJJVe9vej6sd9erPMh5vW0PLWz8S
 2qdA==
X-Gm-Message-State: AFqh2krlByLriydHkjw4lLOAfwMEsO+U8vRZA9l9yHPLzHUniTXBwLcY
 xS4gx0GDshy293rVkMLrPjo2E8rDwNI=
X-Google-Smtp-Source: AMrXdXv/tMi+YeqR8eCB+Id3I1s2mgxomjsatRZDRd/w9Iz0BlOnmST/rceJ3yQU/n1AXHIg6p3MFA==
X-Received: by 2002:a05:600c:4e05:b0:3d3:5a4a:9103 with SMTP id
 b5-20020a05600c4e0500b003d35a4a9103mr18062227wmq.31.1674318960376; 
 Sat, 21 Jan 2023 08:36:00 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b003daf89e01d3sm5648794wmb.11.2023.01.21.08.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:35:59 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Jan 2023 17:35:35 +0100
Message-Id: <20230121163537.147981-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Yd1gnjS0YWwfgxV3UCB3hxyPwBsHPxzSVUFraplBgk=;
 b=A20e5KxGExX+JfB3u8ucDDzwVWurQ7q2yOkSg8Om8O0WK/NvY15e71iGsxWRT2znhG
 1C6bfxYt2CaWVNyoagVYPB1SkQKNNSZp5PyC7lzi5cZY1aHilHv/4Kg2VnrtOQ9qRdzt
 58Y3JG/rPUlZEfpt7SZ5KsjSmvzVjl8g6x2oiFpD/tQQQ90aAU3L8tSub5eQ7RTa2Iow
 r+CcSFSCPC01uuPz0rC3dh1wBMfuJ+N/XmeW/esmlkb/h4BTNxIQyUmQGV0i+V6+uaOR
 6wLtgKqCiHriBWuRKhuthpRTJuBJ96tU2KjFIVdLX7cfVVfIbikPsZ33Bl/Ar6pUrkKf
 0Vmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A20e5KxG
Subject: [Buildroot] [PATCH 5/7] package/perl-mojolicious: security bump to
 version 9.31
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

see https://metacpan.org/dist/Mojolicious/changes#L3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 97625d129..989eaf341 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  494db2d1529e84a2575527dae8f3672d  Mojolicious-9.26.tar.gz
-sha256  9e428c5512698f05e151338d8fa12aede287ab3a5e429ec3d38c80a4a82c8d88  Mojolicious-9.26.tar.gz
+md5  523193316a839ff56a447f0f0c2e5b36  Mojolicious-9.31.tar.gz
+sha256  cb96ccd7a5319321ec6f57633c88bf17193d45169f4d7846da254bb6f9ed8312  Mojolicious-9.31.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index dbf2e6173..618327d09 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.26
+PERL_MOJOLICIOUS_VERSION = 9.31
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
