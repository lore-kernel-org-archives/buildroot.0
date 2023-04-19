Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E298C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D9684028;
	Wed, 19 Apr 2023 08:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D9684028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDOL_rncpUex; Wed, 19 Apr 2023 08:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711DF84024;
	Wed, 19 Apr 2023 08:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711DF84024
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E68B41C431C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C072E4298F
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C072E4298F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWBci-fPkXba for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9338040527
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9338040527
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:52 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-760f29073b4so71644339f.2
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893111; x=1684485111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/BAFd3eotRw4yuyB+12vgK45CPn1GerJwK2Plc2mJFs=;
 b=GxY6bhet6ueEaZ6GRqnexCwBngUxfNwPRlhJhWH8EtmKARxiqtUE1Od86sEjoK0JO/
 coh7iAoPPWQVJ2gZzaOFG59oL67wIa71/347L8QWW41wpZAlFnqy0yVFLE8QwkI32orY
 MaM+EdQC4CddZwOqtCO3z4hQfV3gc6EIQa15aNZV6dOUBwcIa3h5HAytXrn1mN73E+Qm
 eM5T9MbNvA+bUdtE+NlY6WDWQZXNeDTWZ4DAOfVAwCUNqrhE4JS3k83+vJgSF5taGXoj
 Q/2+IvmjulxBljOprUJSdQASpT/qYmNrZC2PzQi99nvaJLmokeG+mm74c0grES1U3AI9
 jhqQ==
X-Gm-Message-State: AAQBX9eY7lEDz3Akw6H9ZTuRLHhBa42aXat4CJ2p+N311R3/XfToSjBU
 LnYhCNJKrdbxMuA9qdbdTeNHWUDPZFw=
X-Google-Smtp-Source: AKy350Y+PpVgMPEjwGuTNN6kukTDozS4AmEpCM2O/or84fOIIMZO6o/ruuq/DH+FsEgHd4dOhTunYQ==
X-Received: by 2002:a5e:d60d:0:b0:763:538e:2316 with SMTP id
 w13-20020a5ed60d000000b00763538e2316mr4868668iom.9.1681893111418; 
 Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:37 -0600
Message-Id: <20230419083144.212921-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893111; x=1684485111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/BAFd3eotRw4yuyB+12vgK45CPn1GerJwK2Plc2mJFs=;
 b=iMKJYT9AQvy5sEcGuokm0bSKePKHjmF/AmLhyfe/gh06pMRCMkaoAqp1mmVcuKrCFV
 vXIi8NRbN679XlS7OGc0cJtgLq8IaBl6P5LAQXCDn3H+bp0XRKiwmqzVbr+48K8C2sZy
 O4ISIFTQIxr6XQocMerNzfnuC19krqHvXF3XuhFvJBbgoCXMx5wnzeKXh/A/l/Gz6vpp
 TFq68icLCkhviMD0xOGP4n7TM62StSghC0qDJyqDho3y6CxF/p5ANq//xC90qDzwPuG4
 wPmvEyv63SHE+B/el3gUIQ49kb3Z8sKFTfMgHSYkhEpmfiJlPNW+Vwnf8Xqr9G505nhz
 5ekQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iMKJYT9A
Subject: [Buildroot] [PATCH 05/12] package/gst1-plugins-ugly: bump version
 to 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 21579216df..ed781df686 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.0.tar.xz.sha256sum
-sha256  a644dc981afa2d8d3a913f763ab9523c0620ee4e65a7ec73c7721c29da3c5a0c  gst-plugins-ugly-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.22.2.tar.xz.sha256sum
+sha256  8f30f44db0bd063709bf6fbe55138e3a98af0abcb61c360f35582bbe10e80691  gst-plugins-ugly-1.22.2.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 9f16fa3da8..f1566b058e 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.22.0
+GST1_PLUGINS_UGLY_VERSION = 1.22.2
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
