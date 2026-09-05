Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA45DC624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCCC60BC1;
	Sat,  5 Sep 2026 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nSCn6P4XSpr; Sat,  5 Sep 2026 12:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B29206060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788610847;
	b=h/L1jjZUHHHivN1HAbMggK4FRxCY6IEgIW8BcT5kzgBy4yVxTIKrMxN4AeEGmswY3MH8
	 2fLhUy3o1EaquCDKTjVgZtVQo4La+CZsfEb2GYYSyE5JTfP2Yeku9zhtbZf0vpdKRYRKW
	 KzU5zchZ1XUh5BkmhYFb+c+hmnABAXDyWaON4DIdeBGR4F3eh/6LuQCPv79eCUj6Fqtc5
	 J3tmaO3Q369xUFKizA5EOIWJT2aGAUp4j2VVJpsiSmg2dXGxjrRmITiDZXp5UZglhRw8W
	 SZmQsR4ul13JGNFs1g+ku2qiLNGPUA46AZQbR3SR3hYFp6S5LP3EqVSj8vojPAcs4sA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788610847;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=b/ps0YMAZsffllnrq8RwBWJbujR+su7ZTp76K6LIx+w=;
	b=jiqmORsuU8/q+kBLyar5cDSXABQG7rGM6O/3gP91b9ER0xZwZ3n6aBOFy/jL4q32r8VU
	 rS29W8dBQ6fwmrUwHzZMYI9BdGxhVirPeMnjj2Uoj+IcYiMRZZPgzF5cPUY12TPv3OEFx
	 sBBFEW/IwSZRPsdeGhuIUwXZVTfcKSxnUwO+v07FipD9oEsi1ABQzxB6G0fMxz/XVvwBV
	 ojOnnpEPfZ9XF0B5dHpbWN3+mnhJfuPMmtbxm925jRvlevHwjTb7ZBGyswTDcXO+T3XhP
	 yWLkNZrmCHTalx4gpGmNnCEIKpCUmCoOSFjlHZ+cWszl+0i0r+YA5ZI1EcYhOHDjB6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788610847;
	bh=b/ps0YMAZsffllnrq8RwBWJbujR+su7ZTp76K6LIx+w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Y4tb776fRo8001QR4aMOQ59ZqMWzGI+3KqV1SoFKgQ+ZXa+CEu5JcecKqjmUWGAoT
	 4n5EhmfpU7YOCZJRUrjaDVTpe31iBJsLHNQycyUHyUq4wYSz7Rv9ljPpE4kqZYSACB
	 k+MKC9j+fkrSyHhJTRZpTgrVfG52uZiRMxfwoqiGRwGpyarwf5JlLahSz7EW2/OJx6
	 DdtOxrRoAqCgb5xFKsbaZjq89UysZ+KKFMI2jXaTgiNnTT5eTzrz1lrh+/PG+nQYVA
	 k1N2WXTrRpZgkRtc+NcftFpa//+DHj6EgzmT2IG5SAN3dbElw7jrSxnlvY3xcCV4yW
	 rwNEigdrEXXZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29206060D;
	Sat,  5 Sep 2026 12:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D83472C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 126E78111C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoK7UlOzA6Kq for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E6D7E809E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788610844;
 b=LDwjdJQJ3XO+URawUwRysfwYsSUSDmwpfeIIiatmhZ6RxtY6LzE1ZVkqkxx+DJIRkFLI
 GvWdHQppRyEnkLzwpcRMk3755Ug6C0CuH0pNrnDT+FqUyfZvKwdDgTX4mW05RW0+yS0nr
 7ZhnvOOwMWreIPMsPo9sXyzRlZiH5hXHVY9bDGJLlcjDKW5Gkm/Djn8hKUMX55oExa60v
 1ollZ5PmYcpFzS4xdEh5nq+obIOo2qo6s+Dt6jOwfbVqUMnVdgz1dk2swhN18vgCfHaMt
 t15cglXY4mIidGCmbGzKgRXtUnu2pZMN4x/9ic20gkUFIo5sd+qndY+fKE505bIBRYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788610844;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=CB0Av88himBsn00UQcXapFngrfSoT/FEjVRqJ6x1VCQ=;
 b=I3fVxTlIrqpoWYJoqLr2eOIDw8bLMm/Yxn5cumG37wMgxZZgfiM7UZTD24mvc41+K4Tr
 yxrd76HwVwwE1SR1VG70EiBVLAEe1w7SMHlMKpx8y1BbmQqhLzfsSk7oyW97Q9ngJ9EdN
 13grYfPIhJFCiyV7byqDf0WLjC60tMOtGa+X15RuBSIkQWB7yXtt3oC2Yj2E/uShMjyoF
 Kmt433cKvbwD1H/j9xQt0dWScS0lXTV03GDYBvNzD2EJQ2nMLKh42Ak5ZKfv962TiUeCp
 jlBxHq347TA+4lrcMx/lobslo55WCxXL3FI0JN4Ty80FEpeeZ8ltmI+aLzB7Sp+LCdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qBrAp0zt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qBrAp0zt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6D7E809E7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788610841;
 bh=CB0Av88himBsn00UQcXapFngrfSoT/FEjVRqJ6x1VCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=qBrAp0zt7+5eiZTsac4tetI/aWQMbyEmbEyrsIbLEghuVNpuisFPsHNlykbbKjxKt
 FBidAfWGfYec2vyn/THZZjrFVpfAHVBv0X71Nq2Ty2ruySJYG+t2yHOM8kSLQlqlSF
 UYFq33CuoRfvzIbJsjRoFhSPqq1rSoOhBVVpVFL57whjSmfjtwq5vsuyW9NW/WC1Yj
 KzRTxMMOEEod1H3yZz13tLx08VUcIB6+UD/X6m0wtqiPRaMWw292/UACn7JhdroFib
 k+yduoF8eLFyndD58GEJhibR5nF1Wt6NJcyDl7fBWV5GKGIg5MjNcIHU61gbOMTzh4
 BO2UTGkbIACrg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19270A4C2D22;
 Sat,  5 Sep 2026 14:20:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60364)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2pNw-000000006UX-2vxk;
 Sat, 05 Sep 2026 12:20:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 14:20:33 +0200
Message-ID: <20260905122040.2054789-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/7] package/{,
 lib}apparmor: bump to version 4.1.8
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.8
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.7
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.6
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.5
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.4
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.3
https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.2

Switched tarballs to bz2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines specific for apparmor passed:
https://gitlab.com/bkuhls/buildroot/-/commits/442dab9ea2ad370bfdfb530e84e748908d87fb8c

This bump fixes build errors with the upcoming bump of swig to 4.5.1.

 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index ef7dd81aaf..e32b52d51f 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.8
+sha256  e5b61bdda754ce55091d390094bdc9eaa7e5c60ae24e75cea18f51c288afa65d  apparmor-v4.1.8.tar.bz2
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index febd1d5eb0..ba63344bd2 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,8 +6,8 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 4.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
-APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).8
+APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.bz2
 APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = apparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index d0603c0a3a..0d113e0d93 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.1
-sha256  f125aae32964e4e84443fec005f37f37abd5164f30620239c42864655a1b0281  apparmor-v4.1.1.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/releases/v4.1.8
+sha256  e5b61bdda754ce55091d390094bdc9eaa7e5c60ae24e75cea18f51c288afa65d  apparmor-v4.1.8.tar.bz2
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 64442fcc16..e4ae9c1a19 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,8 +6,8 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 4.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
-LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).8
+LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.bz2
 LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
