Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63700C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297FE60F6E
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 297FE60F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC768101C;
	Tue,  9 Nov 2021 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrjDfBsuaUkO; Tue,  9 Nov 2021 17:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAD880F7C;
	Tue,  9 Nov 2021 17:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97A101BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 856EF40399
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvX_sRyYt0wy for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B238040398
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:22:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d24so34294040wra.0
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnlUotNUXaiABmCcwzqW1k9wPdSvxjSXwkkMXm/XrxE=;
 b=K5EgTrcD1M313H0JfJDoW63rlNMMG1t95wTR//5x54XA1yOQxsaFZ4lfllzfQn1D6N
 jYqw08Da4Ql5GnMjSGe6xGj9TMubYKCdHioOk7c814E3qU3e0XPzbqRyetHQPE3Dxr8u
 mBWCmsoENEPutY4fJxVTe5/gmF4ItOESEhXbvxvYfP2Xj7D05BFGlK8O2/3BQb7YrJbH
 +qvIl2wadcEtpE7qFIpYRlMo1WYtSb1xD9YSRqVoX/uEZmglM0GKMkLEs8hxG7qx/Az6
 bsQxKDYi9JmQcECpR+bS3+CMD+N/C+ZlyFRK1VPgLk9BLdZW0YGqPwwvoUZiUx7fUU1H
 7T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qnlUotNUXaiABmCcwzqW1k9wPdSvxjSXwkkMXm/XrxE=;
 b=GmeBZlBKAGqjyD9hqYm07MPMMh8u2AznTjjGmoA4fuknt8K0C5Fn4BMzKF9hNXrAs+
 aPYQ/P66jMRQjOo12mMiMsENLF3DEYhsZDZzOk61RKNKv6AQzE/1UQx7jNGOShgTqjGE
 8gMgYepXKsOCPhqU1oG9Q1Gy84HGnj9zFnH7EXPNR1/qFmAidQwxiqw8wqkg0DaqJ3MM
 Jjm/LpB2I7dpARD129OYXIDb98EdHsQZ5Wg6+CccC/2ylT+o/RI8a/bOl5OpKALgkJeY
 YjekztbPx0dzArR4AF+6dWUGma3hjfaSKCgUn2Xe9mOoZMXjZx5bDKNCX1avxQpM/DCO
 6Gqw==
X-Gm-Message-State: AOAM531de9aSlT/FMQg4Oc+7g0ZNHVhc2V0hI3U4gf0KT4Sw7QKj10ef
 3yxkjzIaTEXiXA+cxDcjmiU4nUTBTLk=
X-Google-Smtp-Source: ABdhPJylFhbxq7gYGfnOrd3lL2IWiuE9ulkxn7pEL/iRJKu4Uj2ZsqG03JNxgmRM2enkHc/m+vHd5A==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr11261445wrd.373.1636478528813; 
 Tue, 09 Nov 2021 09:22:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h3sm20371578wrv.69.2021.11.09.09.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:22:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:20:15 +0100
Message-Id: <20211109172015.457094-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/gpu-amd-bin-mx51:
 don't override dependencies
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override GPU_AMD_BIN_MX51_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
index 5586073712..c99c568f73 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -12,7 +12,7 @@ GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
 else
 GPU_AMD_BIN_MX51_VERSION = $(GPU_AMD_BIN_MX51_BASE_VERSION)-x11
 GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_BASE_VERSION).bin
-GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
+GPU_AMD_BIN_MX51_DEPENDENCIES += libxcb xlib_libX11 xlib_libXext \
 	xlib_libXrender xlib_libXau xlib_libXdmcp
 endif
 GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
