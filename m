Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EED6F8E49F
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C723E82255;
	Sat, 18 Apr 2026 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ev2BSWULAE1g; Sat, 18 Apr 2026 13:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA5682256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776519520;
	bh=wl7uaQdaDH9rZli1bQ1zmzo/CfPWCSXnIrmS7KHzdXM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sKxWG/T71yXfIylsqZ1SWlmtx8BQOVCQCu4JYIV8je2gkLQdYu9cuYYjNuTElCl5B
	 g7TVRTABGEWFQSvJjmJ4BxrfLD7I/ybhVlUHQl6IjepNZTGNHN8pxpbgOZjVkV/Mnw
	 NZRkvLDMV4VKBAIcl2NURHxyuCOfaP6j9PlhIcMdMUVQWJkdEbCPqSiwbiKVe4xf7p
	 M2ml0ps+sLJL3BE3ggtQQxM7Ltki52EyY3lm2/tTWDLBTfFC1X+S9LsgdxLUIl3XSn
	 rj4H9VK7WsnSWNH8NVRLQMW5IwvBw2gwjMzZsatHfoFsqDdRmGx5NTMtLDsGE05wSv
	 UU9ueSGkgeiHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA5682256;
	Sat, 18 Apr 2026 13:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C4B35B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC9982256
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIigjB2TlhGr for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 13:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6008D82255
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6008D82255
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6008D82255
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 13:38:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfc7.dip0.t-ipconnect.de [79.214.207.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBB33A4C372E
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:38:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36552)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wE5sX-000000008Mj-2zld
 for buildroot@buildroot.org; Sat, 18 Apr 2026 13:38:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Apr 2026 15:38:33 +0200
Message-ID: <20260418133833.1363288-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776519513;
 bh=Q0BCAySve9NKJaZ3K6N3QEmcEX2HQbE4ArUHlUu56fE=;
 h=From:To:Subject:Date:From;
 b=L11mikoPsDVN3j3hPBfHJ+1iJpD/WBYH9fPawhhfxIGZkb7PbdHc3Xjwr5JPz6Hir
 MAWO7jEpWuaxLdLcXpBQo6X6NPBSFAmo/BkOwbfIuavVxxY2bvf+otOzaj/uEBjhca
 ccsCKTYWKJu5S31KaheRWnrj1Xfg/2wN4KWyZW5PGE44UXGlDRYiqNitWFFcI/zs8/
 ZHfuldDfR0O8gH7vI5j6PoBFYgz9byeAcB/wNvouKlD1ScZtWrAFHrLx2ULD7VNRP9
 nOIe3YynMqfnvgxyCcXmInSRrqRiLcuPHCd/mv+MfL87DUKaKi7CaMwjnlsy5ITGx+
 os7XGJzD2QScg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=L11mikoP
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.1
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

https://github.com/OpenVPN/openvpn/blob/v2.7.1/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d172689685..d01cb73c98 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  13702526f687c18b2540c1a3f2e189187baaa65211edcf7ff6772fa69f0536cf  openvpn-2.6.19.tar.gz
+sha256  9858477ec2894a8a672974d8650dcb1af2eeffb468981a2b619f0fa387081167  openvpn-2.7.1.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9dc4ef4714..64102ab9bf 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.19
+OPENVPN_VERSION = 2.7.1
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
