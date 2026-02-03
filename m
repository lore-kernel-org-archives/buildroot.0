Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894A2E8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00960405E2;
	Tue,  3 Feb 2026 07:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFbMunUG_cZd; Tue,  3 Feb 2026 07:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D81405CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770105458;
	bh=l1K0icfVg4XX9EztargYzj/xXSEaUuTyCGB3JIZTA5U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=plBci6qskANu2bUb3hI6cS9BrIkOH4QxADXioqe94X4IKwn1lyZJeAIr+i9QPqDfW
	 wIhVYc0Yc25pB3yZu+L+wbpy7F2ry7tXKZARpPvLmhuha4hq9P1fmRr0rkLV2Dbq5k
	 AZUEpPbTTmb+dVH7IWmWGrz4H5cpsbFIz7hX50Bh6QyHFJIZuDFk1M8tynC052YkUT
	 CXsvKtbOf+xFR5iISzhzU6kNEujuFT8kpDHsBTyrfz6ijVmxIjH91Je3SU/4mfR/cN
	 2Vm9C2R1TwqWLtjEaNev3l9zVxH7rxVFuJmr42mXeB6ArrHl/1fbqYob5jWi7tJMV/
	 PPDPDX66cD1PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D81405CD;
	Tue,  3 Feb 2026 07:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5891DF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DB040345
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zE8VSiXunLhC for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CA14401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CA14401EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CA14401EB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:57:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC9C9A4C0E30;
 Tue,  3 Feb 2026 08:57:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnBHv-0000000039a-1eSI;
 Tue, 03 Feb 2026 07:57:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 08:57:31 +0100
Message-ID: <20260203075731.22481-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770105451;
 bh=gBNhzRiJqPdH1LAI/BzyQFhJ0mkMR5U3K8qgZHSAOFE=;
 h=From:To:Cc:Subject:Date:From;
 b=Is/6q0tSmB3NWPUehJTdG506bSaG9SZqiP/aDfgVlSkFL7nwaLYqg+yN5QsThbkxQ
 Z33aIFspYkVZUMOu/MooP6My3CaWjKCPH1ui9rMEAFp7Wn4TWEizKnpySen28bUpfP
 1S+mDM3SVPQGZvd+I+WqVAsPjSJuEOf//DyXxsRWspnNf5l+dRiP8fwRzILGFKg3v/
 KgH2wPbW2BfdAVNIn+3sAO8KFQhdCcCbJ/LIlmJjsjpdCGz1g0N3P5Qees7steyHPN
 MtmXwy+j5C9soc3st5E8QiMzHWwl4gHsVpiLAetaePh5fyYcSSzxJcY2VMpk08UjYZ
 +7mKI6MaqjXMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Is/6q0tS
Subject: [Buildroot] [PATCH 1/1] package/php-lua: add comment for lua
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
While testing the php 8.5 bump I did not notice this package because it
did not show up in menuconfig.

 package/php-lua/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php-lua/Config.in b/package/php-lua/Config.in
index 923de2d799..9f43533fad 100644
--- a/package/php-lua/Config.in
+++ b/package/php-lua/Config.in
@@ -6,3 +6,6 @@ config BR2_PACKAGE_PHP_LUA
 	  OO-API to lua variables and functions.
 
 	  https://pecl.php.net/package/lua
+
+comment "php-lua needs the lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
