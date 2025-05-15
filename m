Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5F1C3ABC9
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737AD6114A;
	Thu, 15 May 2025 12:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1Rkl5169_z5; Thu, 15 May 2025 12:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CBF961038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CBF961038;
	Thu, 15 May 2025 12:33:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0FA613D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D8061038
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ITsNi04f-nF for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CFEE61147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CFEE61147
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CFEE61147
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:33:46 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFWz4-008c52-8W; Thu, 15 May 2025 13:48:37 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 206cc062;
 Thu, 15 May 2025 11:48:36 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 15 May 2025 14:48:33 +0300
Message-ID: <20250515114836.572631-1-aperez@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WVvE3xRGEoNDcHvXmps/tWX94qrw+ET/0BHFXCz6p38=; b=gYtP3Uze1Bphna/IOFR9PkEoy0
 T4j270PC/XyosO+AIjcMYpGUNZG3AtEnd6XD/zTxycHw7bh0wqKWCgqzokCIV4L5QEHrp/Yft6Hev
 QOv5Gu2nIEnJ67LkYUKsDysjRGALeFWwdCXd46ukw548iDXDVHIp5GXebQ+ggyc2eWv7U18wzraxF
 B9eWoJfiYIDwbPB/8iMziAnGZlMSx671KysDPRPSv2zBuBgx8/b3kZfM66NWP0lSI0WTTjBqrVL/O
 md68aX4bjoVMMBinFiAmQMbl88cpXcTZvGINDzb+EnYU1XDoGNedC/VSVQ0M4lMYgRqWARZ4N5YSa
 LbTDSKAw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gYtP3Uze
Subject: [Buildroot] [PATCH 0/2] Update to libdex 0.10.0 and sysprof 48.0
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

Hi,

This patch set updates to the latest stable releases of libdex and sysprof.
The libdex update may be applied separately (our old sysprof version builds
fine with 0.10), but it's a requisite for sysprof 48.0 -- that's why I am
sending them both together.

Cheers,
-Adrian


Adrian Perez de Castro (2):
  package/libdex: bump to version 0.10.0
  package/sysprof: bump to version 48.0

 package/libdex/libdex.hash   |  4 ++--
 package/libdex/libdex.mk     |  4 ++--
 package/sysprof/sysprof.hash |  4 ++--
 package/sysprof/sysprof.mk   | 11 +++++++++--
 4 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
