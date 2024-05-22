Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534EAC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF1160AC0;
	Wed, 22 May 2024 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyRwwD5saCCt; Wed, 22 May 2024 09:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E2660AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E2660AC4;
	Wed, 22 May 2024 09:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24E211C59C8
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1119F4011A
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 09:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E4QsKfot0J0 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 09:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6D7640114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6D7640114
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6D7640114
 for <buildroot@buildroot.org>; Wed, 22 May 2024 09:55:53 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9i4w-00B1rx-HF; Wed, 22 May 2024 11:16:10 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9c092a0d;
 Wed, 22 May 2024 09:16:08 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 12:16:03 +0300
Message-ID: <20240522091608.3659847-1-aperez@igalia.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QYjw+XlrYfi4yA54tvl6yYbpX8vSsNj+JitDRjszN8s=; b=j0A1JnC12BCsm6C33a8AmR8YiA
 Bh9IGnEneG11CKVpQGbEWgwIR0gkmI3Nrt7V8gaEQ8z7QYmYkPpM09wHGsQIezgmpIgfJKCXbNDbM
 zp0g2egIVSMU1sf5bP3Ego4EKFjvsTGA16UvznV4nnmadQsewGYjl34oGluiERqWrU2B1kPLXry+a
 GXFJbrGI8eFgmV9jaSv48E4XwdnM7V0lEom7GuYXruXkpBUyNmF/SHIjsNR7zWSTtB+ljHAVUptCz
 nxqZN+HfifsV9ZHh78lcxvl5VFVkO5fIURCQpCLAbxt2SsaxYiiD05duC1AXfIUOD5TgC4BABNpVM
 RKM9YmyA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=j0A1JnC1
Subject: [Buildroot] [PATCH 0/4] Update WPE WebKit to the 2.44 release series
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

This patch set updates WPE WebKit to the latest release series. The only
strictly required patch is the second one with the version bump, and the
libwpe one recommended as to match the recommendation [1]. The patches we
were carrying in Buildroot are no longer needed and have been integrated
upstream.

The last two patches add a new package for libavif and enable its usage
in wpewebkit. These would be nice-to-haves but can also be applied later
separately. We can also enable libavif support in WebKitGTK after the
package gets updated to 2.44.x as well -- there was a patch recently by
Thomas Devoogdt for that bump which I'll be reviewing later today.

Cheers,
-Adrian


---
[1] https://wpewebkit.org/release/schedule/#compatible-components

Adrian Perez de Castro (4):
  package/libwpe: bump to version 1.16.0
  package/wpewebkit: security bump to version 2.44.2
  package/libavif: new package
  package/wpewebkit: use libavif if enabled

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/libavif/Config.in                     |  13 +
 package/libavif/libavif.hash                  |   3 +
 package/libavif/libavif.mk                    |  34 ++
 package/libwpe/libwpe.hash                    |   7 +-
 package/libwpe/libwpe.mk                      |   2 +-
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 337 ------------------
 ...velInterpreter.cpp-339-21-error-t6-w.patch |  39 --
 package/wpewebkit/Config.in                   |   1 -
 package/wpewebkit/wpewebkit.hash              |   7 +-
 package/wpewebkit/wpewebkit.mk                |  40 ++-
 12 files changed, 91 insertions(+), 394 deletions(-)
 create mode 100644 package/libavif/Config.in
 create mode 100644 package/libavif/libavif.hash
 create mode 100644 package/libavif/libavif.mk
 delete mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch
 delete mode 100644 package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
