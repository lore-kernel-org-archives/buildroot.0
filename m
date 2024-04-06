Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB2DC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59D874047D;
	Sat,  6 Apr 2024 07:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZlMgNgNTBUP; Sat,  6 Apr 2024 07:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 734AE40466
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 734AE40466;
	Sat,  6 Apr 2024 07:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14F4E1BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D96241DAD
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7FXMGv0QTsz for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCD7C41DA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD7C41DA5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD7C41DA5
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:32:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75C38A4C275C;
 Sat,  6 Apr 2024 09:32:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60956)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rt0XA-000000000gm-0xYZ;
 Sat, 06 Apr 2024 07:32:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Apr 2024 09:32:01 +0200
Message-Id: <20240406073216.1054073-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240406073216.1054073-1-bernd@kuhls.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712388737;
 bh=pNcIWt4me8lYMY2f1kCO+sRHjlA6vVIEjS2ZkaAVTS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dCT+mumbu9otlDN5j6etMjfeKN68VvZjBOZUHFJxDWDTWSRQ8fBkf0bPsCwtxZqhY
 xlby0/9iqsGjHb+gBDI2PvbmjBYq1zMybN1ehDiGhAZD0EVHJu0EB4ayIIcQFJ/CcG
 dUxP41j0Cz8PLgjEpZQr2RO4/uOFdu3Rb5N929jk2iNd0grSbeuVWLuKPqT6CL72g0
 MGr88fb87zyQPXs5+pFt8avEoJHtWchk9gB5FP9+Sqs3BJBqlP2w+SdTnk52UImWje
 z0AbwpLgzSWBWbdEJ8VpXjw0++7wgnAW3od+oYuBmPP/8bC+xB7GYLQxXBGJe8Zopf
 tnMA3MsQfujjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=dCT+mumb
Subject: [Buildroot] [PATCH 03/18] package/ffmpeg: add optional support for
 libvpl
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added with commit
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=7158f1e64d9b76afea78537a35c465447df0cff8

"It will fail to run configure script if both libmfx and libvpl are
enabled.

It is recommended to use oneVPL for new work, even for currently
available hardwares"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index acd5a7d8b2..e7fc1854e5 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -321,12 +321,18 @@ else
 FFMPEG_CONF_OPTS += --disable-libbluray
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPL),y)
+FFMPEG_CONF_OPTS += --enable-libvpl --disable-libmfx
+FFMPEG_DEPENDENCIES += libvpl
+else
 ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
 FFMPEG_CONF_OPTS += --enable-libmfx
 FFMPEG_DEPENDENCIES += intel-mediasdk
 else
 FFMPEG_CONF_OPTS += --disable-libmfx
 endif
+FFMPEG_CONF_OPTS += --disable-libvpl
+endif
 
 ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
 FFMPEG_CONF_OPTS += --enable-librtmp
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
