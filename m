Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A518CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34A4E6062B;
	Sun, 12 Oct 2025 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syLbgYagU8kJ; Sun, 12 Oct 2025 20:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC7A608F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC7A608F4;
	Sun, 12 Oct 2025 20:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BAA7BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E46B5608F4
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJZqTeoiKmEy for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCB126062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB126062B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB126062B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:22:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D8D3A4C671B;
 Sun, 12 Oct 2025 22:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xz-000000004zD-2tV9;
 Sun, 12 Oct 2025 20:20:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:50 +0200
Message-ID: <20251012202002.178080-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300404;
 bh=EwZ5al9fqU5Tu/AQjDGoh2RzZWAKMXjU0QBah4rqlkE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KDFNSAZvVz2DFAW8uJcKvcB2VperfEoB7WM2B9Bi0U2DR8DaB7r1nR8WlN231+4X4
 SwbIadV+k3lrpO5BXKskH9Qk++pmbV/V+TsuOE9LwZp60Cx8Z2H6A+SnhlaRwsum+r
 sLebmzaong5Th0C7bVIq7km7n8vJ+CKbul0KyS/t01lI4UoCwNuzflxbywObXDEE3c
 qfwTHSxPaDh/S2teJHzah87sNpHM27zOEU739r/xC5knZhEJo9+4H2WabikvvzVCi9
 B+0/360cceO4KMHpm8mgGR3Hj9M2teozWbTDkU2ka5dIF4Nm5pSucNSQ0d5nHSzaeM
 oWFBo0eW2sIjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=KDFNSAZv
Subject: [Buildroot] [PATCH 11/23] package/python-grpc-requests: bump
 version to 0.1.21
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-grpc-requests/python-grpc-requests.hash | 4 ++--
 package/python-grpc-requests/python-grpc-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
index aeb5336a4c..6933b3d4c9 100644
--- a/package/python-grpc-requests/python-grpc-requests.hash
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpc-requests/json
-md5  6d63bed1f4a80fc3e59191ce69903d31  grpc_requests-0.1.20.tar.gz
-sha256  a76744d781c5a7bf3abde8dc778d24c4e17deb39d173d85096ff3caee3d15250  grpc_requests-0.1.20.tar.gz
+md5  e933897ca5e3ad723b17e2e46a957f84  grpc_requests-0.1.21.tar.gz
+sha256  9525bcbc5439f334b39248b9bd867313631e74530cfde1aaf43e76be0298bf20  grpc_requests-0.1.21.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
index 7fecdf5a3c..1830c4dbab 100644
--- a/package/python-grpc-requests/python-grpc-requests.mk
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPC_REQUESTS_VERSION = 0.1.20
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.21
 PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
-PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/92/84/f5a3874a6e10448d8c198253d2c79f7b34a23fb4a96b78a648dc468913a6
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/97/58/7e2be40bad0964f7d6f1c11f72be941c19575ab426c10e1b97e17aa1e42f
 PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
 PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
