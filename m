Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8F4C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA95F80DAB;
	Sat,  4 Jul 2026 18:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h133sVsTEhWt; Sat,  4 Jul 2026 18:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C2380E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783190670;
	bh=mwN4p1f9mjj5Pu6hv6/R0pcw0ikxti57Iz2xb/1KjcY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CQ352DgJIVFtZJtsgIMr6hUQiXk6RHKTPTvOg2yJ/9PB5/wpt+v3uauxZcCZ/YenV
	 2NLUpZ6DmutUFrY2pmDBOJL33AGx9CVdYhfKzg4rJG0UvU4kt9KEDr4NWV5ghE5fKU
	 4kZn559Bk5wfVVTDheV1gQtI/oBz0o65VbQImf6odej1Z9aw6RVcBzPjU+K+X3mvdY
	 5ygJrep3ysUSCdoM0KFGNppldkNm2DYGz5rTCnhxZrLsX6Yb+oRjKY10xdPXfzcX2w
	 8Q0ee3YxtKgS4hL0l92V9uA9HPSpWeWpLXf2yBWQRv9WHz9QX4b7bFHiGzZMyleE0n
	 6XKQvMD+aFSxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C2380E7E;
	Sat,  4 Jul 2026 18:44:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F852A8
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 18:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1347440126
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 18:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GNwa4c85B2L for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 18:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99E9E40079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99E9E40079
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99E9E40079
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 18:44:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 940CDA4C1156
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 20:44:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44024)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wg5Lj-000000002u0-13xJ
 for buildroot@buildroot.org; Sat, 04 Jul 2026 18:44:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Jul 2026 20:44:22 +0200
Message-ID: <20260704184423.2206921-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783190663;
 bh=2gNnlLzzDgH71izBq1vHwrQl2yFWO44PnZMlHMUf+Yk=;
 h=From:To:Subject:Date:From;
 b=SV6JK20AeFLtND7QDKcYF/dwiWOEnbQqflXhxEje3aGE19yylIGh/zZ4zFnRWfq0i
 vQ0veNuZnhcnKPBcWQqCMpYB8CslorBQin4nTR7ZMUs/oowd+JtwpRTn+YifazbH/m
 SfOdGVQuQ/6SJh7rPhqCII4wVh9+2Fkxsf7iHyR5f5mQ+RPnZhPfZQ4IrSyU+zu7Ag
 iHNFwEHHu5B4GICGVpDYxmLrWkKDmM7Zr1WKncbzZHkoCcg3QZFRwF5k4ZW017jHSV
 /JTPOL3Ld1DecCmhqc0gAlDvQxiRQZZCjAWKOCHMUwSdFT7s/2CkVlyF4VdTjPwKBl
 JXRj4lAn9M62Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SV6JK20A
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 26.2
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

https://stellarium.org/release/2026/06/24/stellarium-26.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/6eec8e688b5edbfa2e8c86969bd103c247d047c9
with the exception of build errors in mesa3d/qt6 on some platforms which
are unrelated to Stellarium.

 package/stellarium/stellarium.hash | 6 +++---
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index b3f2a9ec9f..d0dd53f900 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,8 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  578bada2531e39146ccefcf6a0d202867e403b559f54239e8db9f9c003e04443  stellarium-26.1.tar.xz
-# From https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L858
+sha256  9a068d00aac82151f2b24c7f278847a2f9416f31f17c0326fc56ee4cc4cb1aed  stellarium-26.2.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v26.2/CMakeLists.txt#L857
 sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
-# From https://github.com/Stellarium/stellarium/blob/v26.1/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
+# From https://github.com/Stellarium/stellarium/blob/v26.2/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
 sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index f36a3a14df..a3ab725017 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 26.1
+STELLARIUM_VERSION = 26.2
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
