Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80ABC46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65D57408E0;
	Sun, 15 Jan 2023 11:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65D57408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRt4PbVK7eLm; Sun, 15 Jan 2023 11:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8130040640;
	Sun, 15 Jan 2023 11:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8130040640
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C89351BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A457860FBE
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A457860FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mqEZIO_pIvF for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:49:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63CA60F98
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E63CA60F98
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:49:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x36so2548011ede.13
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 03:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IIj2xysqj2mDPMu7+sbcnyVbFf3LbynIlmJItAPI9I0=;
 b=MSX9DbrzHUHkk/+1Sgk0tOQ9arlAUMMrueET0cEYzCLwrc8FVupHr3QOk21Y0rIeqw
 O4FcwdjZ6b2WKVAHoJ2MH/zvCRYxpRNlc5VB8o4K7iuekt6V7wI3KE4GZJid91xf0zGo
 3htMzNNURaBU0F5eJBJHKC9EKLUtod5QRL8vw3HpnhJIGSnz3v7WvCPJPC8+yiaR+d17
 BMlGQTxeg0LdkLfm5aLVFTQE0OGhMclrDJVY9/5LdQXKaZaKjICUO4kUuuQ6gcMF0bpt
 VVNqPUDUHFj9q3iW7cRG3xdaN2vLPiEtDmaj99Skr/k9pwgd6VxWI8Im5M/c3AI+KumZ
 IuFA==
X-Gm-Message-State: AFqh2kql15P9OkAVktxF1mF3u5/iokfSKWu6e4tysJYhXiofBf95SHGf
 OOLhHssUMA3VXEqIoEyWk8jUfPT93Ow=
X-Google-Smtp-Source: AMrXdXtT82zgEWCpdiuQa4H8sjfYOTw+l6fTk9SwHTeHBBPzM3oi1pnD1g696i8ilper9IPC2tbEvA==
X-Received: by 2002:a05:6402:4029:b0:49b:52b3:cae6 with SMTP id
 d41-20020a056402402900b0049b52b3cae6mr15084295eda.30.1673783369146; 
 Sun, 15 Jan 2023 03:49:29 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056402150600b0049622a61f8fsm10351880edw.30.2023.01.15.03.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:49:28 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 12:48:39 +0100
Message-Id: <20230115114840.9027-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115114840.9027-1-nolange79@gmail.com>
References: <20230115114840.9027-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IIj2xysqj2mDPMu7+sbcnyVbFf3LbynIlmJItAPI9I0=;
 b=L5MTzXZ2MzJ0Xxncx+gjSE1HsikMScmjiAHRKwOqzKYaWIshmx9y0jteUV/x3Dy9Ax
 +Kd5Si2PSr+YXkTGrB/r4FxDOLQq2tS8yV/UBx9S+BSJ1VACAKsc1fWWKpiJ3GdmLgqd
 e0ziL53QXZsaqyAQZdotB+2ZnsOIkrD+MAg0X2x9BVFMVq8h+7zyNC+u+bZdJ+p2+8v7
 xewoBoFn1yL1txoD0K1rqShCZV0WrONb4tSsg0QR1f57qNezzzDnsMqNsTqhL/Hvc8QR
 2ItrKTYJPeiE0KKbBoWgT9+Int6SbtIOHGtM6rKkDnq6kgOnE0o86UmXyd+/peVLpH+4
 JWzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L5MTzXZ2
Subject: [Buildroot] [PATCH v8 4/4] system: Warn if systemd is used with
 kernel < 4.15
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To quote the README:

> Kernel versions below 4.15 have significant gaps in functionality and
> are not recommended for use with this version of systemd. Taint flag
> 'old-kernel' will be set. Systemd will most likely still function, but
> upstream support and testing are limited.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
---
 system/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 232bdfe763..70ddf8df3c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -141,6 +141,15 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+comment "systemd highly recommends headers >= 4.15"
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
