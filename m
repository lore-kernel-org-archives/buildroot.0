Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0362D3B7D2
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 13:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A348860747;
	Sat,  6 Dec 2025 13:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKwl9RlD9t0R; Sat,  6 Dec 2025 13:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A088660767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765026653;
	bh=tw9/puxz/fc6dqKOfCHg9o4MqVXspmNuH4sl3T2kY7U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S7sWP0U0o6wZeK14IT0LwJNqZRbeqnKe02gmGLyHW0owTXpSpB6hY6QlnE7CI/dHH
	 5QRzGzrknxW2H4lPk7tP9X9GmRlZ4Mt+XSlEStVQ/Tp8fSrHPW+MEU3kG/b4VOkGc5
	 Bh8zJRabWzd1za50HENqBdSsfjL8tgSRMnDKCUPgM/bdFng9za3uKdd2j76u4rN6Si
	 8l1YLMHrako5S/ZxKW+nUyLIOaIWmeyaVAgXGbGskm9CGGIh/x+qGAPlHRYgY2pMnW
	 Iv1OU5gsLmzvUEjpYhAoaD4eFwJwnIUTtTfqv1R8C8Tey2/7ZTLgVZB/iiuAKrKz29
	 3i3hJsfZlZh0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A088660767;
	Sat,  6 Dec 2025 13:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0DA61A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9141C60767
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSOWXTka6i-D for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 13:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88B1B60747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88B1B60747
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88B1B60747
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 13:10:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35D4DA4C02BB;
 Sat,  6 Dec 2025 14:10:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34398)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRs3g-000000006Mj-1r3P;
 Sat, 06 Dec 2025 13:10:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
Date: Sat,  6 Dec 2025 14:10:44 +0100
Message-ID: <20251206131044.689379-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765026645;
 bh=/FUeQc9cL9odgJVL5k2llwlLT9d4Kk59pZvD2K1fMFA=;
 h=From:To:Cc:Subject:Date:From;
 b=egEUek69e072VROKPD71yT5QeuZLKsFUZnLEfQJrjT8XzL2hh+/zpvyoQdkBs/J8W
 EBMbiITo2KqvWPgp2OwtezQqRmuMoy3zx8hPQj46nSdjaz/+gauIGb7CumBTqgYV2d
 +/E7ftXYdg5Y39cnsxcjGJN7gNcrCWBALNWeSsXC82fUe7SF5XvEX2flpH1jAdd2h7
 3izr+I5z4L8ntGYgX9DKRy3/75FJgrqvr/dkPrSCcGSOF0Qx05Qc799ja3MSlj7pjv
 e6Zngj6GRkR3QITit9tiSgp6h31q2G6rs3Rv4yLYj/GHcGL1pipeduMlO04EjAaHdK
 esqvho5L7j4Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=egEUek69
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump version to
 1.24.2
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

Changelog: https://nlnetlabs.nl/projects/unbound/download/

Fixes CVE-2025-11411:
https://nlnetlabs.nl/downloads/unbound/CVE-2025-11411.txt

Removed UNBOUND_IGNORE_CVES, the fix is included in this release.

Fixes:
https://autobuild.buildroot.net/results/d3d/d3d6b84ba667e3e2586b7cfdaddcd160232eddfd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index d9397f698a..19966d889e 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
 # with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
-sha256  3036d23c23622b36d3c87e943117bdec1ac8f819636eb978d806416b0fa9ea46  unbound-1.21.1.tar.gz
+sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index e9a32e6129..b435839020 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.21.1
+UNBOUND_VERSION = 1.24.2
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
@@ -23,9 +23,6 @@ UNBOUND_CONF_OPTS = \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
-# Only vulnerable if built with --enable-subnet
-UNBOUND_IGNORE_CVES += CVE-2025-5994
-
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
