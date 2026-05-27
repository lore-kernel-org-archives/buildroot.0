Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB31CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 18:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13561842E9;
	Wed, 27 May 2026 18:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEFklBpxarUg; Wed, 27 May 2026 18:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BB3E842F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779907812;
	bh=SSkRHsNz38YLMUrk5jwXW3Kt20FPaLWe9LFaEjm7zXs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TyzUAWoOovbZK3INlZLwlHFTfwENm4q5YDW9hpBDaEWoFXtXWFl92Cznn7AM2Pl5S
	 eYUDP2VAKuDuTF6W8QCpDiehaBu223tQ23FHLCznWI5DF0XfnkhATmP7i+bYYniWq3
	 CMhQzL9EodHizdhjWq4mWxTAfOngq8oh7nVxpIRcMAiKQSPBS/JDf9XierntgzOdTj
	 sPkAw5mx3ULAF0Knev5hk5Nd0vEwExy6vUIUc4nPNRwLxR+fdkKel1N+r5GNHhNn4I
	 YtUnGYQhrmY1rTnxdXU4pt3Zuv0jlE2aEe9Xa2HZgPmOtl25N/xfcRR6gywY0wPOz3
	 Y+/mH4eG1K+ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB3E842F2;
	Wed, 27 May 2026 18:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4411B290
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32EF84221B
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIVJHKdPL6I4 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 18:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DB3A421B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB3A421B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DB3A421B4
 for <buildroot@buildroot.org>; Wed, 27 May 2026 18:50:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2E9FA4C2050
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:50:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45698)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSJKR-000000007v1-0cCd
 for buildroot@buildroot.org; Wed, 27 May 2026 18:50:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 20:50:07 +0200
Message-ID: <20260527185007.3533507-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779907807;
 bh=URVVhhmuNKt2Fn/L13V924Ha1qonO7Db0p6mqtN5Cak=;
 h=From:To:Subject:Date:From;
 b=qLG37QeISuvfHVP+ja1vSaG/xDFMnfsmE7cCL+8FogCcqi5dwopidWxP3vhHWULJ+
 jP5GwnFzauTO6+ZIfqC/5xaKyCFHFPUhmYeY7iY3MeWH5vK2FPTs9RuPwu3YqqNjN3
 IX5ZYIfFHfsCmFTvwf0z5mLz7vr99dupxz9zV7liLjXKTiIvOQ0UdCg7TSR3pubfB2
 r0MvMLXoAu6MT3wkd1l6tcFzyvBNwKoy1LZ/EbcN62TCqI6eupPU3d1aXXd56F7Fhu
 cLSm5GC91oVhkMG10z570ck4cFSUNX6ZyQ4NHTquYjjig3YLRZb0yA//JsQ+tY0BFZ
 QERpM5o0jzkOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qLG37QeI
Subject: [Buildroot] [PATCH/next v2 1/1] package/uhttpd: bump version,
 fix cmake 4 compatibility
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

This bump includes upstream commit
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=ebb92e6b339b88bbc6b76501b6603c52d4887ba1
which fixes cmake 4 builds. No backports necessary because the cmake 4
bump commit e46695bbe4ab583f39f9448f3ef3e044efa28808 is not present in
any older branches.

Updated hash of header file which is used as license file due to
upstream commits:
https://github.com/openwrt/uhttpd/commits/master/uhttpd.h

Disabled new configure option UCODE_SUPPORT which was added by upstream
commit:
https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=3ceccd02d86bf4d6609f46d8b30963cc52034cc2

Fixes:
https://autobuild.buildroot.net/results/cc2/cc265d34aed684b88032edd04ca0fc88186ec676/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added result of Gitlab pipeline
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2556954129

Please note that this pipeline also tested
https://patchwork.ozlabs.org/project/buildroot/patch/20260110110051.4158329-1-bernd@kuhls.net/
where ustream-ssl was enabled as optional dependency.

 package/uhttpd/uhttpd.hash | 4 ++--
 package/uhttpd/uhttpd.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uhttpd/uhttpd.hash b/package/uhttpd/uhttpd.hash
index e84d2dc3ed..015a04af5a 100644
--- a/package/uhttpd/uhttpd.hash
+++ b/package/uhttpd/uhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  397aa4bccc4acb06031270d4a549fb266fec3950a88fe3523f0d7de74caff010  uhttpd-15346de8d3ba422002496526ee24c62a3601ab8c-git4.tar.gz
-sha256  ce1803f83f776cc88661e303fede0e5ff52faf1d9f74508fadbecf7705b4c84d  uhttpd.h
+sha256  5835ced5fd67358b95c07d41a3e2a5991719048f99b5d43bf191287524d8fabe  uhttpd-506e24987b97fbc866005bfb71316bd63601a1ef-git4.tar.gz
+sha256  b98de120bce554de7d205fbc5734c2b72973e55ce36ef6403510c4583cbe2e14  uhttpd.h
diff --git a/package/uhttpd/uhttpd.mk b/package/uhttpd/uhttpd.mk
index f4fcccfa67..2adf409487 100644
--- a/package/uhttpd/uhttpd.mk
+++ b/package/uhttpd/uhttpd.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-UHTTPD_VERSION = 15346de8d3ba422002496526ee24c62a3601ab8c
+UHTTPD_VERSION = 506e24987b97fbc866005bfb71316bd63601a1ef
 UHTTPD_SITE = https://git.openwrt.org/project/uhttpd.git
 UHTTPD_SITE_METHOD = git
 UHTTPD_LICENSE = ISC
 UHTTPD_LICENSE_FILES = uhttpd.h
 UHTTPD_DEPENDENCIES = libubox json-c
+UHTTPD_CONF_OPTS += -DUCODE_SUPPORT=OFF
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 UHTTPD_DEPENDENCIES += libxcrypt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
