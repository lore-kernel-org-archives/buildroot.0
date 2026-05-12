Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC8ACD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E4F60DB8;
	Tue, 12 May 2026 14:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUti9Avt7Pr8; Tue, 12 May 2026 14:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEF360DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597547;
	bh=FkNJR8owKcK6umgXpCwQoYzB2EXssyRyRwuCOnF7Rzc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hq9JEjhvPNSfP/Wk5iDVd9VGcdD1AOu925FAMo1AZFnxjtdKYBieXneEcFd9SIWPP
	 Hg9TqW86+Muclc0cqema1GJBF1aZV0R3WqctLp0iFSWaG0lFxLSm6JUGTZJH2s+Mt/
	 wBV7iYlwOsBWQaQM3yOdawiIiBh6mli0pHVxsLb0fuYKrrn2IYAeBe/B0nIr0SDJYp
	 F8JAupuzW4PYjxB/wVQm2tduU4/BxWwYdRcKhMZvhGk47zCI4Kc55z/1Ra7g2v7Jn1
	 rWA5gsiNqsqbKessn/mhFdtCLUIO7YCGKcS9fKsypLDkZm3qokiqjH4loFVR3ixaQR
	 yNtQi/nt1/5Ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEF360DBB;
	Tue, 12 May 2026 14:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED0515F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 009104065A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33dLA99XJqlx for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E291B40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E291B40137
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E291B40137
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E742A4C0990;
 Tue, 12 May 2026 16:51:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-0wyi;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:51 +0200
Message-ID: <20260512145156.320992-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597517;
 bh=XDNyskylbEjoeQSMecV2T4ETCp+JpxslETRFqCO2wG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZaSjSMjdALbktbbI7w7rvmxbbsOhf56uAADt/hcwpvMxDajMh2TNMhwKR7/eqvuLw
 R++Hq5/g9wFkYN3r4tdgg4DarEE7Ez1t1dXj8bdh6rRCcTuZ8Ze8oSesyC4z6WZm+6
 +pi/OMdo2CB9al7m3FGd5+FctOOZPm14qSX7qIYbYYHTJrY+FJllHSxVrgtznyPZ2l
 bDxdtAm5I1lpSpm8Z27WkJ45Gy8iAg5mQwRGMa/tHp2tfEcZi2pFI6OnOu5sE3lKWc
 kJRMLk0krB0Ycc5sTFvssUMeykdPQHdzMbJ4ijSBChWsD2Ix0snFglMiZZQQIOLBfk
 rmmJJ36KKuGdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZaSjSMjd
Subject: [Buildroot] [PATCH/next 3/8] package/libsemanage: bump version to
 3.10
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

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 1fd5a8019b..ce4bb1fc76 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ec05850aef48bfb8e02135a7f4f3f7edba3670f63d5e67f2708d4bd80b9a4634  libsemanage-3.9.tar.gz
+sha256  1978894c414769ad77438d26886eaae3fb7bb74578ef2a5ad3130c89cb5cb1fe  libsemanage-3.10.tar.gz
 
 # Hash for license file
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 12e378f045..b0b20aec7a 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.9
+LIBSEMANAGE_VERSION = 3.10
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
