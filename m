Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21631E6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 21:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E3F408BD;
	Fri,  6 Sep 2024 21:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tw9bGzngZaef; Fri,  6 Sep 2024 21:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E5F408D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E5F408D9;
	Fri,  6 Sep 2024 21:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20B611BF37A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADAF7405B7
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 21:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJyHp7KAav8b for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 21:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72FE8408D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72FE8408D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72FE8408D9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 21:57:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc3e.dip0.t-ipconnect.de [79.214.204.62])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10206A4C0D95
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 23:56:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35778)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1smgwr-000000005yM-3FWj
 for buildroot@buildroot.org; Fri, 06 Sep 2024 21:56:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 23:56:57 +0200
Message-Id: <20240906215657.1737978-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1725659818;
 bh=oTwt9Ex390XpIlxs+dcN2kv9lbnvkIRVv+VcyaArWkg=;
 h=From:To:Subject:Date:From;
 b=s+powBqVlmT9S7gtaY+0jgQ5kC0NRnSr1Vfisn9xwy/t0HUgU07TuFg5hxTdyODRO
 rf8ksXuC9E68fN8W+u7leO+LWlXzLzXX5DVPz343Mj0fY9gqmyGgedaD7B+dcW8mqJ
 oYD7Fu3sy0kwcoNcMTbZjAC3Ol2jVAbKQKuGdKz1Y+YK2hD5kAl86+Pu+pyk0pEiOP
 hBqnn0/rxpzj+yUPtilbs88P7dGMjqS7nDDVdKMmIJ1cl0YP1/HThrnGPPpGojH1i4
 QMgOMNBl5ov03P59NXZH8HL4qV6mRCdqCpA4+RoKScEAn7EyqnaflSub/IsTrMvEz4
 hALFFLSJSm2Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=s+powBqV
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.123
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2024-August/003528.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 9d78d5e437..aec9f58749 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-June/003518.html
-sha256  d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251  libdrm-2.4.122.tar.xz
-sha512  ea6bac94416d4ba0e9805e142ae62904236bc49f803d4fc10c92968a4df64c818dd42524ad7a4e988062836783a148e27094050bb2754f751a368627f794ad13  libdrm-2.4.122.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003528.html
+sha256  a2b98567a149a74b0f50e91e825f9c0315d86e7be9b74394dae8b298caadb79e  libdrm-2.4.123.tar.xz
+sha512  d3e6ba26bbd609fd87ca131690547eeb6a903c0a8c28b7f5cd5d0947619da09f31daf7bf4b6c38bf5e5dc173e2ccba476338ef682d8cf06d6b71ba73fc9b948d  libdrm-2.4.123.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1cf754227e..021a575474 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.122
+LIBDRM_VERSION = 2.4.123
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
