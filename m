Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46936C56205
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 17:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0328D40857;
	Thu,  6 Aug 2026 17:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbbygb3O2Tzi; Thu,  6 Aug 2026 17:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A8CF40838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786035815;
	bh=9seJssHMiK3b8VS3W5nj47ycl22v8u0no5OF6GMY91k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qUMzMcxgyLIY4rTPXlCrn5LTezFXDkvLfX6kfI4k7d3rFFcdvVEYd+lucidV4Lywr
	 W3Fu3tr+dgFI1PRy8mXvq/UCRQahXt4YcWGOAjsY1a1y9KS+ECIWf93Xcl3YqkH0VP
	 fFyDrQQTZVy3oAF259wJ3qWfnPn7xh/WxaRDUcX5VCcg76ye5eiY5C+nqySpknWVIf
	 cUYeYK5oS3/aHyRt+TwJXtymXNBNwoLgirGRjt0s9Kp/NiYzZo3ZX3yYPregIUELm2
	 qjV8gmXuOHQWB10elVe1xvTBXUNltge9z9Y54nBnYoWVqrDhFCFWTvNXRq9YaM2B4H
	 qpMEXSyCoZvOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8CF40838;
	Thu,  6 Aug 2026 17:03:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E99E392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 17:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2088A40024
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vN8YtklOBKIY for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 17:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F86E402D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F86E402D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F86E402D2
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 17:03:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b3cd.dip0.t-ipconnect.de [84.161.179.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55684A4C47CF
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 19:03:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36930)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1ws1VB-000000003TM-2mY5
 for buildroot@buildroot.org; Thu, 06 Aug 2026 17:03:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Aug 2026 19:03:29 +0200
Message-ID: <20260806170329.1976989-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786035810;
 bh=CWSsbjdAU86eMzgVnYDGjCKCx90xMjVBgOSY/ek+N7w=;
 h=From:To:Subject:Date:From;
 b=kw7NCbrJLI/BXtXlp7DbdFVbtTInlS7lh8rajQSA38q40NfEyz4zn4dJswN3Zwr6F
 wHidY4HeXtRNe0erA46d1AD1ogeVYUVQKcTWDO2HcOlI3t/PoSDLqtsX+rDFYZz/Op
 uFDQRP5FaUIdEhlCPkXo7aHpsbOGRrwvPYMT5XOOr/SWpo3/BvOYkpQ/eReAm2ioLk
 tkIho71t60DL57ZHRU1IHBRBrEVx42T9rhc7r2fx4qh9QjO3ugIaTXw48KvNBzWBsv
 PLuCDuNiDt6PLZOMtps6EiPsgosUD20Lv8Z3c6tyVVUw+QqdZz5RNi8J/T7I3j9aR/
 ggDmjCvpWmlJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kw7NCbrJ
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.7.6
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

https://github.com/OpenVPN/openvpn/blob/v2.7.6/Changes.rst

Fixes CVE-2026-63649 & CVE-2026-63650.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/72c62773e9f00aebff316312fcf47a7b4082d769

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 651f430534..3822b8c5e9 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
+sha256  10e24a9385f23cc38cc5cf448f3ca0769f939bc4cbecc4f4647d7e006e52db74  openvpn-2.7.6.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d5fd308e63..e543610563 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.5
+OPENVPN_VERSION = 2.7.6
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
