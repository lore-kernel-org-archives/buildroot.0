Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F410706EA
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 17:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B824F60754;
	Sat, 14 Mar 2026 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WppTo_OOrRm; Sat, 14 Mar 2026 17:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA54C60765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773508678;
	bh=bvDadQoWEog/zm5Steo808OZw61uyIbDdve6Rjc6Khc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J2DksTFQgj12hJLcRFGkeAPTFi5OXcu79KgpsIlVvsncso7+cdMJbg94MLCS88vBq
	 ie7RaXxu/i1z4/ZGFNf/tjOVtwRKrfAnhd0IJX2Yk1sgHDUoNBFjUTDn4QkGxjRuw8
	 35P3zGrrPav67JIzP4dgnPU8vyP3XeFRG+QXO1Xr3qkAjnIrgKytCFZPGEpMr4c5uH
	 Mu2umhco63rVn4C3Q2Qyh7Ql4pFltYiamQQJnHb2yvozhxKZJgUdHP9ML9U1hdpMKO
	 VGHQRb4mw2IDjT3T6DfSaCNIuBRA5uXZG/g7S3Yj+4pXy8Uqy5/h5wybv/A6LRHAWG
	 v0Tp0qXQsXo6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA54C60765;
	Sat, 14 Mar 2026 17:17:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC501B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D34CB810E3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJk9NWeXGF74 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 17:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B68F8810C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68F8810C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B68F8810C3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:17:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70DF8A4C082E;
 Sat, 14 Mar 2026 18:17:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54836)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1Scc-0000000045I-0L6L;
 Sat, 14 Mar 2026 17:17:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julian Scheel <julian@jusst.de>
Date: Sat, 14 Mar 2026 18:17:53 +0100
Message-ID: <20260314171754.3071677-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773508674;
 bh=ll/Rp0OhLdzCfL52grj0PlACsUmCeioKHgPok21Zg1E=;
 h=From:To:Cc:Subject:Date:From;
 b=AFwWPhawN8yZSUVx4jS0guDVO47MO+TAuiV3OXHT8HEdVkStET0IMgFYyEqxC5DXv
 x+iwDZqYeMez79yZtmfuznOjyJPMBLXW9EWmkFnQNB5EsW66rY602LFG01N2EQkSfB
 /BMlUKkpVkdVxdOvYS+hce+IZOmipaXUPAS5suF57LXRW/RX689Tij0BPa4pfZnqke
 DOo1VTEYuiuDmLv2QmZwibQriD4ofs037XkA5gZQjx8VQ242U+bQBBeB0wlyaeWegZ
 g9mSSWqzcPEmB3ZbIxQv3lyn9i8Hmx62kgvZEJhwcQhCTZ4rbSYZc8PnmCWvGT7KMn
 4gMg98pQxbOEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AFwWPhaw
Subject: [Buildroot] [PATCH 1/2] package/bitstream: bump version to 1.6
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

https://code.videolan.org/videolan/bitstream/-/blob/1.6/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bitstream/bitstream.hash | 8 ++++----
 package/bitstream/bitstream.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index bdaf90c012..fb41a40ee1 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.md5
-md5  34630d13332fd1575bcc8531b0a596be  bitstream-1.5.tar.bz2
-# From https://get.videolan.org/bitstream/1.5/bitstream-1.5.tar.bz2.sha256
-sha256  45fc5a5a6e4537a69fa8440821e87b76252135180a3070c631b0b36ce0a3b90a  bitstream-1.5.tar.bz2
+# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.md5
+md5  3106981310a54d4717cec766a0183f74  bitstream-1.6.tar.bz2
+# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.sha256
+sha256  dea67a9dca7eda0d72017359c8d649bd5a9d249f9f9a691b8daf739d16798029  bitstream-1.6.tar.bz2
 # Locally computed
 sha256  9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 12124a63d3..44228242ce 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITSTREAM_VERSION = 1.5
+BITSTREAM_VERSION = 1.6
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
 BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
