Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D4DD1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C69F61B0B;
	Wed,  3 Dec 2025 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xInH17Na5IXm; Wed,  3 Dec 2025 22:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C8061AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799366;
	bh=eiwdobHcE7GqP74ylAMRpilwIXKFfBotzRJRBXJjBQc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NP/+0VtAtRzLNHtyYDnxgy1/bsizdBS9NMt17T8nARqDRP/qDK6diT1933jK5MHax
	 dO2235894ICGyylZ1sqUqQ7srCtAtzNkA5QQXFVYq6LtA+IW/rni8+4pkbMzhMLWee
	 uWkDMhdItWArANxzxNsm8kj8iuYN6YEJDkpznbncrktMch1uoSz9EOjwocWzI3o2vW
	 Pzu0FExx3Qa71nF46NYMSuMsjuW359jH90JrYIlSs9GO8OLSj+pnmAWacd5J8/+LKI
	 +CnLj9PxfzYQNGjGoXDNsuguVn1Q5hTPfWGCBKAIck9dULD0YwYKf9JJHIAAcWFU8m
	 s+AMO3BBLYGGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C8061AF1;
	Wed,  3 Dec 2025 22:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F3B2D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5587B84239
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0PlGfbwZr05 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4023C8221B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4023C8221B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4023C8221B
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7BEFA4C79CB;
 Wed,  3 Dec 2025 22:59:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqg-000000002OS-3kfd;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:08 +0100
Message-ID: <20251203215723.2323032-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799144;
 bh=4onw0U8Eiw7wE6dw2Cf+W44QI5i1XOaknwpCaxq7nK4=;
 h=From:To:Cc:Subject:Date:From;
 b=EqvLQZcrjDS/SuUYLk+gZ1OwxFG36j3ldKLVTAgedHIt9WoZCzFK54Vky3r2AB9GL
 Nk9lTe4mPjzXDTQEFs7R01bYlsstOWfKflasC7t53qxbn6MDYIZuMuTJq2roYsj6NV
 5nwGTEIdQGDTMju942VwjLqVd/eG+PVscLaBSsPqEZTqGndBNfNXFd9lRA2JQlqIlx
 mjEMKe+Ur4H+pQtq/5XvJuPbnnMJoDhxb7xLfg0ZEZMDCoKpH5z8u/XVtOQhfOQxYk
 Vi9YkGdOSjRefRpJQmp61mgM0ZmZv7lXBAYzSw9Ih1G+q8baLhpl4zyvX/iEmRp9NE
 CdJ2Fqenh8HPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EqvLQZcr
Subject: [Buildroot] [PATCH/next 01/16] package/azmq: bump version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Last release dates back to 2021 with > 50 commits since then, including
fixes for cmake 4 compatibility.

Instead of backporting several patches we bump the package to the latest
commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/azmq/azmq.hash | 2 +-
 package/azmq/azmq.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index 6caf53582a..6633834d3b 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  80cfb951c5614b8c2e55a59ea2e5723a18ebed08da80e5420e525d6bf273771a  azmq-1.0.3.tar.gz
+sha256  6acd312b1358be23d65e0695f0c6ec176efef944af353961e99dfb777169a6b6  azmq-819b24035cfa5b73081e21f5867445f2344f680d.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index a72b155664..7ca211cbde 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AZMQ_VERSION = 1.0.3
-AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))
+AZMQ_VERSION = 819b24035cfa5b73081e21f5867445f2344f680d
+AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
 AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
