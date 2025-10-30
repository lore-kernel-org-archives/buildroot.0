Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F3CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A61084410;
	Thu, 30 Oct 2025 21:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1LghoD6BKXG; Thu, 30 Oct 2025 21:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BBB84405
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BBB84405;
	Thu, 30 Oct 2025 21:42:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63C30160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49FBD6156E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or-Xo1YBVE_H for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42D5B614D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D5B614D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42D5B614D2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:42:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cb2.dip0.t-ipconnect.de [91.58.12.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0285FA4C5B44
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 22:41:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41906)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vEaP6-000000004EC-3fhM
 for buildroot@buildroot.org; Thu, 30 Oct 2025 21:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 22:41:55 +0100
Message-ID: <20251030214156.1307743-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030214156.1307743-1-bernd@kuhls.net>
References: <20251030214156.1307743-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761860517;
 bh=HJTvtypkg+7X+iChhqC4uE5YeOnSZ54HvQUeK8DODqs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ir+w3LZ5CgNnfVWyh2l0DE3WIWcqcxk0IRuFm77OPkd3XsAz6AD/i0slgX9/G+iTF
 zmAxusUvw1XI5xp8cVecDJCtLe/TbV2V66aZyWveyodL6Gc52/7RY3dcYQVsLrsHt0
 4PQ/55WNj8jIu7XL2DhA4sdDFfnZbvN+nhtTFa3iVP76+dx4Pnji8QWA8z2p5Ty86e
 JGos5h06Bq4jfNh8NEEQdMaucEUpIMIrwdKx8IhkLauPiOItz0yW/cYyNdtcvAw0EG
 5AXb4k02g/DkvgQKkwyfod4qG0d1JcNE+d3F7Yll8q3NgT8S8WYnN9/R+SfhgG5B0k
 QroqiAdrDCEVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ir+w3LZ5
Subject: [Buildroot] [PATCH 4/5] package/bind: add optional dependency to
 jemalloc
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

Added upstream in version 9.18.0:
https://gitlab.isc.org/isc-projects/bind9/-/commit/7f1c525625675e7e5e0953a78adefe9e21fc1462

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 64cf2fa9fb..c4d9047c4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -49,6 +49,13 @@ else
 BIND_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+BIND_CONF_OPTS += --with-jemalloc
+BIND_DEPENDENCIES += jemalloc
+else
+BIND_CONF_OPTS += --without-jemalloc
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 BIND_CONF_OPTS += --with-json-c
 BIND_DEPENDENCIES += json-c
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
