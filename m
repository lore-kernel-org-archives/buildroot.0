Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BAAD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D67560B6F;
	Sun,  7 Dec 2025 14:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16DOAmpfwLgG; Sun,  7 Dec 2025 14:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805AC606B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118691;
	bh=OywqoaX1aEoNAZnOBLC+ovaBDDm/rfCOjxnW+i6+Gd0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NAw6rFMJHJaezLMHpooZGRpR6qmnm/m8zntRbrR+omtsMdtkpFXJxpf33NsYnWmfc
	 rUMDBcTQMwxnKNa62HLdgtdXKyxmAG3dhqevYDa5CTIF08aQdJcfkVhhMUtcS0NQUO
	 +llSiFOIB1oLVrE9tbdfRLHpaga/8vLExynSi5d3VaRJ8/TIN9C0VaEywTfmaFXT/X
	 iNbYEfpBYO8MxONn24FtnEHbMLFBC59o4j1Qf+zSUpDTCkWOwGKUkzGrzEPjs07L5M
	 /PnPI01vywWmw343qYfuNagxXDrArQHuqkDilzX5wy0j/K2cTVUScPxRss6Jv4H31t
	 vKbTLxR/qlcdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805AC606B0;
	Sun,  7 Dec 2025 14:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AED4A2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A5640208
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id homQqeV_1AYh for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:44:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46E4140166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E4140166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46E4140166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:44:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F3428A4C0991;
 Sun,  7 Dec 2025 15:42:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-1VDq;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:19 +0100
Message-ID: <20251207144243.3696572-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118575;
 bh=fYcKjvsgDKdV6uFFJ88b7v2ex4syjqqZV+/9Pc95aoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DveJ/6NoG7vXoFtNmShqB8OSCkNFqw/3nfsaNN6/cWYdHYlBzwg2oZfomeDX56rma
 tDvFtys5Ww7gQQ/QgHzH/Lspgb8T5FJenYVboKg7cRht95eQA6/6mbL/WpAnUDdya/
 T3sU1H4gALNjRpzcLx6Kd2gRPTKl+a+6agoshbkU+dOfXva9dPkGq9T1ZCjLd9lJ1n
 NgvWdZENASaddAyvPKhxg+voN/xPZb6xmTMTW+rOzpc+MzC/zSg6TfO9bt4hiQ8AwW
 zpjrEg0XuNEMP3a/4V3gKNEEVfqlw9O4uGXE+v/9K8/mEdF3ux84CeoZy7Mn+zNLX8
 S99QbijWHfkdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DveJ/6No
Subject: [Buildroot] [PATCH/next 10/33] package/ogre: bump version to 14.4.1
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

Release notes:
https://github.com/OGRECave/ogre/blob/v14.4.1/Docs/14-Notes.md

https://github.com/OGRECave/ogre/blob/v14.4.1/Docs/13-Notes.md
"The versioning scheme changed with this release. This is the successor
 to Ogre 1.12 and the porting efforts are comparable with porting from
 1.11 to 1.12."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ogre/ogre.hash | 2 +-
 package/ogre/ogre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 963c521eaa..138885dc3b 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  85d80ad2afe5e59b0ee8593f8bedbab8377a6772f21de310717798f6ca96010f  ogre-v1.12.12-git4.tar.gz
+sha256  ed3b48a3305ef53e21dac72f7a3abf07503510c93dc091f69baed3cefd9c0efc  ogre-v14.4.1-git4.tar.gz
 sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 3fd2fc4650..4e5d5f6d72 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OGRE_VERSION = v1.12.12
+OGRE_VERSION = v14.4.1
 OGRE_SITE = https://github.com/OGRECave/ogre
 OGRE_SITE_METHOD = git
 OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
