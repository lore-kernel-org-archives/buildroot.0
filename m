Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2566ACD3423
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 18:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9B085879;
	Fri,  1 May 2026 18:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nrg0OofFVs4c; Fri,  1 May 2026 18:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5959485875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777660468;
	bh=RupXTwPxEpkyAUvqYVDNZ4K3YghBN1hFTgD3Y+uCA6o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sX/XvRKVw/yjBDpBxjdMmdSVm2JwaWldDmYa9ee5BWfmy30UdJv4HPQLKL32Tk+cK
	 GrG6+bToA8b8XoBFaGXno/O9/u513RrKj12wW86AI18cKX2cP02mvzK469cfjqi1KU
	 f6+GY5nbFOWLxxBMu9r3tsqdcd8lpxaqbiD4xWHSDumihxXET1eQCaG3FXWS15w2Pg
	 WLehxu3n1SIS1x+OdHVwS5YhHmKhn0H2HIfm3PlFIAxXe9KmNtCd5NJY09flnc5P/W
	 m8Gp3ZkBeaY++cry31vrVgCvZrJLP1ytu364FYGIhfbIbNUSN9Ocm1TROsgan0dxnv
	 Zn0PI2l+SDA7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5959485875;
	Fri,  1 May 2026 18:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9EAC293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB2316F899
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdbiigKQ87oJ for <buildroot@buildroot.org>;
 Fri,  1 May 2026 18:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CE5A6F896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CE5A6F896
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CE5A6F896
 for <buildroot@buildroot.org>; Fri,  1 May 2026 18:34:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 812B8A4C0144;
 Fri,  1 May 2026 20:34:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIsgv-000000000Qz-2Yuu;
 Fri, 01 May 2026 18:34:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 May 2026 20:34:17 +0200
Message-ID: <20260501183421.2459291-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777660461;
 bh=R09gSzKPlOcGPMea49TNwXotueDgOdWyn2OnV790WnI=;
 h=From:To:Cc:Subject:Date:From;
 b=nFTXiLnjmRDwE+vTDgX+CnlKJIry9GjxdQ+KkMv6V5eSLl2QPJ047Tt/pg5hSfw31
 0SqGMB66wXdlmDxZ9tRsLALNrMw56mExuftyMWurggpcsUj10pvqsDqPblb8hVz9Su
 zlt7tvzfjz7neIxg2MjTmGWF8Fckz2Ww9yo6+4JnaanZ30jzFATyG+LPfgikhjwM0V
 R8n1WUYI5kjO9NwloeHe7aa++yqN5e5qFxxqTbWstqiaaFXJ+eDtXg4Rv4D5t3qjpx
 9cp/ZXCBqn6zsTp3/E0lgbv6Pp9+bhL1j4vOW3saUDByCWzvaA5yGFVJVy64aFfgic
 IZisN5gQn/9zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nFTXiLnj
Subject: [Buildroot] [PATCH 1/5] package/stellarium: fix qt5serialport
 dependency
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

qt5serialport is only needed when GPS support is enabled:
https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L632

A backport to the LTS branches should be considered, the wrong order of
dependencies in buildroot exists for years and is not caused by recent
upstream changes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 660d518860..48dadfec61 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -32,11 +32,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
-ifeq ($(BR2_PACKAGE_GPSD),y)
-STELLARIUM_DEPENDENCIES += gpsd
-endif
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd qt5serialport
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
