Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDC7CA6015
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 14:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C515E408D3;
	Fri,  9 Oct 2026 14:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3tCb9_XfPTL; Fri,  9 Oct 2026 14:35:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C911C408D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791556499;
	b=Wd28uR56uRRSvHTSdzLffRiMUi0ze8bkMry5TTonfqRiE5PPUsh6PB59df7UaZ89/mUJ
	 b++U11KS+R/AOKlSGnUwKMNTOChqj7htR8TAuZ/wU9LWZE1QBOrxxf7N8GgQEnIMYzIQd
	 fl8e2l595y0+UeQylUxfuk8bg/Za0zM4xOmvNcoIgmoR37kzrz+xA3kGsVzHW/odxRuFo
	 pPQ65zG98tBx62klHBoxJHR+E/S3m7Dp+0b7KppyLFOUwPm9OmJ1KO5iIJiawhWozVb0b
	 q9xDF1Ogsh1vgkOXV/whis+sPfyI/fkDijpniCsj6bhRw1KMMMua4nfcXI0455f/Nzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791556499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZIY2ZsXHCdyrZyeo6d/Z+Yk5e9tEXOpbnliujBHu3MA=;
	b=J5aX0q3mrRjQMpsUz/rs/zuahP6casfAvZdqhbegfhqgHK8+X+PJVuewfbQhkKo+yXxu
	 gtzVYjJQf24GyJxMmz2vOw24m1KqrvjYku3VZx9HCWe5JNgx+QMkAhOc/GSFypPMl69JA
	 DRw4pVo3GD6U8fH7KLPtEqV2ayGwRbxVp3LZgcEkEaeUytrxFawEO/75TP4UdJRdluvaV
	 UiOFFNmcKhTXfFNqalDgl3ZKtmGBi+tVU5S66UH8zRdEKinEyWQk5u3bupo20+Ct2C93l
	 /tiks6d19D2uhEHxIXnZjmwMOhCrwI+6opTu4S8/jwv4KWnmIkwa8oFAPDJxjSa8l2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791556499;
	bh=ZIY2ZsXHCdyrZyeo6d/Z+Yk5e9tEXOpbnliujBHu3MA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AFd1isXHv7zVZLeNaq7G3i+4k7o46ITXp8kqNxT52xShJMSFFcASjr0omGe84w2iQ
	 2CXu9DSh6MhpnQ4XaJgKDx9tJxr4MST8+HGNaYaTpawiQkQ4EH542/eenvKPBsXxtX
	 yuMV7Jl4EHsD49VKTERlpbpa3YOswC3dFj9Kb2CsLYZ3gqMUOrsfW5GCJ/MM13SOd1
	 FggrqrSoHVSxnpJ9uIzWQeS4Ue+1PFE/JyDekGiVOjwp32b6C9E57qE/MBOpe6g01/
	 A4LQoYfRntkNUIb8YFsEnlevL/CkscYAxisFLDH2j5EUDzvIhQQVoCujZJLt2hWcJ8
	 7KC5V7TiZhfcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C911C408D7;
	Fri,  9 Oct 2026 14:34:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D62A317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 14:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151228142A
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 14:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juYUqKDdGf2d for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 14:34:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB32C813FE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791556497;
 b=a7Z61nS2HorEUJ5tHAe1uigdUmhPIn3X6JXyRpKNLMghOER24weYJKetADe/IyKhKOY8
 N8YhPfLIvZwWNAQbuE8XZV+T6O+XYOOD0OeVokKltTRZTn+KKUFdIHG9Lj4uCY2t88wT6
 REZXQsbKnJW/0lDCUWB3r0HpxbWd/CUlRHFb3wE0sEqjdLam9qll1IH+RQP82pZWa1mb4
 lhLxPbu+d0kwifSGUG7vZCeBXZjX2U8qm735LEvu/92ppNp3fsLqpEmhV6O/m80quPt+k
 VF448HK0nF65BZkrDzvyVFizvymI+5aVbSxGFiro7PNh8ipEP/IL57vhvM5mHtML85Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791556497;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=CNsipdrEiT2129oHub8+mNclol4Dqtl+KyCT5AjM7nM=;
 b=NVnnuqJ/AvFe62IuE+3tabYTeoLUbTi3iapjEta3f/AbBS6UAI9QW6BccDpv7IWbmBhc
 W3Cftth3hnP45zuH2POX6QcQ47PnmxWtdeej81HqOsT+07fPjhiQ3FrePPin8N+zexNNJ
 OtYySL+3TIfxqUdSM/jXMc7S4wBnQH/VJD33GIqFgRR/gduJCXcicjh4KIY4UY363KI2+
 aFMFZ8TAsyTVJ5Onqhej/zz6Pm8cGiqa33nf6480eLNhHFZEaZ7A3z/4hyhjZn76H6+iG
 RDMtsBWjObDDtHDezN9Q5lP9eEfgi48SDACKdzLkur5Vthj5uF38FRJu/0rab3WqpXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=dy64irU1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dy64irU1
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB32C813FE
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 14:34:55 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6af9cc73235so3444012a12.0
 for <buildroot@buildroot.org>; Fri, 09 Oct 2026 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791556494; x=1792161294; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CNsipdrEiT2129oHub8+mNclol4Dqtl+KyCT5AjM7nM=;
 b=dy64irU1qUpg9ATybLSF0+oVMtiv7DKlrJQzO3xGqFs/pdWB7xad2LpcwXJFOiBIKb
 nYDG1lUIFo87wWpt0CgAOD7hUipj4LAZkBhHbSr1N52yRdabyMauOLGrsBV4q/BFbHW3
 OWeRWCZeXWY9lGIz4SSaejCz0yE1uWsI8DGTI87RAigeEZtbQtEVd4glRgRT/GrDhWSB
 gW5bwMiTHUdmAu4CyZNtHa5Z36aTff8VQqB0mWor6Xo41Sh67hv0vp5pBr0wxWyJZSL9
 79lVsp4LUlrIncuHk8mAGPZdojlLFxCtpxfuIaa/P5vRhz6E5TFjFbyjcJ+RAiUjynrb
 ALnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791556494; x=1792161294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CNsipdrEiT2129oHub8+mNclol4Dqtl+KyCT5AjM7nM=;
 b=tsrePasSshGMH+zecVMdLtDeHctg++Xt6NbJ3bED0ACYsh/37/8EwlMziHSWt1RkVj
 p4/4moWibSNAI0i5cNvVBQiMdUoprBURkVUOoGJ66hKhMG2EP05/ojC0W8ZLvZT7sWSA
 26jyrF+6hepDjSCjT4yKaDsJM617kjgzYa52Or4R4G4s4MZfmPAu2/KNBSnTqWleXRW8
 x8zHaAOnbeJEd8FMfyauONoHCo+jETeHyKZ+4FTyzyektik7jaMCDV/VWsVUECJFgnBV
 GaV9e1FFMGX/XWAS+2s1PvMxPGKOnOZFvkyA/sQha/E4KM5JcJmD2PU5vtm297N0xd7R
 eqjw==
X-Gm-Message-State: AFq9FYLOO1CoYBKd8h/HxpBdngEj0NXOHRgK787NNBja/EB69umL6eRP
 Y0jfhIdc4kxNEdh0pXHq8lN0D9nnZZdCQB220y5oMzGIYXJWuojmOwQad6XWtw==
X-Gm-Gg: AYBFou1h8qPhT5/i4NjK7cA23y4iNJWOojIqRGEwIlv4B1W/QO26PdcNVZ3da54yd0q
 IcS2bUhrTF3q+HHC0esIiES/aCgNHzC1y7j1Le8USR+PXxVKH5W4HpTBU4qTuEkFEoH8p0AQ8GD
 qkgmUXJLRKgLnI52uVtSDM2bNtUbnz09RRzGzv93HIrviID4jv40i+Fb9AKvLPvlqnKGl8YnjJH
 YK19jVrXUzB86jncNrGogKxVssTBcktWqMaLejkhy/MuRWspRS+gIZOqjkjJZzjKJ4mbk1Hrbu8
 wpGELkzvmTANAcjKWQjMiCSigIq1bzVN/dGTmIYq/dETAFvVrb/V8J5zzSDxUKORT4VYXecT0Tc
 LXTq40lPQkkmOmpuZMvpO/KlZJe7hfagY8iVQyaAV2vlSFAG5jxf6zd67K6vQjQqLDHRmZtfPmD
 6lHItjgTg0uRoVblpgGYk0qDdkTCktRsTF2uA3H1NE2SMN8cNeLw1lTbfYSbRPFjxkFur3ye8/O
 qKLXij1Lbx6gVIjK+tGIfIuq/7gy1zaZXG8biSfcrzMrPo=
X-Received: by 2002:a17:907:c317:b0:c2d:c57e:fab5 with SMTP id
 a640c23a62f3a-c31a9d0df36mr208860166b.7.1791556493332; 
 Fri, 09 Oct 2026 07:34:53 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a97654e6sm105257966b.7.2026.10.09.07.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 07:34:52 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Oct 2026 16:34:48 +0200
Message-Id: <20261009143448.1559850-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shadowsocks-libev: update the site URL
 to shadowsocks-c
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Yegor Yefremov <yegorslists@googlemail.com>

The upstream repository was renamed from shadowsocks-libev to
shadowsocks-c. GitHub still redirects the old URL, but the README names
shadowsocks/shadowsocks-c as the canonical repository.

The v3.3.6 tag points to the same commit in the renamed repository, so
the tarball and its hash are unchanged.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/shadowsocks-libev/Config.in            | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index b5be19f939..939bf5d2bc 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
 
-	  https://github.com/shadowsocks/shadowsocks-libev
+	  https://github.com/shadowsocks/shadowsocks-c
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index 778daf37b9..75c0d58be1 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SHADOWSOCKS_LIBEV_VERSION = v3.3.6
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev.git
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c.git
 SHADOWSOCKS_LIBEV_SITE_METHOD = git
 SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
