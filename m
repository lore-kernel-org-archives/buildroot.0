Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49318C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2877818C4;
	Sun,  6 Feb 2022 21:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wifvd4NrmFW; Sun,  6 Feb 2022 21:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C7DE814BA;
	Sun,  6 Feb 2022 21:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ECCE1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C9660B3C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQ6DNk2z8wbo for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:57:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4156160AED
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:57:40 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q204so14539108iod.8
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Ng4pMK/6Oe0LNUUtJF5NK+IJIO70vg82cWc2rOVIx8=;
 b=ZumGfqKVk5p/sU77HaQkFqWobZKExwFDW7JhdPIvZran9HzJK3er83hi6N5VX+o4Nv
 jsqiLyP2mlBk1VkKNPtqLo4m7JT/MsebOUgjNa5MsEgzKvFH+Dgu7y8AXZ+P9/KXa4el
 WCb/GQNQ92YttIZKvNv1g1KlfdQh6NvqFvEAp2qRvIw5Ji7FnZ/PhaPyU6TMo/UPKiXo
 19w0feQIW3YqY4w2WDZlzRgFR7t0u2BTwtnVRfvoOQ3RT5cJps+ACPQVTkJ3Z2aaI4pw
 Y1B+sAOJk7L4En3LYXgfnknUEP78XVvMcIhxxtB39Fn3+oDTU40IVuZKm83vOIVjlJ1r
 hy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Ng4pMK/6Oe0LNUUtJF5NK+IJIO70vg82cWc2rOVIx8=;
 b=3Bt9NAgqDIcDRIGL9iMNpznHhUjU61nhso0KblFXpldRLJiJ1rnccGzye4yu5pRtly
 167zwgrego4UlKVGIaIXBUW3vgUsGgOj8Ai556kplO9h40iAvULNL0WgLQ5C0h5JBXZC
 FmiV7t2O1GoTR22DLzRoRrpSkn7WUasgyeZH2m6fO2HhSCKU4TuhwqNe4MpvdNfZX0Mj
 JlPVsjrJ8rJnt7KTwdY70fBap4qCzdJ6Weqx76UICL5trZcX9QDtKKwKXDz6uMkCZY4h
 dzZ4ChSQhCPhQvxZfegAq/Y+7/hLSGe4WurlvPz/iCdoo+7h2ZLDP+7a38/X8FdHfsPf
 qwWw==
X-Gm-Message-State: AOAM530/6Xgv2MI3taksa5QI/IvYaarqAU0ZBADsgtRFK63pMW3HbTgD
 1lgu9y9fAE6WIubiZ/Kh346CZ6BiaTwCaQ==
X-Google-Smtp-Source: ABdhPJwkYo97E8d4bHUtBqH83GOgP0JfcUVSc5q0EN2iIEckDOSWvecyuuAdfCYEb0PNVVDXXTX5dA==
X-Received: by 2002:a05:6602:330b:: with SMTP id
 b11mr4258872ioz.156.1644184660083; 
 Sun, 06 Feb 2022 13:57:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id b6sm957632ilq.26.2022.02.06.13.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:57:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:57:34 -0700
Message-Id: <20220206215734.3853337-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5location: remove unused
 qt5location-mapboxgl
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was only needed when the mapboxgl submodule was a separate
package(was never included in buildroot only a patch series).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5location/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index b811f9a590..3d91adaf1f 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
 	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5LOCATION_MAPBOXGL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
