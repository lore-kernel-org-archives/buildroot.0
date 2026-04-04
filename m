Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CDE88D8B
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 10:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14699608A0;
	Sat,  4 Apr 2026 10:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxjkrxts5E3V; Sat,  4 Apr 2026 10:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9E960633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775298540;
	bh=y3w0ukh2VpiKudLqBZ0WvAIRIpaKHA3z25EvEngl/z4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pUzd4qvPbCC8PokVfARSt3w6RTEy+XFE1I8BXH1wXZOQ1ymfxxMHciNTyowK/pkkm
	 +xzO1rnU23oxgu0bOrDbqtNTLeIn2d2OzvO4wBtUcSg2qmqRcU5xoJKPLifbl4zuio
	 BhJSqxGlZtm9jhHX9GeEOoKY9ezW25s6G2xPiFw+ORNMiDmM4mC+rm6rDr5HvzKW07
	 NSEfuHo+Y1xGPizdNOmvhZITF4HErcc+cCBLCQzIiX033G9DnNu14BrhhOk136s4z2
	 8ET2jy7gd+AQRD6IrQUCkSc2nftmy2f5CO2bWetbRvBzwSj3YG24iClSsRV58Gryy+
	 tfhuE4HsuqEpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E9E960633;
	Sat,  4 Apr 2026 10:29:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D955BF2
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D9381360
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZdaSmlKSPkG for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 10:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25CB78135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25CB78135C
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25CB78135C
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:28:52 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b9c62fc8debso214710366b.0
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 03:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775298530; x=1775903330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5oG79mSv/q7T19cNl8m3OcONsGrPkMgtLOeBId1kVA=;
 b=kyfImgoG7cI4nHX6NnnzNIY6nxklluSRw+UD9zanJpVi9Gjm9cvOgy77dMMDuHbbng
 ZqU55hnKcNU64k0NumtwOP98z6FeqF6a3aoZLxDDuPeokv+801v8N6Fajbz8pYKz6Xp/
 qc39aQTwuAVxrJORp2kGacXRR1C5KEVW+mHfWEuuYqxRL0nkToqBVp/yxIknadGuvFfO
 uip3mBFZbbT0U5wxZYZ5QFs7SbKbXNhayicxyVNs5do4M/nnIuzSqDctqBN6rWRx/WED
 hMtgpJrMpiPslLCtavp0hC3Mlk45Q/N9FvTpjhXYuSjL5oukNDfDH8wZa8jEYkL83i76
 qiLw==
X-Gm-Message-State: AOJu0YwRE5bDog/8wUj9l8h/VrRqVSfOZq5vNulNGiHf50tpYj77PTEQ
 47RYbqnE8T903iOQRgos1uieB+X2z8JyicsYOXJe5ld1t+OP+ktKvQD8vlbtfB/04HpyCuWncw2
 GTNUp6x4=
X-Gm-Gg: AeBDieuWM+o9j/CAi2i8FHVc+iFSR9wsUB6AI/B0c+kYpy6HdLn0iLNtaBdk7kHoS4U
 DS8lywDzwzTvkdEK/RGHXOJhnEFma9kEECbWgHauI6pQF3CsF/j7+utWSToRxWXPh8smiNf1f+K
 cJmk0sCNATJNzx6KCqHjLW1K/+b/jl1227aLtbfG/8zo+ykNIBWt8UQS4mXws5oePUGvrK/RlRj
 7LvvVpZ+5kGNP0DLoRUvWCJrLuleyz3ChH9Hv1t8MoyWMGjXXtM0pF+9KP7CCginR+5zXuIvtw9
 vsAsUw6ziFv5ZE21hqPVC0RiEUOrwUc05i+eVF2K2dQLUuvcJ2SwyIHaY8oRfH0LdCqrOutKjg/
 xOZCjLFLOwBVeHygzWWUV1JZve2p84qLJ/+w7KgceCOMBJjQtlQ4T7LXShv9pt8REfUoruI5czH
 hRDNJnD4DhfUSZIngiwOfCWLydSssZ2G6InmJm
X-Received: by 2002:a17:907:c19:b0:b98:6c41:a798 with SMTP id
 a640c23a62f3a-b9c6743b213mr310140266b.20.1775298529204; 
 Sat, 04 Apr 2026 03:28:49 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3c99f80esm286538666b.18.2026.04.04.03.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 03:28:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be
Date: Sat,  4 Apr 2026 12:28:46 +0200
Message-ID: <20260404102846.794428-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775298530; x=1775903330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r5oG79mSv/q7T19cNl8m3OcONsGrPkMgtLOeBId1kVA=;
 b=WLqI1G59II6057uvZ6Xd1az3P66Qoqy08oy3IlsJP5NdsDIytyo4x32edI+htxtPtr
 YbwE3wEd1TDx0nZ1FuJwxGDYYic4VHQGCozSgWRNLsnJNHNOlwgWquqdgmIRXKS1AwU4
 BOyIOo2ECTIisRoUgWf+ujRHyFPZljuaYf0l4XsPYnknUiBQAYr+TBGAK8JhXZ1cvVep
 yDnPxiVL8Fhhlo2PVNWufZeZA8iN7re7XKOuwUaMcOkq+mi76Z1nybFbDoICuNyuLHau
 i5qFo3rKvPUwkTsMgJP+uQVPSHubFVMS0N3gfsu4ueysfhUuRtvpb1vlTHcQ7Y+2XWgl
 1APg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WLqI1G59
Subject: [Buildroot] [PATCH for 2025.02.x] package/rauc: ignore
 CVE-2026-34155
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit c9f7b876ee5bac0ee7344e5ecb7bd3ac0d5aab76 added a patch to
fix the vulnerability for rauc v1.13, but forgot to ignore the CVE in rauc.mk

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/rauc/rauc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 92f58c6139..f8fbb5fdd0 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -13,6 +13,9 @@ RAUC_CPE_ID_VENDOR = pengutronix
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
 RAUC_CONF_OPTS += -Dtests=false
 
+# 0001-fix-cve-2026-34155.patch
+RAUC_IGNORE_CVES += CVE-2026-34155
+
 ifeq ($(BR2_PACKAGE_RAUC_DBUS),y)
 RAUC_CONF_OPTS += -Dservice=true
 RAUC_DEPENDENCIES += dbus
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
