Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3180C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 12:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E37A6109D;
	Wed,  8 Jun 2022 12:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbSfODikV5QI; Wed,  8 Jun 2022 12:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4876109F;
	Wed,  8 Jun 2022 12:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B558D1BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A297542501
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64tM5klPNIFD for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 12:00:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81C3B417A7
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 12:00:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x62so26744089ede.10
 for <buildroot@buildroot.org>; Wed, 08 Jun 2022 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=mfTbhBJG86v1VWfJ5Se5jrJaXbtLHsZjAC0nDiudwuNQNcKwjpBwAyZtwTano6z0OB
 LfkQO+N3IBraZmka9v7tLOi2XDrWAGtJinzp5pAu3kKMn1lm2X387YHdPaJ6VVwXVBhM
 cp8lc1glecreo1TREnXLBzf8U+JbcgE5niL/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4IXBKXDSSFEuVlJRXSZHqEevosZ3N4hk8LYyfESIp88=;
 b=ifTinRjruILXNnc7TCatew0aTRMVYOrrZF0GUR9yJwDyhsejP5Aq1IQBx2yG/PgJWR
 fvfrAySfVZXC4Agw8X9mGJ2b3q/jEWqijt0UVgIwjZeuDr36pMMQkutUFsuXxvayMJBq
 ON2bgzGygfSoIbWMk3rvi1WyOpG22mX2CVqDXA/Q8uZI24cipjhjAMgDbBTSdrqDZwjn
 cPdMUS7U5+Nvulr26WUQAXzueZtNzApgUULK325pTIizkbXIZ67RPfbzgqpcAj2pfLOn
 MP0czyZZdEak0Sc5ASfz2Yrn/ib3hOZxYIKhb6fe2y0wmIXsAzNb6rtzHpY2JPv12D+X
 D8iA==
X-Gm-Message-State: AOAM530L/cdUiTcT5cMuBa24h8Uzsx+Ny6EGjhuvvWlWhFFGJ/tT3zp/
 QS5HF2KQNx9WgE7SNcqdmS35DxmrKHhG0A==
X-Google-Smtp-Source: ABdhPJzou87TaqWluLH6TTotSxJ08Bjy3Io1Eo0Cu4TSN5OhmlpH9KZPeySIYlrL7Q1fBF23/0BRmA==
X-Received: by 2002:a05:6402:c4d:b0:42d:cb2a:1b8d with SMTP id
 cs13-20020a0564020c4d00b0042dcb2a1b8dmr39141500edb.214.1654689640722; 
 Wed, 08 Jun 2022 05:00:40 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 my16-20020a1709065a5000b006fecf74395bsm9068289ejc.8.2022.06.08.05.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:00:40 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 14:00:26 +0200
Message-Id: <20220608120028.2768210-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default configuration file is wrong for the default compiling options.

Fixes:

Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line
'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/wpa_supplicant.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
index 1994a6c739..f8a73d465f 100644
--- a/package/wpa_supplicant/wpa_supplicant.conf
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -1,4 +1,3 @@
-ctrl_interface=/var/run/wpa_supplicant
 ap_scan=1
 
 network={
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
