Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC36C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C9660551
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3C9660551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6B44023F;
	Fri,  5 Nov 2021 22:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9ybiaqvIGv6; Fri,  5 Nov 2021 22:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C0884021D;
	Fri,  5 Nov 2021 22:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D21E1BF386
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 480954021D
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYcWPU2pElKx for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC01340130
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:17:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d3so15917157wrh.8
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 15:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6vUctaJhjUkWK6GMKUIrfQX6Rv5QcAcDTXLR/gj1qE=;
 b=lSF0uKmLgdMuCmwTyF18GtOOAEkPm/ikcggJoRgUfpAROiV0RXC2YA2ABUu5yq+Wgh
 cTYZy34247gQSDxaL2EMnDZqlGvd3M+CpsJdeEiFZ5LU/zbkpSJS5cq6tmFSlTX21V50
 uwL/8J9kpXIgI/shEEsY41PlzemO+W+94jYq9Qp2MRqGTcXDNWFM2UzVy1lGmFb6eTOG
 EnZdnZoeiTjiM2hYNQMmM+T4Fgo3fWwthpgjE+GK5ZfIg6E0pmHUJ2cAvGyYE5rL5f9S
 zYqM+5Ls3AImVpnIkHwb/KUD7Uk5w9bX3J8qghV1pwuyvInLUQ01vjcw/3eUkd7Qi1rO
 qHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6vUctaJhjUkWK6GMKUIrfQX6Rv5QcAcDTXLR/gj1qE=;
 b=1rlV5kQZkwVRYHBnY7T4AU8KwKcGg+1uTKhf0y5C0rmdHwrWg34zz4tU4skMMpaVEI
 jiMzaCoVggH/6yZMFvqwO0oQQBHp2Ft2IHDH4ghRGufyQwRjJ/a3PlXtws2nR3c16vtD
 bZoe09FyTBa956iDlLcJ/vy7CzswSoCl4SPKh0TAHmwehOSNYdghzBPiBJtZtweBCzAh
 WH++3DnC4wG/0xvcfv0LbBHMPLkwA6K1k2av2Es/XdhQ1W4jzeAm60nkOgl/dXZTUGC6
 guy4IyWTmJotoSqGQH4c0/fJUTCLzLcW3tmAIvplbeM3kjUNAeglpC7wK2D40wWVoGtO
 dNug==
X-Gm-Message-State: AOAM531Gwz1juYP8skHJ8BzRAp2jlzUf8gH6bBREz5WRniZbL7i2kHLe
 x+R09jjg+xWshryAG1EmZsxJCtVF210=
X-Google-Smtp-Source: ABdhPJxtDtMkzaZ8eiZMyF+0LhGGnxQQAWTIafqdBYLG6A9Pq6WBAU0CM7AAqbZbNnBVjwBage40PQ==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr71688446wrj.274.1636150624109; 
 Fri, 05 Nov 2021 15:17:04 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 10sm11135281wrb.75.2021.11.05.15.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 15:17:03 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 23:16:58 +0100
Message-Id: <20211105221658.1163788-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/refpolicy: move patches to subdirectory
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

refpolicy patches are for 2.20210908 upstream version but when using a custom
version from git they may fail to apply.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...001-policy-modules-services-samba.te-make-crack-optional.patch | 0
 ...002-policy-modules-services-wireguard.te-make-iptables-o.patch | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/refpolicy/{ => 2.20210908}/0001-policy-modules-services-samba.te-make-crack-optional.patch (100%)
 rename package/refpolicy/{ => 2.20210908}/0002-policy-modules-services-wireguard.te-make-iptables-o.patch (100%)

diff --git a/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
similarity index 100%
rename from package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
rename to package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
diff --git a/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch b/package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
similarity index 100%
rename from package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
rename to package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
