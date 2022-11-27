Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD3FC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D598E6006A;
	Sun, 27 Nov 2022 13:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D598E6006A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK4jvnYj7bcY; Sun, 27 Nov 2022 13:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B27D6061B;
	Sun, 27 Nov 2022 13:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B27D6061B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A97961BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85242400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85242400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEc-OnvATJSZ for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9B7C400B8
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9B7C400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:27 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso10162348fac.10
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8hdQZ8AMJUyglJxZYsLoNTfnTcD72v5AayjXVTScM8o=;
 b=3XVD6CWuDGDMi6ETHlHKWqDr1dZ7n4r0jTl/diJYGTgn95jw3zy2iOsZiRloKWrpOv
 t9hJuo/FlDKbOczy+O2fCemHQEKZX9lVA+CYhye20c39/Hwoa5KybBxie6lM4U9Wa/yg
 /w0fRMHZSgnigBG4dz/k3D2OipC10X9hXExt4SdLr3Gqbvm/onrk4BK6jMfsSeEtJy7Z
 1Jxtw+fHuXezuHoksGp7/7wVSvfqi50VIHfNwUc/EiQOrMa2H8/CWoti8Z90+QGWhP8v
 f1RSSOPkUEFmkYNX4EuNLAt0ODZV5m0fBh9BRNwF6jLiqM+QUT3jTsWILsfZQgHnjtOp
 BqfA==
X-Gm-Message-State: ANoB5plCGnJFFl53iP64SOwNga+gnhem8BxhyZ0syOPM4KJXKX4Kqyda
 2JmgeF8o9PR4wUFJ/858UdMPp7EjgVY=
X-Google-Smtp-Source: AA0mqf7NVNT3czRTLQo0yHIDruiqz815w+kU+Fj0yIGK0E+f07/PYxXSyCAK/BT6YPaUvSw5lMQi1Q==
X-Received: by 2002:a05:6870:4e03:b0:143:2467:f004 with SMTP id
 pl3-20020a0568704e0300b001432467f004mr12953992oab.20.1669554507002; 
 Sun, 27 Nov 2022 05:08:27 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:25 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:25 -0300
Message-Id: <20221127130739.1862398-12-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hdQZ8AMJUyglJxZYsLoNTfnTcD72v5AayjXVTScM8o=;
 b=YztKnhkw5ws8wKFhCUubyvETX3e69BpDTN5/n3Z+6QTSgWfBqtWZyVpOGWttQb2AOa
 SFwBaRKx/rxtH9fUDNQYqkpBxpBzrNADsH9SUHnzPFMKI5qXgYImgeoRmJk21dGnbUrt
 OqeuVhi3TfEcvLz6CgduDUuXRZbUqVvY81JZJS4yvXXLPyyu/BQz/TONdZU6grE8cet9
 MNFjeTKEPPQLSLlfN9KzS08VJ0aZT4k5aTKKaIjuFIeevBQ/+86Mma6RYpl5oiG94nN5
 EeoZt1HnZyBUYvJ9vxu2Zniwvm/hnxwX2QkVTd2+TaN/9brS2bvpokifZrlw7E5nMAzE
 TjNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YztKnhkw
Subject: [Buildroot] [next 11/25] package/busybox: add comment about
 variable override
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The same comment already exists for UCLIBC_CONFIG_FILE.
Both variables can be override from command-line, as described in the
manual, at section 'Environment variables'.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/busybox/busybox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ef628e90e9..0f14bf999d 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -108,6 +108,8 @@ BUSYBOX_MAKE_OPTS = \
 	CONFIG_PREFIX="$(TARGET_DIR)" \
 	SKIP_STRIP=y
 
+# specifying BUSYBOX_CONFIG_FILE on the command-line overrides the .config
+# setting.
 ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
