Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99418C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34ED140620;
	Mon, 14 Sep 2026 08:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bF074fhwSN4f; Mon, 14 Sep 2026 08:22:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 441A64061D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789374124;
	b=mJEscJpnSkQZjb9sT7byX2U9D1vi83FQiFxLaxhygfKy491HLoMYnESqGFD36kFLP5sN
	 crS1W0HADrrTm/uZYgfuPRqT9IYEYlfqY0kRb89v8Q04k4zQ4QkAMYIDYaxJFxhoHvErs
	 XF2z48fkJqXMUqLSHKRGRDm4TWcgFZ57eN2vo7SR1NI0YXED0FavvVC9ZZYCHHXtdPbnL
	 2Ue1FM9vkSnSwDE/FMUGqV7cZNCKHm0ByCEOb+vsHNof+nFzL+8TrVerCtN42V14KFbNp
	 2uqxTk91KHvn1uweQRatyu9KU3cFr9seyigp6tz8r2rw6ANi3NhUZKavYund1hgWBYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789374124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Bfk1YEd1qQlvPwDTFo0wi1uiBDXudqNE42P669Qc9Ss=;
	b=jSvlrJneHIgf+Mo7NiaPQbcq7HRPuiIoAcEvXTypIYP9m+uNSylR16L2kk1TS+JyLGMm
	 WVBlPwk0XQ1dtSCsQG/VVr5J/hXA6csi77QwpzmZFkk7+RDSeF9K6SEk8T6fSRD7owSR7
	 kw+zDGE55lCzKooH9K/U2G6ek5d4LeTHtyWsMfpMganREyJGlFycIdfT6f/+zd7YrCLFU
	 sYknBgmoUCB0Fpu98uOK6QJgMZICpY+IcAPpoKCDR/3Euw80E0gek2W/Xy/RDTc3UCEE6
	 IMLu2XUKISSvA9RF21La3QXxRQoUJMIfI//aCMQ/4eG3HyfFxMASU+GbkvXOkKoV+jw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789374124;
	bh=Bfk1YEd1qQlvPwDTFo0wi1uiBDXudqNE42P669Qc9Ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6iBAvYZxlCInKA+sSw8p2C8//fr7OVwxRSyAyIL4WCTHPTAqIHQmXjGGhZnlI2J3
	 FYCG+XrJelw0eF6vNSZmiq9W9nfd29/6qO5o102+O91HK18XB67X1G3/Uo10W5UaCx
	 ZePHBOMYgpOV4QXj8f7Kp8IxmFe43pHY/z2yZo2TZbVijSj3pd/vWUEy75MBI+y2Xo
	 NfbJTFKpuRN0U0UPYMYpKwb9C+mGpi0IRwGbbFQzqymUwcA7MsNcvbJFKKfd//CWbC
	 MAouBN2FB/IeJq8OhCxTr9lnSoZ891zTdMoZcKi5PCF7L0TIaZbuo6FRqJVF69IFEF
	 jlNRfO1H/qbWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 441A64061D;
	Mon, 14 Sep 2026 08:22:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD68D3AF
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE1540119
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VDpV3m2ShZd for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:22:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8A4A74007C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789374123;
 b=OuWnYw4PR3fTDx7/fZ/gH9HlvuOem0x84tDcPUYk+AcLmFS2qf6FVbmc2Z99vbErN2ku
 caQNWu5xv4INQy0b3FTJE8TiBp3AutdB0/dHw6EIzJ+KCTkwB3fq7ZotU5/ElZ0baktxh
 kXDGRuUOk5EGLfLnBoNL/18FwfGtiURrdKN8XaqD8Kv2thL22r2SoB8aix2ioiFyPz54D
 uuRs+cXogiW0GEMafOTuxi4o1LUdvCQnE60sGRqLqtd5NIonEK61ErwBvXXF+axWfSEJN
 qWm3WBAHUhmgdF5pIbMScgjn9saw/Z+A8XjxQlyszt8KW2zPEMBPYZtuwXe2NkQ70gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789374123;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=z/6FnIlw21dt9XHvxQ8vvVPDNmEf9P2NigJU0msi0+4=;
 b=YMNAJ69i8EzGTcJxSllKpBfNIbXdZvphfMcLiZEXI0pOlyk+l4PCKZ3mp9ZTLnhddNGM
 2WBer5tv09sYrtvjfRnsizZLh1v56fD/YiUY+LYGrJS9Ds8OxbZgJ2JmBJPrtMxsecGyw
 5dk88zyITTHg6gdJT4WBAtnox27pmTpxc2wXxlk0vsRaHSFNDevQUiUJ7HbllQsbPHBxQ
 Ij2YGM2cdzIWUgg0vX9YfR34M4h2cNvNXPnW990379iVo5cam62l1Ux2b61GPznK2vduH
 3ImqP1dnvYSfea1BcbhwBj/WUdmJbUpiu4Hn6NoHlbX3Kt9RteTCoJOVYLrLIAq84HA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hAVwa3Ek; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hAVwa3Ek
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A4A74007C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:22:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-482ea739de2so1976702f8f.0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789374119; x=1789978919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z/6FnIlw21dt9XHvxQ8vvVPDNmEf9P2NigJU0msi0+4=;
 b=hAVwa3Ekf4vL8Cv6SJW/jMpEOZ9ODJ4Rk/SLB6p3A+EGVVEA2T9YgUIxMqS2AbN6fQ
 MEvluBpYpa3HNm/0/clXTlE8ch3UU+ZdefKFj34KnnYhQM8P+PpQFNnF9TIqZsq1nJ3u
 xX6Of5iO3n6m+aMpXEC92SfOonbQj0DkrqqV0iaoeoXKCpvNDTRrlfMEVA1RVr0Fcu+o
 5dzRFOQjg63vNedkX/d6A12hY5H8nPqFJ5AwxOR4oJKLYhZ389cL0TYGAYljgbMaHn1g
 qUOlYziWZ2oh1lHbTZMjhZrsVOpWusJz1HbCE3GADr31QKR1FzyaRIUDHPnmWogtPYdo
 rl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789374119; x=1789978919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=z/6FnIlw21dt9XHvxQ8vvVPDNmEf9P2NigJU0msi0+4=;
 b=oBOgRHXc7qfRI8bvPPbvHVHJ8AkI/0h5KOkO7zsbM+AC0Qc7ELtF8LIFPRhzod/gqn
 gOp9K2nO3gIIhhcpMbrQrMlE8lnswj9qEb7GfRNAHDunYg4W97rXoT+0K9o8Vvph1Uq7
 zjycYRQ6VFmzD/IjYzbaSoPbWJE7HY/yxCY7OsqoVuTvccCmFavtDj3OQUgUXB1XPRrN
 BqjwE+YJH2fSRtDSsKz/TUoawGqRxawz/SBfCAXBI5SdzWAE8WRq6hGDJaJfo4OM25U6
 MKeAbc4Q/0SYBl+oaYEwlTprbjTpGUgqNrERG1DOLPlq0V5AhrcqGLxDPeLwiCSnmFok
 9M8w==
X-Gm-Message-State: AFuF++nZeNv7M2MpJmAJCAY7+18qcIJBtAZyEygutpjBbnRfitqdvbz9
 D2zNoR7y3/GMZLy90Gi+S/KMdC0zJ7BK7kZmSjq1i2pmUaV+fTV78n7ZCxG1iqgovpo=
X-Gm-Gg: AYBFou3xXx+/aB0I7NarbHWFH1Mfgk+1/mZsstzXbDcL3Ii1QJfyeKIxFGEkesIG6dP
 CHnzJPzEViQJFYrZl/POS5TzzpIjlICBuLYzzz3FQ2SiJSUDAI9Q1rT3ZyJTzEZjYq85WBb6wPA
 gbRVRGz3WDXBfrZfTvg163EojAsTAnyjbbkmPd7o+qkvLqhHqDNYgv9Pa75GMzNU3JNY5etDyz6
 w/5z5YGDQLXPNf6aQ4ihZh6/09dfJVwT85oz/PdZOf88ojRmBXcAoVswzIZ1iHAIdlSz5+tEDpI
 tZuvVa2kOz0tOzKz0fgHqK1I9KDiEhSozAkDnZQuRipnZI0FOAPqeYaqpLdJUpyRIXFmnMusqb4
 8Z8MlJoWfXDMSVZXow+N0fsHy83GhAS2Qg71zVLVVyPhmOPt8eYB679Aapx3Jty817e92wqliJx
 jHCO7avaJvK8Xlh4XoZYvHfemuwTB9rQirYU3A3I1yI9QRkYMUwWuohSQF1c2OVtJfLApgTpEO4
 6/GowoGd++x
X-Received: by 2002:a05:6000:4023:b0:487:42c:5a32 with SMTP id
 ffacd0b85a97d-487042c5a52mr43153f8f.27.1789374118885; 
 Mon, 14 Sep 2026 01:21:58 -0700 (PDT)
Received: from WL2200093.evs.tv ([74.221.142.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb34e4b5sm24880218f8f.22.2026.09.14.01.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:21:58 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2026 10:21:36 +0200
Message-ID: <20260914082138.2802-2-fred.lefranc.evs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914082138.2802-1-fred.lefranc.evs@gmail.com>
References: <20260914082138.2802-1-fred.lefranc.evs@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: don't require gbm for
 eglfs
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

From: Fred Lefranc <fred.lefranc+evs@gmail.com>

BR2_PACKAGE_QT6BASE_EGLFS currently has a hard "depends on
BR2_PACKAGE_HAS_LIBGBM", and qt6base.mk unconditionally adds libgbm
and libdrm to QT6BASE_DEPENDENCIES whenever eglfs is enabled. This is
incorrect: GBM is only needed by the eglfs_kms backend. Other eglfs
device integrations, such as the Vivante framebuffer backend
(eglfs_viv) used on 32-bit i.MX6, provide EGL and OpenGL ES without
GBM or DRM.

As a result, eglfs cannot be enabled on i.MX6 (imx-gpu-viv only
provides libgbm on the aarch64/i.MX8 blobs), and forcing it through
triggers the dependency-chain consistency check:

  package 'qt6base' has added 'libgbm' to its _DEPENDENCIES variable
  without selecting it or depending on it from Config.in.

Make GBM optional for eglfs:

 - In Config.in, drop the hard dependency on BR2_PACKAGE_HAS_LIBGBM
   and keep only the libegl requirement, which every eglfs backend
   needs.

 - In qt6base.mk, only pass -DFEATURE_gbm=ON/-DFEATURE_kms=ON and add
   libgbm/libdrm to the dependencies when a gbm provider is actually
   present (BR2_PACKAGE_HAS_LIBGBM). Otherwise pass
   -DFEATURE_gbm=OFF/-DFEATURE_kms=OFF so that the eglfs_kms backend
   is simply not built, while eglfs_viv (and other vendor backends)
   still are.

This keeps eglfs_kms working unchanged on platforms that do provide
GBM (i.MX8, Raspberry Pi 4, ...) while allowing eglfs to be enabled on
GBM-less platforms such as i.MX6 with the Vivante framebuffer output.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/qt6/qt6base/Config.in  |  2 +-
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e6bb99de28..c33e078b15 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -74,7 +74,7 @@ comment "X.org XCB backend available if X.org is enabled"
 config BR2_PACKAGE_QT6BASE_EGLFS
 	bool "eglfs support"
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBGBM || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
 	select BR2_PACKAGE_QT6BASE_OPENGL
 
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 01661b7f01..5e6cf66f32 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -305,8 +305,16 @@ QT6BASE_CONF_OPTS += -DFEATURE_tslib=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
-QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
-QT6BASE_DEPENDENCIES += libegl libgbm
+QT6BASE_CONF_OPTS   += -DINPUT_opengl=es2 -DFEATURE_egl=ON -DFEATURE_eglfs=ON
+QT6BASE_DEPENDENCIES += libegl
+
+# Only pull in GBM/KMS/DRM when a gbm provider actually exists (i.MX8, RPi, etc.)
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+QT6BASE_CONF_OPTS    += -DFEATURE_gbm=ON -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libgbm libdrm
+else
+QT6BASE_CONF_OPTS    += -DFEATURE_gbm=OFF -DFEATURE_kms=OFF
+endif
 else
 QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
