Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679D4C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 17:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEC5840AB;
	Tue,  1 Jul 2025 17:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUrugg8zimQd; Tue,  1 Jul 2025 17:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E0A1840D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0A1840D2;
	Tue,  1 Jul 2025 17:04:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D0EF179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 331E960B63
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFvCM1Us7u3t for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 17:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E8DA60BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8DA60BD6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E8DA60BD6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 17:04:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c012.dip0.t-ipconnect.de [79.214.192.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFFB7A4C2C81;
 Tue,  1 Jul 2025 19:04:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58790)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uWePI-000000000Mz-23O9;
 Tue, 01 Jul 2025 17:04:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 19:04:32 +0200
Message-Id: <20250701170432.664876-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751389472;
 bh=WnHcb9UCm3VOLfk5N3ZZNRA91sbApsKrEW3cKE2HCOc=;
 h=From:To:Cc:Subject:Date:From;
 b=bujjcUfox/aWGIfpEmGdZpwuuGr/6StIhl7+DFyQ6ZjnwZxwnBRtlzQxBYoa/+d7C
 rizEUu4NafTvtvt1TUNEAx4r0O7DNYnBaQEc0n4JH0mL5VxQcA+YridzQX4ZatXZxO
 C008ifY2zFjWFxWLCSWrraN9tmoiwso4/IFmBtP8ggKs3RTlLr42a6R/2mmyPbny79
 7HIxstupxGY9gMgxU3mr72Qnq9kZy+RotlqO73cHJHoKk1SR9qmr9/UGwHXE6GDIia
 Ee+uea96EqEXVI07G+sM4e6xAoI9N1GY5FK5yeTLPuUG6fomYzUSVKueXsGGuI1heF
 hpWI0UfURt5vA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bujjcUfo
Subject: [Buildroot] [PATCH 1/1] package/python-emailproxy: bump version to
 2025.6.25
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

Release notes: https://github.com/simonrob/email-oauth2-proxy/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-emailproxy/python-emailproxy.hash | 4 ++--
 package/python-emailproxy/python-emailproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
index 886173234b..3ba682e33b 100644
--- a/package/python-emailproxy/python-emailproxy.hash
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/emailproxy/json
-md5  f216dea4437131103b1d658cfa1a9bc0  emailproxy-2025.3.14.tar.gz
-sha256  e406478ed86eca2005ed1e17221358a0c37ddaeccfd991d42d2df93febb279a0  emailproxy-2025.3.14.tar.gz
+md5  12c7de8acd36329613c994a9b20385a2  emailproxy-2025.6.25.tar.gz
+sha256  7737083d6339649ffb6149326f83258b537a580e9eb617e5d8343435eb55f261  emailproxy-2025.6.25.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
index fd73110597..01f0104e9a 100644
--- a/package/python-emailproxy/python-emailproxy.mk
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAILPROXY_VERSION = 2025.3.14
+PYTHON_EMAILPROXY_VERSION = 2025.6.25
 PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
-PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/15/b9/b2864ab1da9fdf7409589de99501b227352c9a6b8fa1178660debf0a2ad6
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/a4/85/c9266b2457f018783dc0149e123bad115e02d0bd01f7c2a5aa61715250f1
 PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
 PYTHON_EMAILPROXY_LICENSE = Apache-2.0
 PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
