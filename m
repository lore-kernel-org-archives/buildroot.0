Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8113C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCC060604;
	Thu,  7 Mar 2024 10:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofzSW1NYPEui; Thu,  7 Mar 2024 10:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66BBA607C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66BBA607C4;
	Thu,  7 Mar 2024 10:38:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 470D81BF2C2
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 341D64183A
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lL9DMxxBTEb for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 10:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25290409FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25290409FF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25290409FF
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 10:38:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d7b8f563eso370718f8f.0
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 02:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709807931; x=1710412731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IhN036gevlzgc2vWxDzOAxlDPSk9lQ80ZSUzid2EGY=;
 b=VDLn6jTn9cC5UkONPNxiZ9/0yvCLmK9qhbxFLFdh9EsAY8zo8+JeZV2kyEr/FNfSFa
 XFLdZkk0thBkLnOJPJAQmyNBpLVgjx9oWo5ieZZYqG5qKaFzK8biXpnxppQL2mJsom4r
 zhzr5RSNwv9NeU4k5ixyueDNx/Aairmq8Zbp+EL94onBbyhjL4EI6KhObFpprHO6kkLl
 gBUP1ArFnfJsifEZG8dvhRUE7dxavzdgAuiapNqQdGPIUP08lTJi4DJ+1iF/cmW8OZ4M
 wmUVnyE3Em30tbypht1jVoz0GiDdQSCf0Z0XCxJPIFi57jhLQNQSF9UlDthccH71LtAc
 El4g==
X-Gm-Message-State: AOJu0YzGZAWcMubOINPipjxNBAV/eOgLhx+yIYD386iFXIIcoMlvEQT5
 QhE26LO1tn2h9aaOKd1xbQbg1L69bVyxaLA0vGzty2TboQmh6UkLSPLPjzZx
X-Google-Smtp-Source: AGHT+IFD+TYQdIl38aMzpKcJo+x6vzbm/5+RccsBLVLhuaui23veZY6dB1I6a0vR/Xuf2m4jrdZLHA==
X-Received: by 2002:a5d:6b01:0:b0:33d:15c1:cfcb with SMTP id
 v1-20020a5d6b01000000b0033d15c1cfcbmr12551001wrw.40.1709807930495; 
 Thu, 07 Mar 2024 02:38:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bq27-20020a5d5a1b000000b0033e6879817esm826424wrb.58.2024.03.07.02.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:38:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 11:38:48 +0100
Message-ID: <20240307103848.27961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709807931; x=1710412731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/IhN036gevlzgc2vWxDzOAxlDPSk9lQ80ZSUzid2EGY=;
 b=hUNmpNHH4B585qLzNkcsHETM03jucn5MjNSvMxZdc/fh5xm3KYDluUapYIX/lAwSw6
 RUVlOgaD4sBcJzXRDHxhC30Eq4mshrBuXBCHE15V0V6Jmdh2EIaz2cdfCzKUnfUDkPzt
 GjsFsLhkfzdBNIQD+42Pk64bqTAXnsTclmysOg35eboJ3AG2RVfVCVNW0rY546NUOHS9
 LDKWd6ytYNjFvdo+/BqWuXariBg6DPuobgS3G1l3gjpYDVP71SMNJkcP00543skjzik3
 MWJPjILlU2HPAxDvB/jzX5HdrXjDX9sLzaHuKc5pvs+NxnqBdDJjE5iQvdfqKg78dADz
 484Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hUNmpNHH
Subject: [Buildroot] [PATCH v2, 1/1] package/binutils-bare-metal: fix CPE ID
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
Cc: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 11b439ce1bd28506051fff14646f8bbdbbbe58d8 forgot to set
HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Move product after vendor

 package/binutils-bare-metal/binutils-bare-metal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index d55c2d081e..778a5235f4 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -11,6 +11,7 @@ HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).t
 HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
 HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
+HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
