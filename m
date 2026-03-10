Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38281FD4F0C
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 17:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C096156A;
	Tue, 10 Mar 2026 17:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZK5xk8i0XoWE; Tue, 10 Mar 2026 17:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A6961242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773164332;
	bh=fEQi2kwAPOqEjuA+t1y84pfCRJsBFMdeu7Uyg7LxiqE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=byq8TrrjplEIWBAPKbEdeIN5qoCr6GQPLf98Hz+3TFphxi32hn/QR+rWqy6RwkA+Z
	 0ezt7Wpz6nXP/oOcwxqLScgPsikiNXuDypezczHk7oOAnnS88HL8jALfakQgS9Pqtf
	 4yK0JjOav1JKY3dASa0e4drb7h6Qk9NHc05VH4z9SeD8eQE8QoK/dgVyngr0ataIQ2
	 /nXG3RQ6qRo9Zr5y4+IuPO/msX4r/EPwJWXkcvuKqpghU5WYHxIoQBh7OmYOELBl2n
	 tCKKjuq7EAzHybSm9xNUcomIsBMxzfN1L2/4zUeFJAkDUP+GuA3yNVfwu90HQtEUCS
	 qrnxaeRgwgQdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A6961242;
	Tue, 10 Mar 2026 17:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31BD9201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 17:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22B9E402E6
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 17:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsF--RT2FRDT for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 17:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62F02400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F02400A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F02400A5
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 17:38:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0224.dip0.t-ipconnect.de [91.58.2.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9747DA4C0959;
 Tue, 10 Mar 2026 18:38:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w012b-000000007Do-04rC;
 Tue, 10 Mar 2026 17:38:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 18:38:45 +0100
Message-ID: <20260310173845.3582129-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773164325;
 bh=Oxq8RnsAH0NPIaZeTjN3B/t9V60AISq4cCsW2K9fiIo=;
 h=From:To:Cc:Subject:Date:From;
 b=r6VhaQH2ctxjwJdoM6Z6Jb7/vXNdiACekIqTguRcneuG1Hvjr7rWquEcLDTYfW9rm
 vhGU86xQaCJ9lTUa8FWrLVyRbbkNhJPKB8qrXCehQH4A+ZnqYubjaenF37zpeUtjoZ
 xgrq46DnI4f5Z8BwvimmzdDpg5qITDjlIsTQJ0yzBKAj0YGZbrNkOM0JVe6S0bVSg1
 eFusToMsuTHDXJUTmFg6vW6IbMNgQNTmuc940WGTJmqkBvjzI8/8HCV2vKsoPacBxn
 V51jnI4o9qfEsFiXo+7jOgn7UKLng7j4FO+X9l2R7pVD+r09lGXeBxb2bXY0mLkSys
 oOTbOAndF6EzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=r6VhaQH2
Subject: [Buildroot] [PATCH 1/1] package/crucible: needs NPTL
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

gcc_stack_unix.c: In function 'x_cgo_getstackbound':
gcc_stack_unix.c:28:9: error: implicit declaration of function 'pthread_getattr_np';
 did you mean 'pthread_attr_init'? [-Wimplicit-function-declaration]
   28 |         pthread_getattr_np(pthread_self(), &attr);  // GNU extension

Fixes:
https://autobuild.buildroot.net/results/e07/e07198d7864331027d21cd2109054d86e7ac1c3d/

The build error also occured in Oct 2024 so a backport to buildroot
LTS branches should be considered:
https://autobuild.buildroot.net/results/ebb/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/crucible/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index 1e1b29c3df..e18e393a05 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
 
 	  https://github.com/usbarmory/crucible
+
+comment "crucible needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
