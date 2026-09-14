Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F8C88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA5240542;
	Mon, 14 Sep 2026 22:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jN7o9ThW3YF; Mon, 14 Sep 2026 22:02:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EFEA940537
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789423363;
	b=mHWgatlfjbEiWVASP3JaaNlmgF8263w0/Zrul2W1sIMx3isM8TG05DjJOPK/d5uYxDZW
	 oo2c06mZy5wZ+2OtlMlgYfgeqHo+g6vIFm1c8YzzN+bA0nRdgMrM0b5DyRt36vLyqYfyX
	 3hQdSod1hFA2i2zb7vXVsYgxW7hsim1FO+rbuq5xylBtoZOBYTYgPJLk2O9IVyBz6tv/i
	 NUgJ2AlfVajYPa1HxbGaf8xBgz0WYn5aAVgZebI6Bj3VyXwM/xWcalCJ1r806NiCJbR5H
	 Mlpq7ZMf/lHH18gmdL0LgikQHr68i+O887T5Sin66kdoe615TTKwJJzZp+E2txbwpuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789423363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p3k1Yt/sRa+C7vYLGo8iaRVSOLP895Zf43/cM4P/bV4=;
	b=GssamXWj1iDev+CZOd08BItXTQXYquQXIdm4v4RvYfZZvmSMZZegI/aq9Ukj8zLnLT2a
	 jk0ZEcQMDdPP34+sri2LD7fIf04VNnGXD/PBNwv56s2uBh5x6Yu6HWcFY528+S3XG6Mtk
	 CoZL2NHj3TIFI/hO57fYbci9zmINcmRuhhKa70pRVGCNenYXMikOhi0hkE96xoulUxBaY
	 80aWgr+Ef7ocmLmvUiurNAurPlroS3J8yQxLIDjkoGrjP8nwgtgSF1vxVYXqApSS/pBHx
	 49KRuBBTMrxD2oubhViHA6IXNx4B5Knf/I4I/LNnuym8Gio+zY46u3T5R9pMnDdZOPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789423363;
	bh=p3k1Yt/sRa+C7vYLGo8iaRVSOLP895Zf43/cM4P/bV4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aolCHnNEzUtEOZCEE/9SbXvQDjnEsOBXfjdtg+A7fYLgTpnMKPbw9JNpqkfS6L5zY
	 xON3LtViCTwxxEteQ4pkOTzdCiEEXo9C4NcIlCIgu8fx7o4cGi36fsTC80wArZHpwH
	 cN+eH0B1RlfkT49r0sG148Jt7y6pGeqmtP8EYJyA6Q8aOxhg/KKhmf2xpGyZENoOhp
	 dR//2WuunOA+5Zmuuq3NsO50pRoMz785hIgrIFauNvOz5ViMsejzoks3wblVZG2ALu
	 JH/xx7A3q15dt0yVHLJZMINIMJl3d6k9UWjeq1SMEPmp9J9eIOA4WMm49ODVcN9GPL
	 8AVvGwRXvA5Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEA940537;
	Mon, 14 Sep 2026 22:02:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72BF8224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5925D6062A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpViHrh3wVFB for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:02:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 780DC605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789423360;
 b=ES0Be+OSDHjyvnMp9oNhd4WTABu/+85+3eFM/GGEw2Yg8iLLakEJAI0dnNPn8ZCtfTon
 6ZJrvFyrSqDX1LzwKuZfn5TPIrtHis6gxp7CGw1o+E2bidXfBxgklIxfXyIxld5LbXROx
 Ug0P6VJHMzLWmGhgSFemf/WvVyIu3YVkvgB4eXy7MzaHYM+YEscjya0TzwqU2l+yS5yLS
 c9drNTdugjJM1MprW1JUO732YAL+/fRE45Rebbgnwc63WmhCecLrmdHKWlgK5emtXBcyo
 VMxNVmgRPsEqV147hk53MVPcaNBBr0t3uSFy1WWM62AebUY5Qlgbg997i+FtXKopKBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789423360;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=cXL4xsq//1rd9cICBxGplmWKayktotvy/IFQdeWa+SE=;
 b=FTJM7hZhOixFNi73YtwgT97MXgWdBPdIvY//kd6iiJcfGvh0mEvmEPDBF8ka882Ypm5T
 HyNlFY69Mb0dZROnCXVyBD/V6nog3TZLXf4EOPyjpVlGIVRbBneYiD0cH7TRsXoYnnRPA
 5QP1JSzvcpO6nSAeUP3vwyq7ob66D4KqcklxiR+6swWw26WATOV1d25bW2RTP7DQAlZlY
 3MZ78FfcqzAiQNyf438PD+YCnW4J1M0M7M2E3EMNMltOwbLYITJQPuI2BHsoKZHJr7J0B
 vbaTahdKG34veWVh7iMjVhTq8R4QBX5Ay6VGxNYRdLBfSrGHQGLGQTgHUs4sAaHVzCA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="KI7REV/o"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KI7REV/o
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 780DC605E3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789423357;
 bh=cXL4xsq//1rd9cICBxGplmWKayktotvy/IFQdeWa+SE=;
 h=From:To:Subject:Date:From;
 b=KI7REV/oMow6zyWHQfS12x9DtGwPHakNZWWxjtkTHpGjLnbqafG6bco8l+wpif6uw
 tNybYPO+E/VGH8Ilrkr4foAdUP0A9Npnwx2pZ2ORA2Cpa+4H5xGtYDiusWZwzRLza/
 prSxAPrFegoJ/HEb/brKpmQibo1N6zWBfP+Si/dwJrlZuQm/FQ70t8a3x83iULjWEq
 ku2Dx+nuSB2TBgtw5BVPp2RKnYv6c8l5dKFq4TYwwXJHZ2z1vmQQC2PRM1InZ38T9x
 ZciH4vGG5bSH3uxJkKLCeu0TKVgnrjPsk6dAKDo6UG0eBY7HHxZ+8CicjQpx9n1geY
 DxF2IXv4dYPSw==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7D6EA4C3BFA
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 00:02:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42294)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6El3-000000007ss-3Yf4
 for buildroot@buildroot.org; Mon, 14 Sep 2026 22:02:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 00:02:37 +0200
Message-ID: <20260914220237.3170059-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.4
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

https://github.com/strukturag/libheif/releases/tag/v1.23.4

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commit/26f96b8a018c60927e1922d74520aa6f6384c5d2

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6001e84ce9..78f59f6b67 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
-sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
+sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 1614dafc74..3428646016 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.3
+LIBHEIF_VERSION = 1.23.4
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
