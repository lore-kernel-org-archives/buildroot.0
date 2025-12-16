Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260C5D609DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7026102E;
	Tue, 16 Dec 2025 19:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKiKaw-83mpG; Tue, 16 Dec 2025 19:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5DA61075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914374;
	bh=5X6Ets1zARSe84f8p4Rdn7HfPZWRsGZlW8GK+TntSTg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bddIk3rRZv29/P1UNH7qmYcbryfLId0X5JvRq/NyjPrS8fqiX3mWNJWK6yibxPVLz
	 2TUii6ersR6jQosoeGdDTecFouj4PzoA0owTjDnMB2+F1Hb2LMfS/tRTPCuBJ3zlrs
	 AES0M5JbkbTkF1L51ryJb7NVlz8J3b5KOfLWQ4Q82eUO/MWd0YcqFEYyVyybdJ4YJA
	 o+/mHA3UHTTh23qbgjIU8zB+dKU9iP6ephgP+w4MKWClGJ4PAewUQfFCCyGmw6mFcg
	 7np0dM4DBS8y/xrMxDYJ373xcMgCXte4T+swXihUqM5TJt3XA7eohBU+hKZJ6e35SP
	 KquYJlpjo06Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C5DA61075;
	Tue, 16 Dec 2025 19:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81166364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73CF6405E6
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JqBIbJpUm3hp for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A439405E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A439405E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A439405E0
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:46:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F739A4C4601;
 Tue, 16 Dec 2025 20:41:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-36t2;
 Tue, 16 Dec 2025 19:41:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:18 +0100
Message-ID: <20251216194119.3020421-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914092;
 bh=ofZdL4X+HFu+e/50LfUy05JP0UUzDAzdZOqd3a032Wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rNROzYOLuVZvsXp1uLZEwyqoeHxlaZUjVWEHJ9twgZiuQYSHqURTZTyhWNF303HBq
 XQLxL1R4hfKj3NwJCeTx9RFeMwSYPCe4QDfOaEwwJSdmV5KvhwfpARzZy5VvwdB/ok
 OC4IwTMXG/rx448xYmB5R8fV3KQKLfOAqiHX85s0xozA1BfFjwOqoOXHQ4UDl5/lUT
 QreTNHVGC03PtkUgpFqhqawsDrKtL/SowTmL/Reg9UfWS/Sb1UCIjoT9ylbVHW7ZSz
 YDmTx6LsZYMro3LeKnY7gBTY8rZ7GcFKuI4lI1CT2a9WNqMOo/VUW0TArsHBi2VOTR
 /vx6/q+GxDWxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rNROzYOL
Subject: [Buildroot] [PATCH 25/26] package/python-zope-interface: bump
 version to 8.1.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/zopefoundation/zope.interface/blob/8.1.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 480d572355..3e9844b348 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  dd3e8e7b18c0845f9590a13b2ef66a46  zope_interface-8.0.1.tar.gz
-sha256  eba5610d042c3704a48222f7f7c6ab5b243ed26f917e2bc69379456b115e02d1  zope_interface-8.0.1.tar.gz
+md5  865a1632f5f9fd517f042006381ebf29  zope_interface-8.1.1.tar.gz
+sha256  51b10e6e8e238d719636a401f44f1e366146912407b58453936b781a19be19ec  zope_interface-8.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index e6425ecc4b..2ec511bdfc 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.0.1
+PYTHON_ZOPE_INTERFACE_VERSION = 8.1.1
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/88/3a/7fcf02178b8fad0a51e67e32765cd039ae505d054d744d76b8c2bbcba5ba
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/71/c9/5ec8679a04d37c797d343f650c51ad67d178f0001c363e44b6ac5f97a9da
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
