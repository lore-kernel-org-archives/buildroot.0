Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F273C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 10:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0FFB40376;
	Sat, 15 Jun 2024 10:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isKeGYd1r3tb; Sat, 15 Jun 2024 10:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 995E040189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 995E040189;
	Sat, 15 Jun 2024 10:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B4921BF366
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 10:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 863866061D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 10:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqgccjMbHcBQ for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 10:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83BE8605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83BE8605C5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83BE8605C5
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 10:23:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BBB53B004FF;
 Sat, 15 Jun 2024 12:23:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 12:23:31 +0200
Message-ID: <20240615102331.667604-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718447029;
 bh=mVT5mEUk/l3Exyvztn4992gYGbFi++5+Da9sZxUmJXw=;
 h=From:To:Cc:Subject:Date:From;
 b=GQHmXACtujBLUQfWCxVP4cgiXr3WCAKA89/z7Q5kLTozmt9vn7nWg78jyq2xc35Ia
 ROFHwap3/donh6mxc7+d6YNh/+kuk7fATwDCsHs3uCcxYPI9LDMjTWVf5wEdlknRSz
 oMhwbkQOFIpuHOXCYW2e6guXn9TGIKlCAc12Z9V4mE/INL2Sjc7ZRoPtcHXeUBJL0v
 KXZSMEUkahV808veSpDcgjXHYR1LC1UPORXSeJ/yk6asHKmLH5GVfWKILON9vkNhFd
 FMtyS6CR0kx5Rxdi1ODMa/5SMLmBUmhKh5LRVJt6ObwmbDNnvu3fWHfiq7ps/bsLs+
 MT6aN8EMp+6dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GQHmXACt
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional libcurl support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 6a21bef7b87..f3caac3d3a4 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -36,6 +36,13 @@ else
 OCTAVE_CONF_OPTS += --without-magick
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+OCTAVE_CONF_OPTS += --with-curl
+OCTAVE_DEPENDENCIES += libcurl
+else
+OCTAVE_CONF_OPTS += --without-curl
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
