Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFCC79F9E
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7042560739;
	Tue,  8 Sep 2026 14:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzTqBwFmuRFw; Tue,  8 Sep 2026 14:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 560DA60730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876793;
	b=JoPWgvlda40rQhWAVdUKzn/V0rcILdGPZNpzEEpF43esIEixn9tTgMePZ3DxpGnOquUJ
	 CkDTGi51nT9IRLPzHlu0RTvSxgz3INnTohVYxYUNetArClR4N7X/KmAlIL68jqWuPuaGj
	 NciacZhlVYLIFXQfhSZyZY4bKFiy7bIjXvryxwOI2vr1B2kUGUfZDq/S0xcqZ4rur2//H
	 ogTJbN92pfgnq2+2TyQBfud+je7DOI3OH+PhJ7C0GSh3VbHsCZdQONxKmMLx6ffhU3OqR
	 5C384ZcNYU2c7+JtNcgQFEkQ2ZOk4qxCJ3WIRzsqXxwlQKGu2XRXdKWqR0bdBF5x6EA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2WCvrB1mKCmNCitinCXdZW2TQdHztgeGKkM98yJ4mAc=;
	b=j6+2NrJ488RNAnKF7KQfUgL9RzVsSVv4LMTTvudcIo9JmI2ecV4CRf0zNEe8Y9Q8K/FY
	 eIFHoSiXBxgn8YoThIq0q5mSr30gyYwfmq8qoBh84PJh/fU9VUMwXh02mdDPrbKF7WMsm
	 /CPixNGxeBIr+l7X3cUoEcey+kxLrGvmhZ0o03Ct1zvoHP2G8YfOSesapbKPIDMmPHbfv
	 8XfCSRSOFq/6aFHY2QcN8ewGAs/khlN7snz6jdq2W2XsJBlma9ULbc3tTg4lP8MN8rkmd
	 hjFj6/JR4TANH3IOb4DFoy2g9+04h2ilPL+lS8XedAVG0Ya4FZ1JsMkrCmo8isSRXSw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876793;
	bh=2WCvrB1mKCmNCitinCXdZW2TQdHztgeGKkM98yJ4mAc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QXAgSrpnYQH/dq7+/qOAFryFx75r9qD99NwB0OY4KxMLpqkuXRVgbREQJgKrowbUQ
	 F3A7G2O5SaYpAGxtaNqLJp2EkZ84TMaKoFw21GddB1vFw4qwcJDfJNL3tPS0T4/xro
	 zjhYHTB2ONvhvobHw59XpQpjrNcpKJezvzHaubIdCTdbFQsKxboUNco/Pgvb5I8Di1
	 IjUlZ769MvMLxEhhMX4WfFFOoP7olGDUN38f5mXPf60Cxrx95IGjuBPDb9RZgBCUOP
	 Ks/WJ+Se0eNNJLDiyruyukaM6hQd5OfFDHxncKTUMZtN1SpTkDdjeuXPCCbDbWU4JF
	 YoUfgHf/G0fxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 560DA60730;
	Tue,  8 Sep 2026 14:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFE0DD5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C16FC80A9A
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wZyZwFzW-KV for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B90FA80805
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876789;
 b=Wwui2IIjYw9mbYnCzvzTRzzSCt8pAycB1n3EYqIRYCBxIHxV38GoahhGaV1oLzKLboFi
 LeGE76behbGZNT/Po+oo0IUwgnIFSYLlcIBLW+HrCs598OjG8Dm++9i1ZFwoGpDgcnMWg
 yGAP0KpAhQTu1DzXuXxGa8AI243WTfWMdi1CX21/p3AP3Fyjy8UF3zax/pXJ+CxCdIxRo
 birvfQOJyJiOkkCPAMKtOxx3UjJJNWyWHyN6f+Yi/74rWlKOWZC418kHgLcHGQsSyvxxp
 0+VuBXHThpb37kgJh82iXmIUMcBWJEmRKbwQb4M9NXHGXQnhpfog8Fa++OvQeEn+9Nw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876789;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=BS53o76vKEkUpWe9jPO0EIZMj85Vdglr/t4PMlL4yRFEGvDrndGC6ceU4MUcV3MCz0aW
 2H8wnU6gw23GqptMasaPh770dsTDGaPdQ6u+Z3upBsU8C55m+lwd0jOGC6oqHfWyKujIj
 KqWh8zAMClzfOyJCL84FXVMH8AT1ZFgKdYeoUUx8bZ1BFVLsc8iPIDi2NHCxxlZvD/p0P
 XhVRkNCIMUl62LxRpmC4hxrKt6IBv3b3FosoLEu9j+fvVmoNXn/fvL4VO+hIUCJ0jF4p7
 1mDnIUdULV25fB3XqqH6Dm0EOClS1c7LOzHh5sMLoCjrL7wsmDlvRCyIScD2CBIFCAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=arJNUFu8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=arJNUFu8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B90FA80805
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48584dc164fso4358929f8f.0
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876786; x=1789481586;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=arJNUFu8GZ3hJL8pbyojGmo3n35tA9YBcVuXPr3StF6wgoM/yFhpTDJ2n3MAcdB8fy
 AsqSqronXgfHPhw3sSme4Ubye/wBlpzTvYL1W7z3PLd/FTlMNP0x1NQ89lrI5ob7sIkJ
 RxHE9/OmTyQ87lbmETCENsW6DGwUVXino6NGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876786; x=1789481586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FsDovDfy8TYBhQEXo3mx+ibnkUcW/VGzrXQogKLrhdw=;
 b=ermSVDRgMU5rtQc0hhL4aGFfO9t/Zywe1THeN3FHuA3q81aw8fXm6IycklWv9sem+n
 yJZkgb6BbbOPWn/hiZdJGKLfrk/Rnh2l+B8mRcDlfucN1s7aYTJ/wKKDXtMRD4uYttuS
 d3e/H+86IcPp2WB71umEg8xyZEES7CJSTcE8Rgk/P8nwleg9QyLX2KU2f2n8+rFVwI/D
 aZJ6+ty1yslwWsRLgX0XcAV/1ILBDF26fd4vmzlkL8DeRirjC5jBQLhejJh5AhwjBMbO
 hT1TF+eXsV116X/DuG7rUuAnxkLRnluzFvdTReC9rlmOXWTeXsUGNzHHuuxEwsDsaTaP
 JQ2w==
X-Gm-Message-State: AFuF++m/ESnqmSWsjjpSfEcsuJDG3pLgYpf5QqxVVzFgbM7Q3V+NgPBK
 tSNmIdBasH4jL9rGKN7LTC3zvjNvOX8T3WXsFiZrbhWbfbHGa+bb2IbCFU7jE7sVT/2HTzA6cSq
 gIb/XUEA=
X-Gm-Gg: AYBFou20kuHuE7qq21NMM835Xab8NEoOvDGAyGbSogsigveZkm3Ef35eJBmdxNgqHxq
 ji2F6FXMESaZt8HFs9iuNhpW/JjSuyniWh/kBdT5fPJ5BUD/KruQLWZgJdRh4df5Ju+sXFpWA1u
 sPuytCU/MjZoYL8+bHMBlGmcKSLsUlESUobRVsf3Yajda7JGOGnwOnhbsjt/TeV6RaizjkziSBB
 rvkAOnMufblZoWZKTBVChnh26LIqO83xcLI7sqLSDGMvWSCPPv7KRy6poSlbz/9muUBfAVjcMQs
 Qi3yFEVAEqrHyfAiU4ujMS4vtcDb13AZQstH1rsl+bXVVNjh2AHv5163ljunWNPNaD/N97ycE0+
 GltLnZUjTAWLxq5VxSHcpXdjtzB18Wdrytbb/NYtjHWAC05ZUVoe8I9EaQAB7iyQDqLRkFlohdH
 cocg19d2wDwgub5wUNEkxgcB86gnAidIulQhJz+YAgd0OBZeZk4/gUX5rvWmDYjTTnbz9wO2LOh
 gIMB5yg6cfW10WAYjCea5UrmI+0Aj4iFBAQhKHGcWXbqJb9tf8/2KKY
X-Received: by 2002:a05:6000:4a0a:b0:485:8a46:704d with SMTP id
 ffacd0b85a97d-4858a46713emr29860007f8f.31.1788876786270; 
 Tue, 08 Sep 2026 07:13:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:50 +0200
Message-ID: <20260908141253.1556634-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/6] package/qwt: bump to version 6.3.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd69..e20c9ebadab9 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f6f..67292ee025be 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
