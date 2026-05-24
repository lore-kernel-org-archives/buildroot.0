Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F222CD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 15:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5273F60854;
	Sun, 24 May 2026 15:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJg7RmRfmdx9; Sun, 24 May 2026 15:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AD760861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779636882;
	bh=ziJh4HoXg9uU1FHcsEtSxAICf0hOUZjhBMRwohTMPpw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WYRMg4NZzb/8VCY1+/gWyKDzUmEGGW4iKLiADW+jvntJBcSuUxEryJzGorqOb3dYF
	 jeVF6Dcm1SHvBwz11shjsMMXRjJdfyiI6G2p9rnueBEzaee1LmbqtapZGC2rUbW5qr
	 l6enMWhEm9xfSI+6hUAbQCH9kl9WHqmTr1EoYYAFKpzckHktVwDEfDIS8iTYK4b2Aq
	 MECcWSuzrJzn7Yg+twn4793YxgIbURHjtJvi1Ran6gxcZvq+uJIdSCb4UnVKj+NCaj
	 2OHPhr3n3esBDDpNen5tl8flXj3Nn0qvzUQeBnGtFgMKSOD61g1li0US+ax7rtt7wP
	 JrfSKj/SOTSxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70AD760861;
	Sun, 24 May 2026 15:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22B1C265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 15:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03ECC60861
 for <buildroot@buildroot.org>; Sun, 24 May 2026 15:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_EWtyvUHJu5 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 15:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B3FE60854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B3FE60854
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B3FE60854
 for <buildroot@buildroot.org>; Sun, 24 May 2026 15:34:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29826A4C0EEA
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:34:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35510)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRAqa-000000006ON-1hSI
 for buildroot@buildroot.org; Sun, 24 May 2026 15:34:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 17:34:36 +0200
Message-ID: <20260524153436.919328-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779636877;
 bh=5jzkSOXFT5Kex1KAZelqJxpxtQ5EWprdhNn/DqZdtKI=;
 h=From:To:Subject:Date:From;
 b=Br7PUQlfg89jfvWEvUpE41JP0hWHSiWZ4vtoOvhCiOjnFZYj0tQVfGAtfyKQyvRxm
 M4mswvGKc+EPUGu036eO555XrZrlNFmeuWTRa7pksSPcQpivjHcXLJcFHoHe/FHf9J
 Xi9DgCPTb5a4l6S485TKgT+1JWXoMJUfpSwnq2aE7b+5qeIXmxe+pQ5JIP8/6ArdDN
 A3zm/0C8FARhEQbngTFShPk4gafE1MzO7K7KV0H2HcZXLrwIjzTtfxC//9Adnaq75s
 QilRq0k1nRvOUb6nuO2+2D4vNRrcq2bUq57gdHTlfgzGrbc8uzqkwt1/HGeX8ar0gn
 0LTyY4DlEQdqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Br7PUQlf
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 disable qsv support
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

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/64ed6075b782578d57edd09b3463071d6e5a4342
added support for the Intel Quick Sync Video Encoder with version 1.22.0
that was added to buildroot with commit
895840edd2784492d9b7066330b43842b703343b.

On unsupported platform the build is broken:

In file included from ../sys/qsv/libmfx/api/vpl/mfxdispatcher.h:10,
                 from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.h:24,
                 from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.cpp:7:
../sys/qsv/libmfx/api/vpl/mfxdefs.h:75:6: error: #error Unknown packing
   75 |     #error Unknown packing

caused by
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/1.24.13/subprojects/gst-plugins-bad/sys/qsv/libmfx/api/vpl/mfxdefs.h?ref_type=tags#L75

For now we disable qsv support to fix build errors on

arc: https://autobuild.buildroot.net/results/2d5/2d5666324db2fca7ab0419e28481829edca949b3/
m68k: https://autobuild.buildroot.net/results/53b/53ba2e9d09c25fe85e96b6e1fc9adbfcf5a637b2/
microblazeel: https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
or1k: https://autobuild.buildroot.net/results/17e/17e3dac016a08da8db58d735d0f2d3acc259f81f/
sparc: https://autobuild.buildroot.net/results/f07/f07995804faa0be38bbba462c52be86c6c69822b/

Fixes:
https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index c6fb669e13..ac554749c9 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -39,6 +39,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Davtp=disabled \
 	-Dopensles=disabled \
 	-Dmsdk=disabled \
+	-Dqsv=disabled \
 	-Dvoamrwbenc=disabled \
 	-Dbs2b=disabled \
 	-Dchromaprint=disabled \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
