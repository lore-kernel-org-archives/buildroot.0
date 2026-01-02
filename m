Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA1BFA3741
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 14:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A7440680;
	Fri,  2 Jan 2026 14:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAz0M5wnJ_1Q; Fri,  2 Jan 2026 14:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E99E40629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767362933;
	bh=XuDmzc1iYAvyLVPRCzSZ6W5q/gDiVbNNETLg2XKikHc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mnwbOMmwr/pNTxlzRxoGCDOeyBN52ckazmHn7TrKDLYu95cq01hKjoo/XZ+8bdGvU
	 +S5wXf3liSkkcYEZdAqE4UKn6q3KO8ql/UtTHsvOeeagR2NFnT2a3/2oDn8DaDrvZo
	 kfuAB/d2+MrfmqOFyWOlowjvhvWfdQpgR8Y2hYv3EM5beNOObpjrweoKphnBQRZ+3V
	 39Mf37LuQGcysUgdxx+z6mVxi2p1srNnDTyBL8ac1ukQxbspxLCeIQv/PTVKUT8OnP
	 Cmpv7OztUw+YK7TU/YUrBD6G3et4S9GIocRqSIUtbEc4N3uL07oG3sLCrMB5l0X1Be
	 5C8lnv3ko3acQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E99E40629;
	Fri,  2 Jan 2026 14:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2EECD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58A740629
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xYnmD84O2kM for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 14:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA08A4061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA08A4061E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA08A4061E
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 14:08:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9F78A4C3203;
 Fri,  2 Jan 2026 15:08:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbfp2-000000006rb-2JwU;
 Fri, 02 Jan 2026 14:08:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:08:01 +0100
Message-ID: <20260102140805.166641-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102140805.166641-1-bernd@kuhls.net>
References: <20260102140805.166641-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767362888;
 bh=kXCHX8y/cpvaCfLYz32WsCFP8gbQ35RjQMdNcKHsaKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PywVN7c2eDd/LnnfZLRv3uDpDRYej16YWwsBKM4TqraTbbNaEzRwRUSU87Q95qcHz
 T2qqI4wFFlrAnZCtSrcbFE/XJSJOPHMQu7DaQg6Snhk5vrgO/XcbG39cBPKojwBBz7
 gxs4cJRnRRsCOL7fHt+We8/F1exmXBgKXK/+jsfvX+qVB3GO9plOoXcu3g9ZhvVwRI
 +dXOUiJPXZ8/KY18cCAtBMpqnlN9GjNXd7LY/9ibtQdQOOLOvjWLyFKHurn8ArtR9D
 6YTLOk/kcDkg0lmY9CzL2P+oS8b+uj0bcShXtMgBOmxufH+RKVKw+FXFDPrGmiQAM3
 Wi5LCkpanFtcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PywVN7c2
Subject: [Buildroot] [PATCH v2 3/6] package/python-web2py: bump version to
 3.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 098f8dc490..b100a1fec8 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..5b473698a6 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION = v3.1.1
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
