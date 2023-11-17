Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8738C072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 09:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851D9611E5;
	Fri, 17 Nov 2023 09:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851D9611E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLp4igq0YLIl; Fri, 17 Nov 2023 09:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F7E61181;
	Fri, 17 Nov 2023 09:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F7E61181
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C417F1BF3A0
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A99F842890
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99F842890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROQ2_35ads7f for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 09:54:02 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3FF54288C
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 09:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3FF54288C
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507ad511315so2548971e87.0
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 01:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700214840; x=1700819640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hKaRnP8EkaOAH1FvbORgPY8EP6Kk0Pi49FqVcwVMfo4=;
 b=qs3Ncd2eeKEEXjmJErv/cDEN9nBz8JC3gte7mujY7T+chvXbWxIq/RuYOJ7YhQN1t0
 DT6obxpjF7RnSTakQWhPV7Yb18BbJyv2krwt6dtZkPCRpqWmyqBf+DOo8bS0vlsK2YZ/
 3qCOzVEiYKFuaYlXJBA7Kal/qT4d4xgCFasb6Mgpi127lzkknir1GqQW+eJiFzVWhLFv
 DgYEBfcJhxs0YPKAhNHrj1tv2jZjxvshNJgUsnkvI514iiA6vRD0xXewUr/fOwMm+BaJ
 nmnZnboAlcCtclrelA3QveBroOJUgvEdHSLzwqDtlpOZYS3tjyDz9GaqEiDn73xF+Y9U
 HyqA==
X-Gm-Message-State: AOJu0Yx9LU8C2BDQ3GxT/cpy4QhM/EwhAhaDjz/HUdP6eataaPrK57yv
 xN3zK9O9l7HzsxnyDQMujvYvDvPuxjI=
X-Google-Smtp-Source: AGHT+IHcJ0A7q3t13LD3r1SiWMH32wfmg+hsBdfAXcYDV0YS9XdT2ahXF76VhhqxRj6UuY7zFSugBw==
X-Received: by 2002:ac2:48ad:0:b0:503:257a:7f5d with SMTP id
 u13-20020ac248ad000000b00503257a7f5dmr13012184lfg.31.1700214839353; 
 Fri, 17 Nov 2023 01:53:59 -0800 (PST)
Received: from lanodev2.hipase.local ([80.120.136.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d49c8000000b0031984b370f2sm1803919wrs.47.2023.11.17.01.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:53:58 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 10:52:51 +0100
Message-Id: <20231117095251.494626-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700214840; x=1700819640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hKaRnP8EkaOAH1FvbORgPY8EP6Kk0Pi49FqVcwVMfo4=;
 b=M6QY7Qn7A1sMLxcXITcKJk7OAoptQ6+Ya/UcQ4ylJrIQoSoh6AOwnuLYtEMRdEb2GS
 qlkjKp0mxc1HSTsKlaYnMlYH7rLwcm3HeCjFnX279pJLyrpnv1TCYP7LGQuzf1aNqfuV
 PWvBVKrMUCihThbnv/n4XvCb5fA8pL5KjOlqx8zSvRTwsQML5BZQjIpqcht4n7toNFZm
 AtVjuwz3EqrdGXi6zbnfFz0ZLFMh43hUOe1KqL7z2faWis9o7UbgZYJmZ4NEvvc/OIvt
 XrJUZpDYHmG9ecvdUosjJxq5NsiWju7rdunI+smF2QANrbCgjQ8y6HIib7PPeGK5NO7m
 27jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M6QY7Qn7
Subject: [Buildroot] [PATCH] package/dbus: set runstatedir to /run
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot uses /run for all init systems, and with systemd you will
get several warnings in regards to tmpfiles.d/dbus.conf using
a "legacy" path.

Fix it by configuring the correct runstatedir.

(See 0d3a3e61ee why this setting is not enabled by default)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dbus/dbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 930b1a298b..ad918371c3 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -28,6 +28,7 @@ DBUS_DEPENDENCIES = host-pkgconf expat
 DBUS_SELINUX_MODULES = dbus
 
 DBUS_CONF_OPTS = \
+	--runstatedir=/run \
 	--with-dbus-user=dbus \
 	--disable-tests \
 	--disable-asserts \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
