Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F97DCA6016
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE6440608;
	Thu,  8 Oct 2026 21:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nA2R6fGmIKN; Thu,  8 Oct 2026 21:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7EE3408F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791495987;
	b=qCEGKlnpDrFmQmakqgSAFFr3MBHlDj9G6vSX6GQN2jr/iddpubmUINZT0HhJdCa4EBP7
	 ZIpup54vFDHW62JpZ9xnKGxzmgRaV7SO5WFZPKEn8K3oGj1uLenYZn3GKB4mZyECPtjaB
	 GI1xGEbd4kcMHgt6+Hj6iAddMUS6QeliEUKZxWT/ndKV834VlPWtKXlXXHSoRBUrHpMuW
	 eUz6bUKcY+9Cl4d0OIYeYX+ZUHF65Vc6cBxTtCHxR9c8S6LlujvRw/L8LqCALIGuVxhhS
	 Y9m8h0CGZmzKzRTz9ubGl6nSKs3zyyyRMq6K8VSFDnDgx/7KupMdu2cAoxaAVxhnSVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791495987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=7X7YGJitf2S25/1vNsB22PgFbAt5ZT1ReGo4O90ySRI=;
	b=ZB16woL2/LKO40Bc9Wefu8aq2IkQGR0ki241ViTFTfmySszsCJ9LHFK5TCiIfkkMiJqQ
	 wZi45/i5vZCeDf6jfvIQKPgLw4d7JUQ1HH+1+Bdn/ky5tHWPsAzif3yk5sSmxnmOzH7Tz
	 OTdOeiKDGZClmCN5NbeszdFvGVZXD3+ZeyB6AZMcBbzmRHHiUZmW/S1I2WPx7hGq8S0WA
	 tf4U0vthEIKRKSSK5PZGUiVzoY1Q+u5CZimN5kh3R5vtA25kKLmUjGsh3g2EEf05DMKcg
	 r7aXdAWTLoJgFyI0aZD+9LDkVQGB/tfJe+fniWplKRykiSD2c+9PwBxZc3IBLuh4g7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791495987;
	bh=7X7YGJitf2S25/1vNsB22PgFbAt5ZT1ReGo4O90ySRI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofX23JWKeZHgYq9kUqiBS+X+NkcG9K8tuxW2ZKbP5T+NxZlm8bU0hTTwuJSYosztn
	 Trji3n75rboWE48rEEH3U3cRgqWFgeFRZMhO+3NKuhbVK4Bf7XfnxPovL40stV2wEo
	 JS86YvMlY4ET16P/Hm1tew7gya6+8V00mRcpMynAohur68dL/71U+drPoMgZNDnivR
	 r69DMBTTql8GrjGT741C1ZZhxG25MslfDyDqfRtSvzYlLZl0fUHUrehujjOt8SKWoW
	 4SUrGM/QlPDXXBzoC0+XIlaR2QIwc+tCw2wE8E43VoLxyUXNzUdQn7r5PdTOEhNc5d
	 hhLQNH/1vrIJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7EE3408F2;
	Thu,  8 Oct 2026 21:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 387CE2E0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195C06089D
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBaem_Slh5SK for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 21:46:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57C3A6084A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791495983;
 b=Bl6tPMKvBXnwYHCm4FOCk9eLke6HYYoAapq9ZJTeZuetak/hzoSTUwgbIz/F81Fz822Q
 yonf7c0oIfN65XimpV8TDr/2DtmYWfb7GoIBU3IwZxV6n5HA0iy9YrA0a9jDlpezyF1SC
 6oU6R9uUpAmGFj0QmOwOXJAtpxzhRnTpjZuRI8PD663X4D9gQwMnSQ9BT955zyp9mp588
 JnpLaF6mxqn6baLB04RGhpiTK7orzIHxmeKwoIKoNZP8tVcMIfLlvSAd6ZwIQW24y2bTp
 mkvHhLEi3CHJISRhAZghEei+mOeBBEWneFBYhKqOmT1IPurkyqT/8v6o4aFSevvgLlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791495983;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=j6oMslK5VC0NYsvW4uRnvQoccmdgXsLbkzoyLzVOs6c=;
 b=hBkEbVGGA4CeWjMK8weo1lSaSoAwdCRRBdFridF5/SJf8sWhsmiC0D9ka4dJPtKPG8vn
 g8ulb1gIVTu8VbP2vFWqiTlxAY3Y1o7JVh8GT+4GYIuW/uPSGQXZfawZ7uvM4W6fx16WZ
 gyhQdNDg88CleTgxMd6LJcyXhwZQAGquIrJ5XSq4zEq27QPsqK9DgQyNkUCt/SozuBepa
 4maJB5RQxiD5hyKzh7MvtRMuOjRFGiZOohnSm86nHr0aZaOktBUo9oifknLYXrdq2maj6
 vER37fjjNe2CUCbPstZRLtWsEvEeOYn88AY8ndgZEO+QyPRUgIkafTv6j2KbBVzqd4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="g4/lVGsL"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=g4/lVGsL
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57C3A6084A
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 21:46:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2dc63f8d8aso557195066b.0
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 14:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791495981; x=1792100781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j6oMslK5VC0NYsvW4uRnvQoccmdgXsLbkzoyLzVOs6c=;
 b=g4/lVGsLk/3ovjLhhOROvZdZ3E6mk7OwM1JTGkjQ5+JcVZSHy+ISaBnNurwp1O+OG2
 +GBW1h3Qx0CKBuR0HxKfYxwB3bwHJO2NEQHm1YLQchzQHOWn9Dy9hbM3bd1IWG4gQNCI
 HPejg2FSshhFIJTcr/OrRLJvQb1P1brizo7ZDZCA5jJ+tI2IMi40aYYtvH+w/a17sMfN
 n7fAX3fF3mOSgvybiT5m/Ih5Vr/7z0aXQfKePtRu8aI651/rRObw5kLdcjO7DK/jX+9k
 c6c3ILe01RvwIZe2WN0vh/a5HhEPUkExR5hTOKM64dtU2jxmqqIzIi8Nqqhp7jHNHWdp
 hQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791495981; x=1792100781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j6oMslK5VC0NYsvW4uRnvQoccmdgXsLbkzoyLzVOs6c=;
 b=ndUffN4u4Ga0Q0lTS2w23iOfz83vw13iLdJugGjl1G+j5PPsmSs9jllDsSP4Nktp+e
 NPcrUc8goyAkDjGqKfQyG/kilYgUFK0ehbw6BYyVaukuYyXLrDHkhtJqLqXQVA+DRoKD
 l/R5ym4Mv7IsmSaoSdf+RQqPtMuEiqjGae/tveVwD/VjKYmbES+D3qDOm3cyq911O7C3
 wRP/ZK3kSNppjE/6SzOCJCYXH8xohk9PaePx6kyZEpEU37ngZR+/1nfJDy6pzdMVL/2f
 l/j4exBYSAjfFOue65p9gFd/TkKJ043fXoP3zp7Pz2f3Lp4x6dqeVcoHqzzDpPiNVE6P
 KbMQ==
X-Gm-Message-State: AFuF++mQemmzGFge/adX0ugaoOk0MSfIElMkXYNsnQID0OJlohNhk6JA
 Dk4kSv6JRGQSZ/DG2G4nUkj4LE+wvMXVlQnDFK3QGF2IQrh7iTer1F5Eob3KoQ==
X-Gm-Gg: AYBFou0fIr6cSsYjioKgGcd/DMqLXT/cWs2WaDwgKJzM0vssmgYQveO1XTt37jc/KKU
 qhzF1JAES2EXPfbFH09StF31ztI6nLSJvVwoWyHuHhKEix5QEdRvPyKJi9nVe0qQrZH0hKkDwFq
 K0jtVQDTesgnOr+JcB6XX+v3Kc1dKR4xr8Pyxufr9GZnEWixZnyIPlIDh1B1F2NCOCdUzjgivSC
 aQjEryaxk9PEJqcdfihMsueLb4377T9tipndOpF8vOBOyvBUnJdzR8OuiT/yHYUycV7Q8Af0ZHv
 vdzFgIJxThu3LYr9bkYzdNg9btVG24baxWK3pILOn+pSrsMgiQ6CXJ8rX26ZK0MW4CyEExBURPk
 aKnX6AkKo3g2mG/0X5TMNjpx13JTwUglyY1fYPnKIeq3+/d2m0ZewbyqKowS7FB74a5y3KhHnO7
 CeFgkvTpWQESXOdcIzcx+Hkr56Mf04ApuA9VjSih3fTL9koWhYA8l9+MPR8Z7WXgBMgzaN7I0dy
 Bl9g4e/kN8cgxpMFvidYxFeVkTF098+ZkU3VysKecU0rwOS
X-Received: by 2002:a17:907:3e1d:b0:c31:70a5:4c3b with SMTP id
 a640c23a62f3a-c31a9a2fcccmr7677166b.3.1791495980956; 
 Thu, 08 Oct 2026 14:46:20 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C2641.nat.pool.telekom.hu.
 [37.76.38.65]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31a9a3bbe2sm2523766b.27.2026.10.08.14.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:46:20 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu,  8 Oct 2026 23:46:09 +0200
Message-ID: <20261008214609.721718-2-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
References: <20261008214609.721718-1-mr.zoltan.gyarmati@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/proj: bump to 9.9.0
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

Also the cmake minimum version is increased to 3.22.1

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/proj/Config.in | 1 +
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 86966a4d10..063383f1e0 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PROJ
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_WCHAR
+	select BR2_HOST_CMAKE_AT_LEAST_3_22
 	select BR2_PACKAGE_SQLITE
 	help
 	  proj.4 is a standard UNIX filter function which converts
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 38b4d81337..a0b42fe1d5 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.8.0.tar.gz.md5
-md5  f04335154621e9ce9a5800ea08c8d96a  proj-9.8.0.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.9.0.tar.gz.md5
+md5  50ed234d73d68f7bf4378e9a020a40a7  proj-9.9.0.tar.gz
 # Locally calculated
-sha256  a8b493b00cf4d08b712b9e063ed5e53e2be90fcde46770e9dbd773341f378f43  proj-9.8.0.tar.gz
+sha256  791a0610547eeabb17006cfd49cdbd2034f3240f47ed5e88a1031811f4e2bcf3  proj-9.9.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 5e74f377c4..114f34b04e 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.8.0
+PROJ_VERSION = 9.9.0
 PROJ_SITE = https://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
