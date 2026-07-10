Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1B2C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 19:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A56A810B5;
	Fri, 10 Jul 2026 19:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVeYYo-uT0Qz; Fri, 10 Jul 2026 19:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E6D18109C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783710147;
	bh=wF2xuyyMKFWvIHTxODRSztJcJ0mhhsn6K+Vf1f97cZM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G1Zb9LvA6QlR0MK9o7rkeHr4RPchr0hkf2BjUDo1yczKnm2aw0UMPhLK/SE3GYWK7
	 JGDCuFxpraF6K756klkUMmbeOVgMarENQrwGp8GmIH+RDxUHQQem+uZ1hs83GOdZXK
	 fD/HNDopVUrw+MKn0MVl5ni36zQhGiqnULNZgCCfSsnN/CIAtB9tbUm/m4bFDY0hH9
	 qo/1XDmPIDhXpNrhMkParxn3Z1xzOqW+DQLGqa9nUHLzciXM7YpnYt/PrWM2mkCSJP
	 k12Faf1SG56qlAwdbIi/NDxVd7EJEdE7WbJHGx3dFjlrIf8bfebf6PaTOFq9EZA+Gx
	 ALmF49UTSEY4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E6D18109C;
	Fri, 10 Jul 2026 19:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2024A2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 19:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05BA460877
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 19:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb46CBzzyQBi for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 19:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5EA0D6065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EA0D6065C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EA0D6065C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 19:02:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E17ECA4C306A;
 Fri, 10 Jul 2026 21:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57610)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiGUO-000000000I7-2Llq;
 Fri, 10 Jul 2026 19:02:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 21:02:20 +0200
Message-ID: <20260710190220.2350779-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783710140;
 bh=qKb8gXPmA6Mw5PracDScR9L75p+oOAMEL60Pyz5fDG0=;
 h=From:To:Cc:Subject:Date:From;
 b=I/RaY2XEu719lBPbuD0MWfL6U0LLNf1xnBHIStidCIQgVPuce8YDEYgDzeukKb7YS
 7lG2mApLYz4tEMrpj7lsy3FShq7ASSl+OktVL3yUWqdxIPDudeXwo7aFzT9ha8Fv8g
 h7hFS0l3RFqZu4uhNYJL9PDapgnSgvYmyjaD0Cn/q8jfMdoRr3lHDW8CxwThBonr9Y
 convc3TLlYY/4HKuzODq/K+30b/HIu/GGKon/3Zy+f2ysOPjkWB+d6Njg8a+tW6pPO
 RAf/4ac47SDQl5R3OifWENu1CUubBhAGA2lU7pZCqrauuJ57k0ywsak+8asvbRArfw
 gJKiNITEfNo4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=I/RaY2XE
Subject: [Buildroot] [PATCH 1/1] package/python-emailproxy: bump version to
 2026.7.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/simonrob/email-oauth2-proxy/releases/tag/2026-07-03

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/908f464a58c5a51c5620072f91b292f12287be1c

 package/python-emailproxy/python-emailproxy.hash | 4 ++--
 package/python-emailproxy/python-emailproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
index 6c534834ca..41a1f47195 100644
--- a/package/python-emailproxy/python-emailproxy.hash
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/emailproxy/json
-md5  8cdcbe1f2e0956facf27cf2ed160e227  emailproxy-2025.10.4.tar.gz
-sha256  28efbc446df0319d9641b0b7a35440bae91863bf70471c8cedaafbefb1b50915  emailproxy-2025.10.4.tar.gz
+md5  3585e02c8d9c827d8f5c94da4c93018d  emailproxy-2026.7.3.tar.gz
+sha256  40fbc5d46832d38f22689cb68eb40211580c75301d1192806c7e5a8daaebe9c5  emailproxy-2026.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
index 603e58fe7c..a6dd7a85c8 100644
--- a/package/python-emailproxy/python-emailproxy.mk
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAILPROXY_VERSION = 2025.10.4
+PYTHON_EMAILPROXY_VERSION = 2026.7.3
 PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
-PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/4f/0d/045028f891c4a83ea7d616a81f0b9af8d290316eb0c958d572b6445232f9
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/6e/bc/51b7adf9e9f176f838cf4649ed27584b88ca5a0c8650ca75e9b432c563e0
 PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
 PYTHON_EMAILPROXY_LICENSE = Apache-2.0
 PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
