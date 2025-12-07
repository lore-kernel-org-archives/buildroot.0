Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798BDD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D7A8226D;
	Sun,  7 Dec 2025 14:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHerLT_9O-jg; Sun,  7 Dec 2025 14:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383FB82239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118761;
	bh=CMSSyz1xKkTcekXqBMnrcWGjl3sEesZ97BzZn6V6jOo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QzK9DoqK0RQ/GUNzxcyGn3vl85dLiKLd1cqFuDNO3vq+nRYr2MDKv9kM3/o6Wa9cx
	 SrzvyFsqvhhEvKoINmGcoFRdhB7i3I+7/I00zvhPhcc1uwQLs9WHimlMREynG7eVsR
	 pl2fMLvh+iQCajmi4rMRp9fE8E+OvofM07QSX/IO7mtEhiTQ7tAdEHJrHA3kZNOQvP
	 kv6iRasCY52dL/srgXceibUGgVZTMFmKOGIS3pCsxUdo9vQKzohuyl5fY7h8keAirn
	 LA32gKksHORywOr9g/DjOVrl9fyd1feDAtKQBajq5+vZrgmqPa9iAaW5ZGxXkoVm3m
	 8Ne0odkoiE0ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383FB82239;
	Sun,  7 Dec 2025 14:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB1C151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D41D605FF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j71d73dk-yke for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FB09605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB09605EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FB09605EB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD2F8A4C09E0;
 Sun,  7 Dec 2025 15:42:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-3wTI;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:26 +0100
Message-ID: <20251207144243.3696572-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118576;
 bh=y815Ek27WpEiOB3cwOvaKobfX5LolZd63FJ5oplwaKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l2JxfqRv6zwjLJBJtfP2gri0JR7RHIYn6in1UZqClQl94hFGeZgtVV3lqIORi+Nz8
 aP6PL7nZoiyYOVstj7PUAb+8CRkkmpK2k4vJ1jC4MXhMBdhevUVaN8DUh0g6WmSzLQ
 1PHDna9kB8+BKOTjeRuokCu9W7G1sOwaUgg6Z2NsIF8BRGFYmtI/5b8pma+JpHFKQF
 TWad6HgdmpNTh2rvcQCAvqURLJd50OwDlXQsBh6vpnLDmr4v+1o/zW8f9roSgO9qA7
 q5/2csgFY7BLDOe4MfAeRZqKJY3I4MdhOAUPleBBXpiGFd20rP4VWXDXS0ZxvJRJP5
 dAmjLyp+OliBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=l2JxfqRv
Subject: [Buildroot] [PATCH/next 17/33] package/supertuxkart: bump version
 to 1.5
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added sha256 hash provided by upstream.

Added configure option to disable vulkan support:
https://github.com/supertuxkart/stk-code/blob/1.5/CMakeLists.txt#L274

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/supertuxkart/supertuxkart.hash | 3 ++-
 package/supertuxkart/supertuxkart.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 446a9de8ec..38b45f81a7 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,3 +1,4 @@
+# From https://github.com/supertuxkart/stk-code/releases/tag/1.5
+sha256  33cf8841e4ff4082d80b9248014295bbbea61d14683e86dff100e3ab8f7b27cb  SuperTuxKart-1.5-src.tar.gz
 # Locally computed
-sha256  9890392419baf4715313f14d5ad60746f276eed36eb580636caf44e2532c0f03  SuperTuxKart-1.4-src.tar.xz
 sha256  d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 6bdd512eac..377b9668a1 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.4
-SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
+SUPERTUXKART_VERSION = 1.5
+SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.gz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
 SUPERTUXKART_SITE = https://github.com/supertuxkart/stk-code/releases/download/$(SUPERTUXKART_VERSION)
@@ -38,6 +38,7 @@ SUPERTUXKART_DEPENDENCIES = \
 # Disable In-game recorder (there is no libopenglrecorder package)
 SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 	-DBUILD_RECORDER=OFF \
+	-DNO_SHADERC=on \
 	-DUSE_SYSTEM_ENET=ON \
 	-DUSE_SYSTEM_SQUISH=ON
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
